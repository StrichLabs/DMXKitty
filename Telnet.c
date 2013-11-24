#include <DMXKitty.h>
#include <String.h>

#define __TELNET_C

#include "TCPIPConfig.h"

#if defined(STACK_USE_TELNET_SERVER)

#include "TCPIP Stack/TCPIP.h"

// Set up configuration parameter defaults if not overridden in
// TCPIPConfig.h
#if !defined(TELNET_PORT)
    // Unsecured Telnet port
	#define TELNET_PORT			23
#endif
#if !defined(MAX_TELNET_CONNECTIONS)
    // Maximum number of Telnet connections
	#define MAX_TELNET_CONNECTIONS	(3u)
#endif

#define TELNET_PASSWORD		"kitties"

// Demo title string
static ROM BYTE strTitle[]			= "\r\nStrich Labs \x1b[32m\x1b[1m"	// 2J is clear screen, 31m is red, 1m is bold
									  "DMX\x1b[34mKitty\x1b[0m\r\n"	// 0m is clear all attributes
								  	  "Password: ";
static ROM BYTE strAccessDenied[]	= "\r\nAccess denied\r\n\r\n";
static ROM BYTE strPrompt[]		= "\r\ndmxkitty> ";
static ROM BYTE strInvalidCmd[]		= "\r\nInvalid command.";
static ROM BYTE strIPChanged[]		= "\r\nDisconnecting to update IP address.  Will resume operation at ";
static ROM BYTE strModeChanged[]	= "\r\nDisconnecting to update mode.\r\n";
static ROM BYTE strIPAddressUsage[]     = "usage: ip address <ip> <netmask>\r\n";
static ROM BYTE strReloading[]          = "\r\nReloading. DMXKitty will be available again in ~5 seconds.\r\n\r\n";
static ROM BYTE strHelp[]               = "dmx [in/out]                 configure signal direction\r\n"
                                          "ip address [ip] [netmask]    reset IP address\r\n"
                                          "reload                       reboot DMXKitty\r\n"
                                          "show                         show current configuration\r\n"
                                          "exit                         exit configuration interface\r\n"
                                          "help                         show this help\r\n";

/*********************************************************************
 * Function:        void TelnetTask(void)
 *
 * PreCondition:    Stack is initialized()
 *
 * Input:           None
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        Performs Telnet Server related tasks.  Contains
 *                  the Telnet state machine and state tracking
 *                  variables.
 *
 * Note:            None
 ********************************************************************/
void TelnetTask(void)
{
	BYTE 		i;
	BYTE		vTelnetSession;
        BYTE            CmdBuffer[64];
        BYTE            *TokenPtr;
        uint32_t        IPBuffer;
        uint32_t        NetmaskBuffer;
        BYTE            IPStrBuffer[16];

	WORD		w, w2;
	TCP_SOCKET	MySocket;
	enum
	{
		SM_HOME = 0,
		SM_PRINT_LOGIN,
		SM_GET_PASSWORD,
		SM_PROMPT,
		SM_GET_INPUT
	} TelnetState;
	static TCP_SOCKET hTelnetSockets[MAX_TELNET_CONNECTIONS];
	static BYTE vTelnetStates[MAX_TELNET_CONNECTIONS];
	static BOOL bInitialized = FALSE;


	// Perform one time initialization on power up
	if(!bInitialized)
	{
		for(vTelnetSession = 0; vTelnetSession < MAX_TELNET_CONNECTIONS; vTelnetSession++)
		{
			hTelnetSockets[vTelnetSession] = INVALID_SOCKET;
			vTelnetStates[vTelnetSession] = SM_HOME;
		}
		bInitialized = TRUE;
	}


	// Loop through each telnet session and process state changes and TX/RX data
	for(vTelnetSession = 0; vTelnetSession < MAX_TELNET_CONNECTIONS; vTelnetSession++)
	{
		// Load up static state information for this session
		MySocket = hTelnetSockets[vTelnetSession];
		TelnetState = vTelnetStates[vTelnetSession];

		// Reset our state if the remote client disconnected from us
		if(MySocket != INVALID_SOCKET)
		{
			if(TCPWasReset(MySocket))
				TelnetState = SM_PRINT_LOGIN;
		}

		// Handle session state
		switch(TelnetState)
		{
			case SM_HOME:
				// Connect a socket to the remote TCP server
				MySocket = TCPOpen(0, TCP_OPEN_SERVER, TELNET_PORT, TCP_PURPOSE_TELNET);

				// Abort operation if no TCP socket of type TCP_PURPOSE_TELNET is available
				// If this ever happens, you need to go add one to TCPIPConfig.h
				if(MySocket == INVALID_SOCKET)
					break;

				TelnetState++;
				break;

			case SM_PRINT_LOGIN:
				// Make certain the socket can be written to
				if(TCPIsPutReady(MySocket) < strlenpgm((ROM char*)strTitle))
					break;

				// Place the application protocol data into the transmit buffer.
				TCPPutROMString(MySocket, strTitle);

				// Send the packet
				TCPFlush(MySocket);
				TelnetState++;

			case SM_GET_PASSWORD:
				// See if the user pressed return
				w = TCPFind(MySocket, '\n', 0, FALSE);
				if(w == 0xFFFFu)
				{
					if(TCPGetRxFIFOFree(MySocket) == 0u)
					{
						TCPPutROMString(MySocket, (ROM BYTE*)"Too much data.\r\n");
						TCPDisconnect(MySocket);
					}

					break;
				}

				// Search for the password -- case sensitive
				w2 = TCPFindROMArray(MySocket, (ROM BYTE*)TELNET_PASSWORD, sizeof(TELNET_PASSWORD)-1, 0, FALSE);
				if((w2 != 3u) || !((sizeof(TELNET_PASSWORD)-1 == w-3) || (sizeof(TELNET_PASSWORD) == w-3)))
				{
					// Did not find the password
					//TelnetState = SM_PRINT_LOGIN;
					//TCPPutROMString(MySocket, strAccessDenied);
					//TCPDisconnect(MySocket);
					//break;
				}

				// Password verified, throw this line of data away
				TCPGetArray(MySocket, NULL, w + 1);

				TelnetState = SM_PROMPT;
				// No break

			case SM_PROMPT:
				if(TCPIsPutReady(MySocket) < strlenpgm((ROM char*)strPrompt) + 4)
					break;

				TCPPutROMString(MySocket, strPrompt);
				TelnetState++;

			case SM_GET_INPUT:
                            	w = TCPFind(MySocket, '\n', 0, FALSE);
				if(w == 0xFFFFu) {
					if(TCPGetRxFIFOFree(MySocket) == 0u)
					{
						TCPPutROMString(MySocket, (ROM BYTE*)"Too much data.\r\n");
						TCPDisconnect(MySocket);
					}
					break;
				}
                                
				if(TCPIsGetReady(MySocket))
				{
                                    	TCPGetArray(MySocket, CmdBuffer, 64);
                                        if(strncmp("exit", CmdBuffer, 4) == 0) {
                                            TCPDisconnect(MySocket);
                                            TelnetState = SM_PRINT_LOGIN;
                                            break;
                                        } else if(strncmp("reload", CmdBuffer, 6) == 0) {
                                            TCPPutROMString(MySocket, strReloading);
                                            TCPFlush(MySocket);
                                            TCPDisconnect(MySocket);
                                            ResetRequired = TRUE;
                                            break;
                                        } else if(strncmp("dmx", CmdBuffer, 3) == 0) {
                                            if(strncmp("in", CmdBuffer+4, 2) == 0) {
                                                CfgBlock.Mode = MODE_DMX_TO_ARTNET;

                                            } else {
                                                // TODO: make this check for "out" and such
                                                CfgBlock.Mode = MODE_ARTNET_TO_DMX;
                                            }
                                            CfgDirty = TRUE;
                                            ResetRequired = TRUE;
                                            TCPPutROMString(MySocket, strModeChanged);

                                        } else if(strncmp("show", CmdBuffer, 4) == 0) {
                                            TCPPutString(MySocket, "ip address ");
                                            sprintf(IPStrBuffer, "%d.%d.%d.%d\n",
                                                CfgBlock.IPAddress & 0xFF,
                                                CfgBlock.IPAddress >> (8*1) & 0xFF,
                                                CfgBlock.IPAddress >> (8*2) & 0xFF,
                                                CfgBlock.IPAddress >> (8*3) & 0xFF
                                            );
                                            TCPPutString(MySocket, IPStrBuffer);
                                            break;
                                        } else if(strncmp("ip address", CmdBuffer, 10) == 0) {
                                            IPBuffer = 0;
                                            NetmaskBuffer = 0;
                                            TokenPtr = CmdBuffer + 11;
                                            TokenPtr = strtok(TokenPtr, ".");
                                            IPBuffer = atoi(TokenPtr);
                                            TokenPtr = strtok(NULL, ".");
                                            IPBuffer |= atoi(TokenPtr) << (1*8);
                                            TokenPtr = strtok(NULL, ".");
                                            IPBuffer |= atoi(TokenPtr) << (2*8);
                                            TokenPtr = strtok(NULL, ".");
                                            IPBuffer |= atoi(TokenPtr) << (3*8);

                                            CfgBlock.IPAddress = IPBuffer;
                                            CfgDirty = TRUE;
                                            ResetRequired = TRUE;

                                            TCPPutROMString(MySocket, strIPChanged);
                                            // TODO: move this to an IP display function
                                            itoa(CmdBuffer, (CfgBlock.IPAddress) & 0xFF, 10);
                                            TCPPutString(MySocket, CmdBuffer);
                                            TCPPutROMString(MySocket, (ROM BYTE*)".");
                                            itoa(CmdBuffer, (CfgBlock.IPAddress >> 8) & 0xFF, 10);
                                            TCPPutString(MySocket, CmdBuffer);
                                            TCPPutROMString(MySocket, (ROM BYTE*)".");
                                            itoa(CmdBuffer, (CfgBlock.IPAddress >> 16) & 0xFF, 10);
                                            TCPPutString(MySocket, CmdBuffer);
                                            TCPPutROMString(MySocket, (ROM BYTE*)".");
                                            itoa(CmdBuffer, (CfgBlock.IPAddress >> 24) & 0xFF, 10);
                                            TCPPutString(MySocket, CmdBuffer);
                                            TCPPutROMString(MySocket, (ROM BYTE*)"\r\n");
                                            TCPFlush(MySocket);
                                            TCPDisconnect(MySocket);
                                            break;
                                        } else if(strncmp("help", CmdBuffer, 4) == 0) {
                                            // FIXME: this doesn't work as the string is too long
                                            TCPPutROMString(MySocket, strHelp);
                                            break;
                                        } else if(strncmp("\r\n", CmdBuffer, 2) == 0) {
                                            break;
                                        } else {
                                            if(TCPIsPutReady(MySocket) >= strlenpgm((ROM char*)strInvalidCmd) + 4)
                                                TCPPutROMString(MySocket, strInvalidCmd);
                                        }
				}
       				TelnetState = SM_PROMPT;

				break;
		}


		// Save session state back into the static array
		hTelnetSockets[vTelnetSession] = MySocket;
		vTelnetStates[vTelnetSession] = TelnetState;
	}
}

#endif	//#if defined(STACK_USE_TELNET_SERVER)

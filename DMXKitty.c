/*\
 * File:   DMXKitty.c
 * Author: sen
 *
 * Created on March 15, 2013, 1915
\*/

#define FIRMWARE_VERSION    5
#define THIS_IS_STACK_APPLICATION
#define ESTA_MFG_CODE 0x03AF

#define SUBUNI        0x00

//#include <stdio.h>
#include <stdlib.h>
#include <p32xxxx.h>
#include <plib.h>
#include <HardwareProfile.h>
#include <TCPIP Stack/TCPIP.h>
#include <TCPIP Stack/Tick.h>
#include <TCPIP Stack/StackTsk.h>
#include <DMXKitty.h>
#include <Config.h>
#include <ArtNet.h>
#include <StatusLEDs.h>
#include <DMX.h>

#pragma config OSCIOFNC=OFF, FSOSCEN=OFF, IESO=OFF, ICESEL=ICS_PGx1, POSCMOD=HS
#pragma config FNOSC=PRIPLL, UPLLEN=ON, UPLLIDIV=DIV_2, FWDTEN=OFF
#pragma config FPLLIDIV=DIV_2, FPLLODIV=DIV_1, FPLLMUL=MUL_20, FPBDIV=DIV_1
#pragma config FETHIO=ON, FMIIEN=ON, DEBUG=ON

struct ConfigBlock FlashCfgBlock __attribute__((section("dkcfg"), address(CFG_START_ADDR), space(prog)));

APP_CONFIG      AppConfig;
static ROM BYTE SerializedMACAddress[6] = {MY_DEFAULT_MAC_BYTE1, MY_DEFAULT_MAC_BYTE2, MY_DEFAULT_MAC_BYTE3, MY_DEFAULT_MAC_BYTE4, MY_DEFAULT_MAC_BYTE5, MY_DEFAULT_MAC_BYTE6};
UDP_SOCKET      UdpReceiver;
UDP_SOCKET      UdpSender;

// TODO: move these to non-globals once any watching we need to do is done
int                 PacketLen;
BYTE                *InPacketBuffer;
int                 rv;
uint16_t            *OpCode;
uint8_t             Universe;
struct ArtPollReply PktPollReply;   // TODO: dynamically allocate this
BYTE                *DmxBuffer;
BYTE dmx_buffer[513];
BYTE *dmx_pointer;
struct ConfigBlock  CfgBlock;
BOOL                CfgDirty;
BOOL                ResetRequired;
short               LastTraffic;

int main(int argc, char** argv) {
    TRISB = 0xBFC3;
    TRISE = 0xFFE1;
    TRISF = 0xFFF7;
    TRISD = 0xFFF8;
    LATB = 0x0000;
    LATD = 0x0000;
    LATE = 0x0000;
    AD1PCFG = 0xFFFF;
    LATB=0xFFFF;
    LATF=0xFFFF;    // this enables the PHY
    LATD=0xFFFF;
    mJTAGPortEnable(0);

    // TODO: error check everything
    INTEnableSystemMultiVectoredInt();
    SYSTEMConfigPerformance(GetSystemClock());
    mOSCSetPBDIV(OSC_PB_DIV_1);

    // enable interrupts
    INTDisableInterrupts();
    INTConfigureSystem(INT_SYSTEM_CONFIG_MULT_VECTOR);  // multi-vector mode
    INTEnableInterrupts();
 
    TickInit();
    ConfigLoad(FlashCfgBlock, &CfgBlock);
    InitAppConfig(CfgBlock);
    StackInit();
    switch(CfgBlock.Mode) {
        case MODE_ARTNET_TO_DMX:
            DMXSendInit();
            break;
        case MODE_DMX_TO_ARTNET:
            DMXReceiveInit();
            break;
    }
    LEDInit();

    UdpReceiver = UDPOpenEx(0, UDP_OPEN_SERVER, 6454, 0);
    while(1) {
        StackTask();
        StackApplications();
        LEDTask();
        switch(CfgBlock.Mode) {
            case MODE_ARTNET_TO_DMX:
                InputArtNetTask();
                DMXSendTask();
                break;
            case MODE_DMX_TO_ARTNET:
                // actual DMX receiving happens in an ISR
                if(dmx_break_rx == 1) {
                    dmx_break_rx = 0;
                    OutputArtNetTask();
                }
                break;
        }
        if(CfgDirty) ConfigSave(CfgBlock);
        if(ResetRequired) Reset();
        if(LastTraffic++ >= 10000) {
            // status LED goes off if no traffic for ~100ms
            PORTClearBits(LED_ACT_PORT, LED_ACT_PIN);
            LastTraffic = 10000;
        } else {
            PORTSetBits(LED_ACT_PORT, LED_ACT_PIN);
        }
    }

    return (EXIT_SUCCESS);
}

static void InitAppConfig(struct ConfigBlock CfgBlock) {
    // Start out zeroing all AppConfig bytes to ensure all fields are
    // deterministic for checksum generation
    memset((void*)&AppConfig, 0x00, sizeof(AppConfig));

    AppConfig.Flags.bIsDHCPEnabled = FALSE;
    AppConfig.Flags.bInConfigMode = FALSE;
    memcpypgm2ram((void*)&AppConfig.MyMACAddr, (ROM void*)SerializedMACAddress, sizeof(AppConfig.MyMACAddr));
    AppConfig.MyIPAddr.Val = CfgBlock.IPAddress;
    AppConfig.MyMask.Val = CfgBlock.Netmask;
    AppConfig.DefaultIPAddr.Val = AppConfig.MyIPAddr.Val;
    AppConfig.DefaultMask.Val = AppConfig.MyMask.Val;
    memcpypgm2ram(AppConfig.NetBIOSName, (ROM void*)MY_DEFAULT_HOST_NAME, 16);
    FormatNetBIOSName(AppConfig.NetBIOSName);
    CfgDirty = FALSE;
}

void AssemblePollReplyPacket(struct ArtPollReply *PktPollReply) {
    strcpy(PktPollReply->ID, "Art-Net");
    PktPollReply->OpCode = OpPollReply;
    PktPollReply->IPAddress[0] = 10;  // TODO: make this the real IP
    PktPollReply->IPAddress[1] = 0;
    PktPollReply->IPAddress[2] = 0;
    PktPollReply->IPAddress[3] = 1;
    PktPollReply->Port = 0x1936;
    PktPollReply->VersInfo = FIRMWARE_VERSION;
    PktPollReply->NetSwitch = 0; // FIXME: fix this
    PktPollReply->SubSwitch = 0; // FIXME: fix this
    PktPollReply->Oem = 0; // FIXME: fix this
    PktPollReply->UbeaVersion = 0;
    PktPollReply->Status1 = PollStatusIndicatorNormal;
    PktPollReply->EstaMan = ESTA_MFG_CODE;
    strcpy(PktPollReply->ShortName, "DMXKitty");
    strcpy(PktPollReply->LongName, "Strich Labs DMXKitty");
    PktPollReply->NodeReport[0] = 0;
    PktPollReply->NumPortsHi = 0;
    PktPollReply->NumPortsLo = 1;
    PktPollReply->PortTypes[0] = PortTypeArtNet;
    PktPollReply->GoodInput[0] = PortGoodReceiving;
    PktPollReply->GoodOutput[0] = PortGoodSending;
    PktPollReply->SwIn[0] = SUBUNI;  // FIXME: figure out a better way of handling subscriptions
    PktPollReply->SwOut[0] = SUBUNI;
    PktPollReply->SwVideo = 0x00;
    PktPollReply->SwMacro = 0x00;
    PktPollReply->SwRemote = 0x00;
    PktPollReply->Style = StNode;
    PktPollReply->MAC[0] = (uint8_t)MY_DEFAULT_MAC_BYTE1;
    PktPollReply->MAC[1] = (uint8_t)MY_DEFAULT_MAC_BYTE2;
    PktPollReply->MAC[2] = (uint8_t)MY_DEFAULT_MAC_BYTE3;
    PktPollReply->MAC[3] = (uint8_t)MY_DEFAULT_MAC_BYTE4;
    PktPollReply->MAC[4] = (uint8_t)MY_DEFAULT_MAC_BYTE5;
    PktPollReply->MAC[5] = (uint8_t)MY_DEFAULT_MAC_BYTE6;
    PktPollReply->BindIp[0] = 0;
    PktPollReply->BindIndex = 0;
    PktPollReply->Status2 = PollStatus2ManualIP;
}

void InputArtNetTask(void) {
    if(UDPIsOpened(UdpReceiver) && UDPIsGetReady(UdpReceiver) > 0) {
        PacketLen = UDPIsGetReady(UdpReceiver);
        InPacketBuffer = malloc(PacketLen);
        rv = UDPGetArray(InPacketBuffer, PacketLen);
        // only continue if it has the proper Art-Net magic bytes
        if(strncmp(InPacketBuffer, "Art-Net", 7) != 0) {
            free(InPacketBuffer);
            return;
        };
        OpCode = (uint16_t *)InPacketBuffer+4;
        switch(*OpCode) {
            case OpPoll:
                //PktPollReply = malloc(sizeof(struct ArtPollReply));
                AssemblePollReplyPacket(&PktPollReply);
                UdpSender = UDPOpenEx((DWORD)&UDPSocketInfo[UdpReceiver].remote.remoteNode, UDP_OPEN_NODE_INFO, 6454, UDPSocketInfo[UdpReceiver].localPort);
                UDPIsPutReady(UdpSender);
                UDPPutArray(&PktPollReply, sizeof(struct ArtPollReply));
                UDPFlush();
                UDPClose(UdpSender);
                //free(PktPollReply);
                break;
            case OpDmx:
                LastTraffic = 0;
                Universe = InPacketBuffer[14];
                DmxBuffer = OpCode+5;
                DmxBuffer -= 1;
                memcpy(dmx_buffer, DmxBuffer, 512);     // naming :|
                // FIXME: remove 512 hardcodedness
                break;
        }
        free(InPacketBuffer);
    }
}

void OutputArtNetTask(void) {
    struct ArtDmx   DmxPacket;

    LastTraffic = 0;

    strcpy(DmxPacket.ID, "Art-Net");
    DmxPacket.OpCode = OpDmx;
    DmxPacket.ProtVerHi = 0;
    DmxPacket.ProtVerLo = 14;
    DmxPacket.Sequence = 0;
    DmxPacket.Physical = 0;
    DmxPacket.SubUni = SUBUNI;
    DmxPacket.Net = 0;
    DmxPacket.LengthHi = ((512 >> 8) & 0xFF); // FIXME: don't hardcode 512 here and below
    DmxPacket.LengthLo = (512 & 0xFF);
    memcpy(DmxPacket.Data, dmx_buffer+1, 512);  // +1 to skip the Start Code
    UdpSender = UDPOpenEx((int)NULL, UDP_OPEN_NODE_INFO, 6454, 6454);
    UDPIsPutReady(UdpSender);
    UDPPutArray(&DmxPacket, sizeof(struct ArtDmx));
    UDPFlush();
    UDPClose(UdpSender);
}

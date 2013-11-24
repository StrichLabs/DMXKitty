/*********************************************************************
 *
 *         Micrel KSZ8051MLL PHY API for Microchip TCP/IP Stack
 *
 *********************************************************************
 * FileName:        ETHPIC32ExtPhyKSZ8051MLL.c
 * Dependencies:
 * Processor:       PIC32
 *
 * Complier:        MPLAB XC32
 *                  MPLAB X IDE
 * Company:         Strich Labs
 *
 ********************************************************************/
#include <plib.h>

#include "HardwareProfile.h"

// Compile only for PIC32MX with Ethernet MAC interface (must not have external ENCX24J600, ENC28J60, or MRF24WB0M hardware defined)
#if defined(__PIC32MX__) && defined(_ETH) && !defined(ENC100_INTERFACE_MODE) && !defined(ENC_CS_TRIS) && !defined(WF_CS_TRIS)

#include "TCPIP Stack/ETHPIC32ExtPhy.h"

#include "ETHPIC32ExtPhyKSZ8051MLL.h"


// make sure we're being configured for MII mode, as that's all the
// KSZ8051MLL supports
eEthRes EthPhyConfigureMII(eEthPhyCfgFlags cFlags)
{
	return (cFlags&ETH_PHY_CFG_MII)?ETH_RES_CFG_ERR:ETH_RES_OK;
}

// configure manual or auto MDI-X, and pair order if manual
eEthRes EthPhyConfigureMdix(eEthOpenFlags oFlags) {
	unsigned short	phyReg;

	EthMIIMReadStart(PHY_REG_PHY_CTRL2, PHY_ADDRESS);
	phyReg = EthMIIMReadResult();

	if(oFlags & ETH_OPEN_MDIX_AUTO)
	{	// enable Auto-MDIX
		phyReg &= ~_PHYCTRL2_AMDIXCTRL_MASK;
	} else {
                // disable Auto-MDIX
		phyReg |=  _PHYCTRL2_AMDIXCTRL_MASK;
                if(oFlags&ETH_OPEN_MDIX_SWAP)
                    phyReg |=  _PHYCTRL2_MMDIXCTRL_MASK;	// swap
                else
                    phyReg &= ~_PHYCTRL2_MMDIXCTRL_MASK;	// normal
	}
	
	EthMIIMWriteStart(PHY_REG_PHY_CTRL2, PHY_ADDRESS, phyReg);

	return ETH_RES_OK;	

}

// return the PHY address, which is hardcoded as we only support one PHY
unsigned int EthPhyMIIMAddress(void) {
	return PHY_ADDRESS;
}

// return the max clock rate supported, which is 2.5MHz for the KSZ8051MLL
unsigned int EthPhyMIIMClock(void) {
	return 2500000;
}

#endif	// defined(__PIC32MX__) && defined(_ETH)


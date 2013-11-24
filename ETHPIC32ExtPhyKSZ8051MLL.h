/*********************************************************************
 *
 *                Micrel KSZ8051MLL PHY API definitions
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
#ifndef _KSZ8051MLL_H_

#define _KSZ8051MLL_H_

typedef enum
{
	/*
	// basic registers, accross all registers: 0-1
	PHY_REG_BMCON		= 0,
	PHY_REG_BMSTAT		= 1,
	// extended registers: 2-15
	PHY_REG_PHYID1		= 2,
	PHY_REG_PHYID2		= 3,
	PHY_REG_ANAD		= 4,
	PHY_REG_ANLPAD		= 5,
	PHY_REG_ANLPADNP	= 5,
	PHY_REG_ANEXP		= 6,
	// PHY_REG_ANNPTR		= 7,    not defined for SMSC 8720
	// PHY_REG_ANLPRNP		= 8,    not defined for SMSC 8720
	*/
	// specific vendor registers: 16-31
	PHY_REG_STRAP_OVERRIDE  = 16,
        PHY_REG_STRAP_STATUS    = 17,
	PHY_REG_EXP_CONTROL	= 18,
	PHY_REG_INT_CTRL	= 27,
	PHY_REG_LINKMD  	= 29,
	PHY_REG_PHY_CTRL1       = 30,
	PHY_REG_PHY_CTRL2	= 31,
	//
	//PHY_REGISTERS		= 32	// total number of registers
}ePHY_VENDOR_REG;
// updated version of ePHY_REG


// vendor registers
//

typedef union {
  struct {    
    unsigned HPMDIX:1;
    unsigned MMDIXCTRL:1;
    unsigned AMDIXCTRL:1;
    unsigned :1;
    unsigned FORCELINK:1;
    unsigned POWERSAVE:1;
    unsigned INTLVL:1;
    unsigned JABBEREN:1;
    unsigned :2;
    unsigned LEDMODE:2;
    unsigned XMITDIS:1;
    unsigned REMOTELOOP:1;
    unsigned SQEEN:1;
    unsigned SCRAMBLEDIS:1;
  };
  struct {
    unsigned short w:16;
  };
} __PHYCTRL2bits_t;	// reg 27: PHY_REG_PHY_CTRL2
#define	_PHYCTRL2_MMDIXCTRL_MASK	0x8000
#define	_PHYCTRL2_AMDIXCTRL_MASK	0x4000


#endif	// _KSZ8051MLL_H_


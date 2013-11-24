#ifndef HARDWARE_PROFILE_H
#define HARDWARE_PROFILE_H

#include "Compiler.h"

// Define a macro describing this hardware set up (used in other files)
#define DMXKitty

// Set configuration fuses (but only in MainDemo.c where THIS_IS_STACK_APPLICATION is defined)
//#if defined(THIS_IS_STACK_APPLICATION)
//	pragma config FPLLODIV = DIV_1, FPLLMUL = MUL_20, FPLLIDIV = DIV_2, FWDTEN = OFF, FPBDIV = DIV_1, POSCMOD = XT, FNOSC = PRIPLL, CP = OFF, PWP = OFF
//#endif


// Clock frequency values
// These directly influence timed events using the Tick module.  They also are used for UART and SPI baud rate generation.
#define GetSystemClock()		(80000000ul)			// Hz
#define GetInstructionClock()	(GetSystemClock()/1)	// Normally GetSystemClock()/4 for PIC18, GetSystemClock()/2 for PIC24/dsPIC, and GetSystemClock()/1 for PIC32.  Might need changing if using Doze modes.
#define GetPeripheralClock()	(GetSystemClock()/1)	// Normally GetSystemClock()/4 for PIC18, GetSystemClock()/2 for PIC24/dsPIC, and GetSystemClock()/1 for PIC32.  Divisor may be different if using a PIC32 since it's configurable.

// Hardware I/O pin mappings

// Momentary push buttons
#define BUTTON0_TRIS                    (TRISDbits.TRISD6)	// Ref SW1
#define BUTTON0_IO			(PORTDbits.RD6)

// UART configuration (not too important since we don't have a UART
// connector attached normally, but needed to compile if the STACK_USE_UART
// or STACK_USE_UART2TCP_BRIDGE features are enabled.
#define UARTTX_TRIS			(TRISFbits.TRISF3)
#define UARTRX_TRIS			(TRISFbits.TRISF2)

// External PHY configuration
#define PHY_ADDRESS     1

#endif // #ifndef HARDWARE_PROFILE_H

/* 
 * File:   DMX.h
 * Author: sarahemm
 *
 * Created on March 15, 2013, 9:55 PM
 */

#include <Board.h>

#ifndef DMX_H
#define	DMX_H

#ifdef	__cplusplus
extern "C" {
#endif

#ifdef HW_REV001
#define DMX_RXDIS_PORT  	IOPORT_B
#define DMX_RXDIS_PIN		BIT_3
#define DMX_TXEN_PORT		IOPORT_B
#define DMX_TXEN_PIN		BIT_4
#define DMX_UART                UART1
#define DMX_UART_STABITS        U1STAbits
#endif
#ifdef HW_REV002
#define DMX_RXDIS_PORT  	IOPORT_G
#define DMX_RXDIS_PIN		BIT_9
#define DMX_TXEN_PORT		IOPORT_G
#define DMX_TXEN_PIN		BIT_6
#define DMX_UART                UART3
#define DMX_UART_STABITS        U3STAbits
#endif

extern short dmx_channel;
extern BYTE dmx_break_rx;

void DMXPortInit(void);
void DMXSendInit(void);
void DMXReceiveInit(void);

void DMXSendTask(void);
void __attribute__((nomips16)) DMXReceiveISR(void);

#ifdef	__cplusplus
}
#endif

#endif	/* DMX_H */


/* 
 * File:   StatusLEDs.h
 * Author: sarahemm
 *
 * Created on July 1, 2012, 10:30 AM
 */

#include <Board.h>

#ifndef STATUSLEDS_H
#define	STATUSLEDS_H

#ifdef	__cplusplus
extern "C" {
#endif


void LEDInit(void);
void LEDTask(void);

// LED pins/ports
#ifdef HW_REV001
#define LED_DMXIN_PORT		IOPORT_B
#define LED_DMXIN_PIN		BIT_9
#define LED_DMXOUT_PORT		IOPORT_B
#define LED_DMXOUT_PIN		BIT_10
#define LED_ACT_PORT		IOPORT_B
#define LED_ACT_PIN		BIT_11
#endif
#ifdef HW_REV002
#define LED_DMXIN_PORT		IOPORT_B
#define LED_DMXIN_PIN		BIT_5
#define LED_DMXOUT_PORT		IOPORT_B
#define LED_DMXOUT_PIN		BIT_4
#define LED_ACT_PORT		IOPORT_B
#define LED_ACT_PIN		BIT_3
#endif

#ifdef	__cplusplus
}
#endif

#endif	/* STATUSLEDS_H */


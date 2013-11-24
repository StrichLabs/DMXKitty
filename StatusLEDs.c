#include <TCPIP Stack/Tick.h>
#include <DMXKitty.h>
#include <StatusLEDs.h>
#include <Config.h>

void LEDInit(void) {
    BYTE i;

    // set up all the TRISes
    PORTSetPinsDigitalOut(LED_DMXOUT_PORT, LED_DMXOUT_PIN);
    PORTSetPinsDigitalOut(LED_DMXIN_PORT, LED_DMXIN_PIN);
    PORTSetPinsDigitalOut(LED_ACT_PORT, LED_ACT_PIN);

    // turn off the direction LEDs to start with
    PORTClearBits(LED_DMXIN_PORT, LED_DMXIN_PIN);
    PORTClearBits(LED_DMXOUT_PORT, LED_DMXOUT_PIN);
    PORTClearBits(LED_ACT_PORT, LED_ACT_PIN);
}

void LEDTask(void) {
    switch(CfgBlock.Mode) {
        case MODE_ARTNET_TO_DMX:
            PORTClearBits(LED_DMXIN_PORT, LED_DMXIN_PIN);
            PORTSetBits(LED_DMXOUT_PORT, LED_DMXOUT_PIN);
            break;
        case MODE_DMX_TO_ARTNET:
            PORTSetBits(LED_DMXIN_PORT, LED_DMXIN_PIN);
            PORTClearBits(LED_DMXOUT_PORT, LED_DMXOUT_PIN);
    }
}
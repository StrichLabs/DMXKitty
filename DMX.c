#include <p32xxxx.h>
#include <plib.h>
#include <TCPIP Stack/Tick.h>
#include <DMXKitty.h>
#include <DMX.h>
#include <StatusLEDs.h>

short dmx_channel;
BYTE dmx_break_rx;

void DMXPortInit(void) {
    UARTConfigure(DMX_UART, UART_ENABLE_PINS_TX_RX_ONLY);
    UARTSetFifoMode(DMX_UART, UART_INTERRUPT_ON_TX_NOT_FULL | UART_INTERRUPT_ON_RX_NOT_EMPTY);
    UARTSetLineControl(DMX_UART, UART_DATA_SIZE_8_BITS | UART_PARITY_NONE | UART_STOP_BITS_2);
    UARTSetDataRate(DMX_UART, 80000000, 250000);
    UARTEnable(DMX_UART, UART_ENABLE_FLAGS(UART_PERIPHERAL | UART_RX | UART_TX));

    PORTSetPinsDigitalOut(DMX_RXDIS_PORT, DMX_RXDIS_PIN);
    PORTSetPinsDigitalOut(DMX_TXEN_PORT, DMX_TXEN_PIN);
    PORTSetBits(DMX_RXDIS_PORT, DMX_RXDIS_PIN);
    PORTClearBits(DMX_TXEN_PORT, DMX_TXEN_PIN);
}

void DMXSendInit(void) {
    DMXPortInit();
    PORTSetBits(DMX_RXDIS_PORT, DMX_RXDIS_PIN);
    PORTSetBits(DMX_TXEN_PORT, DMX_TXEN_PIN);

    dmx_channel = 0;
    int i;
    for(i=0; i<513; i++) {
        dmx_buffer[i] = 0xFF;
    }

    dmx_buffer[0] = 0x00;
    dmx_buffer[1] = 0xFF;
    dmx_buffer[2] = 0x00;
    dmx_buffer[3] = 0xFF;
    dmx_buffer[4] = 0x00;
    dmx_buffer[5] = 0xFF;
    dmx_buffer[6] = 0x00;
    dmx_buffer[7] = 0x00;
    dmx_buffer[8] = 0xFF;
}

void DMXReceiveInit(void) {
    short i;

    dmx_break_rx = 0;
    dmx_channel = 0;

    for(i=0; i<513; i++) {
        dmx_buffer[i] = 0x00;
    }

    DMXPortInit();
    PORTClearBits(DMX_RXDIS_PORT, DMX_RXDIS_PIN);
    PORTClearBits(DMX_TXEN_PORT, DMX_TXEN_PIN);

    // set up UART interrupts for receive
    INTSetVectorPriority(INT_VECTOR_UART(UART3), INT_PRIORITY_LEVEL_4);
    INTSetVectorSubPriority(INT_VECTOR_UART(UART3), INT_SUB_PRIORITY_LEVEL_0);
    INTEnable(INT_U3RX, INT_ENABLED);
}

void DMXSendTask(void) {
    if(!UARTTransmissionHasCompleted(DMX_UART)) return;
    UARTSendDataByte(DMX_UART, dmx_buffer[dmx_channel++]);

    if(dmx_channel == 512) {
        while(!UARTTransmissionHasCompleted(DMX_UART));
        // entire universe sent, send the BREAK
        dmx_channel = 0;
        UARTSetDataRate(DMX_UART, 80000000, 100000);
        UARTSendBreak(DMX_UART);
        while(!UARTTransmissionHasCompleted(DMX_UART));
        //BYTE i;
        //for(i=0; i<30; i++);    // MAB
        UARTSetDataRate(DMX_UART, 80000000, 250000);
    }

}


void __attribute__((nomips16))__ISR(_UART_3_VECTOR, IPL4) DMXReceiveISR(void) {
    // don't overflow buffer if we receive too many channels
    if(dmx_channel > 514) dmx_channel = 514;
    // reset channel on BREAK
    if(DMX_UART_STABITS.FERR) {
        dmx_channel = 0;
        dmx_break_rx = 1;
    }
    if(UARTReceivedDataIsAvailable(DMX_UART))
        dmx_buffer[dmx_channel++] = UARTGetDataByte(DMX_UART);

    INTClearFlag(INT_SOURCE_UART_RX(DMX_UART));
}
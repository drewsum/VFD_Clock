
#include <xc.h>

#include "vfd_multiplexing.h"

#include "pin_macros.h"
#include "32mz_interrupt_control.h"

// This function initializes the multiplexing timer (using timer 4)
void vfdMultiplexingTimerInitialize(void) {
 
    // Disable timer to start init
    T4CONbits.ON = 0;
    
    // Enable stop in idle, we don't want to mux when in sleep mode
    T4CONbits.SIDL = 1;
    
    // Disable gating
    T4CONbits.TGATE = 0;
    
    // prescaler of 1:4 and period of 12500 gives a muxing period of ~4ms
    // this gives a refresh rate of around 30 Hz
    
    // Set prescaler to 1:4
    T4CONbits.TCKPS = 0b010;
    
    // Set period to 12500
    PR4 = 12500;
    
    // Disable 32 bit mode
    T4CONbits.T32 = 0;
    
    // Set clock source to PBCLK3
    T4CONbits.TCS = 0;
    
    // Clear timer
    TMR4 = 0;
    
    // Clear Timer Interrupt Flag
    clearInterruptFlag(Timer4);
    
    // Set Timer interrupt priority
    setInterruptPriority(Timer4, 5);
    setInterruptSubpriority(Timer4, 2);
    
    // Enable timer interrupt
    enableInterrupt(Timer4);
    
    // Start timer
    T4CONbits.ON = 1;
    
}

// This function initializes the brightness timer (using timer 5)
void vfdBrightnessTimerInitialize(void) {
    
    // Disable timer to start init
    T5CONbits.ON = 0;
    
    // Enable stop in idle, we don't want to mux when in sleep mode
    T5CONbits.SIDL = 1;
    
    // Disable gating
    T5CONbits.TGATE = 0;
    
    // prescaler of 1:4 and period of 11000 gives an on time of ~3.5ms
    
    // Set prescaler to 1:4
    T5CONbits.TCKPS = 0b010;
    
    // Set period to 11000
    PR5 = 11000;
    
    // Set clock source to PBCLK3
    T5CONbits.TCS = 0;
    
    // Clear timer
    TMR5 = 0;
    
    // Clear Timer Interrupt Flag
    clearInterruptFlag(Timer5);
    
    // Set Timer interrupt priority
    setInterruptPriority(Timer5, 5);
    setInterruptSubpriority(Timer5, 2);
    
    // Enable timer interrupt
    enableInterrupt(Timer5);
    
}


// muxing timer interrupt service routine
void __ISR(_TIMER_4_VECTOR, IPL5SRS) vfdMultiplexingTimerISR(void) {
    
    // start brightness timer
    T5CONbits.ON = 1;
    
    // clear IRQ
    clearInterruptFlag(Timer4);
    
}

// brightness timer interrupt service routine
void __ISR(_TIMER_5_VECTOR, IPL5SRS) vfdBrightnessTimerISR(void) {
    
    // stop brightness timer
    T5CONbits.ON = 0;
    
    // clear IRQ
    clearInterruptFlag(Timer5);
    
}

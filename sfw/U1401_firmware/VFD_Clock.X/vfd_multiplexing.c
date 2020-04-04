
#include <xc.h>
#include <string.h>

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
    
    // prescaler of 1:2 and period of 12500 gives a muxing period of ~2ms
    // this gives a refresh rate of around 60 Hz
    
    // Set prescaler to 1:2
    T4CONbits.TCKPS = 0b001;
    
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
    
    // set first tube to drive to vfd_tube_0
    active_tube = vfd_tube_0;
    
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
    
    // prescaler of 1:2 and period of 11000 gives an on time of ~1.75ms
    
    // Set prescaler to 1:2
    T5CONbits.TCKPS = 0b001;
    
    // Set period to 9000
    PR5 = 9000;
    
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
    
    // Set the grids for the VFD tubes based on the active_tube global enum
    setVFDGrids();
    
    // Set the anodes for the given VFD tube
    // only do this for tubes that display numbers, not the colons
    // inverse which number appears where, since we want data to show up left to right,
    // to match the order of characters in vfd_display_buffer[]
    if (active_tube < right_colon) setVFDAnodes(vfd_display_buffer[5 - active_tube]);
    
    // increment active tube and reset if needed
    active_tube++;
    if (active_tube >= left_colon) active_tube = vfd_tube_0;
    
    // start brightness timer
    T5CONbits.ON = 1;
    
    // clear IRQ
    clearInterruptFlag(Timer4);
    
}

// brightness timer interrupt service routine
void __ISR(_TIMER_5_VECTOR, IPL5SRS) vfdBrightnessTimerISR(void) {
    
    // stop brightness timer
    T5CONbits.ON = 0;
    
    // blank all grids
    blankVFDGrids();
    
    // Blank all anodes
    blankVFDAnodes();
    
    // clear IRQ
    clearInterruptFlag(Timer5);
    
}

// This function sets all VFD tube grids low
void blankVFDGrids(void) {
 
    // Set all grids, along with colon anodes, low
    GRID_0_PIN = LOW;
    GRID_1_PIN = LOW;
    GRID_2_PIN = LOW;
    GRID_3_PIN = LOW;
    GRID_4_PIN = LOW;
    GRID_5_PIN = LOW;
    COLON_0_PIN = LOW;
    COLON_1_PIN = LOW;
    COLON_2_PIN = LOW;
    COLON_3_PIN = LOW;
    
}

// This function blanks all VFD anodes
void blankVFDAnodes(void) {
 
    // blank all anodes
    ANODE_A_PIN = LOW;
    ANODE_B_PIN = LOW;
    ANODE_C_PIN = LOW;
    ANODE_D_PIN = LOW;
    ANODE_E_PIN = LOW;
    ANODE_F_PIN = LOW;
    ANODE_G_PIN = LOW;
    ANODE_DP_PIN = LOW;
    
}

// This function sets up the grids for driving tubes based on active_tube enum
void setVFDGrids(void) {

    // decide what to do based on which tube we want to drive
    switch (active_tube) {
     
        case vfd_tube_0:
            GRID_0_PIN = HIGH;
            break;
            
        case vfd_tube_1:
            GRID_1_PIN = HIGH;
            break;
            
        case right_colon:
            Nop();                          // CHANGE MEEEEEE
            break;
            
        case vfd_tube_2:
            GRID_2_PIN = HIGH;
            break;
            
        case vfd_tube_3:
            GRID_3_PIN = HIGH;
            break;    
            
        case left_colon:
            Nop();                          // CHANGE MEEEEEEE
            break;
            
        case vfd_tube_4:
            GRID_4_PIN = HIGH;
            break;
            
        case vfd_tube_5:
            GRID_5_PIN = HIGH;
            break;
            
        default:
            break;
        
    }
    
}

// This function sets the proper anodes to display the character passed 
// PASS A CHARACTER, NOT A NUMBER!
void setVFDAnodes(char input_char) {
 
    // Set anodes based on input_char
    // This is a mapping of all supported characters
    // This switch statement acts as a seven segment decoder
    switch (input_char) {
        
        case '0':
            ANODE_A_PIN = HIGH;
            ANODE_B_PIN = HIGH;
            ANODE_C_PIN = HIGH;
            ANODE_D_PIN = HIGH;
            ANODE_E_PIN = HIGH;
            ANODE_F_PIN = HIGH;
            break;
            
        case '1':
            ANODE_B_PIN = HIGH;
            ANODE_C_PIN = HIGH;
            break;
            
        case '2':
            ANODE_A_PIN = HIGH;
            ANODE_B_PIN = HIGH;
            ANODE_D_PIN = HIGH;
            ANODE_E_PIN = HIGH;
            ANODE_G_PIN = HIGH;
            break;
            
        case '3':
            ANODE_A_PIN = HIGH;
            ANODE_B_PIN = HIGH;
            ANODE_C_PIN = HIGH;
            ANODE_D_PIN = HIGH;
            ANODE_G_PIN = HIGH;
            break;
            
        case '4':
            ANODE_B_PIN = HIGH;
            ANODE_C_PIN = HIGH;
            ANODE_F_PIN = HIGH;
            ANODE_G_PIN = HIGH;
            break;
            
        case '5':
            ANODE_A_PIN = HIGH;
            ANODE_C_PIN = HIGH;
            ANODE_D_PIN = HIGH;
            ANODE_F_PIN = HIGH;
            ANODE_G_PIN = HIGH;
            break;
            
        case '6':
            ANODE_A_PIN = HIGH;
            ANODE_C_PIN = HIGH;
            ANODE_D_PIN = HIGH;
            ANODE_E_PIN = HIGH;
            ANODE_F_PIN = HIGH;
            ANODE_G_PIN = HIGH;
            break;
            
        case '7':
            ANODE_A_PIN = HIGH;
            ANODE_B_PIN = HIGH;
            ANODE_C_PIN = HIGH;
            break;
            
        case '8':
            ANODE_A_PIN = HIGH;
            ANODE_B_PIN = HIGH;
            ANODE_C_PIN = HIGH;
            ANODE_D_PIN = HIGH;
            ANODE_E_PIN = HIGH;
            ANODE_F_PIN = HIGH;
            ANODE_G_PIN = HIGH;
            break;
            
        case '9':
            ANODE_A_PIN = HIGH;
            ANODE_B_PIN = HIGH;
            ANODE_C_PIN = HIGH;
            ANODE_F_PIN = HIGH;
            ANODE_G_PIN = HIGH;
            break;
            
        case 'A':
            ANODE_A_PIN = HIGH;
            ANODE_B_PIN = HIGH;
            ANODE_C_PIN = HIGH;
            ANODE_E_PIN = HIGH;
            ANODE_F_PIN = HIGH;
            ANODE_G_PIN = HIGH;
            break;
            
        case 'b':
            ANODE_C_PIN = HIGH;
            ANODE_D_PIN = HIGH;
            ANODE_E_PIN = HIGH;
            ANODE_F_PIN = HIGH;
            ANODE_G_PIN = HIGH;
            break;
            
        case 'C':
            ANODE_A_PIN = HIGH;
            ANODE_D_PIN = HIGH;
            ANODE_E_PIN = HIGH;
            ANODE_F_PIN = HIGH;
            break;
            
        case 'd':
            ANODE_B_PIN = HIGH;
            ANODE_C_PIN = HIGH;
            ANODE_D_PIN = HIGH;
            ANODE_E_PIN = HIGH;
            ANODE_G_PIN = HIGH;
            break;
            
        case 'E':
            ANODE_A_PIN = HIGH;
            ANODE_D_PIN = HIGH;
            ANODE_E_PIN = HIGH;
            ANODE_F_PIN = HIGH;
            ANODE_G_PIN = HIGH;
            break;
            
        case 'F':
            ANODE_A_PIN = HIGH;
            ANODE_E_PIN = HIGH;
            ANODE_F_PIN = HIGH;
            ANODE_G_PIN = HIGH;
            break;
        
    }
    
}
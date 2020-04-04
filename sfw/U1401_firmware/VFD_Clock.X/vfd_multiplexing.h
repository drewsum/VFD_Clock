/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _VFD_MULTIPLEXING_H    /* Guard against multiple inclusion */
#define _VFD_MULTIPLEXING_H

#include <xc.h>

// These are macros needed for defining ISRs, included in XC32
#include <sys/attribs.h>

#include "32mz_interrupt_control.h"
#include "pin_macros.h"

/*
 * 
 * Two timers are used to control the mutliplexing period and 
 * on-time of the VFD tubes on the display board
 * 
 * The vfdMultiplexingTimer is what controls the refresh rate
 * 
 * The vfdBrightnessTimer is what controls the on time
 * 
 * the brightness timer must always have a shorter period than
 * the multiplexing timer.
 * 
 * The multplexing timer runs at a fixed period to give a fixed refresh rate,
 * and is never stopped except when the display is disabled
 * 
 * The brightness timer is started every overflow of the multiplexing timer,
 * and the grids/anodes of the VFD tubes are set. The brightness timer runs, and
 * when it overflows, all grids and anodes are blanked. The brightness timer
 * period can be adjusted to adjust brightness of the display. Keep in mind
 * that the brightness timer and multiplexing timer but have some margin in
 * the difference between their period so that there is always SOME blanking
 * time in between the different numerals
 * 
 * 
 * 
 * */

// This enum keeps track of which VFD tube we're currently driving
// This includes the six numerals as well as the two colons
enum active_tube_e {
    
    vfd_tube_0 = 0,
    vfd_tube_1 = 1,
    right_colon = 2,
    vfd_tube_2 = 3,
    vfd_tube_3 = 4,
    left_colon = 5,
    vfd_tube_4 = 6,
    vfd_tube_5 = 7
    
} active_tube;

// This buffer keeps track of which characters are displayed on which tubes
// Copy a <= 8 character string into it
// characters [2] and [5] can only display *, _ and : (these are the colons)
char vfd_display_buffer[8];

// This function initializes the multiplexing timer (using timer 4)
void vfdMultiplexingTimerInitialize(void);

// This function initializes the brightness timer (using timer 5)
void vfdBrightnessTimerInitialize(void);

// muxing timer interrupt service routine
void __ISR(_TIMER_4_VECTOR, IPL5SRS) vfdMultiplexingTimerISR(void);

// brightness timer interrupt service routine
void __ISR(_TIMER_5_VECTOR, IPL5SRS) vfdBrightnessTimerISR(void);

// This function sets all VFD tube grids low
void blankVFDGrids(void);

// This function blanks all VFD anodes
void blankVFDAnodes(void);

// This function sets up the grids for driving tubes based on active_tube enum
void setVFDGrids(void);

// This function sets the proper anodes to display the character passed 
// PASS A CHARACTER, NOT A NUMBER!
void setVFDAnodes(char input_char);

// This function sets anodes for the colons
// pass a colon number (0:1) and a character to display (:, _, and *)
void setVFDColonAnodes(uint8_t colon_number, char input_char);


#endif /* _VFD_MULTIPLEXING_H */

/* *****************************************************************************
 End of File
 */

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

// This function initializes the multiplexing timer (using timer 4)
void vfdMultiplexingTimerInitialize(void);

// This function initializes the brightness timer (using timer 5)
void vfdBrightnessTimerInitialize(void);

// muxing timer interrupt service routine
void __ISR(_TIMER_4_VECTOR, IPL5SRS) vfdMultiplexingTimerISR(void);

// brightness timer interrupt service routine
void __ISR(_TIMER_5_VECTOR, IPL5SRS) vfdBrightnessTimerISR(void);


#endif /* _VFD_MULTIPLEXING_H */

/* *****************************************************************************
 End of File
 */

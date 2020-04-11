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

#ifndef _CLOCK_FUNCTIONALITY_H    /* Guard against multiple inclusion */
#define _CLOCK_FUNCTIONALITY_H

#include <xc.h>

#include "vfd_multiplexing.h"
#include "rtcc.h"

// These are macros needed for defining ISRs, included in XC32
#include <sys/attribs.h>

// These macros set the data to be sent to the display board GPIO expander
// to set display LEDs to show what clock_display_state enum is set to
#define DISPLAY_LEDS_DISPLAY_TIME_STATE         0b0000010000000000
#define DISPLAY_LEDS_SET_TIME_STATE             0b0000001000000000
#define DISPLAY_LEDS_DISPLAY_DATE_STATE         0b0000000100000000
#define DISPLAY_LEDS_SET_DATE_STATE             0b0000000010000000
#define DISPLAY_LEDS_DISPLAY_WEEKDAY_STATE      0b0000000001000000
#define DISPLAY_LEDS_SET_WEEKDAY_STATE          0b0000000000100000
#define DISPLAY_LEDS_DISPLAY_ALARM_STATE        0b0000000000010000
#define DISPLAY_LEDS_SET_ALARM_STATE            0b0000000000001000
#define DISPLAY_LEDS_ALARM_ENABLE_STATE         0b0000000000000100
#define DISPLAY_LEDS_SET_24HR_MODE_STATE        0b0000000000000010
#define DISPLAY_LEDS_SET_BRIGHTNESS_STATE       0b0000000000000001

// This flag is what allows values to alternate on and off when setting them
// with capacitive pushbuttons
volatile uint8_t clock_set_blank_request = 0;

// This global enum keeps track of what we want to display on the VFD display
// This needs to be volatile because a bunch of different functions can modify it
enum clock_display_state_e {
    
    display_time_state = 0,
    set_time_state = 1,
    display_date_state = 2,
    set_date_state = 3,
    display_weekday_state = 4,
    set_weekday_state = 5,
    display_alarm_state = 6,
    set_alarm_state = 7,
    alarm_enable_state = 8,
    set_24hr_mode_state = 9,
    set_brightness_state = 10
    
} volatile clock_display_state = 0;

// This enum keeps track of which time setting we're changing when the user wants
// to change the time (hours, minutes, seconds
enum clock_time_setting_s {
    
    set_time_hours_state = 0,
    set_time_minutes_state = 1,
    set_time_seconds_state = 2,
    clock_time_setting_finished_state = 3
    
}
volatile clock_time_setting = 3;

// This enum keeps track of which date setting we're changing when the user wants
// to change the date (months, days, year
enum clock_date_setting_s {
    
    set_date_month_state = 0,
    set_date_day_state = 1,
    set_date_year_state = 2,
    clock_date_setting_finished_state = 3
    
}
volatile clock_date_setting = 3;

// This enum keeps track of which weekday setting we're changing when the user wants
// to change the weekday
// (only lets you set the weekday or nothing, since there is only one parameter to change
enum clock_weekday_setting_s {
    
    set_weekday_day_state = 0,
    clock_weekday_setting_finished_state = 1
    
}
volatile clock_weekday_setting = 1;


// This function updates the VFD display based on the current state of what we want to display
// relies on global variables in vfd_multiplexing and rtcc modules
void updateClockDisplay(void);

// This function setups up the display board. It assumes that I2C, USB UART and GPIO have already been configured
void displayBoardInitialize(void);

// this function sets the state of the display board LEDs to match what clock_display_state enum is set to
void displayBoardSetLEDs(void);

// This function initializes capacitive pushbuttons located on the display board
void displayBoardCapTouchInitialize(void);

// PORTA CNF ISR
void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SRS) displayBoardCapTouchISR1(void);

// PORTB CNF ISR
void __ISR(_CHANGE_NOTICE_B_VECTOR, IPL2SRS) displayBoardCapTouchISR2(void);

// Power Button ISR
void __ISR(_EXTERNAL_2_VECTOR, IPL2SRS) displayBoardCapTouchPowerISR(void);

// These functions are handler functions for each button, called when pressed
void upPushbuttonHandler(void);
void downPushbuttonHandler(void);
void leftPushbuttonHandler(void);
void rightPushbuttonHandler(void);
void powerPushbuttonHandler(void);

// This timer is used to blink values that are being changed using the pushbuttons
// Using timer 6 for this
void clockSetBlankingTimerInitialize(void);

// this is the ISR for the clock set blanking timer
void __ISR(_TIMER_6_VECTOR, IPL6SRS) clockSetBlankingTimerISR(void);

#endif /* _CLOCK_FUNCTIONALITY_H */

/* *****************************************************************************
 End of File
 */

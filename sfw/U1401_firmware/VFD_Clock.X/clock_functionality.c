
#include <xc.h>

#include <stdio.h>
#include <string.h>

#include "clock_functionality.h"

#include "vfd_multiplexing.h"
#include "rtcc.h"
#include "terminal_control.h"
#include "misc_i2c_devices.h"

// This function updates the VFD display based on the current state of what we want to display
// relies on global variables in vfd_multiplexing and rtcc modules
void updateClockDisplay(void) {
 
    // decide what to shove into the vfd_display_buffer[] based on what we're showing
    switch (clock_display_state) {
    
        case display_time_state:
            if (rtcc_shadow.seconds % 2 == 0) {
                sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
            }
            else {
                sprintf(vfd_display_buffer, "%02u %02u %02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
            }
            break;
            
        case set_time_state:
            break;
            
        case display_date_state:
            sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
            break;
            
        case set_date_state:
            break;
            
        case display_weekday_state:
            sprintf(vfd_display_buffer, "       %u", rtcc_shadow.day);
            break;
            
        case set_weekday_state:
            break;
            
        case display_alarm_state:
            break;
            
        case set_alarm_state:
            break;
            
        case alarm_enable_state:
            break;
            
        case set_24hr_mode_state:
            break;
            
        case set_brightness_state:
            break;
            
        default:
            Nop();
            break;
        
    }
    
}

// This function setups up the display board. It assumes that I2C, USB UART and GPIO have already been configured
void displayBoardInitialize(void) {
 
    
    // We're done with logic board init, move onto to display board
    // First, turn on +5V power supply
    POS5_RUN_PIN = HIGH;
    uint32_t timeout = 0xFFFF;
    while (timeout > 0 && POS5_PGOOD_PIN == LOW) timeout--;
    // This if statement is true if we were bale to turn on the +5V power supply
    if (POS5_PGOOD_PIN) {
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
        printf("    +5V Power Supply Enabled, +5V rail in regulation\r\n");
    }
    else {
        POS5_RUN_PIN = LOW;
        terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
        printf("    +5V Power Supply failed to enable\r\n");
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    }
    
    // If we enabled POS5, enable level shifters to check for display board
    if (POS5_PGOOD_PIN) {
        nIO_LEVEL_SHIFT_ENABLE_PIN = LOW;
        printf("    Logic Board IO Level Shifters Enabled\r\n");
    }
    
    // If we found a display board, print this, if not, disable level shifters and POS5
    if (nDISPLAY_DETECT_PIN == LOW) {
        printf("Display Board Detected, Beginning Display Board Initialization:\r\n");
        I2C_DSP_EN_PIN = HIGH;
        printf("    Display Board I2C Buffer Enabled\r\n");
    }
    else {
        nIO_LEVEL_SHIFT_ENABLE_PIN = HIGH;
        POS5_RUN_PIN = LOW;
        terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
        printf("No display board detected, install one and reset host (or power cycle)\r\n");
        printf("    Logic Board IO Level Shifters Disabled\r\n");
        printf("    +5V Power Supply Disabled\r\n");
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    }
    
    // setup display board GPIO expander
    if (I2C_DSP_EN_PIN) {
        displayI2CInitialize();
        printf("    Display Board I2C Devices Initialized\r\n");   
    }
    
    // Setup display board specific stuff
    if (nDISPLAY_DETECT_PIN == LOW) {
        vfdMultiplexingTimerInitialize();
        vfdBrightnessTimerInitialize();
        printf("    Multiplexing Timers Initialized\r\n");
        
        // start off displaying the time
        clock_display_state = display_time_state;
        displayBoardSetLEDs();
    
        
        POS1P2_VFF_RUN_PIN = HIGH;
        timeout = 0xFFFF;
        while (timeout > 0 && POS1P2_VFF_PGOOD_PIN == LOW) timeout--;
        // This if statement is true if we were bale to turn on the +5V power supply
        if (POS1P2_VFF_PGOOD_PIN) {
            printf("    +1.2VFF Power Supply Enabled, +1.2VFF rail in regulation\r\n");
        }
        else {
            POS1P2_VFF_RUN_PIN = LOW;
            terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
            printf("    +1.2VFF Power Supply failed to enable\r\n");
            terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
        }
        
        POS60_VAN_RUN_PIN = HIGH;
        timeout = 0xFFFF;
        while (timeout > 0 && POS60_VAN_PGOOD_PIN == LOW) timeout--;
        // This if statement is true if we were bale to turn on the +5V power supply
        if (POS60_VAN_PGOOD_PIN) {
            printf("    +60VAN Power Supply Enabled, +60VAN rail in regulation\r\n");
        }
        else {
            POS60_VAN_RUN_PIN = LOW;
            terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
            printf("    +60VAN Power Supply failed to enable\r\n");
            terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
        }
        
    }
    
}

// this function sets the state of the display board LEDs to match what clock_display_state enum is set to
void displayBoardSetLEDs(void) {
 
    // decide what to shove into the vfd_display_buffer[] based on what we're showing
    switch (clock_display_state) {
    
        case display_time_state:
            displayBoardSetIOExpanderOutput(DISPLAY_LEDS_DISPLAY_TIME_STATE);
            break;
            
        case set_time_state:
            displayBoardSetIOExpanderOutput(DISPLAY_LEDS_SET_TIME_STATE);
            break;
            
        case display_date_state:
            displayBoardSetIOExpanderOutput(DISPLAY_LEDS_DISPLAY_DATE_STATE);
            break;
            
        case set_date_state:
            displayBoardSetIOExpanderOutput(DISPLAY_LEDS_SET_DATE_STATE);
            break;
            
        case display_weekday_state:
            displayBoardSetIOExpanderOutput(DISPLAY_LEDS_DISPLAY_WEEKDAY_STATE);
            break;
            
        case set_weekday_state:
            displayBoardSetIOExpanderOutput(DISPLAY_LEDS_SET_WEEKDAY_STATE);
            break;
            
        case display_alarm_state:
            displayBoardSetIOExpanderOutput(DISPLAY_LEDS_DISPLAY_ALARM_STATE);
            break;
            
        case set_alarm_state:
            displayBoardSetIOExpanderOutput(DISPLAY_LEDS_SET_ALARM_STATE);
            break;
            
        case alarm_enable_state:
            displayBoardSetIOExpanderOutput(DISPLAY_LEDS_ALARM_ENABLE_STATE);
            break;
            
        case set_24hr_mode_state:
            displayBoardSetIOExpanderOutput(DISPLAY_LEDS_SET_24HR_MODE_STATE);
            break;
            
        case set_brightness_state:
            displayBoardSetIOExpanderOutput(DISPLAY_LEDS_SET_BRIGHTNESS_STATE);
            break;
            
        default:
            displayBoardSetIOExpanderOutput(0x0000);
            break;
        
    }
    
    
}
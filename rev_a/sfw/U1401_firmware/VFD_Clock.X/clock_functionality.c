
#include <xc.h>

#include <stdio.h>
#include <string.h>

#include "clock_functionality.h"

#include "vfd_multiplexing.h"
#include "rtcc.h"
#include "terminal_control.h"
#include "misc_i2c_devices.h"
#include "32mz_interrupt_control.h"
#include "heartbeat_services.h"

// This function updates the VFD display based on the current state of what we want to display
// relies on global variables in vfd_multiplexing and rtcc modules
void updateClockDisplay(void) {
 
    // decide what to shove into the vfd_display_buffer[] based on what we're showing
    switch (clock_display_state) {
    
        case display_time_state:
            if (rtcc_shadow.seconds % 2 == 0) {
                if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    dp_anode_request = 0;
                }
                else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours - 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    dp_anode_request = 1;
                }
                else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    dp_anode_request = 1;
                }
                else {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    dp_anode_request = 0;
                }
            }
            else {
                if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                    sprintf(vfd_display_buffer, "%02u %02u %02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    dp_anode_request = 0;
                }
                else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                    sprintf(vfd_display_buffer, "%02u %02u %02u", rtcc_shadow.hours - 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    dp_anode_request = 1;
                }
                else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                    sprintf(vfd_display_buffer, "%02u %02u %02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    dp_anode_request = 1;
                }
                else {
                    sprintf(vfd_display_buffer, "%02u %02u %02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    dp_anode_request = 0;
                }
            }
            break;
            
        case set_time_state:
            if (clock_set_blank_request == 0) {
                if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    dp_anode_request = 0;
                }
                else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours - 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    dp_anode_request = 1;
                }
                else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    dp_anode_request = 1;
                }
                else {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    dp_anode_request = 0;
                }
            }
            else {
                switch (clock_time_setting) {
                    case set_time_hours_state:
                        sprintf(vfd_display_buffer, "  :%02u:%02u", rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                        break;
                    case set_time_minutes_state:
                        if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                            sprintf(vfd_display_buffer, "%02u:  :%02u", 12, rtcc_shadow.seconds);
                            dp_anode_request = 0;
                        }
                        else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                            sprintf(vfd_display_buffer, "%02u:  :%02u", rtcc_shadow.hours - 12, rtcc_shadow.seconds);
                            dp_anode_request = 1;
                        }
                        else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                            sprintf(vfd_display_buffer, "%02u:  :%02u", 12, rtcc_shadow.seconds);
                            dp_anode_request = 1;
                        }
                        else {
                            sprintf(vfd_display_buffer, "%02u:  :%02u", rtcc_shadow.hours, rtcc_shadow.seconds);
                            dp_anode_request = 0;
                        }
                        break;
                    case set_time_seconds_state:
                        if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                            sprintf(vfd_display_buffer, "%02u:%02u:  ", 12, rtcc_shadow.minutes);
                            dp_anode_request = 0;
                        }
                        else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                            sprintf(vfd_display_buffer, "%02u:%02u:  ", rtcc_shadow.hours - 12, rtcc_shadow.minutes);
                            dp_anode_request = 1;
                        }
                        else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                            sprintf(vfd_display_buffer, "%02u:%02u:  ", 12, rtcc_shadow.minutes);
                            dp_anode_request = 1;
                        }
                        else {
                            sprintf(vfd_display_buffer, "%02u:%02u:  ", rtcc_shadow.hours, rtcc_shadow.minutes);
                            dp_anode_request = 0;
                        }
                        break;
                    case clock_time_setting_finished_state:
                        if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                            sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                            dp_anode_request = 0;
                        }
                        else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                            sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours - 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                            dp_anode_request = 1;
                        }
                        else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                            sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                            dp_anode_request = 1;
                        }
                        else {
                            sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                            dp_anode_request = 0;
                        }
                        break;
                }
            }
            break;
            
        case display_date_state:
            sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
            dp_anode_request = 0;
            break;
            
        case set_date_state:
            if (clock_set_blank_request == 0) {
                sprintf(vfd_display_buffer, "%02u*%02u*%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
            }
            else {
                switch (clock_date_setting) {
                    case set_date_month_state:
                        sprintf(vfd_display_buffer, "  *%02u*%02u", rtcc_shadow.day, rtcc_shadow.year - 2000);
                        break;
                    case set_date_day_state:
                        sprintf(vfd_display_buffer, "%02u*  *%02u", rtcc_shadow.month, rtcc_shadow.year - 2000);
                        break;
                    case set_date_year_state:
                        sprintf(vfd_display_buffer, "%02u*%02u*  ", rtcc_shadow.month, rtcc_shadow.day);
                        break;
                    case clock_date_setting_finished_state:
                        sprintf(vfd_display_buffer, "%02u*%02u*%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                        break;
                }
            }
            dp_anode_request = 0;
            break;
            
        case display_weekday_state:
            sprintf(vfd_display_buffer, "       %u", (uint8_t) rtcc_shadow.weekday + 1);
            dp_anode_request = 0;
            break;
            
        case set_weekday_state:
            if (clock_set_blank_request == 0) {
                sprintf(vfd_display_buffer, "       %u", (uint8_t) rtcc_shadow.weekday + 1);
            }
            else {
                switch (clock_weekday_setting) {
                    case set_weekday_day_state:
                        sprintf(vfd_display_buffer, "        ");
                        break;
                    case clock_weekday_setting_finished_state:
                        sprintf(vfd_display_buffer, "       %u", (uint8_t) rtcc_shadow.weekday + 1);
                        break;
                }
            }
            dp_anode_request = 0;
            break;
            
        case display_alarm_state:
            if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                dp_anode_request = 0;
            }
            else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                dp_anode_request = 1;
            }
            else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                dp_anode_request = 1;
            }
            else {
                sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                dp_anode_request = 0;
            }
            break;
            
        case set_alarm_state:
            if (clock_set_blank_request == 0) {
                if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                    dp_anode_request = 0;
                }
                else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                    dp_anode_request = 1;
                }
                else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                    dp_anode_request = 1;
                }
                else {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                    dp_anode_request = 0;
                }
            }
            else {
                switch (clock_alarm_setting) {
                    case set_alarm_hours_state:
                        sprintf(vfd_display_buffer, "  :%02u:%02u", clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                        break;
                    case set_alarm_minutes_state:
                        if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                            sprintf(vfd_display_buffer, "%02u:  :%02u", 12, clock_alarm.alarm_second);
                            dp_anode_request = 0;
                        }
                        else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                            sprintf(vfd_display_buffer, "%02u:  :%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_second);
                            dp_anode_request = 1;
                        }
                        else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                            sprintf(vfd_display_buffer, "%02u:  :%02u", 12, clock_alarm.alarm_second);
                            dp_anode_request = 1;
                        }
                        else {
                            sprintf(vfd_display_buffer, "%02u:  :%02u", clock_alarm.alarm_hour, clock_alarm.alarm_second);
                            dp_anode_request = 0;
                        }
                        break;
                    case set_alarm_seconds_state:
                        if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                            sprintf(vfd_display_buffer, "%02u:%02u:  ", 12, clock_alarm.alarm_minute);
                            dp_anode_request = 0;
                        }
                        else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                            sprintf(vfd_display_buffer, "%02u:%02u:  ", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute);
                            dp_anode_request = 1;
                        }
                        else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                            sprintf(vfd_display_buffer, "%02u:%02u:  ", 12, clock_alarm.alarm_minute);
                            dp_anode_request = 1;
                        }
                        else {
                            sprintf(vfd_display_buffer, "%02u:%02u:  ", clock_alarm.alarm_hour, clock_alarm.alarm_minute);
                            dp_anode_request = 0;
                        }
                        break;
                    case clock_alarm_setting_finished_state:
                        if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                            sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                            dp_anode_request = 0;
                        }
                        else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                            sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                            dp_anode_request = 1;
                        }
                        else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                            sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                            dp_anode_request = 1;
                        }
                        else {
                            sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                            dp_anode_request = 0;
                        }
                        break;
                }
            }
            break;
            
        case alarm_enable_state:
            if (clock_set_blank_request == 0) {
                sprintf(vfd_display_buffer, "%s", clock_alarm.alarm_arm ? "tr uE   " : "FA LS E ");
            }
            else {
                switch (clock_alarm_enable_setting) {
                    case set_alarm_arm:
                        sprintf(vfd_display_buffer, "        ");
                        break;
                    case clock_alarm_enable_finished_state:
                        sprintf(vfd_display_buffer, "%s", clock_alarm.alarm_arm ? "tr uE   " : "FA LS E ");
                        break;
                }
            }
            dp_anode_request = 0;
            break;
            
        case set_24hr_mode_state:
            if (clock_set_blank_request == 0) {
                sprintf(vfd_display_buffer, "%s", am_pm_enable ? "FA LS E " : "tr uE   ");
            }
            else {
                switch (clock_24hr_setting) {
                    case set_24hr_value_state:
                        sprintf(vfd_display_buffer, "        ");
                        break;
                    case clock_24hr_setting_finished_state:
                        sprintf(vfd_display_buffer, "%s", am_pm_enable ? "FA LS E " : "tr uE   ");
                        break;
                }
            }
            dp_anode_request = 0;
            break;
            
        case set_brightness_state:
            if (clock_set_blank_request == 0) {
                sprintf(vfd_display_buffer, "      %02u", vfd_display_brightness_setting / 10);
            }
            else {
                switch (clock_brightness_setting) {
                    case set_brightness_value_state:
                        sprintf(vfd_display_buffer, "        ");
                        break;
                    case clock_brightness_setting_finished_state:
                        sprintf(vfd_display_buffer, "      %02u", vfd_display_brightness_setting / 10);
                        break;
                }
            }
            dp_anode_request = 0;
            break;
            
        default:
            dp_anode_request = 0;
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
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("Display Board Detected, Beginning Display Board Initialization:\r\n");
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
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
        
        displayBoardCapTouchInitialize();
        printf("    Capacitive Pushbuttons Initialized\r\n");
        terminalTextAttributesReset();
        
        // save the state that we've enabled the display
        display_power_toggle_flag = 1;
        
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

// this function checks if the current time matches the alarm time and sets the buzzer
// if the alarm is armed.
void clockAlarmCheckMatch(void) {
 
    // only evaluate this stuff if the alarm is armed and not currently sounding
    if (clock_alarm.alarm_arm && BUZZER_ENABLE_PIN == LOW) {
     
        // If the alarm settings and current time match, trigger the alarm
        if (    clock_alarm.alarm_hour == rtcc_shadow.hours &&
                clock_alarm.alarm_minute == rtcc_shadow.minutes &&
                clock_alarm.alarm_second == rtcc_shadow.seconds) {
            BUZZER_ENABLE_PIN = HIGH;
            
        }
        
    }
    
}

// This function initializes capacitive pushbuttons located on the display board
void displayBoardCapTouchInitialize(void) {
 
    // Configure PORT A CNF
    disableInterrupt(PORTA_Input_Change_Interrupt);
    CNCONAbits.EDGEDETECT = 1;
    CNCONAbits.ON = 1;
    setInterruptPriority(PORTA_Input_Change_Interrupt, 2);
    setInterruptSubpriority(PORTA_Input_Change_Interrupt, 0);
    
    
    // Set rising edge detection on pins RA9, RA10
    CNENA = 0;
    CNNEA = 0;
    CNENAbits.CNIEA9 = 1;
    CNENAbits.CNIEA10 = 1;
    
    // Configure PORT B CNF
    disableInterrupt(PORTB_Input_Change_Interrupt);
    CNCONBbits.EDGEDETECT = 1;
    CNCONBbits.ON = 1;
    setInterruptPriority(PORTB_Input_Change_Interrupt, 2);
    setInterruptSubpriority(PORTB_Input_Change_Interrupt, 1);
    
    // Set rising edge detection on RB0, RB1
    CNENB = 0;
    CNNEB = 0;
    CNENBbits.CNIEB0 = 1;
    CNENBbits.CNIEB1 = 1;
    
    // Setup INT2 (power cap touch pushbutton), rising edge
    disableInterrupt(External_Interrupt_2);
    INTCONbits.INT2EP = 1;
    setInterruptPriority(External_Interrupt_2, 2);
    setInterruptSubpriority(External_Interrupt_2, 2);
    
    // Enable interrupts
    clearInterruptFlag(PORTA_Input_Change_Interrupt);
    clearInterruptFlag(PORTB_Input_Change_Interrupt);
    clearInterruptFlag(External_Interrupt_2);
    enableInterrupt(PORTA_Input_Change_Interrupt);
    enableInterrupt(PORTB_Input_Change_Interrupt);
    enableInterrupt(External_Interrupt_2);
    
    clockSetBlankingTimerInitialize();
    
}

// PORTA CNF ISR
void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SRS) displayBoardCapTouchISR1(void) {
    
    if (CNFAbits.CNFA9 && CNENAbits.CNIEA9) {
            
        terminalTextAttributes(MAGENTA_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("User pressed Up button\r\n");
        terminalTextAttributesReset();
        
        if (display_power_toggle_flag) upPushbuttonHandler();
    
    }
    
    if (CNFAbits.CNFA10 && CNENAbits.CNIEA10) {
            
        terminalTextAttributes(MAGENTA_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("User pressed Down button\r\n");
        terminalTextAttributesReset();
        
        if (display_power_toggle_flag) downPushbuttonHandler();
    
    }
    
    
    // Clear all change notification flags
    // If this is not done, we'll continuously trigger on edges that aren't there
    CNFA    = 0;
    CNSTATA = 0;
    
    // Read PORTF, this clears more CN flags
    uint16_t dummy = PORTA;
    
    clearInterruptFlag(PORTA_Input_Change_Interrupt);
    
}

// PORTB CNF ISR
void __ISR(_CHANGE_NOTICE_B_VECTOR, IPL2SRS) displayBoardCapTouchISR2(void) {
    
    if (CNFBbits.CNFB0 && CNENBbits.CNIEB0) {
            
        terminalTextAttributes(MAGENTA_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("User pressed Right button\r\n");
        terminalTextAttributesReset();
    
        if (display_power_toggle_flag) rightPushbuttonHandler();
        
    }
    
    if (CNFBbits.CNFB1 && CNENBbits.CNIEB1) {
            
        terminalTextAttributes(MAGENTA_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("User pressed Left button\r\n");
        terminalTextAttributesReset();
        
        if (display_power_toggle_flag) leftPushbuttonHandler();
    
    }
    
    
    // Clear all change notification flags
    // If this is not done, we'll continuously trigger on edges that aren't there
    CNFB    = 0;
    CNSTATB = 0;
    
    // Read PORTF, this clears more CN flags
    uint16_t dummy = PORTB;
    
    clearInterruptFlag(PORTB_Input_Change_Interrupt);
    
}

// Power Button ISR
void __ISR(_EXTERNAL_2_VECTOR, IPL2SRS) displayBoardCapTouchPowerISR(void) {
 
    terminalTextAttributes(MAGENTA_COLOR, BLACK_COLOR, BOLD_FONT);
    printf("User pressed Power button\r\n");
    terminalTextAttributesReset();
    
    powerPushbuttonHandler();
    
    clearInterruptFlag(External_Interrupt_2);
    
}

// These functions are handler functions for each button, called when pressed
void upPushbuttonHandler(void) {

    // If we're currently sounding the alarm, disable it. If not, do normal functions
    if (clock_alarm.alarm_arm == 1 && BUZZER_ENABLE_PIN == HIGH) {
     
        BUZZER_ENABLE_PIN = LOW;
        
    }
    
    else if (clock_display_state == set_time_state && clock_time_setting != clock_time_setting_finished_state) {
        
        clock_alarm.alarm_arm = 0;
        
        clock_set_blank_request = 0;
        TMR6 = 0;
        
        switch (clock_time_setting) {
        
            case set_time_hours_state:
                if (rtcc_shadow.hours == 23) {
                    rtccWriteTime(0, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours - 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                }
                else {
                    rtccWriteTime(rtcc_shadow.hours + 1, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours - 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                }
                break;
                
            case set_time_minutes_state:
                if (rtcc_shadow.minutes == 59) {
                    rtccWriteTime(rtcc_shadow.hours, 0, rtcc_shadow.seconds);
                    if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours - 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                }
                else {
                    rtccWriteTime(rtcc_shadow.hours, rtcc_shadow.minutes + 1, rtcc_shadow.seconds);
                    if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours - 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                }
                break;
                
            case set_time_seconds_state:
                if (rtcc_shadow.seconds == 59) {
                    rtccWriteTime(rtcc_shadow.hours, rtcc_shadow.minutes, 0);
                    if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours - 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                }
                else {
                    rtccWriteTime(rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds + 1);
                    if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours - 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                }
                break;
        }
        
    }
    
    else if (clock_display_state == set_date_state && clock_date_setting != clock_date_setting_finished_state) {
        
        clock_set_blank_request = 0;
        TMR6 = 0;
        
        switch (clock_date_setting) {
        
            case set_date_month_state:
                if (rtcc_shadow.month == 12) {
                    rtccWriteDate(1, rtcc_shadow.day, rtcc_shadow.year);
                    sprintf(vfd_display_buffer, "%02u*%02u*%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                else {
                    rtccWriteDate(rtcc_shadow.month + 1, rtcc_shadow.day, rtcc_shadow.year);
                    sprintf(vfd_display_buffer, "%02u*%02u*%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                break;
                
            case set_date_day_state:
                if (rtcc_shadow.day == 31) {
                    rtccWriteDate(rtcc_shadow.month, 1, rtcc_shadow.year);
                    sprintf(vfd_display_buffer, "%02u*%02u*%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                else {
                    rtccWriteDate(rtcc_shadow.month, rtcc_shadow.day + 1, rtcc_shadow.year);
                    sprintf(vfd_display_buffer, "%02u*%02u*%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                break;
                
            case set_date_year_state:
                if (rtcc_shadow.year == 99) {
                    rtccWriteDate(rtcc_shadow.month, rtcc_shadow.day, 2000);
                    sprintf(vfd_display_buffer, "%02u*%02u*%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                else {
                    rtccWriteDate(rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year + 1);
                    sprintf(vfd_display_buffer, "%02u*%02u*%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                break;
        }
        
    }
    
    else if (clock_display_state == set_weekday_state && clock_weekday_setting != clock_weekday_setting_finished_state) {
        
        clock_set_blank_request = 0;
        TMR6 = 0;
        
        if (rtcc_shadow.weekday == 6) {
            rtccWriteWeekday(0);
            sprintf(vfd_display_buffer, "       %u", (uint8_t) rtcc_shadow.weekday + 1);
        }
        else {
            rtccWriteWeekday(rtcc_shadow.weekday + 1);
            sprintf(vfd_display_buffer, "       %u", (uint8_t) rtcc_shadow.weekday + 1);
        }
        
    }
    
    else if (clock_display_state == set_alarm_state && clock_alarm_setting != clock_alarm_setting_finished_state) {
        
        clock_set_blank_request = 0;
        TMR6 = 0;
        
        switch (clock_alarm_setting) {
        
            case set_alarm_hours_state:
                if (clock_alarm.alarm_hour == 23) {
                    clock_alarm.alarm_hour = 0;
                    if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                }
                else {
                    clock_alarm.alarm_hour++;
                    if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                }
                break;
                
            case set_alarm_minutes_state:
                if (clock_alarm.alarm_minute == 59) {
                    clock_alarm.alarm_minute = 0;
                    if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                }
                else {
                    clock_alarm.alarm_minute++;
                    if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                }
                break;
                
            case set_alarm_seconds_state:
                if (clock_alarm.alarm_second == 59) {
                    clock_alarm.alarm_second = 0;
                    if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                }
                else {
                    clock_alarm.alarm_second++;
                    if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                }
                break;
        }
        
    }
    
    else if (clock_display_state == alarm_enable_state && clock_alarm_enable_setting != clock_alarm_enable_finished_state) {
        
        clock_set_blank_request = 0;
        TMR6 = 0;
        
        if (clock_alarm.alarm_arm == 1) clock_alarm.alarm_arm = 0;
        else clock_alarm.alarm_arm = 1;
        sprintf(vfd_display_buffer, "%s", clock_alarm.alarm_arm ? "tr uE   " : "FA LS E ");
        
    }
    
    else if (clock_display_state == set_24hr_mode_state && clock_24hr_setting != clock_24hr_setting_finished_state) {
        
        clock_set_blank_request = 0;
        TMR6 = 0;
        
        if (am_pm_enable == 1) am_pm_enable = 0;
        else am_pm_enable = 1;
        sprintf(vfd_display_buffer, "%s", am_pm_enable ? "FA LS E " : "tr uE   ");
        
    }
    
    else if (clock_display_state == set_brightness_state && clock_brightness_setting != clock_brightness_setting_finished_state) {
        
        clock_set_blank_request = 0;
        TMR6 = 0;
        
        if (vfd_display_brightness_setting < 100) {
            vfd_display_brightness_setting += 10;
            vfdSetDisplayBrightness(vfd_display_brightness_setting);
            sprintf(vfd_display_buffer, "      %02u", vfd_display_brightness_setting / 10);
        }
        
    }

    else {
    
        if (clock_display_state == display_time_state) clock_display_state = set_brightness_state;
        else clock_display_state--;

        displayBoardSetLEDs();
        
        clock_time_setting = clock_time_setting_finished_state;
        clock_date_setting = clock_date_setting_finished_state;
        clock_weekday_setting = clock_weekday_setting_finished_state;
        clock_alarm_setting = clock_alarm_setting_finished_state;
        clock_brightness_setting = clock_brightness_setting_finished_state;
        clock_24hr_setting = clock_24hr_setting_finished_state;
        clock_alarm_enable_setting = clock_alarm_enable_finished_state;
        
    }

    
}

void downPushbuttonHandler(void) {
       
    // If we're currently sounding the alarm, disable it. If not, do normal functions
    if (clock_alarm.alarm_arm == 1 && BUZZER_ENABLE_PIN == HIGH) {
     
        BUZZER_ENABLE_PIN = LOW;
        
    }
    
    else if (clock_display_state == set_time_state && clock_time_setting != clock_time_setting_finished_state) {
        
        clock_alarm.alarm_arm = 0;
        
        clock_set_blank_request = 0;
        TMR6 = 0;
        
        switch (clock_time_setting) {
        
            case set_time_hours_state:
                if (rtcc_shadow.hours == 0) {
                    rtccWriteTime(23, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours - 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                }
                else {
                    rtccWriteTime(rtcc_shadow.hours - 1, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours - 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                }
                break;
                
            case set_time_minutes_state:
                if (rtcc_shadow.minutes == 0) {
                    rtccWriteTime(rtcc_shadow.hours, 59, rtcc_shadow.seconds);
                    if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours - 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                }
                else {
                    rtccWriteTime(rtcc_shadow.hours, rtcc_shadow.minutes - 1, rtcc_shadow.seconds);
                    if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours - 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                }
                break;
                
            case set_time_seconds_state:
                if (rtcc_shadow.seconds == 0) {
                    rtccWriteTime(rtcc_shadow.hours, rtcc_shadow.minutes, 59);
                    if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours - 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                }
                else {
                    rtccWriteTime(rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds - 1);
                    if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours - 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        dp_anode_request = 0;
                    }
                }
                break;
        }
    }
    
    else if (clock_display_state == set_date_state && clock_date_setting != clock_date_setting_finished_state) {
        
        clock_set_blank_request = 0;
        TMR6 = 0;
        
        switch (clock_date_setting) {
        
            case set_date_month_state:
                if (rtcc_shadow.month == 1) {
                    rtccWriteDate(12, rtcc_shadow.day, rtcc_shadow.year);
                    sprintf(vfd_display_buffer, "%02u*%02u*%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                else {
                    rtccWriteDate(rtcc_shadow.month - 1, rtcc_shadow.day, rtcc_shadow.year);
                    sprintf(vfd_display_buffer, "%02u*%02u*%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                break;
                
            case set_date_day_state:
                if (rtcc_shadow.day == 1) {
                    rtccWriteDate(rtcc_shadow.month, 31, rtcc_shadow.year);
                    sprintf(vfd_display_buffer, "%02u*%02u*%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                else {
                    rtccWriteDate(rtcc_shadow.month, rtcc_shadow.day - 1, rtcc_shadow.year);
                    sprintf(vfd_display_buffer, "%02u*%02u*%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                break;
                
            case set_date_year_state:
                if (rtcc_shadow.year == 0) {
                    rtccWriteDate(rtcc_shadow.month, rtcc_shadow.day, 2099);
                    sprintf(vfd_display_buffer, "%02u*%02u*%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                else {
                    rtccWriteDate(rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 1);
                    sprintf(vfd_display_buffer, "%02u*%02u*%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                break;
        }
        
    }
    
    else if (clock_display_state == set_weekday_state && clock_weekday_setting != clock_weekday_setting_finished_state) {
        
        clock_set_blank_request = 0;
        TMR6 = 0;
        
        if (rtcc_shadow.weekday == 0) {
            rtccWriteWeekday(6);
            sprintf(vfd_display_buffer, "       %u", (uint8_t) rtcc_shadow.weekday + 1);
        }
        else {
            rtccWriteWeekday(rtcc_shadow.weekday - 1);
            sprintf(vfd_display_buffer, "       %u", (uint8_t) rtcc_shadow.weekday + 1);
        }
        
    }
    
    else if (clock_display_state == set_alarm_state && clock_alarm_setting != clock_alarm_setting_finished_state) {
        
        clock_set_blank_request = 0;
        TMR6 = 0;
        
        switch (clock_alarm_setting) {
        
            case set_alarm_hours_state:
                if (clock_alarm.alarm_hour == 0) {
                    clock_alarm.alarm_hour = 23;
                    if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                }
                else {
                    clock_alarm.alarm_hour--;
                    if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                }
                break;
                
            case set_alarm_minutes_state:
                if (clock_alarm.alarm_minute == 0) {
                    clock_alarm.alarm_minute = 59;
                    if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                }
                else {
                    clock_alarm.alarm_minute--;
                    if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                }
                break;
                
            case set_alarm_seconds_state:
                if (clock_alarm.alarm_second == 0) {
                    clock_alarm.alarm_second = 59;
                    if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                }
                else {
                    clock_alarm.alarm_second--;
                    if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 1;
                    }
                    else {
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                        dp_anode_request = 0;
                    }
                }
                break;
        }
        
    }
    
    else if (clock_display_state == alarm_enable_state && clock_alarm_enable_setting != clock_alarm_enable_finished_state) {
        
        clock_set_blank_request = 0;
        TMR6 = 0;
        
        if (clock_alarm.alarm_arm == 1) clock_alarm.alarm_arm = 0;
        else clock_alarm.alarm_arm = 1;
        sprintf(vfd_display_buffer, "%s", clock_alarm.alarm_arm ? "tr uE   " : "FA LS E ");
        
    }
    
    else if (clock_display_state == set_24hr_mode_state && clock_24hr_setting != clock_24hr_setting_finished_state) {
        
        clock_set_blank_request = 0;
        TMR6 = 0;
        
        if (am_pm_enable == 1) am_pm_enable = 0;
        else am_pm_enable = 1;
        sprintf(vfd_display_buffer, "%s", am_pm_enable ? "FA LS E " : "tr uE   ");
        
    }
    
    else if (clock_display_state == set_brightness_state && clock_brightness_setting != clock_brightness_setting_finished_state) {
        
        clock_set_blank_request = 0;
        TMR6 = 0;
        
        if (vfd_display_brightness_setting > 10) {
            vfd_display_brightness_setting -= 10;
            vfdSetDisplayBrightness(vfd_display_brightness_setting);
            sprintf(vfd_display_buffer, "      %02u", vfd_display_brightness_setting / 10);
        }
        
    }
    
    else {
    
        if (clock_display_state == set_brightness_state) clock_display_state = display_time_state;
        else clock_display_state++;

        displayBoardSetLEDs();
        
        clock_time_setting = clock_time_setting_finished_state;
        clock_date_setting = clock_date_setting_finished_state;
        clock_weekday_setting = clock_weekday_setting_finished_state;
        clock_alarm_setting = clock_alarm_setting_finished_state;
        clock_brightness_setting = clock_brightness_setting_finished_state;
        clock_24hr_setting = clock_24hr_setting_finished_state;
        clock_alarm_enable_setting = clock_alarm_enable_finished_state;
        
    }
    
}

void leftPushbuttonHandler(void) {
    
    // If we're currently sounding the alarm, disable it. If not, do normal functions
    if (clock_alarm.alarm_arm == 1 && BUZZER_ENABLE_PIN == HIGH) {
     
        BUZZER_ENABLE_PIN = LOW;
        
    }
    
    else if (clock_display_state == set_time_state) {
        
        clock_set_blank_request = 1;
        TMR6 = 0;
        
        if (clock_time_setting == set_time_hours_state) clock_time_setting = clock_time_setting_finished_state;
        else clock_time_setting--;
        
        switch (clock_time_setting) {
            case set_time_hours_state:
                sprintf(vfd_display_buffer, "  :%02u:%02u", rtcc_shadow.minutes, rtcc_shadow.seconds);
                dp_anode_request = 0;
                break;
            case set_time_minutes_state:
                if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                    sprintf(vfd_display_buffer, "%02u:  :%02u", 12, rtcc_shadow.seconds);
                }
                else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                    sprintf(vfd_display_buffer, "%02u:  :%02u", rtcc_shadow.hours - 12, rtcc_shadow.seconds);
                    dp_anode_request = 1;
                }
                else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                    sprintf(vfd_display_buffer, "%02u:  :%02u", 12, rtcc_shadow.seconds);
                    dp_anode_request = 1;
                }
                else {
                    sprintf(vfd_display_buffer, "%02u:  :%02u", rtcc_shadow.hours, rtcc_shadow.seconds);
                    dp_anode_request = 0;
                }
                break;
            case set_time_seconds_state:
                if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                    sprintf(vfd_display_buffer, "%02u:%02u:  ", 12, rtcc_shadow.minutes);
                }
                else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:  ", rtcc_shadow.hours - 12, rtcc_shadow.minutes);
                    dp_anode_request = 1;
                }
                else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:  ", 12, rtcc_shadow.minutes);
                    dp_anode_request = 1;
                }
                else {
                    sprintf(vfd_display_buffer, "%02u:%02u:  ", rtcc_shadow.hours, rtcc_shadow.minutes);
                    dp_anode_request = 0;
                }
                break;
            case clock_time_setting_finished_state:
                if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                }
                else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours - 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    dp_anode_request = 1;
                }
                else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    dp_anode_request = 1;
                }
                else {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    dp_anode_request = 0;
                }
                clock_set_blank_request = 0;
                break;
        }
    }
    
    else if (clock_display_state == set_date_state) {
        
        clock_set_blank_request = 1;
        TMR6 = 0;
        
        if (clock_date_setting == set_date_month_state) clock_date_setting = clock_date_setting_finished_state;
        else clock_date_setting--;
        
        switch (clock_date_setting) {
            case set_date_month_state:
                sprintf(vfd_display_buffer, "  *%02u*%02u", rtcc_shadow.day, rtcc_shadow.year - 2000);
                break;
            case set_date_day_state:
                sprintf(vfd_display_buffer, "%02u*  *%02u", rtcc_shadow.month, rtcc_shadow.year - 2000);
                break;
            case set_date_year_state:
                sprintf(vfd_display_buffer, "%02u*%02u*  ", rtcc_shadow.month, rtcc_shadow.day);
                break;
            case clock_date_setting_finished_state:
                sprintf(vfd_display_buffer, "%02u*%02u*%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                clock_set_blank_request = 0;
                break;
        }
    }
    
    else if (clock_display_state == set_weekday_state) {
        
        clock_set_blank_request = 1;
        TMR6 = 0;
        
        if (clock_weekday_setting == set_weekday_day_state) clock_weekday_setting = clock_weekday_setting_finished_state;
        else clock_weekday_setting--;
        
        switch (clock_weekday_setting) {
            case set_weekday_day_state:
                sprintf(vfd_display_buffer, "        ");
                break;
            case clock_weekday_setting_finished_state:
                sprintf(vfd_display_buffer, "       %u", (uint8_t) rtcc_shadow.weekday + 1);
                clock_set_blank_request = 0;
                break;
        }
    }
    
    else if (clock_display_state == set_alarm_state) {
        
        clock_set_blank_request = 1;
        TMR6 = 0;
        
        if (clock_alarm_setting == set_alarm_hours_state) clock_alarm_setting = clock_alarm_setting_finished_state;
        else clock_alarm_setting--;
        
        switch (clock_alarm_setting) {
            case set_alarm_hours_state:
                sprintf(vfd_display_buffer, "  :%02u:%02u", clock_alarm.alarm_minute, clock_alarm.alarm_second);
                dp_anode_request = 0;
                break;
            case set_alarm_minutes_state:
                if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                    sprintf(vfd_display_buffer, "%02u:  :%02u", 12, clock_alarm.alarm_second);
                }
                else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                    sprintf(vfd_display_buffer, "%02u:  :%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_second);
                    dp_anode_request = 1;
                }
                else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                    sprintf(vfd_display_buffer, "%02u:  :%02u", 12, clock_alarm.alarm_second);
                    dp_anode_request = 1;
                }
                else {
                    sprintf(vfd_display_buffer, "%02u:  :%02u", clock_alarm.alarm_hour, clock_alarm.alarm_second);
                    dp_anode_request = 0;
                }
                break;
            case set_alarm_seconds_state:
                if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                    sprintf(vfd_display_buffer, "%02u:%02u:  ", 12, clock_alarm.alarm_minute);
                }
                else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:  ", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute);
                    dp_anode_request = 1;
                }
                else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:  ", 12, clock_alarm.alarm_minute);
                    dp_anode_request = 1;
                }
                else {
                    sprintf(vfd_display_buffer, "%02u:%02u:  ", clock_alarm.alarm_hour, clock_alarm.alarm_minute);
                    dp_anode_request = 0;
                }
                break;
            case clock_alarm_setting_finished_state:
                if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                }
                else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                    dp_anode_request = 1;
                }
                else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                    dp_anode_request = 1;
                }
                else {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                    dp_anode_request = 0;
                }
                clock_set_blank_request = 0;
                break;
        }
    }
    
    else if (clock_display_state == alarm_enable_state) {
     
        clock_set_blank_request = 1;
        TMR6 = 0;
        
        if (clock_alarm_enable_setting == set_alarm_arm) clock_alarm_enable_setting = clock_alarm_enable_finished_state;
        else clock_alarm_enable_setting--;
        
        switch (clock_alarm_enable_setting) {
            case set_alarm_arm:
                sprintf(vfd_display_buffer, "        ");
                break;
            case clock_alarm_enable_finished_state:
                sprintf(vfd_display_buffer, "%s", clock_alarm.alarm_arm ? "tr uE   " : "FA LS E ");
                clock_set_blank_request = 0;
                break;
        }
        
    }
    
    else if (clock_display_state == set_24hr_mode_state) {
     
        clock_set_blank_request = 1;
        TMR6 = 0;
        
        if (clock_24hr_setting == set_24hr_value_state) clock_24hr_setting = clock_24hr_setting_finished_state;
        else clock_24hr_setting--;
        
        switch (clock_24hr_setting) {
            case set_24hr_value_state:
                sprintf(vfd_display_buffer, "        ");
                break;
            case clock_24hr_setting_finished_state:
                sprintf(vfd_display_buffer, "%s", am_pm_enable ? "FA LS E " : "tr uE   ");
                clock_set_blank_request = 0;
                break;
        }
        
    }
    
    else if (clock_display_state == set_brightness_state) {
     
        clock_set_blank_request = 1;
        TMR6 = 0;
        
        if (clock_brightness_setting == set_brightness_value_state) clock_brightness_setting = clock_brightness_setting_finished_state;
        else clock_brightness_setting--;
        
        switch (clock_brightness_setting) {
            case set_brightness_value_state:
                sprintf(vfd_display_buffer, "        ");
                break;
            case clock_brightness_setting_finished_state:
                sprintf(vfd_display_buffer, "      %02u", vfd_display_brightness_setting / 10);
                clock_set_blank_request = 0;
                break;
        }
        
    }
    
}

void rightPushbuttonHandler(void) {

    // If we're currently sounding the alarm, disable it. If not, do normal functions
    if (clock_alarm.alarm_arm == 1 && BUZZER_ENABLE_PIN == HIGH) {
     
        BUZZER_ENABLE_PIN = LOW;
        
    }
    
    else if (clock_display_state == set_time_state) {
        
        clock_set_blank_request = 1;
        TMR6 = 0;
        
        if (clock_time_setting == clock_time_setting_finished_state) clock_time_setting = set_time_hours_state;
        else clock_time_setting++;
        
        switch (clock_time_setting) {
            case set_time_hours_state:
                sprintf(vfd_display_buffer, "  :%02u:%02u", rtcc_shadow.minutes, rtcc_shadow.seconds);
                dp_anode_request = 0;
                break;
            case set_time_minutes_state:
                if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                    sprintf(vfd_display_buffer, "%02u:  :%02u", 12, rtcc_shadow.seconds);
                }
                else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                    sprintf(vfd_display_buffer, "%02u:  :%02u", rtcc_shadow.hours - 12, rtcc_shadow.seconds);
                    dp_anode_request = 1;
                }
                else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                    sprintf(vfd_display_buffer, "%02u:  :%02u", 12, rtcc_shadow.seconds);
                    dp_anode_request = 1;
                }
                else {
                    sprintf(vfd_display_buffer, "%02u:  :%02u", rtcc_shadow.hours, rtcc_shadow.seconds);
                    dp_anode_request = 0;
                }
                break;
            case set_time_seconds_state:
                if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                    sprintf(vfd_display_buffer, "%02u:%02u:  ", 12, rtcc_shadow.minutes);
                }
                else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:  ", rtcc_shadow.hours - 12, rtcc_shadow.minutes);
                    dp_anode_request = 1;
                }
                else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:  ", 12, rtcc_shadow.minutes);
                    dp_anode_request = 1;
                }
                else {
                    sprintf(vfd_display_buffer, "%02u:%02u:  ", rtcc_shadow.hours, rtcc_shadow.minutes);
                    dp_anode_request = 0;
                }
                break;
            case clock_time_setting_finished_state:
                if (am_pm_enable == 1 && rtcc_shadow.hours == 0) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                }
                else if (am_pm_enable == 1 && rtcc_shadow.hours > 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours - 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    dp_anode_request = 1;
                }
                else if (am_pm_enable == 1 && rtcc_shadow.hours == 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    dp_anode_request = 1;
                }
                else {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    dp_anode_request = 0;
                }
                clock_set_blank_request = 0;
                break;
        }
    }
    
    else if (clock_display_state == set_date_state) {
        
        clock_set_blank_request = 1;
        TMR6 = 0;
        
        if (clock_date_setting == clock_date_setting_finished_state) clock_date_setting = set_date_month_state;
        else clock_date_setting++;
        
        switch (clock_date_setting) {
            case set_date_month_state:
                sprintf(vfd_display_buffer, "  *%02u*%02u", rtcc_shadow.day, rtcc_shadow.year - 2000);
                break;
            case set_date_day_state:
                sprintf(vfd_display_buffer, "%02u*  *%02u", rtcc_shadow.month, rtcc_shadow.year - 2000);
                break;
            case set_date_year_state:
                sprintf(vfd_display_buffer, "%02u*%02u*  ", rtcc_shadow.month, rtcc_shadow.day);
                break;
            case clock_date_setting_finished_state:
                sprintf(vfd_display_buffer, "%02u*%02u*%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                clock_set_blank_request = 0;
                break;
        }
    }
    
    else if (clock_display_state == set_weekday_state) {
        
        clock_set_blank_request = 1;
        TMR6 = 0;
        
        if (clock_weekday_setting == clock_weekday_setting_finished_state) clock_weekday_setting = set_weekday_day_state;
        else clock_weekday_setting++;
        
        switch (clock_weekday_setting) {
            case set_weekday_day_state:
                sprintf(vfd_display_buffer, "        ");
                break;
            case clock_weekday_setting_finished_state:
                sprintf(vfd_display_buffer, "       %u", (uint8_t) rtcc_shadow.weekday + 1);
                clock_set_blank_request = 0;
                break;
        }
    }
    
    else if (clock_display_state == set_alarm_state) {
        
        clock_set_blank_request = 1;
        TMR6 = 0;
        
        if (clock_alarm_setting == clock_alarm_setting_finished_state) clock_alarm_setting = set_alarm_hours_state;
        else clock_alarm_setting++;
        
        switch (clock_alarm_setting) {
            case set_alarm_hours_state:
                sprintf(vfd_display_buffer, "  :%02u:%02u", clock_alarm.alarm_minute, clock_alarm.alarm_second);
                dp_anode_request = 0;
                break;
            case set_alarm_minutes_state:
                if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                    sprintf(vfd_display_buffer, "%02u:  :%02u", 12, clock_alarm.alarm_second);
                }
                else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                    sprintf(vfd_display_buffer, "%02u:  :%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_second);
                    dp_anode_request = 1;
                }
                else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                    sprintf(vfd_display_buffer, "%02u:  :%02u", 12, clock_alarm.alarm_second);
                    dp_anode_request = 1;
                }
                else {
                    sprintf(vfd_display_buffer, "%02u:  :%02u", clock_alarm.alarm_hour, clock_alarm.alarm_second);
                    dp_anode_request = 0;
                }
                break;
            case set_alarm_seconds_state:
                if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                    sprintf(vfd_display_buffer, "%02u:%02u:  ", 12, clock_alarm.alarm_minute);
                }
                else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:  ", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute);
                    dp_anode_request = 1;
                }
                else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:  ", 12, clock_alarm.alarm_minute);
                    dp_anode_request = 1;
                }
                else {
                    sprintf(vfd_display_buffer, "%02u:%02u:  ", clock_alarm.alarm_hour, clock_alarm.alarm_minute);
                    dp_anode_request = 0;
                }
                break;
            case clock_alarm_setting_finished_state:
                if (am_pm_enable == 1 && clock_alarm.alarm_hour == 0) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                }
                else if (am_pm_enable == 1 && clock_alarm.alarm_hour > 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour - 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                    dp_anode_request = 1;
                }
                else if (am_pm_enable == 1 && clock_alarm.alarm_hour == 12) {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", 12, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                    dp_anode_request = 1;
                }
                else {
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
                    dp_anode_request = 0;
                }
                clock_set_blank_request = 0;
                break;
        }
    }
    
    else if (clock_display_state == alarm_enable_state) {
     
        clock_set_blank_request = 1;
        TMR6 = 0;
        
        if (clock_alarm_enable_setting == clock_alarm_enable_finished_state) clock_alarm_enable_setting = set_alarm_arm;
        else clock_alarm_enable_setting++;
        
        switch (clock_alarm_enable_setting) {
            case set_alarm_arm:
                sprintf(vfd_display_buffer, "        ");
                break;
            case clock_alarm_enable_finished_state:
                sprintf(vfd_display_buffer, "%s", clock_alarm.alarm_arm ? "tr uE   " : "FA LS E ");
                clock_set_blank_request = 0;
                break;
        }
        
    }
    
    else if (clock_display_state == set_24hr_mode_state) {
     
        clock_set_blank_request = 1;
        TMR6 = 0;
        
        if (clock_24hr_setting == clock_24hr_setting_finished_state) clock_24hr_setting = set_24hr_value_state;
        else clock_24hr_setting++;
        
        switch (clock_24hr_setting) {
            case set_24hr_value_state:
                sprintf(vfd_display_buffer, "        ");
                break;
            case clock_24hr_setting_finished_state:
                sprintf(vfd_display_buffer, "%s", am_pm_enable ? "FA LS E " : "tr uE   ");
                clock_set_blank_request = 0;
                break;
        }
        
    }
    
    else if (clock_display_state == set_brightness_state) {
     
        clock_set_blank_request = 1;
        TMR6 = 0;
        
        if (clock_brightness_setting == clock_brightness_setting_finished_state) clock_brightness_setting = set_brightness_value_state;
        else clock_brightness_setting++;
        
        switch (clock_brightness_setting) {
            case set_brightness_value_state:
                sprintf(vfd_display_buffer, "        ");
                break;
            case clock_brightness_setting_finished_state:
                sprintf(vfd_display_buffer, "      %02u", vfd_display_brightness_setting / 10);
                clock_set_blank_request = 0;
                break;
        }
        
    }
        
}

void powerPushbuttonHandler(void) {
    
    // If we're currently sounding the alarm, disable it. If not, do normal functions
    if (clock_alarm.alarm_arm == 1 && BUZZER_ENABLE_PIN == HIGH) {
     
        BUZZER_ENABLE_PIN = LOW;
        
    }
    
    // If the display is currently on, turn it off
    else if (display_power_toggle_flag) {
        
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("Powering down VFD display:\r\n");
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
        
        vfdTimersStop();
        printf("    VFD Multiplexing Timers Suspended\r\n");
        printf("    VFD Grids and Anodes cleared\r\n");
        
        POS1P2_VFF_RUN_PIN = LOW;
        printf("    Disabled +1.2VFF Power Supply\r\n");
                
        POS60_VAN_RUN_PIN = LOW;
        printf("    Disabled +60VAN Power Supply\r\n");
        
        // clear the menu LEDs
        displayBoardSetIOExpanderOutput(0x0000);
        printf("    Cleared menu LEDs\r\n");
        
        terminalTextAttributesReset();
        
        // save the state that we've enabled the display
        display_power_toggle_flag = 0;
        
        // disable alarm
        clock_alarm.alarm_arm = 0;
        
    }
    
    // else, enable the display since it was shut down
    else {
     
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("Powering up VFD display:\r\n");
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
        
        vfdMultiplexingTimerInitialize();
        vfdBrightnessTimerInitialize();
        printf("    Multiplexing Timers Initialized\r\n");
        
        // start off displaying the time
        clock_display_state = display_time_state;
        displayBoardSetLEDs();
    
        POS1P2_VFF_RUN_PIN = HIGH;
        uint32_t timeout = 0xFFFF;
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

        terminalTextAttributesReset();
        
        // save the state that we've enabled the display
        display_power_toggle_flag = 1;
        
    }
    
}

// This timer is used to blink values that are being changed using the pushbuttons
// Using timer 6 for this
void clockSetBlankingTimerInitialize(void) {
    
    // Stop timer 6
    T6CONbits.ON = 0;
    
    // Set timer 6 prescalar to 256
    T6CONbits.TCKPS = 0b111;
    
    // Set timer clock input as PBCLK3
    T6CONbits.TCS = 0;
    
    // Clear timer 6
    TMR6 = 0x0000;
    
    // Set timer 6 period match to 25000
    PR6 = 25000;
    
    // Clear Timer1 Interrupt Flag
    clearInterruptFlag(Timer6);
    
    // Set Timer 1 interrupt priority
    setInterruptPriority(Timer6, 6);
    setInterruptSubpriority(Timer6, 0);
    
    // Enable timer 6 interrupt
    enableInterrupt(Timer6);
    
    // Start timer 6
    T6CONbits.ON = 1;
}

// this is the ISR for the clock set blanking timer
void __ISR(_TIMER_6_VECTOR, IPL6SRS) clockSetBlankingTimerISR(void) {
 
    // toggle blanking the value we're setting
    if (clock_set_blank_request) clock_set_blank_request = 0;
    else clock_set_blank_request = 1;
    
    // clear IRQ
    clearInterruptFlag(Timer6);
    
}
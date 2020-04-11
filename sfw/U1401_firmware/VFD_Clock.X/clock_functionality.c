
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
                sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
            }
            else {
                sprintf(vfd_display_buffer, "%02u %02u %02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
            }
            break;
            
        case set_time_state:
            if (clock_set_blank_request == 0) {
                sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
            }
            else {
                switch (clock_time_setting) {
                    case set_time_hours_state:
                            sprintf(vfd_display_buffer, "  :%02u:%02u", rtcc_shadow.minutes, rtcc_shadow.seconds);
                        break;
                    case set_time_minutes_state:
                        sprintf(vfd_display_buffer, "%02u:  :%02u", rtcc_shadow.hours, rtcc_shadow.seconds);
                        break;
                    case set_time_seconds_state:
                            sprintf(vfd_display_buffer, "%02u:%02u:  ", rtcc_shadow.hours, rtcc_shadow.minutes);
                        break;
                    case clock_time_setting_finished_state:
                        sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                        break;
                }
            }
            break;
            
        case display_date_state:
            sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
            break;
            
        case set_date_state:
            if (clock_set_blank_request == 0) {
                sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
            }
            else {
                switch (clock_date_setting) {
                    case set_date_month_state:
                        sprintf(vfd_display_buffer, "  _%02u_%02u", rtcc_shadow.day, rtcc_shadow.year - 2000);
                        break;
                    case set_date_day_state:
                        sprintf(vfd_display_buffer, "%02u_  _%02u", rtcc_shadow.month, rtcc_shadow.year - 2000);
                        break;
                    case set_date_year_state:
                        sprintf(vfd_display_buffer, "%02u_%02u_  ", rtcc_shadow.month, rtcc_shadow.day);
                        break;
                    case clock_date_setting_finished_state:
                        sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                        break;
                }
            }
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
        
        displayBoardCapTouchInitialize();
        printf("    Capacitive Pushbuttons Initialized\r\n");
        terminalTextAttributesReset();
        
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
        
        upPushbuttonHandler();
    
    }
    
    if (CNFAbits.CNFA10 && CNENAbits.CNIEA10) {
            
        terminalTextAttributes(MAGENTA_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("User pressed Down button\r\n");
        terminalTextAttributesReset();
        
        downPushbuttonHandler();
    
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
    
        rightPushbuttonHandler();
        
    }
    
    if (CNFBbits.CNFB1 && CNENBbits.CNIEB1) {
            
        terminalTextAttributes(MAGENTA_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("User pressed Left button\r\n");
        terminalTextAttributesReset();
        
        leftPushbuttonHandler();
    
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
    
    clearInterruptFlag(External_Interrupt_2);
    
}

// These functions are handler functions for each button, called when pressed
void upPushbuttonHandler(void) {

    if (clock_display_state == set_time_state && clock_time_setting != clock_time_setting_finished_state) {
        
        clock_set_blank_request = 0;
        TMR6 = 0;
        
        switch (clock_time_setting) {
        
            case set_time_hours_state:
                if (rtcc_shadow.hours == 23) {
                    rtccWriteTime(0, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                }
                else {
                    rtccWriteTime(rtcc_shadow.hours + 1, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                }
                break;
                
            case set_time_minutes_state:
                if (rtcc_shadow.minutes == 59) {
                    rtccWriteTime(rtcc_shadow.hours, 0, rtcc_shadow.seconds);
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                }
                else {
                    rtccWriteTime(rtcc_shadow.hours, rtcc_shadow.minutes + 1, rtcc_shadow.seconds);
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                }
                break;
                
            case set_time_seconds_state:
                if (rtcc_shadow.seconds == 59) {
                    rtccWriteTime(rtcc_shadow.hours, rtcc_shadow.minutes, 0);
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                }
                else {
                    rtccWriteTime(rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds + 1);
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
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
                    sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                else {
                    rtccWriteDate(rtcc_shadow.month + 1, rtcc_shadow.day, rtcc_shadow.year);
                    sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                break;
                
            case set_date_day_state:
                if (rtcc_shadow.day == 31) {
                    rtccWriteDate(rtcc_shadow.month, 1, rtcc_shadow.year);
                    sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                else {
                    rtccWriteDate(rtcc_shadow.month, rtcc_shadow.day + 1, rtcc_shadow.year);
                    sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                break;
                
            case set_date_year_state:
                if (rtcc_shadow.year == 99) {
                    rtccWriteDate(rtcc_shadow.month, rtcc_shadow.day, 2000);
                    sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                else {
                    rtccWriteDate(rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year + 1);
                    sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                break;
        }
        
    }
    
    else {
    
        if (clock_display_state == display_time_state) clock_display_state = set_brightness_state;
        else clock_display_state--;

        displayBoardSetLEDs();
        
        clock_time_setting = set_time_hours_state;
        clock_date_setting = set_date_month_state;
        
    }

    
}

void downPushbuttonHandler(void) {
       
    if (clock_display_state == set_time_state && clock_time_setting != clock_time_setting_finished_state) {
        
        clock_set_blank_request = 0;
        TMR6 = 0;
        
        switch (clock_time_setting) {
        
            case set_time_hours_state:
                if (rtcc_shadow.hours == 0) {
                    rtccWriteTime(23, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                }
                else {
                    rtccWriteTime(rtcc_shadow.hours - 1, rtcc_shadow.minutes, rtcc_shadow.seconds);
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                }
                break;
                
            case set_time_minutes_state:
                if (rtcc_shadow.minutes == 0) {
                    rtccWriteTime(rtcc_shadow.hours, 59, rtcc_shadow.seconds);
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                }
                else {
                    rtccWriteTime(rtcc_shadow.hours, rtcc_shadow.minutes - 1, rtcc_shadow.seconds);
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                }
                break;
                
            case set_time_seconds_state:
                if (rtcc_shadow.seconds == 0) {
                    rtccWriteTime(rtcc_shadow.hours, rtcc_shadow.minutes, 59);
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
                }
                else {
                    rtccWriteTime(rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds - 1);
                    sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
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
                    sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                else {
                    rtccWriteDate(rtcc_shadow.month - 1, rtcc_shadow.day, rtcc_shadow.year);
                    sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                break;
                
            case set_date_day_state:
                if (rtcc_shadow.day == 1) {
                    rtccWriteDate(rtcc_shadow.month, 31, rtcc_shadow.year);
                    sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                else {
                    rtccWriteDate(rtcc_shadow.month, rtcc_shadow.day - 1, rtcc_shadow.year);
                    sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                break;
                
            case set_date_year_state:
                if (rtcc_shadow.year == 0) {
                    rtccWriteDate(rtcc_shadow.month, rtcc_shadow.day, 2099);
                    sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                else {
                    rtccWriteDate(rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 1);
                    sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                }
                break;
        }
        
    }
    
    else {
    
        if (clock_display_state == set_brightness_state) clock_display_state = display_time_state;
        else clock_display_state++;

        displayBoardSetLEDs();
        
        clock_time_setting = set_time_hours_state;
        clock_date_setting = set_date_month_state;
        
    }
    
}

void leftPushbuttonHandler(void) {
    
    if (clock_display_state == set_time_state) {
        
        clock_set_blank_request = 1;
        TMR6 = 0;
        
        if (clock_time_setting == set_time_hours_state) clock_time_setting = clock_time_setting_finished_state;
        else clock_time_setting--;
        
        switch (clock_time_setting) {
            case set_time_hours_state:
                    sprintf(vfd_display_buffer, "  :%02u:%02u", rtcc_shadow.minutes, rtcc_shadow.seconds);
                break;
            case set_time_minutes_state:
                sprintf(vfd_display_buffer, "%02u:  :%02u", rtcc_shadow.hours, rtcc_shadow.seconds);
                break;
            case set_time_seconds_state:
                    sprintf(vfd_display_buffer, "%02u:%02u:  ", rtcc_shadow.hours, rtcc_shadow.minutes);
                break;
            case clock_time_setting_finished_state:
                sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
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
                sprintf(vfd_display_buffer, "  _%02u_%02u", rtcc_shadow.day, rtcc_shadow.year - 2000);
                break;
            case set_date_day_state:
                sprintf(vfd_display_buffer, "%02u_  _%02u", rtcc_shadow.month, rtcc_shadow.year - 2000);
                break;
            case set_date_year_state:
                sprintf(vfd_display_buffer, "%02u_%02u_  ", rtcc_shadow.month, rtcc_shadow.day);
                break;
            case clock_date_setting_finished_state:
                sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                clock_set_blank_request = 0;
                break;
        }
    }
    
}

void rightPushbuttonHandler(void) {

    if (clock_display_state == set_time_state) {
        
        clock_set_blank_request = 1;
        TMR6 = 0;
        
        if (clock_time_setting == clock_time_setting_finished_state) clock_time_setting = set_time_hours_state;
        else clock_time_setting++;
        
        switch (clock_time_setting) {
            case set_time_hours_state:
                sprintf(vfd_display_buffer, "  :%02u:%02u", rtcc_shadow.minutes, rtcc_shadow.seconds);
                break;
            case set_time_minutes_state:
                sprintf(vfd_display_buffer, "%02u:  :%02u", rtcc_shadow.hours, rtcc_shadow.seconds);
                break;
            case set_time_seconds_state:
                sprintf(vfd_display_buffer, "%02u:%02u:  ", rtcc_shadow.hours, rtcc_shadow.minutes);
                break;
            case clock_time_setting_finished_state:
                sprintf(vfd_display_buffer, "%02u:%02u:%02u", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
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
                sprintf(vfd_display_buffer, "  _%02u_%02u", rtcc_shadow.day, rtcc_shadow.year - 2000);
                break;
            case set_date_day_state:
                sprintf(vfd_display_buffer, "%02u_  _%02u", rtcc_shadow.month, rtcc_shadow.year - 2000);
                break;
            case set_date_year_state:
                sprintf(vfd_display_buffer, "%02u_%02u_  ", rtcc_shadow.month, rtcc_shadow.day);
                break;
            case clock_date_setting_finished_state:
                sprintf(vfd_display_buffer, "%02u_%02u_%02u", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year - 2000);
                clock_set_blank_request = 0;
                break;
        }
    }
        
}

void powerPushbuttonHandler(void) {
    
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
    
    // Set timer 6 period match to 48828
    // This will give an interrupt rate of 1 Hz
    PR6 = 48828;
    
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
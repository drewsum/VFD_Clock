
#include <xc.h>
#include <string.h>
#include <stdio.h>
#include <math.h>

#include "usb_uart_rx_lookup_table.h"
#include "usb_uart.h"
#include "uthash.h"

#include "terminal_control.h"
#include "device_control.h"
#include "cause_of_reset.h"
#include "rtcc.h"
#include "adc.h"
#include "adc_channels.h"
#include "error_handler.h"
#include "pgood_monitor.h"
#include "telemetry.h"
#include "heartbeat_services.h"
#include "watchdog_timer.h"
#include "misc_i2c_devices.h"
#include "clock_functionality.h"
#include "vfd_multiplexing.h"
#include "plib_i2c.h"

usb_uart_command_function_t helpCommandFunction(char * input_str) {

    terminalTextAttributesReset();
    terminalTextAttributes(YELLOW_COLOR, BLACK_COLOR, BOLD_FONT);
    printf("Supported Commands:\n\r");
    
    terminalTextAttributes(YELLOW_COLOR, BLACK_COLOR, NORMAL_FONT);
    
    // iterate over usb_uart_commands hash table and print the name of all commands and their help messages
    usb_uart_command_t  *current_command, *temp;
    HASH_ITER(hh, usb_uart_commands, current_command, temp) {
            
        printf("    %s: %s\r\n", current_command->command_name, current_command->command_help_message);
        
    }
    
    terminalTextAttributes(YELLOW_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("\r\nHelp messages and neutral responses appear in yellow\n\r");
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("System parameters and affirmative responses appear in green\n\r");
    terminalTextAttributes(CYAN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("Measurement responses appear in cyan\n\r");
    terminalTextAttributes(MAGENTA_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("Urgent/interrupt messages appear in magenta\n\r");
    terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("Errors and negative responses appear in red\n\r");
    terminalTextAttributesReset();
    printf("User input appears in white\n\r");
         
    
}

usb_uart_command_function_t resetCommand(char * input_str) {
 
    deviceReset();
    
}

usb_uart_command_function_t clearCommand(char * input_str) {

    terminalClearScreen();
    terminalSetCursorHome();
    
}

usb_uart_command_function_t idnCommand(char * input_str) {
    terminalTextAttributesReset();
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("VFD Clock by Drew Maatman, 2020\r\n");
    terminalTextAttributesReset();    
}

usb_uart_command_function_t repositoryCommand(char * input_str) {
    terminalTextAttributesReset();
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("Project Git repository is hosted at: https://github.com/drewsum/VFD_Clock\r\n");
    terminalTextAttributesReset();    
}

usb_uart_command_function_t hostStatusCommand(char * input_str) {

    terminalTextAttributesReset();
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
    printf("Host Device IDs:\r\n");
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    
    // Print serial number
    printf("    PIC32MZ Serial Number retrieved from Flash: %s\n\r",
                getStringSerialNumber());
        
    // Print device ID
    printf("    Device ID retrieved from Flash: %s (0x%X)\n\r", 
        getDeviceIDString(getDeviceID()), 
        getDeviceID());

        // Print revision ID
    printf("    Revision ID retrieved from Flash: %s (0x%X)\n\r", 
        getRevisionIDString(getRevisionID()), 
        getRevisionID());

    terminalTextAttributesReset();
    
    printWatchdogStatus();
    printDeadmanStatus();
    printPrefetchStatus();
    
    // Print cause of reset
    if (    reset_cause == Undefined ||
            reset_cause == Primary_Config_Registers_Error ||
            reset_cause == Primary_Secondary_Config_Registers_Error ||
            reset_cause == Config_Mismatch ||
            reset_cause == DMT_Reset ||
            reset_cause == WDT_Reset ||
            reset_cause == Software_Reset ||
            reset_cause == External_Reset ||
            reset_cause == BOR_Reset) {
    
        terminalTextAttributes(RED_COLOR, BLACK_COLOR, BOLD_FONT);
        
    }
    
    else {
     
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
        
    }
    
    printf("Cause of most recent device reset: %s\r\n", getResetCauseString(reset_cause));
    terminalTextAttributesReset();
    
    terminalTextAttributesReset();
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
    printf("Up time since last device reset: %s\n\r", 
            getStringSecondsAsTime(device_on_time_counter));
    terminalTextAttributesReset();

}

usb_uart_command_function_t peripheralStatusCommand(char * input_str) {
 
    // Snipe out received arguments
    char rx_peripheral_name[32];
    sscanf(input_str, "Peripheral Status? %[^\t\n\r]", rx_peripheral_name);

    // Determine the rail we're enabling or disabling
    if (strcmp(rx_peripheral_name, "Interrupts") == 0) {
        printInterruptStatus();
    }
    else if (strcmp(rx_peripheral_name, "Clocks") == 0) {
        printClockStatus(SYSCLK_INT);
    }
    else if (strcmp(rx_peripheral_name, "PMD") == 0) {
        printPMDStatus();
    }
    else if (strcmp(rx_peripheral_name, "WDT") == 0) {
        printWatchdogStatus();
    }
    else if (strcmp(rx_peripheral_name, "DMT") == 0) {
        printDeadmanStatus();
    }
    else if (strcmp(rx_peripheral_name, "Prefetch") == 0) {
       printPrefetchStatus();
    }
    else if (strcmp(rx_peripheral_name, "DMA") == 0) {
        printDMAStatus();
    }
    else if (strcmp(rx_peripheral_name, "ADC Channels") == 0) {
        printADCChannelStatus();
    }
    else if (strcmp(rx_peripheral_name, "ADC") == 0) {
        printADCStatus();
    }
    else if (strcmp(rx_peripheral_name, "I2C Master") == 0) {    
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("I2C Bus Master Controller Status:\r\n");
        printI2CMasterStatus();
    }
    else if (strcmp(rx_peripheral_name, "RTCC") == 0) {
        printRTCCStatus();
    }
    else if (strcomp(rx_peripheral_name, "Timer ") == 0) {
        uint32_t read_timer_number;
        sscanf(rx_peripheral_name, "Timer %u", &read_timer_number);
        if (read_timer_number < 1 || read_timer_number > 9) {
            terminalTextAttributes(YELLOW_COLOR, BLACK_COLOR, NORMAL_FONT);
            printf("Please enter a timer number between 1 and 9, user entered %u\r\n", read_timer_number);
            terminalTextAttributesReset();
        }
        else {
            printTimerStatus((uint8_t) read_timer_number);
        }
    }
    else {
        terminalTextAttributes(YELLOW_COLOR, BLACK_COLOR, NORMAL_FONT);
        printf("Please enter a peripheral to view status. Received %s as peripheral name\r\n", rx_peripheral_name);
        printf("Peripherals that can be monitored include:\r\n"
                "   Interrupts\r\n"
                "   Clocks\r\n"
                "   PMD\r\n"
                "   WDT\r\n"
                "   DMT\r\n"
                "   ADC\r\n"
                "   ADC Channels\r\n"
                "   Prefetch\r\n"
                "   DMA\r\n"
                "   I2C Master\r\n"
                "   RTCC\r\n"
                "   Timer <x> (x = 1-9)\r\n");
        terminalTextAttributesReset();
        return;
    }

}

usb_uart_command_function_t errorStatusCommand(char * input_str) {
 
    // Print error handler status
    printErrorHandlerStatus();

    // Print help message
    terminalTextAttributes(YELLOW_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("\n\rCall 'Clear Errors' command to clear any errors that have been set\n\r");
    terminalTextAttributesReset();
    
}

usb_uart_command_function_t clearErrorsCommand(char * input_str) {
 
    // Zero out all error handler flags
    clearErrorHandler();

    // Update error LEDs based on error handler status
    update_error_leds_flag = 1;

    terminalTextAttributesReset();
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("Error Handler flags cleared\n\r");
    terminalTextAttributesReset();
    
}

usb_uart_command_function_t platformStatusCommand(char * input_str) {
 
    printPGOODStatus();
    
    if (nTOF_CONFIG_PIN == LOW) {
        double logic_tof_temp = logicBoardGetTOF();
        uint32_t logic_tof_temp_int = (uint32_t) floor(logic_tof_temp);
        uint32_t logic_power_cycle_temp = logicBoardGetPowerCycles();

        // first print stuff for logic board
        terminalTextAttributesReset();
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
        printf("Logic Board Time of Flight is %s\r\n", getStringSecondsAsTime(logic_tof_temp_int));
        printf("Logic Board has power cycled %u times\r\n", logic_power_cycle_temp);

        // Next, print stuff for display board if it's installed
        if (I2C_DSP_EN_PIN) {
            double display_tof_temp = displayBoardGetTOF();
            uint32_t display_tof_temp_int = (uint32_t) floor(display_tof_temp);
            uint32_t display_power_cycle_temp = displayBoardGetPowerCycles();

            printf("Display Board Time of Flight is %s\r\n", getStringSecondsAsTime(display_tof_temp_int));
            printf("Display Board has power cycled %u times\r\n", display_power_cycle_temp);
        }
    }
    
    terminalTextAttributesReset();
    
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, REVERSE_FONT);
    printf("\r\nI2C Bus Slave Device Status:\r\n");
    terminalTextAttributesReset();
    if (nTELEMETRY_CONFIG_PIN == LOW) {
        printTemperatureSensorStatus();
        printPowerMonitorStatus();
    }
    miscI2CDevicesPrintStatus();
    
}

usb_uart_command_function_t timeAndDateCommand(char * input_str) {
 
    terminalTextAttributesReset();
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
    printf("Current system time and date:\r\n   ");
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printTimeAndDate();
    terminalTextAttributesReset();
    
}

usb_uart_command_function_t setRTCCCommand(char * input_str) {

    // Snipe out received arguments
    char rtcc_args[64];
    sscanf(input_str, "Set RTCC: %[^\t\n\r]", rtcc_args);
    
    // only do these things if we actually have arguments for this command
    if (rtcc_args[0]) {

        if(strcomp(rtcc_args, "Date: ") == 0) {

            // Snipe out received string
            uint32_t read_month, read_day, read_year;
            sscanf(rtcc_args, "Date: %02u/%02u/%04u", &read_month, &read_day, &read_year);

            // Write received data into RTCC
            if (read_year >= 2000) {

                rtccWriteDate((uint8_t) read_month, (uint8_t) read_day, (uint16_t) read_year);

                // print out what we just did
                terminalTextAttributesReset();
                terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
                printf("Set RTCC date as %02u/%02u/%04u\r\n", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year);
                terminalTextAttributesReset();

            }

            // return error if year < 2000
            else {

                terminalTextAttributesReset();
                terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
                printf("Enter a valid date after 01/01/2000. User entered %02u/%02u/%04u\r\n", read_month, read_day, read_year);
                terminalTextAttributesReset();

            }

        }

        else if(strcomp(rtcc_args, "Time: ") == 0) {

            // Snipe out received string
            uint32_t read_hour, read_minute, read_second;
            sscanf(rtcc_args, "Time: %02u:%02u:%02u", &read_hour, &read_minute, &read_second);

            if (read_hour < 24 && read_minute < 60 && read_second < 60) {
                rtccWriteTime((uint8_t) read_hour, (uint8_t) read_minute, (uint8_t) read_second);
            }
            
            // print out what we just did
            terminalTextAttributesReset();
            terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
            printf("Set RTCC time as %02u:%02u:%02u\r\n", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
            terminalTextAttributesReset();

        }

        else if (strcomp(rtcc_args, "Weekday: ") == 0) {

            char read_weekday[16];
            uint8_t read_weekday_enum;
            sscanf(rtcc_args, "Weekday: %s", &read_weekday);

            if (strcmp(read_weekday, "Sunday") == 0) read_weekday_enum = 0;
            else if (strcmp(read_weekday, "Monday") == 0) read_weekday_enum = 1;
            else if (strcmp(read_weekday, "Tuesday") == 0) read_weekday_enum = 2;
            else if (strcmp(read_weekday, "Wednesday") == 0) read_weekday_enum = 3;
            else if (strcmp(read_weekday, "Thursday") == 0) read_weekday_enum = 4;
            else if (strcmp(read_weekday, "Friday") == 0) read_weekday_enum = 5;
            else if (strcmp(read_weekday, "Saturday") == 0) read_weekday_enum = 6;
            else read_weekday_enum = 255;

            if (read_weekday_enum != 255) {

                // print out what we just did
                terminalTextAttributesReset();
                terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
                rtccWriteWeekday(read_weekday_enum);
                printf("Set RTCC weekday as %s\r\n", getDayOfWeek(rtcc_shadow.weekday));
                terminalTextAttributesReset();

            }

            else {

                terminalTextAttributesReset();
                terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
                printf("Please enter a valid day of the weekday. Input is case sensitive, user entered %s\r\n", read_weekday);
                terminalTextAttributesReset();

            }

        }

        else if (strcomp(rtcc_args, "Unix Time: ") == 0) {

            // Snipe out received string
            uint32_t read_unix_time, read_offset;
            sscanf(rtcc_args, "Unix Time: %lu, %d", &read_unix_time, &read_offset);

            // remove timezone from unix time (this converts from UTC to local time)
            read_offset *= 3600;                // convert from hours to seconds
            read_unix_time += read_offset;      // add or remove these seconds to read unix time

            // write unix time into RTCC
            rtccWriteUnixTime(read_unix_time);

            // print out what we just did
            terminalTextAttributesReset();
            terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
            printf("Set RTCC time as %02u:%02u:%02u\r\n", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
            printf("Set RTCC date as %02u/%02u/%04u\r\n", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year);
            printf("Set RTCC weekday as %s\r\n", getDayOfWeek(rtcc_shadow.weekday));
            terminalTextAttributesReset();

        }

        else {
     
            terminalTextAttributes(YELLOW_COLOR, BLACK_COLOR, NORMAL_FONT);
            printf("Please enter an RTCC parameter to set, as well as what that parameter should be set to\r\n");
            printf("Available parameters are:\r\n");
            printf("    Date: <mm>/<dd>/<yyyy>: Sets the RTCC date \r\n");
            printf("    Time: <hh>:<mm>:<ss>: Sets the RTCC time. (Must be 24 hr time)\r\n");
            printf("    Weekday: <weekday>: Sets the RTCC weekday\r\n");
            printf("    Unix Time: <decimal unix time>, <hour offset from UTC to local time>: sets the RTCC to the supplied UNIX time with hour offset from UTC\r\n");
            terminalTextAttributesReset();

        }
        
        // Save time from internal RTCC into external backup RTC
        if (nBACKUP_RTC_CONFIG_PIN == LOW) backupRTCStashTime();
        
    }
        
    else {
     
        terminalTextAttributes(YELLOW_COLOR, BLACK_COLOR, NORMAL_FONT);
        printf("Please enter an RTCC parameter to set, as well as what that parameter should be set to\r\n");
        printf("Available parameters are:\r\n");
        printf("    Date: <mm>/<dd>/<yyyy>: Sets the RTCC date \r\n");
        printf("    Time: <hh>:<mm>:<ss>: Sets the RTCC time. (Must be 24 hr time)\r\n");
        printf("    Weekday: <weekday>: Sets the RTCC weekday\r\n");
        printf("    Unix Time: <decimal unix time>, <hour offset from UTC to local time>: sets the RTCC to the supplied UNIX time with hour offset from UTC\r\n");
        terminalTextAttributesReset();
        
    }
    
}

usb_uart_command_function_t liveTelemetryCommand(char * input_str) {
 
    terminalTextAttributesReset();
    
    if (live_telemetry_enable == 0) {
        terminalClearScreen();
        terminalSetCursorHome();
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("Enabling Live Telemetry\n\r");
        live_telemetry_enable = 1;
        // Disable pushbuttons
        disableInterrupt(PORTA_Input_Change_Interrupt);
        disableInterrupt(PORTB_Input_Change_Interrupt);
        disableInterrupt(External_Interrupt_2);
    }
    else {
        terminalClearScreen();
        terminalSetCursorHome();
        terminalTextAttributes(RED_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("Disabling Live Telemetry\n\r");
        live_telemetry_enable = 0;
        // enable pushbuttons
        clearInterruptFlag(PORTA_Input_Change_Interrupt);
        clearInterruptFlag(PORTB_Input_Change_Interrupt);
        clearInterruptFlag(External_Interrupt_2);
        enableInterrupt(PORTA_Input_Change_Interrupt);
        enableInterrupt(PORTB_Input_Change_Interrupt);
        enableInterrupt(External_Interrupt_2);
    }
    
    terminalTextAttributesReset();
    
}

usb_uart_command_function_t railStatusCommand(char * input_str) {
 
    printPGOODStatus();
    
}

usb_uart_command_function_t pingCommand(char * input_str) {
    terminalTextAttributesReset();
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("Pinging Buzzer\r\n");
    terminalTextAttributesReset();
    
    BUZZER_ENABLE_PIN = HIGH;
    softwareDelay(0x1FFFFF);
    BUZZER_ENABLE_PIN = LOW;
}

usb_uart_command_function_t timeOfFlightCommand(char * input_str) {
 
    double logic_tof_temp = logicBoardGetTOF();
    uint32_t logic_tof_temp_int = (uint32_t) floor(logic_tof_temp);
    uint32_t logic_power_cycle_temp = logicBoardGetPowerCycles();
    
    // first print stuff for logic board
    terminalTextAttributesReset();
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("Logic Board Time of Flight is %s\r\n", getStringSecondsAsTime(logic_tof_temp_int));
    printf("Logic Board has power cycled %u times\r\n", logic_power_cycle_temp);
    
    // Next, print stuff for display board if it's installed
    if (I2C_DSP_EN_PIN) {
        double display_tof_temp = displayBoardGetTOF();
        uint32_t display_tof_temp_int = (uint32_t) floor(display_tof_temp);
        uint32_t display_power_cycle_temp = displayBoardGetPowerCycles();

        printf("Display Board Time of Flight is %s\r\n", getStringSecondsAsTime(display_tof_temp_int));
        printf("Display Board has power cycled %u times\r\n", display_power_cycle_temp);
    }
    
    terminalTextAttributesReset();
    
}

usb_uart_command_function_t displayLampTestCommand(char * input_str) {
 
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("Testing all display segments. Press up arrow key to exit\r\n");
    terminalTextAttributesReset();
    
    clock_display_state = display_lamp_test;
    strcpy(vfd_display_buffer, "88:88:88");
    dp_anode_request = 1;
    
}

usb_uart_command_function_t setDisplayBrightnessCommand(char * input_str) {
    
    // Snipe out received arguments
    uint32_t read_brightness;
    sscanf(input_str, "Set Display Brightness: %3u", &read_brightness);
    
    if (read_brightness <= 100 && read_brightness >= 10) {
    
        vfd_display_brightness_setting = (uint8_t) read_brightness;
        vfdSetDisplayBrightness(vfd_display_brightness_setting);
        
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
        printf("Set display brightness as %u%%\r\n", vfd_display_brightness_setting);
        terminalTextAttributesReset();
    
    }
    
    else {
     
        terminalTextAttributes(YELLOW_COLOR, BLACK_COLOR, NORMAL_FONT);
        printf("Please enter brightness as an integer between 10 and 100. User entered %u%%\r\n", read_brightness);
        terminalTextAttributesReset();
        
    }
}

usb_uart_command_function_t setTimeFormatCommand(char * input_str) {
 
    // Snipe out received arguments
    char read_mode[32];
    sscanf(input_str, "Set Time Format: %s", read_mode);
    
    if (strcmp(read_mode, "24") == 0 || strcmp(read_mode, "AM_PM") == 0) {
    
        // copy logical inverse
        if (strcmp(read_mode, "24") == 0) am_pm_enable = 0;
        else am_pm_enable = 1;
        
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
        printf("Set time display format as %s\r\n", am_pm_enable ? "AM/PM" : "24hr");
        terminalTextAttributesReset();
    
    }
    
    else {
     
        terminalTextAttributes(YELLOW_COLOR, BLACK_COLOR, NORMAL_FONT);
        printf("Please enter time format as '24' or 'AM_PM'. User entered %s\r\n", read_mode);
        terminalTextAttributesReset();
        
    }
    
}

usb_uart_command_function_t alarmStatusCommand(char * input_str) {
 
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("Current clock alarm settings:\r\n");
    
    // print if alarm is armed
    if (clock_alarm.alarm_arm) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Alarm is currently %s\r\n", clock_alarm.alarm_arm ? "armed" : "disarmed");
    
    // Print alarm settings
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Alarm Time Setting: %02u:%02u:%02u (24hr time format)\r\n",
            clock_alarm.alarm_hour,
            clock_alarm.alarm_minute,
            clock_alarm.alarm_second);
    
    terminalTextAttributesReset();
    
}

usb_uart_command_function_t setAlarmCommand(char * input_str) {
 
    // Snipe out received string
    uint32_t read_hour, read_minute, read_second;
    sscanf(input_str, "Set Alarm: %02u:%02u:%02u", &read_hour, &read_minute, &read_second);

    if (read_hour < 24 && read_minute < 60 && read_second < 60) {

        clock_alarm.alarm_hour = read_hour;
        clock_alarm.alarm_minute = read_minute;
        clock_alarm.alarm_second = read_second;
        
        // print out what we just did
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
        printf("Set Alarm as %02u:%02u:%02u (24 hr time format)\r\n", clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
        terminalTextAttributesReset();
    
    }
    
    else {
     
        terminalTextAttributes(YELLOW_COLOR, BLACK_COLOR, NORMAL_FONT);
        printf("Please enter a valid alarm time. User entered %02u:%02u:%02u\r\n", read_hour, read_minute, read_second);
        terminalTextAttributesReset();
        
    }
    
}

usb_uart_command_function_t setAlarmEnableCommand(char * input_str) {
 
    // Snipe out received string
    char read_setting[32];
    sscanf(input_str, "Arm Alarm: %s", read_setting);

    if (strcmp(read_setting, "Arm") == 0) {
     
        clock_alarm.alarm_arm = 1;
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
        printf("Alarm has been armed. Current alarm time is %02u:%02u:%02u (24 hr time format)\r\n", 
                clock_alarm.alarm_hour, clock_alarm.alarm_minute, clock_alarm.alarm_second);
        terminalTextAttributesReset();
        
        
    }
    
    else if (strcmp(read_setting, "Disarm") == 0) {
     
        clock_alarm.alarm_arm = 0;
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
        printf("Alarm has been disarmed\r\n");
        terminalTextAttributesReset();
        
    }
    
    else {
     
        terminalTextAttributes(YELLOW_COLOR, BLACK_COLOR, NORMAL_FONT);
        printf("Please enter a valid alarm enable setting (Arm or Disarm)\r\n");
        terminalTextAttributesReset();
        
    }
    
}

usb_uart_command_function_t writeDisplayCommand(char * input_str) {
 
    // Snipe out received string
    char read_string[32];
    sscanf(input_str, "Write Display: %[^ \n\t\r\f\v]", read_string);
    
    clock_display_state = display_lamp_test;
    dp_anode_request = 0;
    // have to distinctly copy instead of using strcpy because we want to skip colon characters
    vfd_display_buffer[0] = read_string[0];
    vfd_display_buffer[1] = read_string[1];
    vfd_display_buffer[2] = ' ';
    vfd_display_buffer[3] = read_string[2];
    vfd_display_buffer[4] = read_string[3];
    vfd_display_buffer[5] = ' ';
    vfd_display_buffer[6] = read_string[4];
    vfd_display_buffer[7] = read_string[5];
    read_string[6] = '\0';
    // Clear display board LEDs since we're not in a valid state in the display state machine
    displayBoardSetLEDs();
    
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("Displaying string %s on VFD display, press up button to exit\r\n", read_string);
    terminalTextAttributesReset();
    
}

usb_uart_command_function_t setPowerCommand(char * input_str) {
 
    // Snipe out received string
    char read_string[32];
    sscanf(input_str, "Set Power: %s", read_string);
    
    if (strcmp(read_string, "On") == 0) {
        
        display_power_toggle_flag = 0;
        powerPushbuttonHandler();
    
    }
    
    else if (strcmp(read_string, "Off") == 0) {
     
        display_power_toggle_flag = 1;
        powerPushbuttonHandler();
        
    }
    
    else {
     
        terminalTextAttributes(YELLOW_COLOR, BLACK_COLOR, NORMAL_FONT);
        printf("Please enter a valid power state (On or Off)\r\n");
        terminalTextAttributesReset();
        
    }
    
}

// This function must be called to set up the usb_uart_commands hash table
// Entries into this hash table are "usb_uart serial commands"
void usbUartHashTableInitialize(void) {
    
    usbUartAddCommand("Help", 
            "Prints help message for all supported serial commands", 
            helpCommandFunction);
    usbUartAddCommand("Reset", 
            "Executes an MCU software reset", 
            resetCommand);
    usbUartAddCommand("Clear Screen", 
            "Clears the serial port terminal", 
            clearCommand);
    usbUartAddCommand("*IDN?", 
            "Prints identification string", 
            idnCommand);
    usbUartAddCommand("Repository?",
            "Prints project Git repo location",
            repositoryCommand);
    usbUartAddCommand("Ping",
            "Pings the alarm buzzer for a short duration",
            pingCommand);
    usbUartAddCommand("Host Status?",
            "Prints status of MCU host device (IDs, WDT, DMT, Prefetch, Cause of Reset, up time)", 
            hostStatusCommand);
    usbUartAddCommand("Peripheral Status?",
            "\b\b <peripheral_name>: Prints status of passed host peripheral. Available peripherals:\r\n"
            "       Interrupts\r\n"
            "       Clocks\r\n"
            "       PMD\r\n"
            "       WDT\r\n"
            "       DMT\r\n"
            "       Prefetch\r\n"
            "       DMA\r\n"
            "       ADC\r\n"
            "       ADC Channels\r\n"
            "       I2C Master\r\n"
            "       RTCC\r\n"
            "       Timer <x> (x = 1-9)",
            peripheralStatusCommand);
    usbUartAddCommand("Error Status?",
            "Prints the status of various error handler flags",
            errorStatusCommand);
    usbUartAddCommand("Clear Errors",
            "Clears all error handler flags",
            clearErrorsCommand);
    usbUartAddCommand("Platform Status?",
        "Prints current state of surrounding circuitry, including PGOOD, time of flight, I2C slaves",
        platformStatusCommand);
    if (nTELEMETRY_CONFIG_PIN == LOW) {
        usbUartAddCommand("Live Telemetry",
                "Toggles live updates of system level telemetry",
                liveTelemetryCommand);
    }
    usbUartAddCommand("Time and Date?",
            "Prints the current system time and date",
            timeAndDateCommand);
    usbUartAddCommand("Set RTCC:",
            "\b\b <parameter>: <parameter args>: sets a time parameter within the Real Time Clock and Calendar. Available parameters:\r\n"
            "       Date: <mm>/<dd>/<yyyy>: Sets the RTCC date \r\n"
            "       Time: <hh>:<mm>:<ss>: Sets the RTCC time. (Must be 24 hr time)\r\n"
            "       Weekday: <weekday>: Sets the RTCC weekday\r\n"
            "       Unix Time: <decimal unix time>, <hour offset from UTC to local time>: sets the RTCC to the supplied UNIX time with hour offset from UTC",
            setRTCCCommand);
    usbUartAddCommand("Display Lamp Test",
            "Tests all VFD display segments",
            displayLampTestCommand);
    usbUartAddCommand("Write Display:",
            "\b\b <string>: Writes the passed string to the VFD display",
            writeDisplayCommand);
    usbUartAddCommand("Set Display Brightness:",
            "\b\b <percent>: Sets the VFD display to the entered brightness as a percentage",
            setDisplayBrightnessCommand);
    usbUartAddCommand("Set Time Format:",
            "\b\b <24/AM_PM>: Sets time display format",
            setTimeFormatCommand);
    usbUartAddCommand("Alarm Status?",
            "Prints clock alarm settings",
            alarmStatusCommand);
    usbUartAddCommand("Set Alarm:",
            "\b\b <hh>:<mm>:<ss>: Sets the alarm time. (Must be 24 hr time)",
            setAlarmCommand);
    usbUartAddCommand("Arm Alarm:",
            "\b\b <Arm/Disarm>: Arms or disarms the clock alarm",
            setAlarmEnableCommand);
    usbUartAddCommand("Set Power:",
            "\b\b <On/Off>: Sets the clock power state",
            setPowerCommand);
    
}

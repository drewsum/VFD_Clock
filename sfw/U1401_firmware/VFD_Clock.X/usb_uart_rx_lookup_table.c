
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
// #include "adc.h"
#include "error_handler.h"
#include "pgood_monitor.h"
#include "telemetry.h"
#include "heartbeat_services.h"
#include "watchdog_timer.h"
#include "misc_i2c_devices.h"
#include "clock_functionality.h"
#include "vfd_multiplexing.h"

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
//    else if (strcmp(rx_peripheral_name, "ADC") == 0) {
//        printADCStatus();
//    }
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
                "   Prefetch\r\n"
                // "   ADC\r\n"
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

usb_uart_command_function_t timeAndDateCommand(char * input_str) {
 
    terminalTextAttributesReset();
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
    printf("Current system time and date:\r\n   ");
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printTimeAndDate();
    terminalTextAttributesReset();
    
}

usb_uart_command_function_t setDateCommand(char * input_str) {
 
    // Snipe out received string
    uint32_t read_month, read_day, read_year;
    sscanf(input_str, "Set Date: %02u/%02u/%04u", &read_month, &read_day, &read_year);

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

usb_uart_command_function_t setTimeCommand(char * input_str) {
 
    // Snipe out received string
    uint32_t read_hour, read_minute, read_second;
    sscanf(input_str, "Set Time: %02u:%02u:%02u", &read_hour, &read_minute, &read_second);

    rtccWriteTime((uint8_t) read_hour, (uint8_t) read_minute, (uint8_t) read_second);

    // print out what we just did
    terminalTextAttributesReset();
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("Set RTCC time as %02u:%02u:%02u\r\n", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
    terminalTextAttributesReset();
    
}

usb_uart_command_function_t setWeekdayCommand(char * input_str) {
 
    char read_weekday[16];
    uint8_t read_weekday_enum;
    sscanf(input_str, "Set Weekday: %s", &read_weekday);

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
        printf("Please enter a valid day of the weekday. Input is case sensitive\r\n");
        terminalTextAttributesReset();

    }
    
}

usb_uart_command_function_t telemetryCommand(char * input_str) {
 
    terminalTextAttributesReset();
    terminalTextAttributes(CYAN_COLOR, BLACK_COLOR, BOLD_FONT);
    printf("Most recent system telemetry:\n\r");
    
    printCurrentTelemetry();
    
}

usb_uart_command_function_t liveTelemetryCommand(char * input_str) {
 
    terminalTextAttributesReset();
    
    if (live_telemetry_enable == 0) {
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("Enabling Live Telemetry\n\r");
        live_telemetry_enable = 1;
    }
    else {
        terminalClearScreen();
        terminalSetCursorHome();
        terminalTextAttributes(RED_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("Disabling Live Telemetry\n\r");
        live_telemetry_enable = 0;
    }
    
    terminalTextAttributesReset();
    
}

usb_uart_command_function_t setUnixTimeCommand(char * input_str) {
 
    // Snipe out received string
    uint32_t read_unix_time, read_offset;
    sscanf(input_str, "Set Unix Time: %lu, %d", &read_unix_time, &read_offset);

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

usb_uart_command_function_t backupTimeCommand(char * input_str) {

    // Save time from internal RTCC into external backup RTC
    backupRTCStashTime();
    
    // print out what we just did
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("Backed up RTCC time as %02u:%02u:%02u\r\n", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
    printf("Backed up RTCC date as %02u/%02u/%04u\r\n", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year);
    printf("Backed up RTCC weekday as %s\r\n", getDayOfWeek(rtcc_shadow.weekday));
    terminalTextAttributesReset();
    
}

usb_uart_command_function_t restoreBackupTimeCommand(char * input_str) {
 
    // Restore time from external RTC into internal RTCC
    backupRTCRestoreTime();
    
    // print out what we just did
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("Restored RTCC time as %02u:%02u:%02u\r\n", rtcc_shadow.hours, rtcc_shadow.minutes, rtcc_shadow.seconds);
    printf("Restored RTCC date as %02u/%02u/%04u\r\n", rtcc_shadow.month, rtcc_shadow.day, rtcc_shadow.year);
    printf("Restored RTC weekday as %s\r\n", getDayOfWeek(rtcc_shadow.weekday));
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
    usbUartAddCommand("Peripheral Status? ",
            "\b\b<peripheral_name>: Prints status about passed peripheral. Available peripherals:\r\n"
            "       Interrupts\r\n"
            "       Clocks\r\n"
            "       PMD\r\n"
            "       WDT\r\n"
            "       DMT\r\n"
            "       Prefetch\r\n"
            "       RTCC\r\n"
            "       Timer <x> (x = 1-9)",
            peripheralStatusCommand);
    usbUartAddCommand("Error Status?",
            "Prints the status of various error handler flags",
            errorStatusCommand);
    usbUartAddCommand("Clear Errors",
            "Clears all error handler flags",
            clearErrorsCommand);
    usbUartAddCommand("Time of Flight?",
            "Returns time of flight for logic board",
            timeOfFlightCommand);
    usbUartAddCommand("Rail Status?",
            "Prints current state of run and power good signals for all voltage rails",
            railStatusCommand);
    usbUartAddCommand("Telemetry?",
            "Prints board level telemetry measurements",
            telemetryCommand);
    usbUartAddCommand("Live Telemetry",
            "Toggles live updates of board level telemetry",
            liveTelemetryCommand);
    usbUartAddCommand("Time and Date?",
            "Prints the current system time and date",
            timeAndDateCommand);
    usbUartAddCommand("Set Date: ",
            "\b\b<mm>/<dd>/<yyyy>: Sets the system date",
            setDateCommand);
    usbUartAddCommand("Set Time: ",
            "\b\b<hh>:<mm>:<ss>: Sets the system time. (Must be 24 hr time)",
            setTimeCommand);
    usbUartAddCommand("Set Weekday: ",
            "\b\b<weekday>: Sets the system weekday",
            setWeekdayCommand);
    usbUartAddCommand("Set Unix Time: ",
            "\b\b<decimal unix time>, <hour offset from UTC to local time>: sets the RTCC to the supplied UNIX time with hour offset from UTC",
            setUnixTimeCommand);
    usbUartAddCommand("Backup Time",
            "Saves internal RTCC time into external backup RTC",
            backupTimeCommand);
    usbUartAddCommand("Restore Time",
            "Restores time from external backup RTC into internal RTCC",
            restoreBackupTimeCommand);
    usbUartAddCommand("Display Lamp Test",
            "Tests all VFD display segments",
            displayLampTestCommand);
    usbUartAddCommand("Set Display Brightness: ",
            "\b\b<percent>: Sets the VFD display to the entered brightness as a percentage",
            setDisplayBrightnessCommand);
    usbUartAddCommand("Set Time Format: ",
            "\b\b<24/AM_PM>: Sets time display format",
            setTimeFormatCommand);
    usbUartAddCommand("Alarm Status?",
            "Prints clock alarm settings",
            alarmStatusCommand);
    usbUartAddCommand("Set Alarm: ",
            "\b\b<hh>:<mm>:<ss>: Sets the alarm time. (Must be 24 hr time)",
            setAlarmCommand);
    usbUartAddCommand("Arm Alarm: ",
            "\b\b<Arm/Disarm>: Arms or disarms the clock alarm",
            setAlarmEnableCommand);
    
}

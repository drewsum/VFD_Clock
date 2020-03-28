
#include <xc.h>
#include <string.h>
#include <stdio.h>

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
    printf("Electronic Calendar by Drew Maatman, 2019\r\n");
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
    sscanf(input_str, "Peripheral Status? %s", rx_peripheral_name);

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
                "   RTCC\r\n");
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
    sscanf(input_str, "Set Date: %u/%u/%u", &read_month, &read_day, &read_year);

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
    sscanf(input_str, "Set Time: %u:%u:%u", &read_hour, &read_minute, &read_second);

    rtccWriteTime((uint8_t) read_hour, (uint8_t) read_minute, (uint16_t) read_second);

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
    terminalTextAttributes(CYAN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Input Protect Temp: %f\r\n", telemetry.pos12.temperature);
    printf("    Input Voltage: %f\r\n", telemetry.pos12.output_voltage);
    printf("    +3.3V temp: %f\r\n", telemetry.pos3p3.temperature);
    printf("    +3.3V Output Volt: %f\r\n", telemetry.pos3p3.output_voltage);
    printf("    +5V temp: %f\r\n", telemetry.pos5.temperature);
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

usb_uart_command_function_t setRailEnableCommand(char * input_str) {

    // Snipe out received arguments
    char rx_rail_name[32];
    uint32_t rx_rail_enable;
    sscanf(input_str, "Set Rail Enable: %[^,], %u", rx_rail_name, &rx_rail_enable);
    
    // Make sure the enable state we've received is valid, print help if not
    if (rx_rail_enable > 1) {
        terminalTextAttributes(YELLOW_COLOR, BLACK_COLOR, NORMAL_FONT);
        printf("Please enter a power supply enable state that is either 0 or 1, received %u\r\n", rx_rail_enable);
        terminalTextAttributesReset();
        return;
    }
    
    else {
        
        // Determine the rail we're enabling or disabling
        if (strcmp(rx_rail_name, "POS5") == 0) {
            POS5_RUN_PIN = rx_rail_enable;
        }
        else if (strcmp(rx_rail_name, "POS60_VAN") == 0) {
            POS60_VAN_RUN_PIN = rx_rail_enable;
        }
        else if (strcmp(rx_rail_name, "POS1P2_VFF") == 0) {
            POS1P2_VFF_RUN_PIN = rx_rail_enable;
        }
        else if (strcmp(rx_rail_name, "VBAT") == 0) {
            VBAT_ENABLE_PIN = rx_rail_enable;
        }
        else {
            terminalTextAttributes(YELLOW_COLOR, BLACK_COLOR, NORMAL_FONT);
            printf("Please enter a power supply which can be enabled. Received %s as rail name, %u as enable state\r\n", rx_rail_name, rx_rail_enable);
            printf("Power supplies that can be enabled include:\r\n"
                    "   POS5\r\n"
                    "   POS60_VAN\r\n"
                    "   POS1P2_VFF\r\n"
                    "   VBAT\r\n");
            terminalTextAttributesReset();
            return;
        }

        // print feedback back to terminal
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
        printf("Set Rail %s RUN pin to %u\r\n", rx_rail_name, rx_rail_enable);
        terminalTextAttributesReset();
        return;
    
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
            "       RTCC",
            peripheralStatusCommand);
    usbUartAddCommand("Error Status?",
            "Prints the status of various error handler flags",
            errorStatusCommand);
    usbUartAddCommand("Clear Errors",
            "Clears all error handler flags",
            clearErrorsCommand);
    usbUartAddCommand("Rail Status?",
            "Prints current state of run and power good signals for all voltage rails",
            railStatusCommand);
    usbUartAddCommand("Set Rail Enable: ",
            "\b\b<rail_name>, <rail_state>: Sets RUN pin state for rail_name power supply. 1 for enabled, 0 for disabled. Available rails:\r\n"
            "       POS5\r\n"
            "       POS60_VAN\r\n"
            "       POS1P2_VFF\r\n"
            "       VBAT",
            setRailEnableCommand);
    usbUartAddCommand("Telemetry?",
            "Prints board level telemetry measurements",
            telemetryCommand);
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
    
}

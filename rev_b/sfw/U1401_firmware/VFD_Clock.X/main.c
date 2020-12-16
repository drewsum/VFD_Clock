/*
 * File:   main.c
 * Author: Drew Maatman
 *
 * Created on March 8th, 2020, 12:16 PM
 */


#include <xc.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

#include "main.h"

// Core Drivers
#include "configuration.h"
#include "32mz_interrupt_control.h"
#include "cause_of_reset.h"
#include "device_control.h"
#include "error_handler.h"
#include "heartbeat_timer.h"
#include "watchdog_timer.h"
#include "prefetch.h"
#include "rtcc.h"
#include "adc.h"
#include "adc_channels.h"

// GPIO
#include "pin_macros.h"
#include "gpio_setup.h"

// USB UART
#include "uthash.h"
#include "usb_uart.h"
#include "usb_uart_rx_lookup_table.h"
#include "terminal_control.h"

// I2C
#include "temperature_sensors.h"
#include "power_monitors.h"
#include "misc_i2c_devices.h"

// Application Specific
#include "power_saving.h"
#include "pgood_monitor.h"
#include "telemetry.h"
#include "heartbeat_services.h"
#include "power_monitors.h"
#include "vfd_multiplexing.h"
#include "clock_functionality.h"

void main(void) {
    
    // Save the cause of the most recent device reset
    // This also checks for configuration errors
    reset_cause = getResetCause();
    
    // Clear the terminal
    terminalClearScreen();
    terminalSetCursorHome();
    terminalSetTitle("VFD Clock Serial Terminal");
    
    terminalTextAttributesReset();
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
    printf("VFD Clock\r\n");
    printf("Host Firmware Version: %s, Platform Hardware Revision: %s\r\n", FIRMWARE_VERSION_STR, PLATFORM_REVISION_STR);
    printf("Created by Drew Maatman, December 2020\r\n");
    terminalTextAttributesReset();
    
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
    
        terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
        
    }
    
    else {
     
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
        
    }
    
    // only clear persistent error flags if we've seen a POR... keep old values after other resets
    if (reset_cause == POR_Reset) {
        live_telemetry_enable = 0;
        live_telemetry_print_request = 0;
        clearErrorHandler();
    }
    
    printf("\r\nCause of most recent device reset: %s\r\n\r\n", getResetCauseString(reset_cause));
    terminalTextAttributesReset();
    
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
    printf("Beginning Logic Board Initialization:\r\n");
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    
    // setup GPIO pins
    gpioInitialize();
    printf("    GPIO Pins Initialized\n\r");
    
    // Disable global interrupts so clocks can be initialized properly
    disableGlobalInterrupts();
    
    // Initialize system clocks
    clockInitialize();
    printf("    Oscillators, Phase-Locked Loop, and System Clocks Initialized\n\r");
    
    // Configure interrupt controller
    interruptControllerInitialize();
    
    // Enable Global Interrupts
    enableGlobalInterrupts();
    printf("    Interrupt Controller Initialized, Global Interrupts Enabled\n\r");
    
    // Setup error handling
    errorHandlerInitialize();
    printf("    Error Handler Initialized\n\r");
    
    // Setup USB UART debugging
    usbUartInitialize();
    printf("    USB UART Initialized, DMA buffer method used\n\r");
    
    // Setup prefetch module
    prefetchInitialize();
    printf("    CPU Instruction Prefetch Module Enabled\r\n");
    
    // Disable unused peripherals for power savings
    PMDInitialize();
    printf("    Unused Peripheral Modules Disabled\n\r");
    
    // Setup the real time clock-calendar
    rtccInitialize();
    if (reset_cause == POR_Reset) rtccClear();
    printf("    Real Time Clock-Calendar Initialized\r\n");
    
    // Setup heartbeat timer
    heartbeatTimerInitialize();
    printf("    Heartbeat Timer Initialized\n\r");
    
    // setup watchdog timer
    watchdogTimerInitialize();
    printf("    Watchdog Timer Initialized\n\r");
    
    // setup master I2C bus
    I2C_EN_PIN = HIGH;
    softwareDelay(0xFFFFF);
    I2CMaster_Initialize();
    printf("    I2C Bus Controller Initialized\r\n");
    softwareDelay(0xFFFFF);

    if (nTELEMETRY_CONFIG_PIN == LOW) {
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("Telemetry Configuration Detected\r\n");
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
        // setup I2C slaves
        tempSensorsInitialize();
        printf("    Temperature Sensors Initialized\r\n");
        powerMonitorsInitialize();
        printf("    Power Monitors Initialized\r\n");
        // Enable ADC
        ADCInitialize();
        printf("    Analog to Digital Converter Initialized\n\r");
    }
    else {
        terminalTextAttributes(RED_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("Telemetry Configuration Not Detected\r\n");
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    }
  
    if (nTOF_CONFIG_PIN == LOW) {
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("Time of Flight Configuration Detected\r\n");
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
        logicBoardTOFInitialize();
        printf("    Logic Board Time of Flight Counter Initialized\r\n");
    }
    else {
        terminalTextAttributes(RED_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("Time of Flight Configuration Not Detected\r\n");
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    }
    
    if (nBACKUP_RTC_CONFIG_PIN == LOW) {
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("Backup RTC Configuration Detected\r\n");
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
        backupRTCInitialize();
        printf("    Backup Real-Time Clock Initialized\r\n");
        backupRTCRestoreTime();
        printf("    Restored time backup from previous sessions\r\n");
    }
    else {
        terminalTextAttributes(RED_COLOR, BLACK_COLOR, BOLD_FONT);
        printf("Backup RTC Configuration Not Detected\r\n");
        terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    }
    
    // Try to find an installed display board and set it up
    displayBoardInitialize();
    
    // Disable reset LED
    RESET_LED_PIN = LOW;
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Reset LED Disabled\r\n");
    
    // Print end of boot message, reset terminal for user input
    terminalTextAttributesReset();
    terminalTextAttributes(YELLOW_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("\n\rType 'Help' for list of supported commands\n\r\n\r");
    terminalTextAttributesReset();
    
    // check to see if a clock fail has occurred and latch it
    clockFailCheck();
    
    // Main loop, do this stuff forever and ever and never get tired of it
    while (1) {
        
        // get temperature sensor data
        if (temp_sense_data_request) tempSensorsRetrieveData();

        // get power monitor data
        if (power_monitor_data_request) powerMonitorsGetData();
        
        // clear the watchdog if we need to
        if (wdt_clear_request) {
            kickTheDog();
            wdt_clear_request = 0;
        }
        
        // Only do these actions if a display is detected
        if (nDISPLAY_DETECT_PIN == LOW) {
         
            // update what's in the vfd_display_buffer[] based on what we want to display
            updateClockDisplay();
            
            // check to see if we need to trigger the alarm
            clockAlarmCheckMatch();
            
        }
        
        // parse received USB strings if we have a new one received
        if (usb_uart_rx_ready) {
            usbUartRxLUTInterface(usb_uart_rx_buffer);
            // Determine length of received string
            uint32_t length = strlen(usb_uart_rx_buffer);
        
            // clear rx buffer
            uint32_t index;
            for (index = 0; index < length; index++) {
                usb_uart_rx_buffer[index] = '\0';
            }
        }
        
        if (live_telemetry_print_request && live_telemetry_enable) {

            // Clear the terminal
            //terminalClearScreen();
            terminalSetCursorHome();
            
            terminalTextAttributesReset();
            terminalTextAttributes(CYAN_COLOR, BLACK_COLOR, BOLD_FONT);
            printf("Live system telemetry:\033[K\n\r\033[K");
            
            printCurrentTelemetry();
            
            terminalTextAttributes(YELLOW_COLOR, BLACK_COLOR, NORMAL_FONT);
            printf("Call 'Live Telemetry' command to disable\033[K\n\r");
            terminalTextAttributesReset();
            
            live_telemetry_print_request = 0;
            
        }
        
        // check to see if a clock fail has occurred and latch it
        clockFailCheck();
        
        // update error LEDs if needed
        if (update_error_leds_flag) updateErrorLEDs();
        
    }
    
}

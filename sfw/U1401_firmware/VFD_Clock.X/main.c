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

// Core Drivers
#include "configuration.h"
#include "32mz_interrupt_control.h"
#include "cause_of_reset.h"
#include "device_control.h"
#include "error_handler.h"
#include "heartbeat_timer.h"
#include "watchdog_timer.h"
#include "prefetch.h"

// GPIO
#include "pin_macros.h"
#include "gpio_setup.h"

// USB UART
#include "uthash.h"
#include "usb_uart.h"
#include "usb_uart_rx_lookup_table.h"
#include "terminal_control.h"

void main(void) {
    
    // Clear the terminal
    terminalClearScreen();
    terminalSetCursorHome();
    
    terminalTextAttributesReset();
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
    printf("VFD Clock\r\n");
    printf("Created by Drew Maatman, 2020\r\n");
    terminalTextAttributesReset();
    
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("Beginning Peripheral Initialization:\r\n");
    
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
    
    // Setup heartbeat timer
    heartbeatTimerInitialize();
    printf("    Heartbeat Timer Initialized\n\r");
    
    // setup watchdog timer
    watchdogTimerInitialize();
    printf("    Watchdog Timer Initialized\n\r");
    
    // Setup prefetch module
    prefetchInitialize();
    printf("    CPU Instruction Prefetch Module Enabled\r\n");
    
    // Setup USB UART debugging
    usbUartInitialize();
    printf("    USB UART Initialized, DMA buffer method used\n\r");
    
    // Disable reset LED
    RESET_LED_PIN = LOW;
    printf("    Reset LED Disabled\r\n");
    
    // Print end of boot message, reset terminal for user input
    terminalTextAttributesReset();
    terminalTextAttributes(YELLOW_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("\n\rType 'Help' for list of supported commands\n\r\n\r");
    terminalTextAttributesReset();
    
    // Main loop, do this stuff forever and ever
    while (1) {
        
        Nop();
        
    }
    
}

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

// GPIO
#include "pin_macros.h"
#include "gpio_setup.h"


void main(void) {
    
    
    // setup GPIO pins
    gpioInitialize();
    
    // Disable global interrupts so clocks can be initialized properly
    disableGlobalInterrupts();
    
    // Initialize system clocks
    clockInitialize();
    
    // Configure interrupt controller
    interruptControllerInitialize();
    
    // Enable Global Interrupts
    enableGlobalInterrupts();
    
    // Setup heartbeat timer
    heartbeatTimerInitialize();
    
    // Disable reset LED
    RESET_LED_PIN = LOW;
    
    while (1) {
        
    }
    
}

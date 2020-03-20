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

#include "configuration.h"
#include "pin_macros.h"


void main(void) {
    
    
    // setup GPIO pins
    gpioInitialize();
    
    // Disable reset LED
    RESET_LED_PIN = LOW;
    
    while (1) {
        
    }
    
}

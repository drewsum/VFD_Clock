
#include <xc.h>

#include <stdio.h>
#include <string.h>

#include "clock_functionality.h"

#include "vfd_multiplexing.h"
#include "rtcc.h"

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
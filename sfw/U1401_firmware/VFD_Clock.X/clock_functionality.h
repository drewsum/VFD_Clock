/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _CLOCK_FUNCTIONALITY_H    /* Guard against multiple inclusion */
#define _CLOCK_FUNCTIONALITY_H

#include <xc.h>

#include "vfd_multiplexing.h"
#include "rtcc.h"

// This global enum keeps track of what we want to display on the VFD display
// This needs to be volatile because a bunch of different functions can modify it
enum clock_display_state_e {
    
    display_time_state = 0,
    set_time_state = 1,
    display_date_state = 2,
    set_date_state = 3,
    display_weekday_state = 4,
    set_weekday_state = 5,
    display_alarm_state = 6,
    set_alarm_state = 7,
    alarm_enable_state = 8,
    set_24hr_mode_state = 9,
    set_brightness_state = 10
    
} volatile clock_display_state = 0;

// This function updates the VFD display based on the current state of what we want to display
// relies on global variables in vfd_multiplexing and rtcc modules
void updateClockDisplay(void);


#endif /* _CLOCK_FUNCTIONALITY_H */

/* *****************************************************************************
 End of File
 */

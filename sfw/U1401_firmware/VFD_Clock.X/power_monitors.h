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

#ifndef _POWER_MONITORS_H    /* Guard against multiple inclusion */
#define _POWER_MONITORS_H

#include "ina219_power_monitor.h"

#include "error_handler.h"

// These are all the I2C 7 bit addresses of power monitors in this project
#define POS12_MON_ADDR              0x40
#define POS3P3_IN_MON_ADDR          0x41
#define POS3P3_OUT_MON_ADDR         0x42
#define POS5_IN_MON_ADDR            0x43
#define POS5_OUT_MON_ADDR           0x44

uint8_t power_monitor_data_request = 0;

// This function initializes all power monitors in the project, if available
void powerMonitorsInitialize(void);

// this function gets data from all power monitors
void powerMonitorGetData(void);


#endif /* _POWER_MONITORS_H */

/* *****************************************************************************
 End of File
 */

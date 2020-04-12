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

#ifndef _MISC_I2C_DEVICES_H    /* Guard against multiple inclusion */
#define _MISC_I2C_DEVICES_H


#include <xc.h>
#include <time.h>

#include "i2c_master.h"

#include "ds1683_time_of_flight.h"
#include "tca9555_io_expander.h"
#include "mcp9804_temp_sensor.h"

#define LOGIC_TOF_ADDR      0x6B

#define DISPLAY_TOF_ADDR    0x6F

#define BACKUP_RTC_ADDR     0x68

#define DISPLAY_IO_ADDR     0x20

// this function initializes the logic board TOF counter
void logicBoardTOFInitialize(void);

// this function returns time of flight in seconds (w/ 0.25 second granularity) for logic board from I2C time of flight counter
double logicBoardGetTOF(void);

// this function returns the number of power cycles for the logic board from I2C time of flight counter
uint32_t logicBoardGetPowerCycles(void);

// this function returns time of flight in seconds (w/ 0.25 second granularity) for display board from I2C time of flight counter
double displayBoardGetTOF(void);

// this function returns the number of power cycles for the display board from I2C time of flight counter
uint32_t displayBoardGetPowerCycles(void);

// This function sets up the backup RTC to act as a fail safe to count while input power is removed
void backupRTCInitialize(void);

// This function stashes the current date and time saved in the internal RTCC into the backup RTC
void backupRTCStashTime(void);

// This function recovers the time from the backup RTC and stores it into the internal RTCC
void backupRTCRestoreTime(void);

// This function sets up the I2C devices on the display board
void displayI2CInitialize(void);

// This function sets the display board IO expander output
void displayBoardSetIOExpanderOutput(uint16_t output_data);

#endif /* _MISC_I2C_DEVICES_H */

/* *****************************************************************************
 End of File
 */

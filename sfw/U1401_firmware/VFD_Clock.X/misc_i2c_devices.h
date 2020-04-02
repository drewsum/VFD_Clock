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

#define LOGIC_TOF_ADDR      0x6B

#define BACKUP_RTC_ADDR     0x68

// this function initializes the logic board TOF counter
void logicBoardTOFInitialize(void);

// this function returns time of flight in seconds (w/ 0.25 second granularity) for logic board from I2C time of flight counter
double logicBoardGetTOF(void);

// this function returns the number of power cycles for the logic board from I2C time of flight counter
uint32_t logicBoardGetPowerCycles(void);

// This function sets up the backup RTC to act as a fail safe to count while input power is removed
void backupRTCInitialize(void);

// This function stashes the current date and time saved in the internal RTCC into the backup RTC
void backupRTCStashTime(void);

// This function recovers the time from the backup RTC and stores it into the internal RTCC
void backupRTCRestoreTime(void);

#endif /* _MISC_I2C_DEVICES_H */

/* *****************************************************************************
 End of File
 */

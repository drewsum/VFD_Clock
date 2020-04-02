
#include <time.h>

#include "misc_i2c_devices.h"

#include "pin_macros.h"
#include "error_handler.h"
#include "ds3231_rtc.h"
#include "rtcc.h"


// this function initializes the logic board TOF counter
void logicBoardTOFInitialize(void) {
 
    DS1683TimeOfFlightInitialize(LOGIC_TOF_ADDR, &error_handler.flags.logic_tof);
    
}

// this function returns time of flight in seconds (w/ 0.25 second granularity) for logic board from I2C time of flight counter
double logicBoardGetTOF(void) {
 
    return DS1683GetETC(LOGIC_TOF_ADDR, &error_handler.flags.logic_tof);
    
}

// this function returns the number of power cycles for the logic board from I2C time of flight counter
uint32_t logicBoardGetPowerCycles(void) {
 
    return (uint32_t) DS1683GetEventCount(LOGIC_TOF_ADDR, &error_handler.flags.logic_tof);
    
}

// This function sets up the backup RTC to act as a fail safe to count while input power is removed
void backupRTCInitialize(void) {
 
    DS3231MRTCInitialize(BACKUP_RTC_ADDR, &error_handler.flags.backup_rtc);
    
}

// This function stashes the current date and time saved in the internal RTCC into the backup RTC
void backupRTCStashTime(void) {
 
    DS3231MRTCStoreTime(BACKUP_RTC_ADDR, &error_handler.flags.backup_rtc, getRTCTimeStruct());
    
}

// This function recovers the time from the backup RTC and stores it into the internal RTCC
void backupRTCRestoreTime(void) {
 
    struct tm read_time = DS3231MRTCReadTime(BACKUP_RTC_ADDR, &error_handler.flags.backup_rtc);
    rtccWriteUnixTime(mktime(&read_time));
    
}
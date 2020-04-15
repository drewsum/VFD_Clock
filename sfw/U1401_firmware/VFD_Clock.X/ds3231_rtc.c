
#include "ds3231_rtc.h"

#include <stdio.h>
#include <time.h>

#include "i2c_master.h"

#include "error_handler.h"
#include "device_control.h"



// This function initializes aN rtc at passed address. Also pass pointer to error handler flag for device
void DS3231MRTCInitialize(uint8_t device_address, volatile uint8_t *device_error_handler_flag) {
    
    // Write config data to config register on input temp sensor
    uint8_t output_data_array[2];
    output_data_array[0] = DS3231M_CONTROL_REG;
    output_data_array[1] = DS3231M_CONTROL_DATA;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
    // Write config data to config register on input temp sensor
    output_data_array[0] = DS3231M_STATUS_REG;
    output_data_array[1] = DS3231M_STATUS_DATA;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
}

// This function reads temperature sensor data from the RTC
double DS3231MRTCGetTemperature(uint8_t device_address, volatile uint8_t *device_error_handler_flag) {
 
    // Check to see if we're starting up into a broken I2C state machine
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) {
        // log the fault
        error_handler.flags.i2c_stall = 1;
        // reset the I2C controller if it's enabled
        if (getI2COnState) I2COnStateReset();
    }
    
    uint8_t data_reg_pointer[1];
    uint8_t readBytes[2];
    I2C_TRANSACTION_REQUEST_BLOCK readTRB[2];
    data_reg_pointer[0] = DS3231M_TEMP_MSB_REG;
    I2C_MasterWriteTRBBuild(&readTRB[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRB[1], readBytes, 2, device_address);
    I2C_MasterTRBInsert(2, readTRB, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    
    if (I2C_STATUS == I2C_MESSAGE_COMPLETE) {
        // convert received data to volts
        // from section 8.6.3.2 of datasheet
        return (readBytes[0] * 1.0) + ((readBytes[1] >> 6) * 0.25);
    }
    else {
        *device_error_handler_flag = 1;
        return 0.0;
    }
    
    
}

// This function stores the passed time into the RTC. Pass time as a time_t structure
void DS3231MRTCStoreTime(uint8_t device_address, volatile uint8_t *device_error_handler_flag, struct tm input_time) {
 
    // save passed time into variables for writing into RTC
    // First, convert time elements into BCD and shift into format for RTC
    uint8_t write_seconds_01    = input_time.tm_sec % 10;
    uint8_t write_seconds_10    = (input_time.tm_sec / 10) % 10;
    uint8_t write_seconds       = (write_seconds_10 << 4) | write_seconds_01;
    uint8_t write_minutes_01    = input_time.tm_min % 10;
    uint8_t write_minutes_10    = (input_time.tm_min / 10) % 10;
    uint8_t write_minutes       = (write_minutes_10 << 4) | write_minutes_01;
    uint8_t write_hours_01      = input_time.tm_hour % 10;
    uint8_t write_hours_10      = (input_time.tm_hour / 10) % 10;
    uint8_t write_hours         = (write_hours_10 << 4) | write_hours_01;
    
    // Now do the same with date
    uint8_t write_day           = input_time.tm_wday + 1;       // 1 indexed, unlike time.c
    uint8_t write_date_01       = input_time.tm_mday % 10;
    uint8_t write_date_10       = (input_time.tm_mday / 10) % 10;
    uint8_t write_date          = (write_date_10 << 4) | write_date_01;
    uint8_t write_month_01      = (input_time.tm_mon + 1) % 10;     // time.c encodes month 0 indexed
    uint8_t write_month_10      = ((input_time.tm_mon + 1) / 10) % 10;      // time.c encodes month as 0 indexed
    uint8_t write_month         = (write_month_10 << 4) | write_month_01;
    uint8_t write_year_01       = (input_time.tm_year - 100) % 10;      // time.c encodes year as year since 1900
    uint8_t write_year_10       = ((input_time.tm_year - 100) / 10) % 10;      // time.c encodes year as year since 1900
    uint8_t write_year          = (write_year_10 << 4) | write_year_01;
    
    // Now shit all this stuff out to the RTC itself over I2C bus
    // Seconds
    uint8_t output_data_array[2];
    output_data_array[0] = DS3231M_SECONDS_REG;
    output_data_array[1] = write_seconds;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
    // Minutes
    output_data_array[0] = DS3231M_MINUTES_REG;
    output_data_array[1] = write_minutes;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
    // hours
    output_data_array[0] = DS3231M_HOURS_REG;
    output_data_array[1] = write_hours;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
    // weekday
    output_data_array[0] = DS3231M_DAY_REG;
    output_data_array[1] = write_day;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
    // date
    output_data_array[0] = DS3231M_DATE_REG;
    output_data_array[1] = write_date;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
    // month
    output_data_array[0] = DS3231M_MONTH_CENT_REG;
    output_data_array[1] = write_month;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
    // year
    output_data_array[0] = DS3231M_YEAR_REG;
    output_data_array[1] = write_year;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
}

// This function reads the time from the RTC
struct tm DS3231MRTCReadTime(uint8_t device_address, volatile uint8_t *device_error_handler_flag) {
    
    struct tm return_time;
    uint8_t data_reg_pointer[1];
    uint8_t readBytes[1];
    I2C_TRANSACTION_REQUEST_BLOCK readTRB[2];
    
    // read seconds
    data_reg_pointer[0] = DS3231M_SECONDS_REG;
    I2C_MasterWriteTRBBuild(&readTRB[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRB[1], readBytes, 1, device_address);
    I2C_MasterTRBInsert(2, readTRB, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_seconds_01 = readBytes[0] & 0x0F;
    uint8_t read_seconds_10 = (readBytes[0] >> 4) & 0x07;
    return_time.tm_sec = read_seconds_01 + (read_seconds_10 * 10);
    
    // read minutes
    data_reg_pointer[0] = DS3231M_MINUTES_REG;
    I2C_MasterWriteTRBBuild(&readTRB[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRB[1], readBytes, 1, device_address);
    I2C_MasterTRBInsert(2, readTRB, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_minutes_01 = readBytes[0] & 0x0F;
    uint8_t read_minutes_10 = (readBytes[0] >> 4) & 0x07;
    return_time.tm_min = read_minutes_01 + (read_minutes_10 * 10);
    
    // read hours
    data_reg_pointer[0] = DS3231M_HOURS_REG;
    I2C_MasterWriteTRBBuild(&readTRB[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRB[1], readBytes, 1, device_address);
    I2C_MasterTRBInsert(2, readTRB, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_hours_01 = readBytes[0] & 0x0F;
    uint8_t read_hours_10 = (readBytes[0] >> 4) & 0x03;
    return_time.tm_hour = read_hours_01 + (read_hours_10 * 10);
    
    // read weekday
    data_reg_pointer[0] = DS3231M_DAY_REG;
    I2C_MasterWriteTRBBuild(&readTRB[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRB[1], readBytes, 1, device_address);
    I2C_MasterTRBInsert(2, readTRB, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    return_time.tm_wday = readBytes[0] - 1;
    
    // read date
    data_reg_pointer[0] = DS3231M_DATE_REG;
    I2C_MasterWriteTRBBuild(&readTRB[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRB[1], readBytes, 1, device_address);
    I2C_MasterTRBInsert(2, readTRB, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_date_01 = readBytes[0] & 0x0F;
    uint8_t read_date_10 = (readBytes[0] >> 4) & 0x03;
    return_time.tm_mday = read_date_01 + (read_date_10 * 10);
    
    // read month
    data_reg_pointer[0] = DS3231M_MONTH_CENT_REG;
    I2C_MasterWriteTRBBuild(&readTRB[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRB[1], readBytes, 1, device_address);
    I2C_MasterTRBInsert(2, readTRB, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_month_01 = readBytes[0] & 0x0F;
    uint8_t read_month_10 = (readBytes[0] >> 4) & 0x01;
    return_time.tm_mon = read_month_01 + (read_month_10 * 10) - 1;
    
    // read year
    data_reg_pointer[0] = DS3231M_YEAR_REG;
    I2C_MasterWriteTRBBuild(&readTRB[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRB[1], readBytes, 1, device_address);
    I2C_MasterTRBInsert(2, readTRB, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_year_01 = readBytes[0] & 0x0F;
    uint8_t read_year_10 = (readBytes[0] >> 4) & 0x0F;
    return_time.tm_year = read_year_01 + (read_year_10 * 10) + 100;
    
    // send return time structure back to function call
    return return_time;
    
}

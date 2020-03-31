
#include "ds3231_rtc.h"

#include <stdio.h>

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
    softwareDelay(0x1FF);
    
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
    // Write config data to config register on input temp sensor
    output_data_array[0] = DS3231M_STATUS_REG;
    output_data_array[1] = DS3231M_STATUS_DATA;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0x1FF);
    
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
    softwareDelay(0x1FF);
    
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
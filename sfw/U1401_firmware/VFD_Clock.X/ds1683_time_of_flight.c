
#include "ds1683_time_of_flight.h"

#include <stdio.h>

#include "i2c_master.h"

#include "error_handler.h"
#include "device_control.h"


// This function initializes a time of flight counter at passed address. Also pass pointer to error handler flag for device
void DS1683TimeOfFlightInitialize(uint8_t device_address, volatile uint8_t *device_error_handler_flag) {

    // Write config data to config register on input temp sensor
    uint8_t output_data_array[2];
    output_data_array[0] = DS1683_CONFIG_REG;
    output_data_array[1] = DS1683_CONFIG_DATA;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    
    softwareDelay(0x1FF);
    
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    

}

// This function gets the time of flight from counter at passed address. Also pass pointer to error handler flag for device
// returns on time in seconds with 0.25 second resolution
double DS1683GetETC(uint8_t device_address, volatile uint8_t *device_error_handler_flag) {

    // Check to see if we're starting up into a broken I2C state machine
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) {
        // log the fault
        error_handler.flags.i2c_stall = 1;
        // reset the I2C controller if it's enabled
        if (getI2COnState) I2COnStateReset();
    }
    
    uint8_t data_reg_pointer[1];
    uint8_t readBytes[4];
    I2C_TRANSACTION_REQUEST_BLOCK readTRB[2];
    data_reg_pointer[0] = DS1683_ETC_0_REG;
    I2C_MasterWriteTRBBuild(&readTRB[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRB[1], readBytes, 4, device_address);
    I2C_MasterTRBInsert(2, readTRB, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0x1FF);
    
    if (I2C_STATUS == I2C_MESSAGE_COMPLETE) {
        // convert received data to volts
        uint32_t received_data = ((readBytes[3] << 24) | (readBytes[2] << 16) | (readBytes[1] << 8) | (readBytes[0]));
        return received_data * 0.25;
    }
    else {
        *device_error_handler_flag = 1;
        return 0.0;
    }
    
    
}

// This function gets the event count from counter at passed address. Also pass pointer to error handler flag for device
uint32_t DS1683GetEventCount(uint8_t device_address, volatile uint8_t *device_error_handler_flag) {
 
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
    data_reg_pointer[0] = DS1683_EVENT_0_REG;
    I2C_MasterWriteTRBBuild(&readTRB[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRB[1], readBytes, 2, device_address);
    I2C_MasterTRBInsert(2, readTRB, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0x1FF);
    
    if (I2C_STATUS == I2C_MESSAGE_COMPLETE) {
        // convert received data to volts
        return ((readBytes[1] << 8) | (readBytes[0]));
    }
    else {
        *device_error_handler_flag = 1;
        return 0;
    }
    
    
}

#include "LTC4151_power_monitor.h"

#include <math.h>
#include <stdio.h>

#include "i2c_master.h"

#include "error_handler.h"
#include "device_control.h"


// This function initializes a power monitor at passed address. Also pass pointer to error handler flag for device
void LTC4151PowerMonitorInitialize(uint8_t device_address, volatile uint8_t *device_error_handler_flag) {
 
    // Write config data to config register on input temp sensor
    uint8_t output_data_array[2];
    output_data_array[0] = LTC4151_CONTROL_G_REG;
    output_data_array[1] = LTC4151_CONTROL_DATA;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    
    softwareDelay(0x1FF);
    
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
}

// this function gets data over I2C from the given I2C address and returns the converted voltage
double LTC4151GetVoltage(uint8_t input_address, volatile uint8_t *device_error_handler_flag) {
 
    // Check to see if we're starting up into a broken I2C state machine
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) {
        // log the fault
        error_handler.flags.i2c_stall = 1;
        // reset the I2C controller if it's enabled
        if (getI2COnState) I2COnStateReset();
    }
    
    uint8_t data_reg_pointer[1];
    uint8_t temp[2];
    I2C_TRANSACTION_REQUEST_BLOCK readTRB[2];
    data_reg_pointer[0] = LTC4151_VIN_C_REG;
    I2C_MasterWriteTRBBuild(&readTRB[0], data_reg_pointer, 1, input_address);
    I2C_MasterReadTRBBuild(&readTRB[1], temp, 2, input_address);
    I2C_MasterTRBInsert(2, readTRB, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);

    softwareDelay(0x1FF);
    
    if (I2C_STATUS == I2C_MESSAGE_COMPLETE) {
        // convert received data to volts
        uint16_t received_data = ((uint16_t) temp[0] << 4) | (temp[1] >> 4);
        return received_data * 0.025;
    }
    else {
        *device_error_handler_flag = 1;
        return 0.0;
    }
    
    
}

// this function gets data over I2C from the given I2C address and returns the converted current
double LTC4151GetCurrent(uint8_t input_address, volatile uint8_t *device_error_handler_flag, double rshunt) {
 
    // Check to see if we're starting up into a broken I2C state machine
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) {
        // log the fault
        error_handler.flags.i2c_stall = 1;
        // reset the I2C controller if it's enabled
        if (getI2COnState) I2COnStateReset();
    }
    
    uint8_t data_reg_pointer[1];
    uint8_t temp[2];
    data_reg_pointer[0] = LTC4151_SENSE_A_REG;
    I2C_MasterWrite(data_reg_pointer, 1, input_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    // Read two bytes from temp reg
    I2C_MasterRead(temp, 2, input_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    
    softwareDelay(0x1FF);
    
    if (I2C_STATUS == I2C_MESSAGE_COMPLETE) {
        // convert received data to amps
        uint16_t received_data = (temp[0] << 4 | temp[1]) >> 4;
        return ((double) received_data) * 0.20e-6 / rshunt;
    }
    else {
        *device_error_handler_flag = 1;
        return 0.0;
    }
    
}
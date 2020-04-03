

#include "tca9555_io_expander.h"

#include <stdio.h>
#include <time.h>

#include "i2c_master.h"

#include "error_handler.h"
#include "device_control.h"

// This function initializes an io expander at passed address. Also pass pointer to error handler flag for device
void TCA9555IOExpanderInitialize(uint8_t device_address, volatile uint8_t *device_error_handler_flag) {
 
    uint8_t output_data_array[2];
    output_data_array[0] = TCA9555_OUTPUT_PORT_0_REG;
    output_data_array[1] = TCA9555_OUTPUT_PORT_0_DATA;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0x1FF);
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
    output_data_array[0] = TCA9555_OUTPUT_PORT_1_REG;
    output_data_array[1] = TCA9555_OUTPUT_PORT_1_DATA;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0x1FF);
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;

    output_data_array[0] = TCA9555_CONFIG_0_REG;
    output_data_array[1] = TCA9555_CONFIG_0_DATA;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0x1FF);
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
    output_data_array[0] = TCA9555_CONFIG_1_REG;
    output_data_array[1] = TCA9555_CONFIG_1_DATA;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0x1FF);
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
}

// This function writes output to both output registers
void TCA9555IOExpanderSetOutput(uint8_t device_address, volatile uint8_t *device_error_handler_flag, uint16_t output_word) {

    uint8_t output_data_array[2];
    output_data_array[0] = TCA9555_OUTPUT_PORT_0_REG;
    output_data_array[1] = output_word & 0xFF;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0x1FF);
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
    output_data_array[0] = TCA9555_OUTPUT_PORT_1_REG;
    output_data_array[1] = (output_word & 0xFF00) >> 8;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0x1FF);
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
}
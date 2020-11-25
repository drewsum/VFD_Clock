

#include "tca9555_io_expander.h"

#include <stdio.h>
#include <time.h>

#include "i2c_master.h"

#include "error_handler.h"
#include "device_control.h"
#include "terminal_control.h"

// This function initializes an io expander at passed address. Also pass pointer to error handler flag for device
void TCA9555IOExpanderInitialize(uint8_t device_address, volatile uint8_t *device_error_handler_flag) {
 
    uint8_t output_data_array[2];
    output_data_array[0] = TCA9555_OUTPUT_PORT_0_REG;
    output_data_array[1] = TCA9555_OUTPUT_PORT_0_DATA;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
    output_data_array[0] = TCA9555_OUTPUT_PORT_1_REG;
    output_data_array[1] = TCA9555_OUTPUT_PORT_1_DATA;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;

    output_data_array[0] = TCA9555_CONFIG_0_REG;
    output_data_array[1] = TCA9555_CONFIG_0_DATA;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
    output_data_array[0] = TCA9555_CONFIG_1_REG;
    output_data_array[1] = TCA9555_CONFIG_1_DATA;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
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
    softwareDelay(0xFF);
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
    output_data_array[0] = TCA9555_OUTPUT_PORT_1_REG;
    output_data_array[1] = (output_word & 0xFF00) >> 8;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
}

// this function prints out status for the IO expander at passed address
void TCA9555IOExpanderPrintStatus(uint8_t device_address, volatile uint8_t *device_error_handler_flag) {
    
    // Check to see if we're starting up into a broken I2C state machine
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) {
        // log the fault
        error_handler.flags.i2c_stall = 1;
        // reset the I2C controller if it's enabled
        if (getI2COnState) I2COnStateReset();
    }
    
    // read all registers
    uint8_t data_reg_pointer[1];
    uint8_t temp[1];
    I2C_TRANSACTION_REQUEST_BLOCK readTRBH[2];
    data_reg_pointer[0] = TCA9555_INPUT_PORT_0_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 1, device_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_input_0 = temp[0];
    
    data_reg_pointer[0] = TCA9555_INPUT_PORT_1_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 1, device_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_input_1 = temp[0];
    
    data_reg_pointer[0] = TCA9555_OUTPUT_PORT_0_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 1, device_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_output_0 = temp[0];
    
    data_reg_pointer[0] = TCA9555_OUTPUT_PORT_1_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 1, device_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_output_1 = temp[0];
    
    data_reg_pointer[0] = TCA9555_POL_INV_0_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 1, device_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_pol_0 = temp[0];
    
    data_reg_pointer[0] = TCA9555_POL_INV_1_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 1, device_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_pol_1 = temp[0];
    
    data_reg_pointer[0] = TCA9555_CONFIG_0_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 1, device_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_config_0 = temp[0];
    
    data_reg_pointer[0] = TCA9555_CONFIG_1_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 1, device_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_config_1 = temp[0];
    
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
    printf("TCA9555 I/O Expander, located at 0x%02X\r\n", device_address);
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Port\tPin\tInput/Output\tOut\tIn\tInv\r\n");
    // loop over i/o pins in port 0
    uint8_t index;
    for (index = 0; index < 8; index++) {
        printf("    0\t\t%u\t%s\t\t%u\t%u\t%u\r\n",
                index,
                (read_config_0 >> index) & 0b1 ? "Input" : "Output",
                (read_output_0 >> index) & 0b1,
                (read_input_0 >> index) & 0b1,
                (read_pol_0 >> index) & 0b1);
    }
    // loop over i/o pins in port 1
    for (index = 0; index < 8; index++) {
        printf("    1\t\t%u\t%s\t\t%u\t%u\t%u\r\n",
                index,
                (read_config_1 >> index) & 0b1 ? "Input" : "Output",
                (read_output_1 >> index) & 0b1,
                (read_input_1 >> index) & 0b1,
                (read_pol_1 >> index) & 0b1);
    }
    terminalTextAttributesReset();
}
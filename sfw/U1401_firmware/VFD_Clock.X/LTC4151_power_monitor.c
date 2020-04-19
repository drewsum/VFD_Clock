
#include "LTC4151_power_monitor.h"

#include <math.h>
#include <stdio.h>

#include "i2c_master.h"

#include "error_handler.h"
#include "device_control.h"
#include "terminal_control.h"

// This function initializes a power monitor at passed address. Also pass pointer to error handler flag for device
void LTC4151PowerMonitorInitialize(uint8_t device_address, volatile uint8_t *device_error_handler_flag) {
 
    // Write config data to config register on input temp sensor
    uint8_t output_data_array[2];
    output_data_array[0] = LTC4151_CONTROL_G_REG;
    output_data_array[1] = LTC4151_CONTROL_DATA;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    
    
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
    uint8_t tempH[1], tempL[1];
    I2C_TRANSACTION_REQUEST_BLOCK readTRBH[2];
    data_reg_pointer[0] = LTC4151_VIN_C_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, input_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], tempH, 1, input_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    I2C_TRANSACTION_REQUEST_BLOCK readTRBL[2];
    data_reg_pointer[0] = LTC4151_VIN_D_REG;
    I2C_MasterWriteTRBBuild(&readTRBL[0], data_reg_pointer, 1, input_address);
    I2C_MasterReadTRBBuild(&readTRBL[1], tempL, 1, input_address);
    I2C_MasterTRBInsert(2, readTRBL, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    
    if (I2C_STATUS == I2C_MESSAGE_COMPLETE) {
        // convert received data to volts
        uint16_t received_data = (tempH[0] << 4) | (tempL[0] >> 4);
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
    uint8_t tempH[1], tempL[1];
    I2C_TRANSACTION_REQUEST_BLOCK readTRBH[2];
    data_reg_pointer[0] = LTC4151_SENSE_A_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, input_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], tempH, 1, input_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    I2C_TRANSACTION_REQUEST_BLOCK readTRBL[2];
    data_reg_pointer[0] = LTC4151_SENSE_B_REG;
    I2C_MasterWriteTRBBuild(&readTRBL[0], data_reg_pointer, 1, input_address);
    I2C_MasterReadTRBBuild(&readTRBL[1], tempL, 1, input_address);
    I2C_MasterTRBInsert(2, readTRBL, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    
    if (I2C_STATUS == I2C_MESSAGE_COMPLETE) {
        // convert received data to amps
        uint16_t received_data = (tempH[0] << 4 | tempL[0]) >> 4;
        return ((double) received_data) * 20e-6 / rshunt;
    }
    else {
        *device_error_handler_flag = 1;
        return 0.0;
    }
    
}

// This function prints status for the device at the passed address
void LTC4151printStatus(uint8_t input_address, volatile uint8_t *device_error_handler_flag) {
 
    // Check to see if we're starting up into a broken I2C state machine
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) {
        // log the fault
        error_handler.flags.i2c_stall = 1;
        // reset the I2C controller if it's enabled
        if (getI2COnState) I2COnStateReset();
    }
    
    uint8_t data_reg_pointer[1];
    uint8_t temp[1];
    I2C_TRANSACTION_REQUEST_BLOCK readTRBH[2];
    data_reg_pointer[0] = LTC4151_CONTROL_G_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, input_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 1, input_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    
    uint8_t read_snap_enable = (temp[0] >> 7) & 0b1;
    uint8_t read_snap_channel = (temp[0] >> 5) & 0b11;
    uint8_t read_test_mode = (temp[0] >> 4) & 0b1;
    uint8_t read_page_wr = (temp[0] >> 3) & 0b1;
    uint8_t read_stuck_bus = (temp[0] >> 2) & 0b1;
    
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
    printf("LTC4151 Power Monitor, located at 0x%02X\r\n", input_address);
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    if (read_snap_enable) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC Snapshot Mode: %s\r\n", read_snap_enable ? "enabled" : "disabled");
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC Snapshot Channel: ");
    switch (read_snap_channel) {
        case 0b00: 
            printf("SENSE (Default)\r\n");
            break;
        case 0b01: 
            printf("VIN\r\n");
            break;
        case 0b10: 
            printf("ADIN\r\n");
            break;
    }
    if (read_test_mode) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Device Test Mode: %s\r\n", read_test_mode ? "enabled" : "disabled");
    if (read_page_wr) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Page Read/Write: %s\r\n", read_page_wr ? "enabled" : "disabled");
    if (read_stuck_bus) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Stuck I2C Bus Timer: %s\r\n", read_stuck_bus ? "enabled" : "disabled");
    terminalTextAttributesReset();
}
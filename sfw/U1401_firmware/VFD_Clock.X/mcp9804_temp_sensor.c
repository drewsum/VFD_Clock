
#include "mcp9804_temp_sensor.h"

#include <stdio.h>

#include "i2c_master.h"

#include "error_handler.h"
#include "device_control.h"
#include "terminal_control.h"

// This function initializes a temperature sensor at passed address. Also pass pointer to error handler flag for device
void MCP9804TempSensorInitialize(uint8_t device_address, volatile uint8_t *device_error_handler_flag){
    
    // Write config data to config register on input temp sensor
    uint8_t length;
    uint8_t output_data_array[3];
    output_data_array[0] = MCP9804_CONFIG_REG;
    output_data_array[1] = MCP9804_CONFIG_MSB;
    output_data_array[2] = MCP9804_CONFIG_LSB;
    length = 3;
    I2C_MasterWrite(output_data_array, length, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    
    
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
    
}

// this function converts the ray two byte data return from MCP9804 to a double representing temperature
double MCP9804BytesToFloat(uint8_t input_array[2]) {
    
    input_array[0] = input_array[0] & 0x1F;
    // if we read a negative temperature
    if ((input_array[0] & 0x10) == 0x10) {

        input_array[0] = input_array[0] & 0x0F; //Clear SIGN
        // convert to floating point number
        return 256.0 - ((input_array[0] * 16.0) + (input_array[1] / 16.0));
        
    }
    
    // else if we read a positive temperature
    else {
     
        return ((input_array[0] * 16.0) + (input_array[1] / 16.0));
        
    }

}

// this function gets data over I2C from the given I2C address and returns the converted temperature
double MCP9804GetTemperature(uint8_t input_address, volatile uint8_t *device_error_handler_flag) {

    // Check to see if we're starting up into a broken I2C state machine
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) {
        // log the fault
        error_handler.flags.i2c_stall = 1;
        // reset the I2C controller if it's enabled
        if (getI2COnState) I2COnStateReset();
    }
    
    uint8_t data_reg_pointer[1];
    uint8_t temp[2];
    I2C_TRANSACTION_REQUEST_BLOCK readTRBH[2];
    data_reg_pointer[0] = MCP9804_TA_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, input_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 2, input_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    
    if (I2C_STATUS == I2C_MESSAGE_COMPLETE) return MCP9804BytesToFloat(temp);
    else {
        *device_error_handler_flag = 1;
        return 0.0;
    }
    
}

// this function prints configuration status to stdio for the passed device address
void MCP9804printStatus(uint8_t input_address, volatile uint8_t *device_error_handler_flag) {
    
    // Check to see if we're starting up into a broken I2C state machine
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) {
        // log the fault
        error_handler.flags.i2c_stall = 1;
        // reset the I2C controller if it's enabled
        if (getI2COnState) I2COnStateReset();
    }
    
    // first, get manufacturer ID
    uint8_t data_reg_pointer[1];
    uint8_t temp[2];
    I2C_TRANSACTION_REQUEST_BLOCK readTRBH[2];
    data_reg_pointer[0] = MCP9804_MANF_ID_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, input_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 2, input_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint16_t read_mfg_id = (temp[0] << 8) | temp[1];
    
    // get dev id and revision
    data_reg_pointer[0] = MCP9804_DEV_ID_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, input_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 2, input_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_device_id = temp[0];
    uint8_t read_rev_id = temp[1];
    
    // get resolution
    data_reg_pointer[0] = MCP9804_RES_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, input_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 1, input_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_resolution = temp[0] & 0b11;
    
    //read config register
    data_reg_pointer[0] = MCP9804_CONFIG_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, input_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 2, input_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_hyst = (temp[0] >> 1) & 0b11;
    uint8_t read_shutdown = temp[0] & 0b1;
    uint8_t read_crit_lock = (temp[1] >> 7) & 0b1;
    uint8_t read_win_lock = (temp[1] >> 6) & 0b1;
    uint8_t read_int_clear = (temp[1] >> 5) & 0b1;
    uint8_t read_alert_stat = (temp[1] >> 4) & 0b1;
    uint8_t read_alert_cnt = (temp[1] >> 3) & 0b1;
    uint8_t read_alert_sel = (temp[1] >> 2) & 0b1;
    uint8_t read_alert_pol = (temp[1] >> 1) & 0b1;
    uint8_t read_alert_mod = (temp[1]) & 0b1;
    
    // print read data out
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
    printf("MCP9804 Temperature Sensor, located at 0x%02X\r\n", input_address);
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Manufacturer ID: 0x%04X\r\n", read_mfg_id);
    printf("    Device ID: 0x%02X\r\n", read_device_id);
    printf("    Device Revision ID: 0x%02X\r\n", read_rev_id);
    printf("    Device Resolution: ");
    switch (read_resolution) {
        case 0b00: 
            printf("LSB = 0.5C (tCONV = 30 ms typical)\r\n");
            break;
        case 0b01: 
            printf("LSB = 0.25C (tCONV = 65 ms typical)\r\n");
            break;
        case 0b10: 
            printf("LSB = 0.125C (tCONV = 130 ms typical)\r\n");
            break;
        case 0b11: 
            printf("LSB = 0.0625C (power up default, tCONV = 250 ms typical)\r\n");
            break;
    }
    printf("    Comparator Hysteresis: ");
    switch (read_hyst) {
        case 0b00:
            printf("0C (power-up default)\r\n");
            break;
        case 0b01:
            printf("1.5C\r\n");
            break;
        case 0b10:
            printf("3.0C\r\n");
            break;
        case 0b11:
            printf("6.0C\r\n");
            break;
    }
    if (read_shutdown) terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Shutdown mode: %s\r\n", read_shutdown ? "Low Power Mode" : "Continuous Conversion Mode");
    if (read_crit_lock) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Critical Lock: %s\r\n", read_crit_lock ? "Locked" : "Unlocked");
    if (read_win_lock) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Window Lock: %s\r\n", read_win_lock ? "Locked" : "Unlocked");
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Interrupt Clear: %s\r\n", read_int_clear ? "No Effect" : "Clear IRQ");
    if (read_alert_stat) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Alert Output Status: %s\r\n", read_alert_stat ? "Alert is asserted" : "Alert is not asserted");
    if (read_alert_cnt) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Alert Output Control: %s\r\n", read_alert_cnt ? "Enabled" : "Disabled");
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Alert Output Select: %s\r\n", 
            read_alert_sel ? 
            "TA > TCRIT only. (TUPPER and TLOWER temperature boundaries are disabled.)" 
            : "Alert output for TUPPER, TLOWER and TCRIT (power-up default)");
    printf("    Alert Output Polarity: %s\r\n", read_alert_pol ? "Active-High" : "Active-Low");
    printf("    Alert Output Mode: %s\r\n", read_alert_mod ? "Interrupt Output" : "Comparator Output");
    terminalTextAttributesReset();
}
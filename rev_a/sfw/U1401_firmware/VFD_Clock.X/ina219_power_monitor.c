
#include "ina219_power_monitor.h"

#include <math.h>
#include <stdio.h>

#include "i2c_master.h"

#include "error_handler.h"
#include "device_control.h"
#include "terminal_control.h"

// this function resets an INA219 power monitor
void INA219Reset(uint8_t device_address, volatile uint8_t *device_error_handler_flag) {
 
    // Write config data to config register on input temp sensor
    uint8_t output_data_array[3];
    output_data_array[0] = INA219_CONFIG_REG;
    output_data_array[1] = 0b10000000;
    output_data_array[2] = 0x00;
    I2C_MasterWrite(output_data_array, 3, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    
    
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
    
}

// This function initializes a power monitor at passed address. Also pass pointer to error handler flag for device
void INA219PowerMonitorInitialize(uint8_t device_address, volatile uint8_t *device_error_handler_flag) {
 
    INA219Reset(device_address, device_error_handler_flag);
    
    // Write config data to config register on input temp sensor
    uint8_t output_data_array[3];
    output_data_array[0] = INA219_CONFIG_REG;
    output_data_array[1] = INA219_CONFIG_MSB;
    output_data_array[2] = INA219_CONFIG_LSB;
    I2C_MasterWrite(output_data_array, 3, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    
    
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;
    
}

// this function sets the calibration register for the INA219
// Pass a device address, pointer to an error handler flag, 
// CURRENT_LSB, and RSHUNT value. See section 8.5.1 in the datasheet
void INA219SetCalibration(uint8_t device_address, volatile uint8_t *device_error_handler_flag, double current_lsb, double rshunt) {

    // first let's figure out what Cal should be based on equation 3 of the datasheet
    uint16_t calibration_value = (uint16_t) floor((0.04096) / (current_lsb * rshunt));
    
    // Write cal data to cal register on input temp sensor
    uint8_t output_data_array[3];
    output_data_array[0] = INA219_CALIBRATION_REG;
    output_data_array[1] = (uint8_t) (calibration_value >> 8);
    output_data_array[2] = (uint8_t) (calibration_value & 0xFF);
    I2C_MasterWrite(output_data_array, 3, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    
    
    // Pass error back to function call
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) *device_error_handler_flag = 1;

}

// this function gets data over I2C from the given I2C address and returns the converted current
double INA219GetVoltage(uint8_t input_address, volatile uint8_t *device_error_handler_flag) {
    
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
    data_reg_pointer[0] = INA219_BUS_VOLTAGE_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, input_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 2, input_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    
    if (I2C_STATUS == I2C_MESSAGE_COMPLETE) {
        // convert received data to volts
        // from section 8.6.3.2 of datasheet
        uint16_t received_data = (temp[0] << 8 | temp[1]) >> 3;
        return received_data * 0.004;
    }
    else {
        *device_error_handler_flag = 1;
        return 0.0;
    }
    
}

// this function gets data over I2C from the given I2C address and returns the converted current
double INA219GetCurrent(uint8_t input_address, volatile uint8_t *device_error_handler_flag, double current_lsb) {
    
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
    data_reg_pointer[0] = INA219_CURRENT_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, input_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 2, input_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    
    if (I2C_STATUS == I2C_MESSAGE_COMPLETE) {
        // convert received data to amps
        int16_t received_data = (temp[0] << 8 | temp[1]);
        return ((double) received_data) * current_lsb;
    }
    else {
        *device_error_handler_flag = 1;
        return 0.0;
    }
 
    
}

// this function gets data over I2C from the given I2C address and returns the converted power
double INA219GetPower(uint8_t input_address, volatile uint8_t *device_error_handler_flag, double current_lsb) {
 
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
    data_reg_pointer[0] = INA219_POWER_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, input_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 2, input_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    
    if (I2C_STATUS == I2C_MESSAGE_COMPLETE) {
        // convert received data to amps
        int16_t received_data = (temp[0] << 8 | temp[1]);
        return ((double) received_data) * current_lsb * 20;
    }
    else {
        *device_error_handler_flag = 1;
        return 0.0;
    }
 
    
}

// this function prints configuration status to stdio for the passed device address
void INA219printStatus(uint8_t input_address, volatile uint8_t *device_error_handler_flag) {
 
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
    data_reg_pointer[0] = INA219_CONFIG_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, input_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 2, input_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    
    uint8_t read_brng = (temp[0] >> 5) & 0b1;
    uint8_t read_pg = (temp[0] >> 3) & 0b11;
    uint8_t read_badc = ((temp[0] & 0b111) << 1) | ((temp[1] >> 7) & 0b1);
    uint8_t read_sadc = (temp[1] >> 3) & 0b1111;
    uint8_t read_mode = temp[1] & 0b111;
    
    // Check to see if we're starting up into a broken I2C state machine
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) {
        // log the fault
        error_handler.flags.i2c_stall = 1;
        // reset the I2C controller if it's enabled
        if (getI2COnState) I2COnStateReset();
    }
    
    data_reg_pointer[0] = INA219_CALIBRATION_REG;
    I2C_MasterWriteTRBBuild(&readTRBH[0], data_reg_pointer, 1, input_address);
    I2C_MasterReadTRBBuild(&readTRBH[1], temp, 2, input_address);
    I2C_MasterTRBInsert(2, readTRBH, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    
    uint16_t read_cal = (temp[0] << 8) | temp[1];
    
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
    printf("INA219 Power Monitor, located at 0x%02X\r\n", input_address);
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Bus Voltage Range setting: %s\r\n", read_brng ? "16V" : "32V");
    printf("    PGA Gain Settings: ");
    switch (read_pg) {
        case 0b00:
            printf("/1 (+/-40mV)\r\n");
            break;
        case 0b01:
            printf("/2 (+/-80mV)\r\n");
            break;
        case 0b10:
            printf("/4 (+/- 160mV)\r\n");
            break;
        case 0b11:
            printf("/8 (+/- 320mV)\r\n");
            break;
    }
    printf("    Bus ADC conversion settings: ");
    switch (read_badc) {
        case 0b0000:
            printf("9 bit single\r\n");
            break;
        case 0b0100:
            printf("9 bit single\r\n");
            break;
        case 0b0001:
            printf("10 bit single\r\n");
            break;
        case 0b0101:
            printf("10 bit single\r\n");
            break;
        case 0b0010:
            printf("11 bit single\r\n");
            break;
        case 0b0110:
            printf("11 bit single\r\n");
            break;
        case 0b0011:
            printf("12 bit single\r\n");
            break;
        case 0b0111:
            printf("12 bit single\r\n");
            break;
        case 0b1000:
            printf("12 bit single\r\n");
            break;
        case 0b1001:
            printf("2 conversion average\r\n");
            break;
        case 0b1010:
            printf("4 conversion average\r\n");
            break;
        case 0b1011:
            printf("8 conversion average\r\n");
            break;
        case 0b1100:
            printf("16 conversion average\r\n");
            break;
        case 0b1101:
            printf("32 conversion average\r\n");
            break;
        case 0b1110:
            printf("64 conversion average\r\n");
            break;
        case 0b1111:
            printf("128 conversion average\r\n");
            break;
    }
    printf("    Shunt ADC conversion settings: ");
    switch (read_sadc) {
        case 0b0000:
            printf("9 bit single\r\n");
            break;
        case 0b0100:
            printf("9 bit single\r\n");
            break;
        case 0b0001:
            printf("10 bit single\r\n");
            break;
        case 0b0101:
            printf("10 bit single\r\n");
            break;
        case 0b0010:
            printf("11 bit single\r\n");
            break;
        case 0b0110:
            printf("11 bit single\r\n");
            break;
        case 0b0011:
            printf("12 bit single\r\n");
            break;
        case 0b0111:
            printf("12 bit single\r\n");
            break;
        case 0b1000:
            printf("12 bit single\r\n");
            break;
        case 0b1001:
            printf("2 conversion average\r\n");
            break;
        case 0b1010:
            printf("4 conversion average\r\n");
            break;
        case 0b1011:
            printf("8 conversion average\r\n");
            break;
        case 0b1100:
            printf("16 conversion average\r\n");
            break;
        case 0b1101:
            printf("32 conversion average\r\n");
            break;
        case 0b1110:
            printf("64 conversion average\r\n");
            break;
        case 0b1111:
            printf("128 conversion average\r\n");
            break;
    }
    printf("    Operating mode: ");
    switch (read_mode) {
        case 0b000:
            printf("power down\r\n");
            break;
        case 0b001:
            printf("shunt voltage, triggered\r\n");
            break;
        case 0b010: 
            printf("Bus voltage, triggered\r\n");
            break;
        case 0b011: 
            printf("Shunt and bus, triggered\r\n");
            break;
        case 0b100: 
            printf("ADC off (disabled)\r\n");
            break;
        case 0b101: 
            printf("Shunt voltage, continuous\r\n");
            break;
        case 0b110: 
            printf("Bus voltage, continuous\r\n");
            break;
        case 0b111: 
            printf("Shunt and bus, continuous\r\n");
            break;
    }
    printf("    Calibration value: 0x%04X\r\n", read_cal);
    terminalTextAttributesReset();
}
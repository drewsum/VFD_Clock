
#include "ds1683_time_of_flight.h"

#include <stdio.h>

#include "i2c_master.h"

#include "error_handler.h"
#include "device_control.h"
#include "terminal_control.h"


// This function initializes a time of flight counter at passed address. Also pass pointer to error handler flag for device
void DS1683TimeOfFlightInitialize(uint8_t device_address, volatile uint8_t *device_error_handler_flag) {

    // Write config data to config register on input temp sensor
    uint8_t output_data_array[2];
    output_data_array[0] = DS1683_CONFIG_REG;
    output_data_array[1] = DS1683_CONFIG_DATA;
    I2C_MasterWrite(output_data_array, 2, device_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    
    softwareDelay(0xFF);
    
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
    softwareDelay(0xFF);
    
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
    softwareDelay(0xFF);
    
    if (I2C_STATUS == I2C_MESSAGE_COMPLETE) {
        // convert received data to volts
        return ((readBytes[1] << 8) | (readBytes[0]));
    }
    else {
        *device_error_handler_flag = 1;
        return 0;
    }
    
    
}

// this function prints status and config data for a ocunter at passed address
void DS1683PrintStatus(uint8_t device_address, volatile uint8_t *device_error_handler_flag) {
 
    // Check to see if we're starting up into a broken I2C state machine
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) {
        // log the fault
        error_handler.flags.i2c_stall = 1;
        // reset the I2C controller if it's enabled
        if (getI2COnState) I2COnStateReset();
    }
    
    // read status register first
    uint8_t data_reg_pointer[1];
    uint8_t readBytes[16];
    I2C_TRANSACTION_REQUEST_BLOCK readTRB[2];
    data_reg_pointer[0] = DS1683_STATUS_REG;
    I2C_MasterWriteTRBBuild(&readTRB[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRB[1], readBytes, 1, device_address);
    I2C_MasterTRBInsert(2, readTRB, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_event_af = (readBytes[0] >> 1) & 0b1;
    uint8_t read_etc_af = (readBytes[0]) & 0b1;
    
    // read event count alarm register
    data_reg_pointer[0] = DS1683_EVENT_ALRM_0_REG;
    I2C_MasterWriteTRBBuild(&readTRB[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRB[1], readBytes, 2, device_address);
    I2C_MasterTRBInsert(2, readTRB, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint16_t read_event_alarm = (readBytes[1] << 8) | readBytes[0];
    
    // read ETC alarm limit
    data_reg_pointer[0] = DS1683_ETC_0_REG;
    I2C_MasterWriteTRBBuild(&readTRB[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRB[1], readBytes, 4, device_address);
    I2C_MasterTRBInsert(2, readTRB, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint32_t read_etc_alarm = ((readBytes[3] << 24) | (readBytes[2] << 16) | (readBytes[1] << 8) | (readBytes[0]));
    
    // read config register
    data_reg_pointer[0] = DS1683_CONFIG_REG;
    I2C_MasterWriteTRBBuild(&readTRB[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRB[1], readBytes, 1, device_address);
    I2C_MasterTRBInsert(2, readTRB, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t read_etc_alarm_en = (readBytes[0] >> 2) & 0b1;
    uint8_t read_event_alarm_en = (readBytes[0] >> 1) & 0b1;
    uint8_t read_alarm_pol = readBytes[0] & 0b1;
    
    // read user NVM
    data_reg_pointer[0] = DS1683_USR_MEM_0_REG;
    I2C_MasterWriteTRBBuild(&readTRB[0], data_reg_pointer, 1, device_address);
    I2C_MasterReadTRBBuild(&readTRB[1], readBytes, 16, device_address);
    I2C_MasterTRBInsert(2, readTRB, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    softwareDelay(0xFF);
    uint8_t readUserNVM[16];
    uint8_t i;
    for(i=0; i<16; i++)
    {
        readUserNVM[i] = readBytes[i];
    }
    
    // print out received data
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
    printf("DS1683 Elapsed Time/Event counter, located at 0x%02X\r\n", device_address);
    if (read_etc_alarm_en) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ETC Alarm is %s\r\n", read_etc_alarm_en ? "enabled" : "disabled");
    if (read_event_alarm_en) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Event Alarm is %s\r\n", read_event_alarm_en ? "enabled" : "disabled");
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Alarm pin polarity is %s\r\n", read_alarm_pol ? "active high" : "active low");
    if (read_event_af) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Event Alarm has %s\r\n", read_event_af ? "triggered" : "not triggered");
    if (read_etc_af) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ETC Alarm has %s\r\n", read_etc_af ? "triggered" : "not triggered");
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Event Alarm threshold set to %u events\r\n", read_event_alarm);
    printf("    ETC Alarm set to %.3f seconds\r\n", read_etc_alarm * 0.25);
    for(i=0; i<16; i++) {
        printf("    User NVM Data %u: 0x%02X\r\n", i, readUserNVM[i]);
    }       
    terminalTextAttributesReset();
}
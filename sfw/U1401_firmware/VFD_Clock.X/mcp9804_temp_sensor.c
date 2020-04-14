
#include "mcp9804_temp_sensor.h"

#include "i2c_master.h"

#include "error_handler.h"
#include "device_control.h"

// #include "telemetry.h"

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
    softwareDelay(0x1FF);
    
    
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
    softwareDelay(0x1FF);
    
    if (I2C_STATUS == I2C_MESSAGE_COMPLETE) return MCP9804BytesToFloat(temp);
    else {
        *device_error_handler_flag = 1;
        return 0.0;
    }
    
}

#include "ina219_power_monitor.h"

#include "i2c_master.h"

#include "error_handler.h"
#include "device_control.h"



// this function gets data over I2C from the given I2C address and returns the converted current
double INA219GetVoltage(uint8_t input_address, volatile uint8_t *device_error_handler_flag) {
    
    // Check to see if we're starting up into a broken I2C state machine
    if (I2C_STATUS != I2C_MESSAGE_COMPLETE) {
        // log the fault
        error_handler.flags.i2c_stall = 1;
        // reset the I2C controller if it's enabled
        if (getTempI2COnState) tempI2COnStateReset();
    }
    
    uint8_t data_reg_pointer[1];
    uint8_t temp[2];
    data_reg_pointer[0] = INA219_BUS_VOLTAGE_REG;
    I2C_MasterWrite(data_reg_pointer, 1, input_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    // Read two bytes from temp reg
    I2C_MasterRead(temp, 2, input_address, &I2C_STATUS);
    while(I2C_STATUS == I2C_MESSAGE_PENDING);
    
    softwareDelay(0x1FF);
    
    // convert received data to volts
    // from section 8.6.3.2 of datasheet
    uint16_t received_data = (temp[0] << 8 | temp[1]) >> 3;
    return received_data * 0.004;
    
}
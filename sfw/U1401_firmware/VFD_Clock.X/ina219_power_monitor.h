/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _INA219_POWER_MONITOR_H    /* Guard against multiple inclusion */
#define _INA219_POWER_MONITOR_H


#include <xc.h>
#include <stdbool.h>

#include "i2c_master.h"

// INA219 register pointers
// from register 5-1 of INA219 datasheet
#define INA219_CONFIG_REG           0x00
#define INA219_SHUNT_VOLTAGE_REG    0x01
#define INA219_BUS_VOLTAGE_REG      0x02
#define INA219_POWER_REG            0x03
#define INA219_CURRENT_REG          0x04
#define INA219_CALIBRATION_REG      0x05

// these macros hold hardcoded config data for the sensors
// #define INA219_CONFIG_LSB          0
// #define INA219_CONFIG_MSB          0

// This function initializes a power monitor at passed address. Also pass pointer to error handler flag for device
void INA219PowerMonitorInitialize(uint8_t device_address, volatile uint8_t *device_error_handler_flag);

// this function gets data over I2C from the given I2C address and returns the converted voltage
double INA219GetVoltage(uint8_t input_address, volatile uint8_t *device_error_handler_flag);


#endif /* _INA219_POWER_MONITOR_H */

/* *****************************************************************************
 End of File
 */

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
// These settings come from section 8.6.2.1 of the INA219 datasheet and set the following:
/*
 * RST = 0
 * BRNG = 0 (16V)
 * PG = 0b11 (/8)
 * BADC = 0b1111 (128 sample average)
 * SADC = 0b1111 (128 sample average)
 * MODE = 0b11 (Shunt and bus, continuous)
 * 
 */
#define INA219_CONFIG_LSB          0b11111111
#define INA219_CONFIG_MSB          0b00011111

// This function initializes a power monitor at passed address. Also pass pointer to error handler flag for device
void INA219PowerMonitorInitialize(uint8_t device_address, volatile uint8_t *device_error_handler_flag);

// this function gets data over I2C from the given I2C address and returns the converted voltage
double INA219GetVoltage(uint8_t input_address, volatile uint8_t *device_error_handler_flag);


#endif /* _INA219_POWER_MONITOR_H */

/* *****************************************************************************
 End of File
 */

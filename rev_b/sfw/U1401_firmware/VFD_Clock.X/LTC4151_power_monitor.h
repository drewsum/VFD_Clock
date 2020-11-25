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

#ifndef _LTC4151_POWER_MONITOR_H    /* Guard against multiple inclusion */
#define _LTC4151_POWER_MONITOR_H


#include <xc.h>
#include <stdbool.h>

#include "plib_i2c.h"

// These register mappings are from table 2 of the LTC4151 datasheet
#define LTC4151_SENSE_A_REG           0x00
#define LTC4151_SENSE_B_REG           0x01
#define LTC4151_VIN_C_REG             0x02
#define LTC4151_VIN_D_REG             0x03
#define LTC4151_ADIN_E_REG            0x04
#define LTC4151_ADIN_F_REG            0x05
#define LTC4151_CONTROL_G_REG         0x06

// these macros hold hardcoded config data for the sensors
// These settings come from section 8.6.2.1 of the INA219 datasheet and set the following:
/*
 * ADC Snapshot Mode = 0 (snapshot disabled)
 * ADC channel label for snapshot = 0b00 (snapshot disabled)
 * Test Mode Enabled = 0 (Test Mode Disabled)
 * Page Read/Write = 1 (page read/write enabled)
 * Stuck-bus timer enable = 1 (disable stuck bus timer)
 */
#define LTC4151_CONTROL_DATA          0b00001100

// This function initializes a power monitor at passed address. Also pass pointer to error handler flag for device
void LTC4151PowerMonitorInitialize(uint8_t device_address, volatile uint8_t *device_error_handler_flag);

// this function gets data over I2C from the given I2C address and returns the converted voltage
double LTC4151GetVoltage(uint8_t input_address, volatile uint8_t *device_error_handler_flag);

// this function gets data over I2C from the given I2C address and returns the converted current
double LTC4151GetCurrent(uint8_t input_address, volatile uint8_t *device_error_handler_flag, double rshunt);

// This function prints status for the device at the passed address
void LTC4151printStatus(uint8_t input_address, volatile uint8_t *device_error_handler_flag);



#endif /* _LTC4151_POWER_MONITOR_H */

/* *****************************************************************************
 End of File
 */

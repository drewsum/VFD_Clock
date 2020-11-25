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

#ifndef _TCA9555_IO_EXPANDER_H    /* Guard against multiple inclusion */
#define _TCA9555_IO_EXPANDER_H

#include <xc.h>
#include <stdbool.h>

#include "plib_i2c.h"

// I2C register definitions, Table 3 of datasheet
#define TCA9555_INPUT_PORT_0_REG        0x00
#define TCA9555_INPUT_PORT_1_REG        0x01
#define TCA9555_OUTPUT_PORT_0_REG       0x02
#define TCA9555_OUTPUT_PORT_1_REG       0x03
#define TCA9555_POL_INV_0_REG           0x04
#define TCA9555_POL_INV_1_REG           0x05
#define TCA9555_CONFIG_0_REG            0x06
#define TCA9555_CONFIG_1_REG            0x07

// hardcoded init bytes to write to registers
// Set all I/O to 0, set as outputs, no polarity inversion
#define TCA9555_OUTPUT_PORT_0_DATA      0x00
#define TCA9555_OUTPUT_PORT_1_DATA      0x00
#define TCA9555_CONFIG_0_DATA           0x00
#define TCA9555_CONFIG_1_DATA           0x00

// This function initializes an io expander at passed address. Also pass pointer to error handler flag for device
void TCA9555IOExpanderInitialize(uint8_t device_address, volatile uint8_t *device_error_handler_flag);

// This function writes output to both output registers
void TCA9555IOExpanderSetOutput(uint8_t device_address, volatile uint8_t *device_error_handler_flag, uint16_t output_word);

// this function prints out status for the IO expander at passed address
void TCA9555IOExpanderPrintStatus(uint8_t device_address, volatile uint8_t *device_error_handler_flag);

#endif /* _TCA9555_IO_EXPANDER_H */

/* *****************************************************************************
 End of File
 */

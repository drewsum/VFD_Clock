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

#ifndef _TELEMETRY_H    /* Guard against multiple inclusion */
#define _TELEMETRY_H

#include <xc.h>

// This is a typedef for holding the different types of telemetry data for each power supply
typedef struct telemetry_paramaters_ps_u {
    
    double input_voltage;
    double input_current;
    double input_power;
    double temperature;
    double output_voltage;
    double output_current;
    double output_power;
    
} telemetry_parameters_ps_t;


// This is the structure that holds all telemetry data in the entire system
struct telemetry_s {
    
    telemetry_parameters_ps_t pos12;
    telemetry_parameters_ps_t pos3p3;
    telemetry_parameters_ps_t pos5;
    telemetry_parameters_ps_t pos5_usb;
    telemetry_parameters_ps_t pos60_van;
    telemetry_parameters_ps_t pos1p2_vff;
    
} telemetry;

// These flags are used to keep enable and request live telemetry updates
uint8_t live_telemetry_enable, live_telemetry_request;

// This prints all telemetry data in an easily digested format
void printCurrentTelemetry(void);


#endif /* _TELEMETRY_H */

/* *****************************************************************************
 End of File
 */

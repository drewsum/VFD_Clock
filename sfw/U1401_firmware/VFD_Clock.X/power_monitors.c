
#include "power_monitors.h"

#include "pin_macros.h"
#include "telemetry.h"


// This function initializes all temperature sensors in the project, if available
void powerMonitorsInitialize(void) {
 
    Nop();
    
}

// this function gets temperature data for all temperature sensors
void powerMonitorGetData(void) {
 
    telemetry.pos12.output_voltage = INA219GetVoltage(POS12_MON_ADDR, NULL);
    telemetry.pos3p3.output_voltage = INA219GetVoltage(POS3P3_OUT_MON_ADDR, NULL);
    
    power_monitor_data_request = 0;
    
}

#include "power_monitors.h"

#include "pin_macros.h"
#include "telemetry.h"


// This function initializes all temperature sensors in the project, if available
void powerMonitorsInitialize(void) {
 
    Nop();
    
}

// this function gets temperature data for all temperature sensors
void powerMonitorGetData(void) {
 
    // Get bus voltage data for each power monitor and stash in telemetry structure
    telemetry.pos12.output_voltage = INA219GetVoltage(POS12_MON_ADDR, &error_handler.flags.pos12_mon);
    telemetry.pos3p3.input_voltage = INA219GetVoltage(POS3P3_IN_MON_ADDR, &error_handler.flags.pos3p3_in_mon);
    telemetry.pos3p3.output_voltage = INA219GetVoltage(POS3P3_OUT_MON_ADDR, &error_handler.flags.pos3p3_out_mon);
    telemetry.pos5.input_voltage = INA219GetVoltage(POS5_IN_MON_ADDR, &error_handler.flags.pos5_in_mon);
    telemetry.pos5.output_voltage = INA219GetVoltage(POS5_OUT_MON_ADDR, &error_handler.flags.pos5_out_mon);
    telemetry.pos1p2_vff.input_voltage = INA219GetVoltage(POS1P2_VFF_IN_MON_ADDR, &error_handler.flags.pos1p2_vff_in_mon);
    telemetry.pos1p2_vff.output_voltage = INA219GetVoltage(POS1P2_VFF_OUT_MON_ADDR, &error_handler.flags.pos1p2_vff_out_mon);
    telemetry.pos60_van.input_voltage = INA219GetVoltage(POS60_VAN_IN_MON_ADDR, &error_handler.flags.pos60_van_in_mon);
    // telemetry.pos60_van.output_voltage = INA219GetVoltage(POS60_VAN_OUT_MON_ADDR, &error_handler.flags.pos60_van_out_mon);
    
    power_monitor_data_request = 0;
    
}
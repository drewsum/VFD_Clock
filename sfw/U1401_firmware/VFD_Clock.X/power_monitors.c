
#include "power_monitors.h"

#include "pin_macros.h"
#include "telemetry.h"


// This function initializes all temperature sensors in the project, if available
void powerMonitorsInitialize(void) {
 
    // Reset chips and write data to config registers
    INA219PowerMonitorInitialize(POS12_MON_ADDR, &error_handler.flags.pos12_mon);
    INA219PowerMonitorInitialize(POS3P3_IN_MON_ADDR, &error_handler.flags.pos3p3_in_mon);
    INA219PowerMonitorInitialize(POS3P3_OUT_MON_ADDR, &error_handler.flags.pos3p3_out_mon);
    INA219PowerMonitorInitialize(POS5_IN_MON_ADDR, &error_handler.flags.pos5_in_mon);
    INA219PowerMonitorInitialize(POS5_OUT_MON_ADDR, &error_handler.flags.pos5_out_mon);
    INA219PowerMonitorInitialize(POS1P2_VFF_IN_MON_ADDR, &error_handler.flags.pos1p2_vff_in_mon);
    INA219PowerMonitorInitialize(POS1P2_VFF_OUT_MON_ADDR, &error_handler.flags.pos1p2_vff_out_mon);
    INA219PowerMonitorInitialize(POS60_VAN_IN_MON_ADDR, &error_handler.flags.pos60_van_in_mon);
    LTC4151PowerMonitorInitialize(POS60_VAN_OUT_MON_ADDR, &error_handler.flags.pos60_van_out_mon);
    
    // Write calibration data to allow power monitors to calculate current
    INA219SetCalibration(POS12_MON_ADDR, &error_handler.flags.pos12_mon, POS12_MON_CLSB, POS12_MON_RSHUNT);
    INA219SetCalibration(POS3P3_IN_MON_ADDR, &error_handler.flags.pos3p3_in_mon, POS3P3_IN_MON_CLSB, POS3P3_IN_MON_RSHUNT);
    INA219SetCalibration(POS3P3_OUT_MON_ADDR, &error_handler.flags.pos3p3_out_mon, POS3P3_OUT_MON_CLSB, POS3P3_OUT_MON_RSHUNT);
    INA219SetCalibration(POS5_IN_MON_ADDR, &error_handler.flags.pos5_in_mon, POS5_IN_MON_CLSB, POS5_IN_MON_RSHUNT);
    INA219SetCalibration(POS5_OUT_MON_ADDR, &error_handler.flags.pos5_out_mon, POS5_OUT_MON_CLSB, POS5_OUT_MON_RSHUNT);
    INA219SetCalibration(POS1P2_VFF_IN_MON_ADDR, &error_handler.flags.pos1p2_vff_in_mon, POS1P2_VFF_IN_MON_CLSB, POS1P2_VFF_IN_MON_RSHUNT);
    INA219SetCalibration(POS1P2_VFF_OUT_MON_ADDR, &error_handler.flags.pos1p2_vff_out_mon, POS1P2_VFF_OUT_MON_CLSB, POS1P2_VFF_OUT_MON_RSHUNT);
    INA219SetCalibration(POS60_VAN_IN_MON_ADDR, &error_handler.flags.pos60_van_in_mon, POS60_VAN_IN_MON_CLSB, POS60_VAN_IN_MON_RSHUNT);
    
}

// this function gets temperature data for all temperature sensors
void powerMonitorsGetData(void) {
 
    // Get bus voltage data for each power monitor and stash in telemetry structure
    telemetry.pos12.output_voltage = INA219GetVoltage(POS12_MON_ADDR, &error_handler.flags.pos12_mon);
    telemetry.pos3p3.input_voltage = INA219GetVoltage(POS3P3_IN_MON_ADDR, &error_handler.flags.pos3p3_in_mon);
    telemetry.pos3p3.output_voltage = INA219GetVoltage(POS3P3_OUT_MON_ADDR, &error_handler.flags.pos3p3_out_mon);
    telemetry.pos5.input_voltage = INA219GetVoltage(POS5_IN_MON_ADDR, &error_handler.flags.pos5_in_mon);
    telemetry.pos5.output_voltage = INA219GetVoltage(POS5_OUT_MON_ADDR, &error_handler.flags.pos5_out_mon);
    telemetry.pos1p2_vff.input_voltage = INA219GetVoltage(POS1P2_VFF_IN_MON_ADDR, &error_handler.flags.pos1p2_vff_in_mon);
    telemetry.pos1p2_vff.output_voltage = INA219GetVoltage(POS1P2_VFF_OUT_MON_ADDR, &error_handler.flags.pos1p2_vff_out_mon);
    telemetry.pos60_van.input_voltage = INA219GetVoltage(POS60_VAN_IN_MON_ADDR, &error_handler.flags.pos60_van_in_mon);
    telemetry.pos60_van.output_voltage = LTC4151GetVoltage(POS60_VAN_OUT_MON_ADDR, &error_handler.flags.pos60_van_out_mon);
    
    // Get current data for each power monitor and stash in telemetry structure
    telemetry.pos12.output_current = INA219GetCurrent(POS12_MON_ADDR, &error_handler.flags.pos12_mon, POS12_MON_CLSB);
    telemetry.pos3p3.input_current = INA219GetCurrent(POS3P3_IN_MON_ADDR, &error_handler.flags.pos3p3_in_mon, POS3P3_IN_MON_CLSB);
    telemetry.pos3p3.output_current = INA219GetCurrent(POS3P3_OUT_MON_ADDR, &error_handler.flags.pos3p3_out_mon, POS3P3_OUT_MON_CLSB);
    telemetry.pos5.input_current = INA219GetCurrent(POS5_IN_MON_ADDR, &error_handler.flags.pos5_in_mon, POS5_IN_MON_CLSB);
    telemetry.pos5.output_current = INA219GetCurrent(POS5_OUT_MON_ADDR, &error_handler.flags.pos5_out_mon, POS5_OUT_MON_CLSB);
    telemetry.pos1p2_vff.input_current = INA219GetCurrent(POS1P2_VFF_IN_MON_ADDR, &error_handler.flags.pos1p2_vff_in_mon, POS1P2_VFF_IN_MON_CLSB);
    telemetry.pos1p2_vff.output_current = INA219GetCurrent(POS1P2_VFF_OUT_MON_ADDR, &error_handler.flags.pos1p2_vff_out_mon, POS1P2_VFF_OUT_MON_CLSB);
    telemetry.pos60_van.input_current = INA219GetCurrent(POS60_VAN_IN_MON_ADDR, &error_handler.flags.pos60_van_in_mon, POS60_VAN_IN_MON_CLSB);
    telemetry.pos60_van.output_current = LTC4151GetCurrent(POS60_VAN_OUT_MON_ADDR, &error_handler.flags.pos60_van_out_mon, POS60_VAN_OUT_MON_RSHUNT);
    
    // Get power data for each power monitor and stash in telemetry structure
    telemetry.pos12.output_power = INA219GetPower(POS12_MON_ADDR, &error_handler.flags.pos12_mon, POS12_MON_CLSB);
    telemetry.pos3p3.input_power = INA219GetPower(POS3P3_IN_MON_ADDR, &error_handler.flags.pos3p3_in_mon, POS3P3_IN_MON_CLSB);
    telemetry.pos3p3.output_power = INA219GetPower(POS3P3_OUT_MON_ADDR, &error_handler.flags.pos3p3_out_mon, POS3P3_OUT_MON_CLSB);
    telemetry.pos5.input_power = INA219GetPower(POS5_IN_MON_ADDR, &error_handler.flags.pos5_in_mon, POS5_IN_MON_CLSB);
    telemetry.pos5.output_power = INA219GetPower(POS5_OUT_MON_ADDR, &error_handler.flags.pos5_out_mon, POS5_OUT_MON_CLSB);
    telemetry.pos1p2_vff.input_power = INA219GetPower(POS1P2_VFF_IN_MON_ADDR, &error_handler.flags.pos1p2_vff_in_mon, POS1P2_VFF_IN_MON_CLSB);
    telemetry.pos1p2_vff.output_power = INA219GetPower(POS1P2_VFF_OUT_MON_ADDR, &error_handler.flags.pos1p2_vff_out_mon, POS1P2_VFF_OUT_MON_CLSB);
    telemetry.pos60_van.input_power = INA219GetPower(POS60_VAN_IN_MON_ADDR, &error_handler.flags.pos60_van_in_mon, POS60_VAN_IN_MON_CLSB);
    telemetry.pos60_van.output_power = telemetry.pos60_van.output_current * telemetry.pos60_van.output_voltage; // LTC4151 does not calculate power for us
    
    power_monitor_data_request = 0;
    
}
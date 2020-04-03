
#include "temperature_sensors.h"

#include "pin_macros.h"
#include "telemetry.h"


// This function initializes all temperature sensors in the project, if available
void tempSensorsInitialize(void) {
 
    MCP9804TempSensorInitialize(POS12_TEMP_SNS_ADDR, &error_handler.flags.pos12_temp);
    MCP9804TempSensorInitialize(POS3P3_TEMP_SNS_ADDR, &error_handler.flags.pos3p3_temp);
    MCP9804TempSensorInitialize(POS5_TEMP_SNS_ADDR, &error_handler.flags.pos5_temp);
    MCP9804TempSensorInitialize(POS1P2_VFF_TEMP_SNS_ADDR, &error_handler.flags.pos1p2_vff_temp);
    MCP9804TempSensorInitialize(POS60_VAN_TEMP_SNS_ADDR, &error_handler.flags.pos60_van_temp);
    MCP9804TempSensorInitialize(AMB_TEMP_SNS_ADDR, &error_handler.flags.amb_temp);
    
//    if (nUSB_DETECT_PIN == LOW) {
//        MCP9804TempSensorInitialize(USB_TEMP_SNS_ADDR, &error_handler.flags.usb_temp);
//    }
    
}

// this function gets temperature data for all temperature sensors
void tempSensorsRetrieveData(void) {
 
    telemetry.pos12.temperature         = MCP9804GetTemperature(POS12_TEMP_SNS_ADDR, &error_handler.flags.pos12_temp);
    telemetry.pos3p3.temperature        = MCP9804GetTemperature(POS3P3_TEMP_SNS_ADDR, &error_handler.flags.pos3p3_temp);
    telemetry.pos5.temperature          = MCP9804GetTemperature(POS5_TEMP_SNS_ADDR, &error_handler.flags.pos5_temp);
    telemetry.pos1p2_vff.temperature    = MCP9804GetTemperature(POS1P2_VFF_TEMP_SNS_ADDR, &error_handler.flags.pos1p2_vff_temp);
    telemetry.pos60_van.temperature     = MCP9804GetTemperature(POS60_VAN_TEMP_SNS_ADDR, &error_handler.flags.pos60_van_temp);
    telemetry.ambient_temperature       = MCP9804GetTemperature(AMB_TEMP_SNS_ADDR, &error_handler.flags.amb_temp);
    telemetry.backup_rtc_temperature    = DS3231MRTCGetTemperature(BACKUP_RTC_ADDR, &error_handler.flags.backup_rtc);
//    if (nUSB_DETECT_PIN == LOW) {
//        MCP9804GetTemperature(USB_TEMP_SNS_ADDR, &error_handler.flags.usb_temp);
//    }
    
    if (I2C_DSP_EN_PIN == HIGH) {
        telemetry.display_temperature = MCP9804GetTemperature(DSPLY_TEMP_SNS_ADDR, &error_handler.flags.dsply_temp);
    }
    
    temp_sense_data_request = 0;
    
}
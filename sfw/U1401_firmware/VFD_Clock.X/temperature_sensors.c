
#include "temperature_sensors.h"

#include "pin_macros.h"


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
    
//    if (nDISPLAY_DETECT_PIN == LOW && I2C_DSP_EN_PIN == HIGH) {
//        MCP9804TempSensorInitialize(DSPLY_TEMP_SNS_ADDR, &error_handler.flags.dsply_temp);   
//    }
    
    
}
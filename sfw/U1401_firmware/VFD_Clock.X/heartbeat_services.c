

#include "heartbeat_services.h"

#include "error_handler.h"
#include "temperature_sensors.h"
#include "power_monitors.h"
#include "telemetry.h"

// This function executes actions every call of the heartbeat timer, and is used as an easy interface to do some action every second
void heartbeatServices(void) {
 
    // gather new I2C telemetry data next loop through main if we're streaming that data somewhere
    if (live_telemetry_enable) {
    
        // Get new temperature sensor data
        temp_sense_data_request = 1;

        // Get new power monitor data
        power_monitor_data_request = 1;

    }
    
    if (live_telemetry_enable) live_telemetry_request = 1;
    
    // Update error LEDs based on error handler status
    update_error_leds_flag = 1;
    
    // Increment on time counter
    device_on_time_counter++;
    
    
}
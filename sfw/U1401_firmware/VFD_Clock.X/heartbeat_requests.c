
#include "heartbeat_requests.h"

#include "error_handler.h"
#include "temperature_sensors.h"

// This function executes actions every call of the heartbeat timer, and is used as an easy interface to do some action every second
void heartbeatRequests(void) {
 
    // Get new temperature sensor data
    temp_sense_data_request = 1;
    
    // Update error LEDs based on error handler status
    update_error_leds_flag = 1;
    
    // Increment on time counter
    device_on_time_counter++;
    
    
}
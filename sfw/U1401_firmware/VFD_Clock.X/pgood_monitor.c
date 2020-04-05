
#include <stdio.h>

#include "pgood_monitor.h"

#include "pin_macros.h"

#include "terminal_control.h"

// this function prints current PGOOD status
void printPGOODStatus(void) {
 
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
    printf("Current Power Supply Status:\r\n");
   
    if (POS12_PGOOD_PIN) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    +12V Input Voltage is %s\n\r", POS12_PGOOD_PIN ? "within tolerance" : "out of tolerance");
    
    if (POS3P3_PGOOD_PIN) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    +3.3V Power Supply is %s", POS12_PGOOD_PIN ? "enabled, " : "disabled\r\n");
    if (POS3P3_PGOOD_PIN) printf("output voltage is %s\r\n", POS3P3_PGOOD_PIN ? "within regulation" : "out of regulation");
    
    if (POS5_PGOOD_PIN) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    +5V Power Supply is %s", POS5_RUN_PIN ? "enabled, " : "disabled\r\n");
    if (POS5_PGOOD_PIN) printf("output voltage is %s\r\n", POS5_PGOOD_PIN ? "within regulation" : "out of regulation");
    
    if (POS60_VAN_PGOOD_PIN) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    +60VAN Power Supply is %s", POS60_VAN_RUN_PIN ? "enabled, " : "disabled\r\n");
    if (POS60_VAN_PGOOD_PIN) printf("output voltage is %s\r\n", POS60_VAN_PGOOD_PIN ? "within regulation" : "out of regulation");
    
    if (POS1P2_VFF_PGOOD_PIN) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    +1.2VFF Power Supply is %s", POS1P2_VFF_RUN_PIN ? "enabled, " : "disabled\r\n");
    if (POS1P2_VFF_PGOOD_PIN) printf("output voltage is %s\r\n", POS1P2_VFF_PGOOD_PIN ? "within regulation" : "out of regulation");
    
    if (!nUSB_DETECT_PIN) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    USB Bus Voltage is %s\n\r", !nUSB_DETECT_PIN ? "within tolerance" : "out of tolerance (or USB cable is unplugged)");
    
    if (VBAT_PGOOD_PIN) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Backup Battery is %s, battery is %s\n\r", 
            VBAT_ENABLE_PIN ? "in circuit" : "out of circuit",
            VBAT_PGOOD_PIN ? "charged" : "discharged");
    
    if (BCKP_ON_PIN) terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Power Backup Circuit is %s\n\r", BCKP_ON_PIN ? "in circuit" : "out of circuit");
    
    terminalTextAttributesReset();
}
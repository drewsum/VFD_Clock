
#ifndef _PIN_MACROS_H    /* Guard against multiple inclusion */
#define _PIN_MACROS_H


#include <xc.h>

#define HIGH    1
#define LOW     0

// These pin macros allow for easier manipulation of GPIO with matching
// signal names from the hardware schematic

// Port A
#define ANODE_G_PIN             LATAbits.LATA0
#define USB_ERROR_LED_PIN       LATAbits.LATA1
#define POS1P2_VFF_RUN_PIN      LATAbits.LATA2
#define POS1P2_VFF_PGOOD_PIN    PORTAbits.RA3
#define POS12_PGOOD_PIN         PORTAbits.RA4
#define I2C_DSP_EN_PIN          LATAbits.LATA5
#define CAP_TOUCH_UP_PIN        PORTAbits.RA9
#define CAP_TOUCH_DOWN_PIN      PORTAbits.RA10

// Port B
#define CAP_TOUCH_RIGHT_PIN     PORTBbits.RB0
#define CAP_TOUCH_LEFT_PIN      PORTBbits.RB1
#define ANODE_A_PIN             LATBbits.LATB2
#define ANODE_B_PIN             LATBbits.LATB3
#define ANODE_C_PIN             LATBbits.LATB4
#define ANODE_D_PIN             LATBbits.LATB5
#define CAP_TOUCH_POWER_PIN     PORTBbits.RB8
#define nDISPLAY_DETECT_PIN     PORTBbits.RB9
#define CPU_EXCEPTION_LED_PIN   LATBbits.LATB10
#define OTHER_ERROR_LED_PIN     LATBbits.LATB11
#define VBAT_ADC_ENABLE_PIN     LATBbits.LATB13
#define POS3P3_BCKP_ADC_ENABLE_PIN   LATBbits.LATB14

// Port C
#define COLON_0_PIN             LATCbits.LATC1
#define GRID_5_PIN              LATCbits.LATC2
#define GRID_4_PIN              LATCbits.LATC3
#define GRID_3_PIN              LATCbits.LATC4
#define POS60_VAN_PGOOD_PIN     PORTCbits.RC13
#define MCU_POSC_ENABLE_PIN     LATCbits.LATC15

// Port D
#define POS60_VAN_RUN_PIN       LATDbits.LATD0
#define BCKP_ON_PIN             PORTDbits.RD3
#define I2C_EN_PIN              LATDbits.LATD9
#define POS3P3_PGOOD_PIN        PORTDbits.RD10
#define nUSB_DETECT_PIN         PORTDbits.RD11
#define VBAT_ENABLE_PIN         LATDbits.LATD12
#define VBAT_PGOOD_PIN          PORTDbits.RD13

// Port E
#define nIO_LEVEL_SHIFT_ENABLE_PIN  LATEbits.LATE4
#define COLON_3_PIN             LATEbits.LATE5
#define COLON_2_PIN             LATEbits.LATE6
#define COLON_1_PIN             LATEbits.LATE7
#define ANODE_F_PIN             LATEbits.LATE8
#define ANODE_E_PIN             LATEbits.LATE9

// Port F
#define RESET_LED_PIN           LATFbits.LATF2
#define POS5_RUN_PIN            LATFbits.LATF4
#define POS5_PGOOD_PIN          PORTFbits.RF5
#define ANALOG_ERROR_LED_PIN    LATFbits.LATF8
#define HEARTBEAT_LED_PIN       LATFbits.LATF12
#define I2C_ERROR_LED_PIN       LATFbits.LATF13

// Port G
#define BLE_RESET_PIN           LATGbits.LATG1
#define GRID_2_PIN              LATGbits.LATG6
#define GRID_1_PIN              LATGbits.LATG7
#define GRID_0_PIN              LATGbits.LATG8
#define ANODE_DP_PIN            LATGbits.LATG9
#define BUZZER_ENABLE_PIN       LATGbits.LATG15



#endif /* _PIN_MACROS_H */

/* *****************************************************************************
 End of File
 */

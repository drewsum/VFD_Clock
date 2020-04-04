
#include <xc.h>

#include "gpio_setup.h"

// initializes GPIO ports on microcontroller
void gpioInitialize (void) {
    
    // Unlock peripheral pin select
    PPSUnlock();
    
    portAGPIOInitialize();
    portBGPIOInitialize();
    portCGPIOInitialize();
    portDGPIOInitialize();
    portEGPIOInitialize();
    portFGPIOInitialize();
    portGGPIOInitialize();
    
    // Lock PPS
    PPSLock();
    
}

// initializes port A GPIO pins
void portAGPIOInitialize (void) {
    
    // RA0
    ANSELAbits.ANSA0        = ANALOG_DISABLE;
    ODCAbits.ODCA0          = ODC_DISABLE;
    LATAbits.LATA0          = LAT_LOW;
    TRISAbits.TRISA0        = TRIS_OUTPUT;
    
    // RA1
    ANSELAbits.ANSA1        = ANALOG_DISABLE;
    ODCAbits.ODCA1          = ODC_DISABLE;
    LATAbits.LATA1          = LAT_LOW;
    TRISAbits.TRISA1        = TRIS_OUTPUT;
    
    // RA2
    ODCAbits.ODCA2          = ODC_DISABLE;
    LATAbits.LATA2          = LAT_LOW;
    TRISAbits.TRISA2        = TRIS_OUTPUT;
    
    // RA3
    ODCAbits.ODCA3          = ODC_DISABLE;
    TRISAbits.TRISA3        = TRIS_INPUT;
    
    // RA4
    ODCAbits.ODCA4          = ODC_DISABLE;
    TRISAbits.TRISA4        = TRIS_INPUT;
    
    // RA5
    ANSELAbits.ANSA5        = ANALOG_DISABLE;
    ODCAbits.ODCA5          = ODC_DISABLE;
    LATAbits.LATA5          = LAT_LOW;
    TRISAbits.TRISA5        = TRIS_OUTPUT;
    
    // RA6
    ODCAbits.ODCA6          = ODC_DISABLE;
    LATAbits.LATA6          = LAT_LOW;
    TRISAbits.TRISA6        = TRIS_OUTPUT;
    
    // RA7
    ODCAbits.ODCA7          = ODC_DISABLE;
    LATAbits.LATA7          = LAT_LOW;
    TRISAbits.TRISA7        = TRIS_OUTPUT;
    
    // RA9
    ANSELAbits.ANSA9        = ANALOG_DISABLE;
    ODCAbits.ODCA9          = ODC_DISABLE;
    TRISAbits.TRISA9        = TRIS_INPUT;
    
    // RA10
    ANSELAbits.ANSA10       = ANALOG_DISABLE;
    ODCAbits.ODCA10         = ODC_DISABLE;
    TRISAbits.TRISA10       = TRIS_INPUT;
    
    // RA14
    ODCAbits.ODCA14         = ODC_ENABLE;
    TRISAbits.TRISA14       = TRIS_INPUT;
    
    // RA15
    ODCAbits.ODCA15         = ODC_ENABLE;
    TRISAbits.TRISA15       = TRIS_INPUT;
    
}

// initializes port B GPIO pins
void portBGPIOInitialize (void) {
    
    // RB0
    ANSELBbits.ANSB0        = ANALOG_DISABLE;
    ODCBbits.ODCB0          = ODC_DISABLE;
    TRISBbits.TRISB0        = TRIS_INPUT;
    
    // RB1
    ANSELBbits.ANSB1        = ANALOG_DISABLE;
    ODCBbits.ODCB1          = ODC_DISABLE;
    TRISBbits.TRISB1        = TRIS_INPUT;
    
    // RB2
    ANSELBbits.ANSB2        = ANALOG_DISABLE;
    ODCBbits.ODCB2          = ODC_DISABLE;
    LATBbits.LATB2          = LAT_LOW;
    TRISBbits.TRISB2        = TRIS_OUTPUT;
    
    // RB3
    ANSELBbits.ANSB3        = ANALOG_DISABLE;
    ODCBbits.ODCB3          = ODC_DISABLE;
    LATBbits.LATB3          = LAT_LOW;
    TRISBbits.TRISB3        = TRIS_OUTPUT;
    
    // RB4
    ANSELBbits.ANSB4        = ANALOG_DISABLE;
    ODCBbits.ODCB4          = ODC_DISABLE;
    LATBbits.LATB4          = LAT_LOW;
    TRISBbits.TRISB4        = TRIS_OUTPUT;
    
    // RB5
    ANSELBbits.ANSB5        = ANALOG_DISABLE;
    ODCBbits.ODCB5          = ODC_DISABLE;
    LATBbits.LATB5          = LAT_LOW;
    TRISBbits.TRISB5        = TRIS_OUTPUT;
    
    // RB6
    ANSELBbits.ANSB6        = ANALOG_DISABLE;
    ODCBbits.ODCB6          = ODC_DISABLE;
    LATBbits.LATB6          = LAT_LOW;
    TRISBbits.TRISB6        = TRIS_OUTPUT;
    
    // RB7
    ANSELBbits.ANSB7        = ANALOG_DISABLE;
    ODCBbits.ODCB7          = ODC_DISABLE;
    LATBbits.LATB7          = LAT_LOW;
    TRISBbits.TRISB7        = TRIS_OUTPUT;
    
    // RB8
    ANSELBbits.ANSB8        = ANALOG_DISABLE;
    ODCBbits.ODCB8          = ODC_DISABLE;
    TRISBbits.TRISB8        = TRIS_INPUT;

    // RB9
    ANSELBbits.ANSB9        = ANALOG_DISABLE;
    ODCBbits.ODCB9          = ODC_DISABLE;
    TRISBbits.TRISB9        = TRIS_INPUT;   
    
    // RB10
    ANSELBbits.ANSB10       = ANALOG_DISABLE;
    ODCBbits.ODCB10         = ODC_DISABLE;
    LATBbits.LATB10         = LAT_LOW;
    TRISBbits.TRISB10       = TRIS_OUTPUT;
    
    // RB11
    ANSELBbits.ANSB11       = ANALOG_DISABLE;
    ODCBbits.ODCB11         = ODC_DISABLE;
    LATBbits.LATB11         = LAT_LOW;
    TRISBbits.TRISB11       = TRIS_OUTPUT;
    
    // RB12
    ANSELBbits.ANSB12       = ANALOG_ENABLE;
    ODCBbits.ODCB12         = ODC_DISABLE;
    LATBbits.LATB12         = LAT_LOW;
    TRISBbits.TRISB12       = TRIS_INPUT;
    
    // RB13
    ANSELBbits.ANSB13       = ANALOG_DISABLE;
    ODCBbits.ODCB13         = ODC_DISABLE;
    LATBbits.LATB13         = LAT_LOW;
    TRISBbits.TRISB13       = TRIS_OUTPUT;
    
    // RB14
    ANSELBbits.ANSB14       = ANALOG_DISABLE;
    ODCBbits.ODCB14         = ODC_DISABLE;
    LATBbits.LATB14         = LAT_LOW;
    TRISBbits.TRISB14       = TRIS_OUTPUT;
    
    // RB15
    ANSELBbits.ANSB15       = ANALOG_ENABLE;
    ODCBbits.ODCB15         = ODC_DISABLE;
    LATBbits.LATB15         = LAT_LOW;
    TRISBbits.TRISB15       = TRIS_INPUT;
    
}

// initializes port C GPIO pins
void portCGPIOInitialize (void) {
    
    // RC1
    ANSELCbits.ANSC1        = ANALOG_DISABLE;
    ODCCbits.ODCC1          = ODC_DISABLE;
    LATCbits.LATC1          = LAT_LOW;
    TRISCbits.TRISC1        = TRIS_OUTPUT;
    
    // RC2
    ANSELCbits.ANSC2        = ANALOG_DISABLE;
    ODCCbits.ODCC2          = ODC_DISABLE;
    LATCbits.LATC2          = LAT_LOW;
    TRISCbits.TRISC2        = TRIS_OUTPUT;
    
    // RC3
    ANSELCbits.ANSC3        = ANALOG_DISABLE;
    ODCCbits.ODCC3          = ODC_DISABLE;
    LATCbits.LATC3          = LAT_LOW;
    TRISCbits.TRISC3        = TRIS_OUTPUT;
    
    // RC4
    ANSELCbits.ANSC4        = ANALOG_DISABLE;
    ODCCbits.ODCC4          = ODC_DISABLE;
    LATCbits.LATC4          = LAT_LOW;
    TRISCbits.TRISC4        = TRIS_OUTPUT;
    
    // RC12
    ODCCbits.ODCC12         = ODC_DISABLE;
    LATCbits.LATC12         = LAT_LOW;
    TRISCbits.TRISC12       = TRIS_INPUT;
    
    // RC13
    ODCCbits.ODCC13         = ODC_DISABLE;
    LATCbits.LATC13         = LAT_LOW;
    TRISCbits.TRISC13       = TRIS_INPUT;
    
    // RC14
    ODCCbits.ODCC14         = ODC_DISABLE;
    LATCbits.LATC14         = LAT_LOW;
    TRISCbits.TRISC14       = TRIS_INPUT;
    
    // RC15
    ODCCbits.ODCC15         = ODC_DISABLE;
    LATCbits.LATC15         = LAT_LOW;
    TRISCbits.TRISC15       = TRIS_OUTPUT;
    
}

// initializes port D GPIO pins
void portDGPIOInitialize (void) {
    
    // RD0
    ODCDbits.ODCD0          = ODC_DISABLE;
    LATDbits.LATD0          = LAT_LOW;
    TRISDbits.TRISD0        = TRIS_OUTPUT;
    
    // RD1
    ODCDbits.ODCD1          = ODC_DISABLE;
    LATDbits.LATD1          = LAT_LOW;
    TRISDbits.TRISD1        = TRIS_OUTPUT;
    
    // RD2
    ODCDbits.ODCD2          = ODC_DISABLE;
    LATDbits.LATD2          = LAT_LOW;
    TRISDbits.TRISD2        = TRIS_OUTPUT;
    
    // RD3
    ODCDbits.ODCD3          = ODC_DISABLE;
    LATDbits.LATD3          = LAT_LOW;
    TRISDbits.TRISD3        = TRIS_INPUT;
    
    // RD4
    ODCDbits.ODCD4          = ODC_DISABLE;
    LATDbits.LATD4          = LAT_LOW;
    TRISDbits.TRISD4        = TRIS_OUTPUT;
    
    // RD5
    ODCDbits.ODCD5          = ODC_DISABLE;
    LATDbits.LATD5          = LAT_LOW;
    TRISDbits.TRISD5        = TRIS_OUTPUT;
    
    // RD9
    ODCDbits.ODCD9          = ODC_DISABLE;
    LATDbits.LATD9          = LAT_LOW;
    TRISDbits.TRISD9        = TRIS_OUTPUT;
    
    // RD10
    ODCDbits.ODCD10         = ODC_DISABLE;
    LATDbits.LATD10         = LAT_LOW;
    TRISDbits.TRISD10       = TRIS_INPUT;
    
    // RD11
    ODCDbits.ODCD11         = ODC_DISABLE;
    LATDbits.LATD11         = LAT_LOW;
    TRISDbits.TRISD11       = TRIS_INPUT;
    
    // RD12
    ODCDbits.ODCD12         = ODC_DISABLE;
    LATDbits.LATD12         = LAT_LOW;
    TRISDbits.TRISD12       = TRIS_OUTPUT;
    
    // RD13
    ODCDbits.ODCD13         = ODC_DISABLE;
    LATDbits.LATD13         = LAT_LOW;
    TRISDbits.TRISD13       = TRIS_INPUT;
    
    // RD14
    ANSELDbits.ANSD14       = ANALOG_DISABLE;
    ODCDbits.ODCD14         = ODC_DISABLE;
    LATDbits.LATD14         = LAT_LOW;
    TRISDbits.TRISD14       = TRIS_INPUT;
    RPD14Rbits.RPD14R       = 0b0001;           // Assign UART 3 TX to RD14
    
    // RD15
    ANSELDbits.ANSD15       = ANALOG_DISABLE;
    ODCDbits.ODCD15         = ODC_DISABLE;
    LATDbits.LATD15         = LAT_LOW;
    TRISDbits.TRISD15       = TRIS_INPUT;
    U3RXRbits.U3RXR         = 0b1011;           // Assign UART 3 RX to RD15
    
}

// initializes port E GPIO pins
void portEGPIOInitialize (void) {
    
    // RE0
    ODCEbits.ODCE0          = ODC_DISABLE;
    LATEbits.LATE0          = LAT_LOW;
    TRISEbits.TRISE0        = TRIS_OUTPUT;
    
    // RE1
    ODCEbits.ODCE1          = ODC_DISABLE;
    LATEbits.LATE1          = LAT_LOW;
    TRISEbits.TRISE1        = TRIS_OUTPUT;
    
    // RE2
    ODCEbits.ODCE2          = ODC_DISABLE;
    LATEbits.LATE2          = LAT_LOW;
    TRISEbits.TRISE2        = TRIS_OUTPUT;
    
    // RE3
    ODCEbits.ODCE3          = ODC_DISABLE;
    LATEbits.LATE3          = LAT_LOW;
    TRISEbits.TRISE3        = TRIS_OUTPUT;
    
    // RE4
    ANSELEbits.ANSE4        = ANALOG_DISABLE;
    ODCEbits.ODCE4          = ODC_ENABLE;
    LATEbits.LATE4          = LAT_HIGH;
    TRISEbits.TRISE4        = TRIS_OUTPUT;
    
    // RE5
    ANSELEbits.ANSE5        = ANALOG_DISABLE;
    ODCEbits.ODCE5          = ODC_DISABLE;
    LATEbits.LATE5          = LAT_LOW;
    TRISEbits.TRISE5        = TRIS_OUTPUT;
    
    // RE6
    ANSELEbits.ANSE6        = ANALOG_DISABLE;
    ODCEbits.ODCE6          = ODC_DISABLE;
    LATEbits.LATE6          = LAT_LOW;
    TRISEbits.TRISE6        = TRIS_OUTPUT;
    
    // RE7
    ANSELEbits.ANSE7        = ANALOG_DISABLE;
    ODCEbits.ODCE7          = ODC_DISABLE;
    LATEbits.LATE7          = LAT_LOW;
    TRISEbits.TRISE7        = TRIS_OUTPUT;
    
    // RE8
    ANSELEbits.ANSE8        = ANALOG_DISABLE;
    ODCEbits.ODCE8          = ODC_DISABLE;
    LATEbits.LATE8          = LAT_LOW;
    TRISEbits.TRISE8        = TRIS_OUTPUT;
    
    // RE9
    ANSELEbits.ANSE9        = ANALOG_DISABLE;
    ODCEbits.ODCE9          = ODC_DISABLE;
    LATEbits.LATE9          = LAT_LOW;
    TRISEbits.TRISE9        = TRIS_OUTPUT;
    
}

// initializes port F GPIO pins
void portFGPIOInitialize (void) {
    
    // RF0
    ODCFbits.ODCF0          = ODC_DISABLE;
    LATFbits.LATF0          = LAT_LOW;
    TRISFbits.TRISF0        = TRIS_INPUT;
    
    // RF1
    ODCFbits.ODCF1          = ODC_DISABLE;
    LATFbits.LATF1          = LAT_LOW;
    TRISFbits.TRISF1        = TRIS_INPUT;
    
    // RF2
    ODCFbits.ODCF2          = ODC_ENABLE;
    LATFbits.LATF2          = LAT_HIGH;
    TRISFbits.TRISF2        = TRIS_OUTPUT;
    
    // RF3
    ODCFbits.ODCF3          = ODC_DISABLE;
    LATFbits.LATF3          = LAT_LOW;
    TRISFbits.TRISF3        = TRIS_OUTPUT;
    
    // RF4
    ODCFbits.ODCF4          = ODC_DISABLE;
    LATFbits.LATF4          = LAT_LOW;
    TRISFbits.TRISF4        = TRIS_OUTPUT;
    
    // RF5
    ODCFbits.ODCF5          = ODC_DISABLE;
    LATFbits.LATF5          = LAT_LOW;
    TRISFbits.TRISF5        = TRIS_INPUT;
    
    // RF8
    ODCFbits.ODCF8          = ODC_DISABLE;
    LATFbits.LATF8          = LAT_LOW;
    TRISFbits.TRISF8        = TRIS_OUTPUT;
    
    // RF12
    ANSELFbits.ANSF12       = ANALOG_DISABLE;
    ODCFbits.ODCF12         = ODC_DISABLE;
    LATFbits.LATF12         = LAT_LOW;
    TRISFbits.TRISF12       = TRIS_OUTPUT;
    
    // RF13
    ANSELFbits.ANSF13       = ANALOG_DISABLE;
    ODCFbits.ODCF13         = ODC_DISABLE;
    LATFbits.LATF13         = LAT_LOW;
    TRISFbits.TRISF13       = TRIS_OUTPUT;
    
}

// initializes port G GPIO pins
void portGGPIOInitialize (void) {
    
    // RG0
    ODCGbits.ODCG0          = ODC_DISABLE;
    LATGbits.LATG0          = LAT_LOW;
    TRISGbits.TRISG0        = TRIS_OUTPUT;
    
    // RG1
    ODCGbits.ODCG1          = ODC_DISABLE;
    LATGbits.LATG1          = LAT_HIGH;
    TRISGbits.TRISG1        = TRIS_OUTPUT;
    
    // RG6
    ANSELGbits.ANSG6        = ANALOG_DISABLE;
    ODCGbits.ODCG6          = ODC_DISABLE;
    LATGbits.LATG6          = LAT_LOW;
    TRISGbits.TRISG6        = TRIS_OUTPUT;
    
    // RG7
    ANSELGbits.ANSG7        = ANALOG_DISABLE;
    ODCGbits.ODCG7          = ODC_DISABLE;
    LATGbits.LATG7          = LAT_LOW;
    TRISGbits.TRISG7        = TRIS_OUTPUT;
    
    // RG8
    ANSELGbits.ANSG8        = ANALOG_DISABLE;
    ODCGbits.ODCG8          = ODC_DISABLE;
    LATGbits.LATG8          = LAT_LOW;
    TRISGbits.TRISG8        = TRIS_OUTPUT;
    
    // RG9
    ANSELGbits.ANSG9        = ANALOG_DISABLE;
    ODCGbits.ODCG9          = ODC_DISABLE;
    LATGbits.LATG9          = LAT_LOW;
    TRISGbits.TRISG9        = TRIS_OUTPUT;
    
    // RG12
    ODCGbits.ODCG12         = ODC_DISABLE;
    LATGbits.LATG12         = LAT_LOW;
    TRISGbits.TRISG12       = TRIS_OUTPUT;
    
    // RG13
    ODCGbits.ODCG13         = ODC_DISABLE;
    LATGbits.LATG13         = LAT_LOW;
    TRISGbits.TRISG13       = TRIS_OUTPUT;
    
    // RG14
    ODCGbits.ODCG14         = ODC_DISABLE;
    LATGbits.LATG14         = LAT_LOW;
    TRISGbits.TRISG14       = TRIS_OUTPUT;
    
    // RG15
    ANSELGbits.ANSG15       = ANALOG_DISABLE;
    ODCGbits.ODCG15         = ODC_DISABLE;
    LATGbits.LATG15         = LAT_LOW;
    TRISGbits.TRISG15       = TRIS_OUTPUT;
    
}

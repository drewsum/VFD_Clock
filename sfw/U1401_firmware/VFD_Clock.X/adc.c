
#include <xc.h>

#include <stdio.h>

// These are macros needed for defining ISRs, included in XC32
#include <sys/attribs.h>


#include "adc.h"
#include "32mz_interrupt_control.h"
#include "error_handler.h"
#include "pin_macros.h"
#include "terminal_control.h"

// This function initializes the ADC modules
void ADCInitialize(void) {
    
    // setup ADC fault interrupt
    disableInterrupt(ADC_Fault);
    setInterruptPriority(ADC_Fault, 3);
    setInterruptSubpriority(ADC_Fault, 2);
    clearInterruptFlag(ADC_Fault);
    
    // Block ADC triggers for startup
    ADCCON3bits.TRGSUSP = 1;
    
    /* initialize ADC calibration setting */
    ADC0CFG = DEVADC0;
    ADC1CFG = DEVADC1;
    ADC2CFG = DEVADC2;
    ADC3CFG = DEVADC3;
    ADC4CFG = DEVADC4;
    ADC7CFG = DEVADC7;
    
    // disable analog input charge pump
    ADCCON1bits.AICPMPEN = 0;
    CFGCONbits.IOANCPEN = 0;
    
    /* Configure ADCCON1 */
    ADCCON1 = 0;
    ADCCON1bits.TRBEN = 0;     // Disable Turbo Mode
    if (ADCCON1bits.TRBERR) error_handler.flags.ADC_configuration_error = 1;     // Verify turbo mode disabled
    ADCCON1bits.SIDL = 1;   // Stop ADC in idle mode

    /* Initialize warm up time register */
    ADCANCON = 0;
    ADCANCONbits.WKUPCLKCNT = 0b1111; // Set for longest wakeup time to be safe
    
    /* Clock setting */
    ADCCON3 = 0;
    ADCCON3bits.ADCSEL = 0; // Select input clock source
    ADCCON3bits.CONCLKDIV = 1; // Control clock frequency is half of input clock
    ADCCON3bits.VREFSEL = 0; // Select AVDD and AVSS as reference source
    
    /* Configure ADCCON2 */
    ADCCON2 = 0;
    /* Select ADC7 sample time and conversion clock */
    ADCCON2bits.ADCDIV = 40;
    ADCCON2bits.SAMC = 8;
    ADCCON1bits.SELRES = 3;     // 12 bit result
    
    // Setup used ADC channels
    adcChannelsInitialize();
    
    // Setup ADC end of scan interrupt
    disableInterrupt(ADC_End_Of_Scan_Ready);
    setInterruptPriority(ADC_End_Of_Scan_Ready, 3);
    setInterruptSubpriority(ADC_End_Of_Scan_Ready, 1);
    clearInterruptFlag(ADC_End_Of_Scan_Ready);
    
    /* Configure ADCCMPCONx */
    ADCCMPCON1 = 0; // No digital comparators are used. Setting the ADCCMPCONx
    ADCCMPCON2 = 0; // register to '0' ensures that the comparator is disabled.
    ADCCMPCON3 = 0; // Other registers are ?don't care?.
    ADCCMPCON4 = 0;
    ADCCMPCON5 = 0;
    
   /* Configure ADCFLTRx */
    ADCFLTR1 = 0; // No oversampling filters are used.
    ADCFLTR2 = 0;
    ADCFLTR3 = 0;
    ADCFLTR4 = 0;
    ADCFLTR5 = 0;
    ADCFLTR6 = 0;
    
    /* Set up the trigger sources */
    ADCCON1bits.STRGLVL = 0;            // Edge trigger mode
    ADCCON1bits.STRGSRC = 0b00001;      // Trigger source is global software edge trigger
    
    /* Early interrupt */
    ADCEIEN1 = 0; // No early interrupts used
    ADCEIEN2 = 0;
    
    /* Turn the ADC on */
    ADCCON1bits.ON = 1;
    
    /* Wait for voltage reference to be stable */
    while(!ADCCON2bits.BGVRRDY); // Wait until the reference voltage is ready
    
    if (ADCCON2bits.REFFLT) error_handler.flags.ADC_configuration_error = 1;     // Record error if reference fails
    
    /* Enable clock to analog circuit */
    ADCANCONbits.ANEN7 = 1; // Enable the clock to analog bias
    
    while (ADCANCONbits.WKRDY7);    // wait for ADC7 AN to be ready
    
    /* Enable the ADC module */
    ADCCON3bits.DIGEN7 = 1; // Enable ADC7 digital circuits
    
    // Unblock triggers
    ADCCON3bits.TRGSUSP = 0;
    
    // enable ADC fault interrupt
    ADCCON2bits.REFFLTIEN = 1;
    enableInterrupt(ADC_Fault);

    
}

// this is the ADC fault interrupt service routine
void __ISR(_ADC_FAULT_VECTOR, IPL3SRS) ADCFaultISR(void) {
 
    // record error
    if (ADCCON2bits.REFFLT) {
        
        error_handler.flags.ADC_reference_fault = 1;
        
        ADCCON2bits.REFFLT = 0;
        ADCCON1bits.ON = 0;
        
    }
    
    clearInterruptFlag(ADC_Fault);
    
}

// This function prints the status of the ADC
void printADCStatus(void) {

    terminalTextAttributesReset();
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, BOLD_FONT);
    printf("Analog to Digital Converter Status:\n\r");
    
    // Print if ADC is on
    if (ADCCON1bits.ON) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC %s\n\r", ADCCON1bits.ON ? "Enabled" : "Disabled");
    
    // Print ADC resolution
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC7 Resolution: ");
    switch (ADCCON1bits.SELRES) {
     
        case 0b00:
            printf("6 bits\n\r");
            break;
            
        case 0b01:
            printf("8 bits\n\r");
            break;
            
        case 0b10:
            printf("10 bits\n\r");
            break;
                    
        case 0b11:
            printf("12 bits\n\r");
            break;
        
    }
    
    // Print if fractional of integer mode
    if (ADCCON1bits.FRACT) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Fraction Format: %s\n\r", ADCCON1bits.FRACT ? "Fractional" : "Integer");
    
    // Print trigger source
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC Scan Trigger Source: ");
    switch (ADCCON1bits.STRGSRC) {
     
        case 0b00000:
            printf("No Trigger\n\r");
            break;
            
        case 0b00001:
            printf("Global software edge trigger (GSWTRG)\n\r");
            break;
            
        case 0b00010:
            printf("Global level software trigger (GLSWTRG)\n\r");
            break;
            
        case 0b00100:
            printf("INT0 External interrupt\n\r");
            break;
            
        case 0b00101:
            printf("TMR1 match\n\r");
            break;
            
        case 0b00110:
            printf("TMR3 match\n\r");
            break;
            
        case 0b00111:
            printf("TMR5 match\n\r");
            break;
            
        case 0b01000:
            printf("OCMP1\n\r");
            break;
            
        case 0b01001:
            printf("OCMP3\n\r");
            break;
            
        case 0b01010:
            printf("OCMP5\n\r");
            break;
            
        case 0b01011:
            printf("Comparator 1 (COUT)\n\r");
            break;
            
        case 0b01100:
            printf("Comparator 2 (COUT)\n\r");
            break;
            
        default:
            printf("Undefined\n\r");
            break;
            
    }
    
    // print trigger level/edge
    if (ADCCON1bits.STRGLVL) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Scan Trigger Sensitivity: %s\n\r", ADCCON1bits.STRGLVL ? "Level" : "Edge");
    
    // print trigger suspension status
    if (ADCCON3bits.TRGSUSP) terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Scan Trigger Suspension: %s\n\r", ADCCON3bits.TRGSUSP ? "suspended" : "not suspended");
    
    // Print status of bandgap reference
    if (ADCCON2bits.BGVRRDY) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Bandgap Reference Status: %s\n\r", ADCCON2bits.BGVRRDY ? "Ready" : "Not Ready");
    
    // Print bandgap fault status
    if (ADCCON2bits.REFFLT) terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Bandgap Reference is %s\n\r", ADCCON2bits.REFFLT ? "faulty" : "working properly");
    
    // Print SAMC7
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC7 Sample Time (TSAM7) = %d * TAD7\n\r", ADCCON2bits.SAMC + 2);
    
    // print ADC7 clock divider
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC7 Clock (TAD7) = %d * TQ\n\r", ADCCON2bits.ADCDIV * 2);
    
    // print ADC clock source
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC Clock Source (TCLK): ");
    switch (ADCCON3bits.ADCSEL) {
     
        case 0b00:
            printf("PBCLK3\n\r");
            break;
            
        case 0b01:
            printf("System Clock (TCY)\n\r");
            break;
            
        case 0b10:
            printf("REFCLK3\n\r");
            break;
            
        case 0b11:
            printf("FRC\n\r");
            break;
        
    }
    
    // Print control clock divider
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC Control Clock (TQ) = %d * TCLK\n\r", ADCCON3bits.CONCLKDIV * 2);
    
    // print digital enables
    if (ADCCON3bits.DIGEN0) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC0 is %s\n\r", ADCCON3bits.DIGEN0 ? "digital enabled" : "digital disabled");
    if (ADCCON3bits.DIGEN1) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC1 is %s\n\r", ADCCON3bits.DIGEN1 ? "digital enabled" : "digital disabled");
    if (ADCCON3bits.DIGEN2) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC2 is %s\n\r", ADCCON3bits.DIGEN2 ? "digital enabled" : "digital disabled");
    if (ADCCON3bits.DIGEN3) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC3 is %s\n\r", ADCCON3bits.DIGEN3 ? "digital enabled" : "digital disabled");
    if (ADCCON3bits.DIGEN4) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC4 is %s\n\r", ADCCON3bits.DIGEN4 ? "digital enabled" : "digital disabled");
    if (ADCCON3bits.DIGEN7) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC7 is %s\n\r", ADCCON3bits.DIGEN7 ? "digital enabled" : "digital disabled");
    
    // print voltage reference selection
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Voltage reference selection: ");
    switch (ADCCON3bits.VREFSEL) {
     
        case 0b00:
            printf("AVDD and AVSS\n\r");
            break;
            
        case 0b01:
            printf("VREFH and AVSS\n\r");
            break;
            
        case 0b10:
            printf("AVDD and VREFL\n\r");
            break;
            
        case 0b11:
            printf("VREFH and VREFL\n\r");
            break;
        
    }
    
    // Print analog enable status    
    if (ADCANCONbits.ANEN0) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC0 is %s\n\r", ADCANCONbits.ANEN0 ? "analog enabled" : "analog disabled");
    if (ADCANCONbits.ANEN1) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC1 is %s\n\r", ADCANCONbits.ANEN1 ? "analog enabled" : "analog disabled");
    if (ADCANCONbits.ANEN2) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC2 is %s\n\r", ADCANCONbits.ANEN2 ? "analog enabled" : "analog disabled");
    if (ADCANCONbits.ANEN3) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC3 is %s\n\r", ADCANCONbits.ANEN3 ? "analog enabled" : "analog disabled");
    if (ADCANCONbits.ANEN4) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC4 is %s\n\r", ADCANCONbits.ANEN4 ? "analog enabled" : "analog disabled");
    if (ADCANCONbits.ANEN7) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC7 is %s\n\r", ADCANCONbits.ANEN7 ? "analog enabled" : "analog disabled");
    
    // print wakeup status bits
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC warmup count exponent = %d\n\r", ADCANCONbits.WKUPCLKCNT);
    
    // print wakeup status bits
    if (ADCANCONbits.WKRDY0) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC0 is %s\n\r", ADCANCONbits.WKRDY0 ? "warmed up" : "cold");
    if (ADCANCONbits.WKRDY1) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC1 is %s\n\r", ADCANCONbits.WKRDY1 ? "warmed up" : "cold");
    if (ADCANCONbits.WKRDY2) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC2 is %s\n\r", ADCANCONbits.WKRDY2 ? "warmed up" : "cold");
    if (ADCANCONbits.WKRDY3) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC3 is %s\n\r", ADCANCONbits.WKRDY3 ? "warmed up" : "cold");
    if (ADCANCONbits.WKRDY4) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC4 is %s\n\r", ADCANCONbits.WKRDY4 ? "warmed up" : "cold");
    if (ADCANCONbits.WKRDY7) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC7 is %s\n\r", ADCANCONbits.WKRDY7 ? "warmed up" : "cold");
    
    // print configuration data
    terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    ADC0 config data: 0x%08X\n\r", ADC0CFG);
    printf("    ADC1 config data: 0x%08X\n\r", ADC1CFG);
    printf("    ADC2 config data: 0x%08X\n\r", ADC2CFG);
    printf("    ADC3 config data: 0x%08X\n\r", ADC3CFG);
    printf("    ADC4 config data: 0x%08X\n\r", ADC4CFG);
    printf("    ADC7 config data: 0x%08X\n\r\n\r", ADC7CFG);
    
    // print out presence of each analog input
    if (ADCSYSCFG0bits.AN0) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN0 is %s\n\r", ADCSYSCFG0bits.AN0 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN1) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN1 is %s\n\r", ADCSYSCFG0bits.AN1 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN2) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN2 is %s\n\r", ADCSYSCFG0bits.AN2 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN3) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN3 is %s\n\r", ADCSYSCFG0bits.AN3 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN3) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN3 is %s\n\r", ADCSYSCFG0bits.AN3 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN4) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN4 is %s\n\r", ADCSYSCFG0bits.AN4 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN5) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN5 is %s\n\r", ADCSYSCFG0bits.AN5 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN6) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN6 is %s\n\r", ADCSYSCFG0bits.AN6 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN7) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN7 is %s\n\r", ADCSYSCFG0bits.AN7 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN8) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN8 is %s\n\r", ADCSYSCFG0bits.AN8 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN9) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN9 is %s\n\r", ADCSYSCFG0bits.AN9 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN10) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN10 is %s\n\r", ADCSYSCFG0bits.AN10 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN11) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN11 is %s\n\r", ADCSYSCFG0bits.AN11 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN12) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN12 is %s\n\r", ADCSYSCFG0bits.AN12 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN13) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN13 is %s\n\r", ADCSYSCFG0bits.AN13 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN14) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN14 is %s\n\r", ADCSYSCFG0bits.AN14 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN15) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN15 is %s\n\r", ADCSYSCFG0bits.AN15 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN16) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN16 is %s\n\r", ADCSYSCFG0bits.AN16 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN17) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN17 is %s\n\r", ADCSYSCFG0bits.AN17 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN18) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN18 is %s\n\r", ADCSYSCFG0bits.AN18 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN19) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN19 is %s\n\r", ADCSYSCFG0bits.AN19 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN20) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN20 is %s\n\r", ADCSYSCFG0bits.AN20 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN21) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN21 is %s\n\r", ADCSYSCFG0bits.AN21 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN22) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN22 is %s\n\r", ADCSYSCFG0bits.AN22 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN23) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN23 is %s\n\r", ADCSYSCFG0bits.AN23 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN24) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN24 is %s\n\r", ADCSYSCFG0bits.AN24 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN25) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN25 is %s\n\r", ADCSYSCFG0bits.AN25 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN26) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN26 is %s\n\r", ADCSYSCFG0bits.AN26 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN27) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN27 is %s\n\r", ADCSYSCFG0bits.AN27 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN28) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN28 is %s\n\r", ADCSYSCFG0bits.AN28 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN29) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN29 is %s\n\r", ADCSYSCFG0bits.AN29 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN30) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN30 is %s\n\r", ADCSYSCFG0bits.AN30 ? "present" : "absent");
    if (ADCSYSCFG0bits.AN31) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN31 is %s\n\r", ADCSYSCFG0bits.AN31 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN32) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN32 is %s\n\r", ADCSYSCFG1bits.AN32 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN33) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN33 is %s\n\r", ADCSYSCFG1bits.AN33 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN34) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN34 is %s\n\r", ADCSYSCFG1bits.AN34 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN35) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN35 is %s\n\r", ADCSYSCFG1bits.AN35 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN36) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN36 is %s\n\r", ADCSYSCFG1bits.AN36 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN37) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN37 is %s\n\r", ADCSYSCFG1bits.AN37 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN38) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN38 is %s\n\r", ADCSYSCFG1bits.AN38 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN39) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN39 is %s\n\r", ADCSYSCFG1bits.AN39 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN40) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN40 is %s\n\r", ADCSYSCFG1bits.AN40 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN41) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN41 is %s\n\r", ADCSYSCFG1bits.AN41 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN42) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN42 is %s\n\r", ADCSYSCFG1bits.AN42 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN43) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN43 is %s\n\r", ADCSYSCFG1bits.AN43 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN44) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN44 is %s\n\r", ADCSYSCFG1bits.AN44 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN45) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN45 is %s\n\r", ADCSYSCFG1bits.AN45 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN46) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN46 is %s\n\r", ADCSYSCFG1bits.AN46 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN47) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN47 is %s\n\r", ADCSYSCFG1bits.AN47 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN48) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN48 is %s\n\r", ADCSYSCFG1bits.AN48 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN49) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN49 is %s\n\r", ADCSYSCFG1bits.AN49 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN50) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN50 is %s\n\r", ADCSYSCFG1bits.AN50 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN51) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN51 is %s\n\r", ADCSYSCFG1bits.AN51 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN52) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN52 is %s\n\r", ADCSYSCFG1bits.AN52 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN53) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN53 is %s\n\r", ADCSYSCFG1bits.AN53 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN54) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN54 is %s\n\r", ADCSYSCFG1bits.AN54 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN55) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN55 is %s\n\r", ADCSYSCFG1bits.AN55 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN56) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN56 is %s\n\r", ADCSYSCFG1bits.AN56 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN57) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN57 is %s\n\r", ADCSYSCFG1bits.AN57 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN58) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN58 is %s\n\r", ADCSYSCFG1bits.AN58 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN59) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN59 is %s\n\r", ADCSYSCFG1bits.AN59 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN60) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN60 is %s\n\r", ADCSYSCFG1bits.AN60 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN61) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN61 is %s\n\r", ADCSYSCFG1bits.AN61 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN62) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN62 is %s\n\r", ADCSYSCFG1bits.AN62 ? "present" : "absent");
    if (ADCSYSCFG1bits.AN63) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN63 is %s\n\r\n\r", ADCSYSCFG1bits.AN63 ? "present" : "absent");
    
    // print out common scan setting for each input
    if (ADCCSS1bits.CSS0) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN0 scan %s\n\r", ADCCSS1bits.CSS0 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS1) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN1 scan %s\n\r", ADCCSS1bits.CSS1 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS2) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN2 scan %s\n\r", ADCCSS1bits.CSS2 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS3) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN3 scan %s\n\r", ADCCSS1bits.CSS3 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS3) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN3 scan %s\n\r", ADCCSS1bits.CSS3 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS4) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN4 scan %s\n\r", ADCCSS1bits.CSS4 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS5) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN5 scan %s\n\r", ADCCSS1bits.CSS5 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS6) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN6 scan %s\n\r", ADCCSS1bits.CSS6 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS7) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN7 scan %s\n\r", ADCCSS1bits.CSS7 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS8) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN8 scan %s\n\r", ADCCSS1bits.CSS8 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS9) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN9 scan %s\n\r", ADCCSS1bits.CSS9 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS10) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN10 scan %s\n\r", ADCCSS1bits.CSS10 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS11) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN11 scan %s\n\r", ADCCSS1bits.CSS11 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS12) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN12 scan %s\n\r", ADCCSS1bits.CSS12 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS13) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN13 scan %s\n\r", ADCCSS1bits.CSS13 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS14) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN14 scan %s\n\r", ADCCSS1bits.CSS14 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS15) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN15 scan %s\n\r", ADCCSS1bits.CSS15 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS16) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN16 scan %s\n\r", ADCCSS1bits.CSS16 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS17) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN17 scan %s\n\r", ADCCSS1bits.CSS17 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS18) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN18 scan %s\n\r", ADCCSS1bits.CSS18 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS19) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN19 scan %s\n\r", ADCCSS1bits.CSS19 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS20) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN20 scan %s\n\r", ADCCSS1bits.CSS20 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS21) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN21 scan %s\n\r", ADCCSS1bits.CSS21 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS22) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN22 scan %s\n\r", ADCCSS1bits.CSS22 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS23) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN23 scan %s\n\r", ADCCSS1bits.CSS23 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS24) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN24 scan %s\n\r", ADCCSS1bits.CSS24 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS25) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN25 scan %s\n\r", ADCCSS1bits.CSS25 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS26) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN26 scan %s\n\r", ADCCSS1bits.CSS26 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS27) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN27 scan %s\n\r", ADCCSS1bits.CSS27 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS28) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN28 scan %s\n\r", ADCCSS1bits.CSS28 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS29) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN29 scan %s\n\r", ADCCSS1bits.CSS29 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS30) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN30 scan %s\n\r", ADCCSS1bits.CSS30 ? "enabled" : "disabled");
    if (ADCCSS1bits.CSS31) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN31 scan %s\n\r", ADCCSS1bits.CSS31 ? "enabled" : "disabled");
    if (ADCCSS2bits.CSS32) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN32 scan %s\n\r", ADCCSS2bits.CSS32 ? "enabled" : "disabled");
    if (ADCCSS2bits.CSS33) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN33 scan %s\n\r", ADCCSS2bits.CSS33 ? "enabled" : "disabled");
    if (ADCCSS2bits.CSS34) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN34 scan %s\n\r", ADCCSS2bits.CSS34 ? "enabled" : "disabled");
    if (ADCCSS2bits.CSS35) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN35 scan %s\n\r", ADCCSS2bits.CSS35 ? "enabled" : "disabled");
    if (ADCCSS2bits.CSS36) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN36 scan %s\n\r", ADCCSS2bits.CSS36 ? "enabled" : "disabled");
    if (ADCCSS2bits.CSS37) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN37 scan %s\n\r", ADCCSS2bits.CSS37 ? "enabled" : "disabled");
    if (ADCCSS2bits.CSS38) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN38 scan %s\n\r", ADCCSS2bits.CSS38 ? "enabled" : "disabled");
    if (ADCCSS2bits.CSS39) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN39 scan %s\n\r", ADCCSS2bits.CSS39 ? "enabled" : "disabled");
    if (ADCCSS2bits.CSS40) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN40 scan %s\n\r", ADCCSS2bits.CSS40 ? "enabled" : "disabled");
    if (ADCCSS2bits.CSS41) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN41 scan %s\n\r", ADCCSS2bits.CSS41 ? "enabled" : "disabled");
    if (ADCCSS2bits.CSS42) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN42 scan %s\n\r", ADCCSS2bits.CSS42 ? "enabled" : "disabled");
    if (ADCCSS2bits.CSS43) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN43 scan %s\n\r", ADCCSS2bits.CSS43 ? "enabled" : "disabled");
    if (ADCCSS2bits.CSS44) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN44 scan %s\n\r\n\r", ADCCSS2bits.CSS44 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS45) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN45 scan %s\n\r", ADCCSS2bits.CSS45 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS46) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN46 scan %s\n\r", ADCCSS2bits.CSS46 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS47) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN47 scan %s\n\r", ADCCSS2bits.CSS47 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS48) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN48 scan %s\n\r", ADCCSS2bits.CSS48 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS49) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN49 scan %s\n\r", ADCCSS2bits.CSS49 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS50) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN50 scan %s\n\r", ADCCSS2bits.CSS50 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS51) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN51 scan %s\n\r", ADCCSS2bits.CSS51 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS52) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN52 scan %s\n\r", ADCCSS2bits.CSS52 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS53) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN53 scan %s\n\r", ADCCSS2bits.CSS53 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS54) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN54 scan %s\n\r", ADCCSS2bits.CSS54 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS55) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN55 scan %s\n\r", ADCCSS2bits.CSS55 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS56) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN56 scan %s\n\r", ADCCSS2bits.CSS56 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS57) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN57 scan %s\n\r", ADCCSS2bits.CSS57 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS58) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN58 scan %s\n\r", ADCCSS2bits.CSS58 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS59) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN59 scan %s\n\r", ADCCSS2bits.CSS59 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS60) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN60 scan %s\n\r", ADCCSS2bits.CSS60 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS61) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN61 scan %s\n\r", ADCCSS2bits.CSS61 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS62) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN62 scan %s\n\r", ADCCSS2bits.CSS62 ? "enabled" : "disabled");
//    if (ADCCSS2bits.CSS63) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN63 scan %s\n\r\n\r", ADCCSS2bits.CSS63 ? "enabled" : "disabled");

    
    // print out data ready IRQ setting for each input
    if (ADCCSS1bits.CSS0) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN0 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN0 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN1) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN1 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN1 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN2) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN2 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN2 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN3) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN3 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN3 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN3) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN3 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN3 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN4) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN4 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN4 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN5) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN5 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN5 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN6) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN6 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN6 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN7) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN7 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN7 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN8) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN8 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN8 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN9) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN9 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN9 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN10) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN10 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN10 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN11) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN11 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN11 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN12) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN12 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN12 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN13) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN13 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN13 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN14) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN14 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN14 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN15) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN15 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN15 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN16) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN16 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN16 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN17) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN17 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN17 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN18) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN18 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN18 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN19) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN19 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN19 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN20) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN20 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN20 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN21) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN21 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN21 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN22) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN22 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN22 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN23) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN23 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN23 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN24) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN24 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN24 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN25) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN25 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN25 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN26) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN26 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN26 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN27) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN27 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN27 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN28) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN28 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN28 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN29) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN29 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN29 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN30) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN30 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN30 ? "enabled" : "disabled");
    if (ADCGIRQEN1bits.AGIEN31) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN31 data interrupt %s\n\r", ADCGIRQEN1bits.AGIEN31 ? "enabled" : "disabled");
    if (ADCGIRQEN2bits.AGIEN32) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN32 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN32 ? "enabled" : "disabled");
    if (ADCGIRQEN2bits.AGIEN33) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN33 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN33 ? "enabled" : "disabled");
    if (ADCGIRQEN2bits.AGIEN34) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN34 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN34 ? "enabled" : "disabled");
    if (ADCGIRQEN2bits.AGIEN35) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN35 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN35 ? "enabled" : "disabled");
    if (ADCGIRQEN2bits.AGIEN36) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN36 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN36 ? "enabled" : "disabled");
    if (ADCGIRQEN2bits.AGIEN37) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN37 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN37 ? "enabled" : "disabled");
    if (ADCGIRQEN2bits.AGIEN38) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN38 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN38 ? "enabled" : "disabled");
    if (ADCGIRQEN2bits.AGIEN39) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN39 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN39 ? "enabled" : "disabled");
    if (ADCGIRQEN2bits.AGIEN40) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN40 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN40 ? "enabled" : "disabled");
    if (ADCGIRQEN2bits.AGIEN41) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN41 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN41 ? "enabled" : "disabled");
    if (ADCGIRQEN2bits.AGIEN42) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN42 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN42 ? "enabled" : "disabled");
    if (ADCGIRQEN2bits.AGIEN43) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN43 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN43 ? "enabled" : "disabled");
    if (ADCGIRQEN2bits.AGIEN44) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
    printf("    Channel AN44 data interrupt %s\n\r\n\r", ADCGIRQEN2bits.AGIEN44 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN45) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN45 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN45 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN46) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN46 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN46 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN47) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN47 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN47 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN48) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN48 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN48 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN49) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN49 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN49 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN50) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN50 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN50 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN51) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN51 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN51 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN52) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN52 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN52 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN53) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN53 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN53 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN54) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN54 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN54 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN55) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN55 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN55 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN56) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN56 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN56 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN57) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN57 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN57 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN58) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN58 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN58 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN59) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN59 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN59 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN60) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN60 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN60 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN61) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN61 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN61 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN62) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN62 data interrupt %s\n\r", ADCGIRQEN2bits.AGIEN62 ? "enabled" : "disabled");
//    if (ADCGIRQEN2bits.AGIEN63) terminalTextAttributes(GREEN_COLOR, BLACK_COLOR, NORMAL_FONT);
//    else terminalTextAttributes(RED_COLOR, BLACK_COLOR, NORMAL_FONT);
//    printf("    Channel AN63 data interrupt %s\n\r\n\r", ADCGIRQEN2bits.AGIEN63 ? "enabled" : "disabled");
    
    terminalTextAttributesReset();
    
}
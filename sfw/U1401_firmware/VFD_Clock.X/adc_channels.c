
#warning "remove this shit"
#include <stdio.h>

#include "adc_channels.h"

#include "32mz_interrupt_control.h"
#include "telemetry.h"

/*
 * 
 * Used ADC channels: 
 * AN7 (Pin RB12) - VBAT ADC
 * AN10 (PIN RB15) - POS3P3_BACKUP_ADC
 * AN43 - Internal VREF
 * AN44 - Die Temp
 * 
 * */

// this function sets up ADC channels
void adcChannelsInitialize(void) {
 
    /* Select ADC input mode for each channel*/
    ADCIMCON1bits.DIFF7  = 0; // Single ended mode
    ADCIMCON1bits.SIGN7  = 0; //unsigned data format
    ADCIMCON1bits.DIFF10 = 0; // Single ended mode
    ADCIMCON1bits.SIGN10 = 0; //unsigned data format
    ADCIMCON3bits.DIFF43 = 0; // Single ended mode
    ADCIMCON3bits.SIGN43 = 0; // unsigned data format
    ADCIMCON3bits.DIFF44 = 0; // Single ended mode
    ADCIMCON3bits.SIGN44 = 0; // unsigned data format
    
    /* Configure interrupt enables */
    ADCGIRQEN1bits.AGIEN7  = 1;     // enable data ready 7 IRQ
    ADCGIRQEN1bits.AGIEN10 = 1;     // enable data ready 10 IRQ
    ADCGIRQEN2bits.AGIEN43 = 1;     // enable data ready 43 IRQ
    ADCGIRQEN2bits.AGIEN44 = 1;     // enable data ready 44 IRQ
    
    // set IRQ priorities
    setInterruptPriority(ADC_Data_7, 1);
    setInterruptPriority(ADC_Data_10, 1);
    setInterruptPriority(ADC_Data_43, 1);
    setInterruptPriority(ADC_Data_44, 1);
    
    // set IRQ subpriorities
    setInterruptSubpriority(ADC_Data_7, 0);
    setInterruptSubpriority(ADC_Data_10, 1);
    setInterruptSubpriority(ADC_Data_43, 2);
    setInterruptSubpriority(ADC_Data_44, 3);
    
    /* Configure common scan */
    ADCCSS1bits.CSS7 = 1;           // Enable channel 7 for common scan
    ADCCSS1bits.CSS10 = 1;          // Enable channel 10 for common scan
    ADCCSS2bits.CSS43 = 1;          // Enable Channel 43 for common scan
    ADCCSS2bits.CSS44 = 1;          // Enable Channel 44 for common scan
    
    // clear interrupt flags
    clearInterruptFlag(ADC_Data_7);
    clearInterruptFlag(ADC_Data_10);
    clearInterruptFlag(ADC_Data_43);
    clearInterruptFlag(ADC_Data_44);
    
    // enable data ready interrupts
    enableInterrupt(ADC_Data_7);
    enableInterrupt(ADC_Data_10);
    enableInterrupt(ADC_Data_43);
    enableInterrupt(ADC_Data_44);
    
}

// these ISRs are triggered when data for their respective ADC channel is ready
void __ISR(_ADC_DATA7_VECTOR, IPL1SRS) ADCData7ISR(void) {
 
    // check to see if data is actually ready
    if (ADCDSTAT1bits.ARDY7) {
        
        // copy ADC conversion result into telemetry
        telemetry.battery_voltage = (double) (ADCDATA7 * ADC_VOLTS_PER_LSB * adc_cal_gain * 2.0);
        
    }
    
    // clear IRQ
    clearInterruptFlag(ADC_Data_7);
    
}

void __ISR(_ADC_DATA10_VECTOR, IPL1SRS) ADCData10ISR(void) {
 
    // check to see if data is actually ready
    if (ADCDSTAT1bits.ARDY10) {
        
        // copy ADC conversion result into telemetry
        telemetry.mcu_vdd = (double) (ADCDATA10 * ADC_VOLTS_PER_LSB * adc_cal_gain * 2.0);
        
    }
    
    // clear IRQ
    clearInterruptFlag(ADC_Data_10);
    
}

void __ISR(_ADC_DATA43_VECTOR, IPL1SRS) ADCData43ISR(void) {

    // check to see if data is actually ready
    if (ADCDSTAT2bits.ARDY43) {
        // copy ADC conversion result into telemetry
        telemetry.adc_vref_voltage = (double) ADCDATA43 * ADC_VOLTS_PER_LSB;
        // compensate for errors in the ADC, we know VREF is supposed to be 1.2V
        adc_cal_gain = (1.2 / telemetry.adc_vref_voltage);
        
    }
    
    // clear IRQ
    clearInterruptFlag(ADC_Data_43);
    
}

void __ISR(_ADC_DATA44_VECTOR, IPL1SRS) ADCData44ISR(void) {
    
    // check to see if data is actually ready
    if (ADCDSTAT2bits.ARDY44) {

        // copy ADC conversion result into telemetry
        telemetry.mcu_die_temp = (double) ((ADCDATA44 * ADC_VOLTS_PER_LSB * adc_cal_gain) - 0.7) / 0.005;
        
    }
    
    // clear IRQ
    clearInterruptFlag(ADC_Data_44);
    
}


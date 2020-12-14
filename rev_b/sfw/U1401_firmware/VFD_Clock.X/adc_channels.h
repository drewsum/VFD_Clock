/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _ADC_CHANNELS_H    /* Guard against multiple inclusion */
#define _ADC_CHANNELS_H

#include <xc.h>

// These are macros needed for defining ISRs, included in XC32
#include <sys/attribs.h>

#include "adc.h"

#define DIE_TEMP_OFFSET     -90.0

// this function sets up ADC channels
void adcChannelsInitialize(void);

// these ISRs are triggered when data for their respective ADC channel is ready
void __ISR(_ADC_DATA7_VECTOR, IPL1SRS) ADCData7ISR(void);
void __ISR(_ADC_DATA43_VECTOR, IPL1SRS) ADCData43ISR(void);
void __ISR(_ADC_DATA44_VECTOR, IPL1SRS) ADCData44ISR(void);


// this function prints out ADC channel status
void printADCChannelStatus(void);

#endif /* _ADC_CHANNELS_H */

/* *****************************************************************************
 End of File
 */

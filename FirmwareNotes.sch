EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 26 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 15 24
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 770  970  0    60   ~ 0
* All of PORTC should be configured as open drain outputs for sinking current from LEDs
Text Notes 770  1070 0    60   ~ 0
* All of PORTA is used for ADC measurments/external oscillator
Text Notes 770  1170 0    60   ~ 0
* Most of PORTD is used for driving grid switches, can be set up as a 6 bit structure located at the PORTC memory address
Text Notes 770  1270 0    60   ~ 0
* All of PORTF is used for driving anode switches, so smae thing as above with 8 bits
Text Notes 770  1370 0    60   ~ 0
* All of PORTE is used for measuring pushbuttons so all should be set as inputs with IOC's enabled
Text Notes 770  1470 0    60   ~ 0
* Same with PORTB except with only 6 bits, and used for generic input logic signals
Text Notes 770  1570 0    60   ~ 0
* RD0 and RD1 should be routed to SMT1 and SMT2 so that the signal measurement timers can be used to measure dipslay update rate and refresh rate
Text Notes 770  1870 0    60   ~ 0
* RG0 and RG1 will be the inputs to CCPx modules to measure the switching frequency (maybe duty cycle as well) of VFF and VAN supplies
Text Notes 770  1960 0    60   ~ 0
* RG4 should be set/cleared every other display refresh cycle, and the input snese ciruit queued when cleared, so that energy/charge per display cycle can be measured
Text Notes 770  2060 0    60   ~ 0
* While operating, the external 16MHz clock with internal 4x PLL will yield an FOSC of 64MHz. While the display is off, FOSC should be switched to something slower internally to minimize power consumption
Text Notes 770  1770 0    60   ~ 0
* EUSART5 must be used for USB serial communication since only this module can be routed to PORTG
Text Notes 770  1670 0    60   ~ 0
* RG3 should be configured as an output for a CCPx module to produce a PWM signal for dimming LEDs on the board. Display itself will be dimmed in software by adjusting the on time
$EndSCHEMATC

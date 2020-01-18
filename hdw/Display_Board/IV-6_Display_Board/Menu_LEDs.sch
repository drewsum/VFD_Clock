EESchema Schematic File Version 4
LIBS:IV-6_Display_Board-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 5 9
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Interface_Expansion:TCA9555RGER U?
U 1 1 5E0AA272
P 5060 3310
F 0 "U?" H 4610 4260 50  0000 C CNN
F 1 "TCA9555RGER" H 5060 3310 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-24-1EP_4x4mm_P0.5mm_EP2.6x2.6mm" H 6260 2310 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tca9555.pdf" H 4560 4210 50  0001 C CNN
	1    5060 3310
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E0AB497
P 5060 2210
F 0 "#PWR?" H 5060 2060 50  0001 C CNN
F 1 "+5V" H 5060 2350 50  0000 C CNN
F 2 "" H 5060 2210 50  0001 C CNN
F 3 "" H 5060 2210 50  0001 C CNN
	1    5060 2210
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0AB88F
P 5110 4490
F 0 "#PWR?" H 5110 4240 50  0001 C CNN
F 1 "GND" H 5110 4340 50  0000 C CNN
F 2 "" H 5110 4490 50  0001 C CNN
F 3 "" H 5110 4490 50  0001 C CNN
	1    5110 4490
	1    0    0    -1  
$EndComp
Wire Wire Line
	5110 4490 5110 4450
Wire Wire Line
	5110 4450 5060 4450
Wire Wire Line
	5060 4450 5060 4410
Wire Wire Line
	5110 4450 5160 4450
Wire Wire Line
	5160 4450 5160 4410
Connection ~ 5110 4450
NoConn ~ 4360 2710
Text GLabel 4360 2510 0    50   BiDi ~ 0
I2C_DSP_SDA
Text GLabel 4360 2610 0    50   Input ~ 0
I2C_DSP_SCL
Text Notes 7780 3350 0    50   ~ 0
Menu LEDs
$EndSCHEMATC

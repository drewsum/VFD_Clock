EESchema Schematic File Version 4
LIBS:IV-6_Display_Board-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 10 12
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
L Custom_Library:MCP9804 U?
U 1 1 5E3DEAA6
P 5310 2550
F 0 "U?" H 5060 3000 50  0000 C CNN
F 1 "MCP9804" H 5710 3000 50  0000 C CNN
F 2 "Package_DFN_QFN:DFN-8-1EP_3x2mm_P0.5mm_EP1.75x1.45mm" H 4210 2050 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 5060 3000 50  0001 C CNN
F 4 "MCP9804T-E/MCCT-ND" H 5310 2550 50  0001 C CNN "Digi-Key PN"
	1    5310 2550
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E3DFBBD
P 5310 3130
F 0 "#PWR?" H 5310 2880 50  0001 C CNN
F 1 "GND" H 5310 2980 50  0000 C CNN
F 2 "" H 5310 3130 50  0001 C CNN
F 3 "" H 5310 3130 50  0001 C CNN
	1    5310 3130
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5310 3130 5310 3090
Wire Wire Line
	5310 3090 5210 3090
Wire Wire Line
	5210 3090 5210 3050
Connection ~ 5310 3090
Wire Wire Line
	5310 3090 5310 3050
$Comp
L power:+5V #PWR?
U 1 1 5E3E0334
P 5310 2050
F 0 "#PWR?" H 5310 1900 50  0001 C CNN
F 1 "+5V" H 5310 2190 50  0000 C CNN
F 2 "" H 5310 2050 50  0001 C CNN
F 3 "" H 5310 2050 50  0001 C CNN
	1    5310 2050
	-1   0    0    -1  
$EndComp
NoConn ~ 4910 2550
Text GLabel 5710 2250 2    50   BiDi ~ 0
I2C_DSP_SDA
Text GLabel 5710 2350 2    50   Input ~ 0
I2C_DSP_SCL
$Comp
L Custom_Library:I2C_Address DOC?
U 1 1 5E3E2D49
P 6290 3360
F 0 "DOC?" H 6290 3610 60  0001 C CNN
F 1 "I2C_Address" H 5840 3360 60  0000 L CNN
F 2 "" H 6290 3710 60  0001 C CNN
F 3 "" H 6290 3710 60  0001 C CNN
	1    6290 3360
	1    0    0    -1  
$EndComp
$EndSCHEMATC

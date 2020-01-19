EESchema Schematic File Version 4
LIBS:IV-6_Display_Board-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 5 12
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
P 2960 3100
F 0 "U?" H 2510 4050 50  0000 C CNN
F 1 "TCA9555RGER" H 2960 3100 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-24-1EP_4x4mm_P0.5mm_EP2.6x2.6mm" H 4160 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tca9555.pdf" H 2460 4000 50  0001 C CNN
	1    2960 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E0AB497
P 2960 2000
F 0 "#PWR?" H 2960 1850 50  0001 C CNN
F 1 "+5V" H 2960 2140 50  0000 C CNN
F 2 "" H 2960 2000 50  0001 C CNN
F 3 "" H 2960 2000 50  0001 C CNN
	1    2960 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0AB88F
P 3010 4280
F 0 "#PWR?" H 3010 4030 50  0001 C CNN
F 1 "GND" H 3010 4130 50  0000 C CNN
F 2 "" H 3010 4280 50  0001 C CNN
F 3 "" H 3010 4280 50  0001 C CNN
	1    3010 4280
	1    0    0    -1  
$EndComp
Wire Wire Line
	3010 4280 3010 4240
Wire Wire Line
	3010 4240 2960 4240
Wire Wire Line
	2960 4240 2960 4200
Wire Wire Line
	3010 4240 3060 4240
Wire Wire Line
	3060 4240 3060 4200
Connection ~ 3010 4240
NoConn ~ 2260 2500
Text GLabel 2260 2300 0    50   BiDi ~ 0
I2C_DSP_SDA
Text GLabel 2260 2400 0    50   Input ~ 0
I2C_DSP_SCL
Text GLabel 3660 3200 2    50   Output ~ 0
24HR_Mode_LED
Text GLabel 3660 2300 2    50   Output ~ 0
Display_Time_LED
Text GLabel 3660 2500 2    50   Output ~ 0
Display_Date_LED
Text GLabel 3660 2900 2    50   Output ~ 0
Display_Alarm_LED
Text GLabel 3660 2400 2    50   Output ~ 0
Set_Time_LED
Text GLabel 3660 2600 2    50   Output ~ 0
Set_Date_LED
Text GLabel 3660 3000 2    50   Output ~ 0
Set_Alarm_LED
Text GLabel 3660 2700 2    50   Output ~ 0
Display_Weekday_LED
Text GLabel 3660 2800 2    50   Output ~ 0
Set_Weekday_LED
$Comp
L Custom_Library:I2C_Address DOC?
U 1 1 5E3D77B3
P 4030 4480
F 0 "DOC?" H 4030 4730 60  0001 C CNN
F 1 "I2C_Address" H 3580 4480 60  0000 L CNN
F 2 "" H 4030 4830 60  0001 C CNN
F 3 "" H 4030 4830 60  0001 C CNN
	1    4030 4480
	1    0    0    -1  
$EndComp
Text GLabel 3660 3300 2    50   Output ~ 0
Alarm_Enable_LED
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E25E93E
P 2920 5060
AR Path="/5C1D5CD8/5E25E93E" Ref="C?"  Part="1" 
AR Path="/5C1D5CCA/5E25E93E" Ref="C?"  Part="1" 
AR Path="/5C26E09A/5E25E93E" Ref="C?"  Part="1" 
AR Path="/5D739492/5E25E93E" Ref="C?"  Part="1" 
AR Path="/5E28CFDF/5E25E93E" Ref="C?"  Part="1" 
AR Path="/5E36CE18/5E25E93E" Ref="C?"  Part="1" 
AR Path="/5E3C80C8/5E25E93E" Ref="C?"  Part="1" 
AR Path="/5E3C97B4/5E25E93E" Ref="C?"  Part="1" 
AR Path="/5E0A7959/5E25E93E" Ref="C?"  Part="1" 
F 0 "C?" H 2945 5160 50  0000 L CNN
F 1 "0.1uF" H 2945 4960 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2958 4910 50  0001 C CNN
F 3 "" H 2945 5160 50  0001 C CNN
F 4 "311-1344-1-ND" H 3345 5560 60  0001 C CNN "Digi-Key PN"
F 5 "0603" H 2770 5160 50  0000 R CNN "display_footprint"
F 6 "50V" H 2770 5060 50  0000 R CNN "Voltage"
F 7 "X7R" H 2770 4960 50  0000 R CNN "Dielectric"
	1    2920 5060
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E25E944
P 2920 5210
AR Path="/5E28CFDF/5E25E944" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5E25E944" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5E25E944" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5E25E944" Ref="#PWR?"  Part="1" 
AR Path="/5E0A7959/5E25E944" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2920 4960 50  0001 C CNN
F 1 "GND" H 2920 5060 50  0000 C CNN
F 2 "" H 2920 5210 50  0001 C CNN
F 3 "" H 2920 5210 50  0001 C CNN
	1    2920 5210
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E25E974
P 2920 4910
F 0 "#PWR?" H 2920 4760 50  0001 C CNN
F 1 "+5V" H 2920 5050 50  0000 C CNN
F 2 "" H 2920 4910 50  0001 C CNN
F 3 "" H 2920 4910 50  0001 C CNN
	1    2920 4910
	1    0    0    -1  
$EndComp
$EndSCHEMATC

EESchema Schematic File Version 4
LIBS:IV-6_Display_Board-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 5 13
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
Text GLabel 3660 3300 2    50   Output ~ 0
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
F 1 "0x20" H 3580 4480 60  0000 L CNN
F 2 "" H 4030 4830 60  0001 C CNN
F 3 "" H 4030 4830 60  0001 C CNN
	1    4030 4480
	1    0    0    -1  
$EndComp
Text GLabel 3660 3200 2    50   Output ~ 0
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
$Comp
L power:GND #PWR?
U 1 1 5E2ABD89
P 2260 3900
F 0 "#PWR?" H 2260 3650 50  0001 C CNN
F 1 "GND" V 2260 3750 50  0000 R CNN
F 2 "" H 2260 3900 50  0001 C CNN
F 3 "" H 2260 3900 50  0001 C CNN
	1    2260 3900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2AC34B
P 2260 3800
F 0 "#PWR?" H 2260 3550 50  0001 C CNN
F 1 "GND" V 2260 3650 50  0000 R CNN
F 2 "" H 2260 3800 50  0001 C CNN
F 3 "" H 2260 3800 50  0001 C CNN
	1    2260 3800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2AC4ED
P 2260 3700
F 0 "#PWR?" H 2260 3450 50  0001 C CNN
F 1 "GND" V 2260 3550 50  0000 R CNN
F 2 "" H 2260 3700 50  0001 C CNN
F 3 "" H 2260 3700 50  0001 C CNN
	1    2260 3700
	0    1    1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5E2AE0C0
P 8120 1650
F 0 "D?" H 8120 1750 50  0000 C CNN
F 1 "Cyan" H 8120 1550 50  0000 C CNN
F 2 "" H 8120 1650 50  0001 C CNN
F 3 "~" H 8120 1650 50  0001 C CNN
	1    8120 1650
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2B4E05
P 7820 1650
AR Path="/5C3165D8/5E2B4E05" Ref="R?"  Part="1" 
AR Path="/5C26E09A/5E2B4E05" Ref="R?"  Part="1" 
AR Path="/5D739492/5E2B4E05" Ref="R?"  Part="1" 
AR Path="/5E28CFDF/5E2B4E05" Ref="R?"  Part="1" 
AR Path="/5E36CE18/5E2B4E05" Ref="R?"  Part="1" 
AR Path="/5E3C80C8/5E2B4E05" Ref="R?"  Part="1" 
AR Path="/5E3C97B4/5E2B4E05" Ref="R?"  Part="1" 
AR Path="/5E3CBFDA/5E2B4E05" Ref="R?"  Part="1" 
AR Path="/5E0A7959/5E2B4E05" Ref="R?"  Part="1" 
F 0 "R?" V 7720 1650 50  0000 C CNN
F 1 "499" V 7820 1650 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7820 1650 50  0001 C CNN
F 3 "" H 7820 1650 50  0001 C CNN
F 4 "P499HCT-ND" H 8120 2050 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 7920 1650 50  0001 C CNN "display_footprint"
F 6 "1%" V 8020 1650 50  0001 C CNN "Tolerance"
F 7 "1/10W" V 8120 1650 50  0001 C CNN "Wattage"
	1    7820 1650
	0    -1   1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5E2B682B
P 8120 1950
F 0 "D?" H 8120 2050 50  0000 C CNN
F 1 "Cyan" H 8120 1850 50  0000 C CNN
F 2 "" H 8120 1950 50  0001 C CNN
F 3 "~" H 8120 1950 50  0001 C CNN
	1    8120 1950
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2B6839
P 7820 1950
AR Path="/5C3165D8/5E2B6839" Ref="R?"  Part="1" 
AR Path="/5C26E09A/5E2B6839" Ref="R?"  Part="1" 
AR Path="/5D739492/5E2B6839" Ref="R?"  Part="1" 
AR Path="/5E28CFDF/5E2B6839" Ref="R?"  Part="1" 
AR Path="/5E36CE18/5E2B6839" Ref="R?"  Part="1" 
AR Path="/5E3C80C8/5E2B6839" Ref="R?"  Part="1" 
AR Path="/5E3C97B4/5E2B6839" Ref="R?"  Part="1" 
AR Path="/5E3CBFDA/5E2B6839" Ref="R?"  Part="1" 
AR Path="/5E0A7959/5E2B6839" Ref="R?"  Part="1" 
F 0 "R?" V 7720 1950 50  0000 C CNN
F 1 "499" V 7820 1950 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7820 1950 50  0001 C CNN
F 3 "" H 7820 1950 50  0001 C CNN
F 4 "P499HCT-ND" H 8120 2350 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 7920 1950 50  0001 C CNN "display_footprint"
F 6 "1%" V 8020 1950 50  0001 C CNN "Tolerance"
F 7 "1/10W" V 8120 1950 50  0001 C CNN "Wattage"
	1    7820 1950
	0    -1   1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5E2B73B3
P 8120 2250
F 0 "D?" H 8120 2350 50  0000 C CNN
F 1 "Cyan" H 8120 2150 50  0000 C CNN
F 2 "" H 8120 2250 50  0001 C CNN
F 3 "~" H 8120 2250 50  0001 C CNN
	1    8120 2250
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2B73C1
P 7820 2250
AR Path="/5C3165D8/5E2B73C1" Ref="R?"  Part="1" 
AR Path="/5C26E09A/5E2B73C1" Ref="R?"  Part="1" 
AR Path="/5D739492/5E2B73C1" Ref="R?"  Part="1" 
AR Path="/5E28CFDF/5E2B73C1" Ref="R?"  Part="1" 
AR Path="/5E36CE18/5E2B73C1" Ref="R?"  Part="1" 
AR Path="/5E3C80C8/5E2B73C1" Ref="R?"  Part="1" 
AR Path="/5E3C97B4/5E2B73C1" Ref="R?"  Part="1" 
AR Path="/5E3CBFDA/5E2B73C1" Ref="R?"  Part="1" 
AR Path="/5E0A7959/5E2B73C1" Ref="R?"  Part="1" 
F 0 "R?" V 7720 2250 50  0000 C CNN
F 1 "499" V 7820 2250 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7820 2250 50  0001 C CNN
F 3 "" H 7820 2250 50  0001 C CNN
F 4 "P499HCT-ND" H 8120 2650 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 7920 2250 50  0001 C CNN "display_footprint"
F 6 "1%" V 8020 2250 50  0001 C CNN "Tolerance"
F 7 "1/10W" V 8120 2250 50  0001 C CNN "Wattage"
	1    7820 2250
	0    -1   1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5E2B73CB
P 8120 2550
F 0 "D?" H 8120 2650 50  0000 C CNN
F 1 "Cyan" H 8120 2450 50  0000 C CNN
F 2 "" H 8120 2550 50  0001 C CNN
F 3 "~" H 8120 2550 50  0001 C CNN
	1    8120 2550
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2B73D9
P 7820 2550
AR Path="/5C3165D8/5E2B73D9" Ref="R?"  Part="1" 
AR Path="/5C26E09A/5E2B73D9" Ref="R?"  Part="1" 
AR Path="/5D739492/5E2B73D9" Ref="R?"  Part="1" 
AR Path="/5E28CFDF/5E2B73D9" Ref="R?"  Part="1" 
AR Path="/5E36CE18/5E2B73D9" Ref="R?"  Part="1" 
AR Path="/5E3C80C8/5E2B73D9" Ref="R?"  Part="1" 
AR Path="/5E3C97B4/5E2B73D9" Ref="R?"  Part="1" 
AR Path="/5E3CBFDA/5E2B73D9" Ref="R?"  Part="1" 
AR Path="/5E0A7959/5E2B73D9" Ref="R?"  Part="1" 
F 0 "R?" V 7720 2550 50  0000 C CNN
F 1 "499" V 7820 2550 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7820 2550 50  0001 C CNN
F 3 "" H 7820 2550 50  0001 C CNN
F 4 "P499HCT-ND" H 8120 2950 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 7920 2550 50  0001 C CNN "display_footprint"
F 6 "1%" V 8020 2550 50  0001 C CNN "Tolerance"
F 7 "1/10W" V 8120 2550 50  0001 C CNN "Wattage"
	1    7820 2550
	0    -1   1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5E2B982B
P 8120 2850
F 0 "D?" H 8120 2950 50  0000 C CNN
F 1 "Cyan" H 8120 2750 50  0000 C CNN
F 2 "" H 8120 2850 50  0001 C CNN
F 3 "~" H 8120 2850 50  0001 C CNN
	1    8120 2850
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2B9839
P 7820 2850
AR Path="/5C3165D8/5E2B9839" Ref="R?"  Part="1" 
AR Path="/5C26E09A/5E2B9839" Ref="R?"  Part="1" 
AR Path="/5D739492/5E2B9839" Ref="R?"  Part="1" 
AR Path="/5E28CFDF/5E2B9839" Ref="R?"  Part="1" 
AR Path="/5E36CE18/5E2B9839" Ref="R?"  Part="1" 
AR Path="/5E3C80C8/5E2B9839" Ref="R?"  Part="1" 
AR Path="/5E3C97B4/5E2B9839" Ref="R?"  Part="1" 
AR Path="/5E3CBFDA/5E2B9839" Ref="R?"  Part="1" 
AR Path="/5E0A7959/5E2B9839" Ref="R?"  Part="1" 
F 0 "R?" V 7720 2850 50  0000 C CNN
F 1 "499" V 7820 2850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7820 2850 50  0001 C CNN
F 3 "" H 7820 2850 50  0001 C CNN
F 4 "P499HCT-ND" H 8120 3250 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 7920 2850 50  0001 C CNN "display_footprint"
F 6 "1%" V 8020 2850 50  0001 C CNN "Tolerance"
F 7 "1/10W" V 8120 2850 50  0001 C CNN "Wattage"
	1    7820 2850
	0    -1   1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5E2B9843
P 8120 3150
F 0 "D?" H 8120 3250 50  0000 C CNN
F 1 "Cyan" H 8120 3050 50  0000 C CNN
F 2 "" H 8120 3150 50  0001 C CNN
F 3 "~" H 8120 3150 50  0001 C CNN
	1    8120 3150
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2B9851
P 7820 3150
AR Path="/5C3165D8/5E2B9851" Ref="R?"  Part="1" 
AR Path="/5C26E09A/5E2B9851" Ref="R?"  Part="1" 
AR Path="/5D739492/5E2B9851" Ref="R?"  Part="1" 
AR Path="/5E28CFDF/5E2B9851" Ref="R?"  Part="1" 
AR Path="/5E36CE18/5E2B9851" Ref="R?"  Part="1" 
AR Path="/5E3C80C8/5E2B9851" Ref="R?"  Part="1" 
AR Path="/5E3C97B4/5E2B9851" Ref="R?"  Part="1" 
AR Path="/5E3CBFDA/5E2B9851" Ref="R?"  Part="1" 
AR Path="/5E0A7959/5E2B9851" Ref="R?"  Part="1" 
F 0 "R?" V 7720 3150 50  0000 C CNN
F 1 "499" V 7820 3150 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7820 3150 50  0001 C CNN
F 3 "" H 7820 3150 50  0001 C CNN
F 4 "P499HCT-ND" H 8120 3550 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 7920 3150 50  0001 C CNN "display_footprint"
F 6 "1%" V 8020 3150 50  0001 C CNN "Tolerance"
F 7 "1/10W" V 8120 3150 50  0001 C CNN "Wattage"
	1    7820 3150
	0    -1   1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5E2B985B
P 8120 3450
F 0 "D?" H 8120 3550 50  0000 C CNN
F 1 "Cyan" H 8120 3350 50  0000 C CNN
F 2 "" H 8120 3450 50  0001 C CNN
F 3 "~" H 8120 3450 50  0001 C CNN
	1    8120 3450
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2B9869
P 7820 3450
AR Path="/5C3165D8/5E2B9869" Ref="R?"  Part="1" 
AR Path="/5C26E09A/5E2B9869" Ref="R?"  Part="1" 
AR Path="/5D739492/5E2B9869" Ref="R?"  Part="1" 
AR Path="/5E28CFDF/5E2B9869" Ref="R?"  Part="1" 
AR Path="/5E36CE18/5E2B9869" Ref="R?"  Part="1" 
AR Path="/5E3C80C8/5E2B9869" Ref="R?"  Part="1" 
AR Path="/5E3C97B4/5E2B9869" Ref="R?"  Part="1" 
AR Path="/5E3CBFDA/5E2B9869" Ref="R?"  Part="1" 
AR Path="/5E0A7959/5E2B9869" Ref="R?"  Part="1" 
F 0 "R?" V 7720 3450 50  0000 C CNN
F 1 "499" V 7820 3450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7820 3450 50  0001 C CNN
F 3 "" H 7820 3450 50  0001 C CNN
F 4 "P499HCT-ND" H 8120 3850 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 7920 3450 50  0001 C CNN "display_footprint"
F 6 "1%" V 8020 3450 50  0001 C CNN "Tolerance"
F 7 "1/10W" V 8120 3450 50  0001 C CNN "Wattage"
	1    7820 3450
	0    -1   1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5E2B9873
P 8120 3750
F 0 "D?" H 8120 3850 50  0000 C CNN
F 1 "Cyan" H 8120 3650 50  0000 C CNN
F 2 "" H 8120 3750 50  0001 C CNN
F 3 "~" H 8120 3750 50  0001 C CNN
	1    8120 3750
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2B9881
P 7820 3750
AR Path="/5C3165D8/5E2B9881" Ref="R?"  Part="1" 
AR Path="/5C26E09A/5E2B9881" Ref="R?"  Part="1" 
AR Path="/5D739492/5E2B9881" Ref="R?"  Part="1" 
AR Path="/5E28CFDF/5E2B9881" Ref="R?"  Part="1" 
AR Path="/5E36CE18/5E2B9881" Ref="R?"  Part="1" 
AR Path="/5E3C80C8/5E2B9881" Ref="R?"  Part="1" 
AR Path="/5E3C97B4/5E2B9881" Ref="R?"  Part="1" 
AR Path="/5E3CBFDA/5E2B9881" Ref="R?"  Part="1" 
AR Path="/5E0A7959/5E2B9881" Ref="R?"  Part="1" 
F 0 "R?" V 7720 3750 50  0000 C CNN
F 1 "499" V 7820 3750 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7820 3750 50  0001 C CNN
F 3 "" H 7820 3750 50  0001 C CNN
F 4 "P499HCT-ND" H 8120 4150 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 7920 3750 50  0001 C CNN "display_footprint"
F 6 "1%" V 8020 3750 50  0001 C CNN "Tolerance"
F 7 "1/10W" V 8120 3750 50  0001 C CNN "Wattage"
	1    7820 3750
	0    -1   1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5E2BC155
P 8120 4050
F 0 "D?" H 8120 4150 50  0000 C CNN
F 1 "Cyan" H 8120 3950 50  0000 C CNN
F 2 "" H 8120 4050 50  0001 C CNN
F 3 "~" H 8120 4050 50  0001 C CNN
	1    8120 4050
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2BC163
P 7820 4050
AR Path="/5C3165D8/5E2BC163" Ref="R?"  Part="1" 
AR Path="/5C26E09A/5E2BC163" Ref="R?"  Part="1" 
AR Path="/5D739492/5E2BC163" Ref="R?"  Part="1" 
AR Path="/5E28CFDF/5E2BC163" Ref="R?"  Part="1" 
AR Path="/5E36CE18/5E2BC163" Ref="R?"  Part="1" 
AR Path="/5E3C80C8/5E2BC163" Ref="R?"  Part="1" 
AR Path="/5E3C97B4/5E2BC163" Ref="R?"  Part="1" 
AR Path="/5E3CBFDA/5E2BC163" Ref="R?"  Part="1" 
AR Path="/5E0A7959/5E2BC163" Ref="R?"  Part="1" 
F 0 "R?" V 7720 4050 50  0000 C CNN
F 1 "499" V 7820 4050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7820 4050 50  0001 C CNN
F 3 "" H 7820 4050 50  0001 C CNN
F 4 "P499HCT-ND" H 8120 4450 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 7920 4050 50  0001 C CNN "display_footprint"
F 6 "1%" V 8020 4050 50  0001 C CNN "Tolerance"
F 7 "1/10W" V 8120 4050 50  0001 C CNN "Wattage"
	1    7820 4050
	0    -1   1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5E2BC16D
P 8120 4350
F 0 "D?" H 8120 4450 50  0000 C CNN
F 1 "Cyan" H 8120 4250 50  0000 C CNN
F 2 "" H 8120 4350 50  0001 C CNN
F 3 "~" H 8120 4350 50  0001 C CNN
	1    8120 4350
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2BC17B
P 7820 4350
AR Path="/5C3165D8/5E2BC17B" Ref="R?"  Part="1" 
AR Path="/5C26E09A/5E2BC17B" Ref="R?"  Part="1" 
AR Path="/5D739492/5E2BC17B" Ref="R?"  Part="1" 
AR Path="/5E28CFDF/5E2BC17B" Ref="R?"  Part="1" 
AR Path="/5E36CE18/5E2BC17B" Ref="R?"  Part="1" 
AR Path="/5E3C80C8/5E2BC17B" Ref="R?"  Part="1" 
AR Path="/5E3C97B4/5E2BC17B" Ref="R?"  Part="1" 
AR Path="/5E3CBFDA/5E2BC17B" Ref="R?"  Part="1" 
AR Path="/5E0A7959/5E2BC17B" Ref="R?"  Part="1" 
F 0 "R?" V 7720 4350 50  0000 C CNN
F 1 "499" V 7820 4350 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7820 4350 50  0001 C CNN
F 3 "" H 7820 4350 50  0001 C CNN
F 4 "P499HCT-ND" H 8120 4750 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 7920 4350 50  0001 C CNN "display_footprint"
F 6 "1%" V 8020 4350 50  0001 C CNN "Tolerance"
F 7 "1/10W" V 8120 4350 50  0001 C CNN "Wattage"
	1    7820 4350
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2BF5D8
P 8430 4510
F 0 "#PWR?" H 8430 4260 50  0001 C CNN
F 1 "GND" H 8430 4360 50  0000 C CNN
F 2 "" H 8430 4510 50  0001 C CNN
F 3 "" H 8430 4510 50  0001 C CNN
	1    8430 4510
	1    0    0    -1  
$EndComp
Wire Wire Line
	8430 4510 8430 4350
Wire Wire Line
	8430 1650 8270 1650
Wire Wire Line
	8270 1950 8430 1950
Connection ~ 8430 1950
Wire Wire Line
	8430 1950 8430 1650
Wire Wire Line
	8430 2250 8270 2250
Wire Wire Line
	8270 2550 8430 2550
Connection ~ 8430 2250
Wire Wire Line
	8430 2250 8430 1950
Connection ~ 8430 2550
Wire Wire Line
	8430 2550 8430 2250
Wire Wire Line
	8430 2850 8270 2850
Wire Wire Line
	8270 3150 8430 3150
Wire Wire Line
	8430 3450 8270 3450
Wire Wire Line
	8270 3750 8430 3750
Connection ~ 8430 2850
Wire Wire Line
	8430 2850 8430 2550
Connection ~ 8430 3150
Wire Wire Line
	8430 3150 8430 2850
Connection ~ 8430 3450
Wire Wire Line
	8430 3450 8430 3150
Connection ~ 8430 3750
Wire Wire Line
	8430 3750 8430 3450
Wire Wire Line
	8430 4050 8270 4050
Wire Wire Line
	8270 4350 8430 4350
Connection ~ 8430 4050
Wire Wire Line
	8430 4050 8430 3750
Connection ~ 8430 4350
Wire Wire Line
	8430 4350 8430 4050
Text GLabel 7670 4350 0    50   Input ~ 0
24HR_Mode_LED
Text GLabel 7670 1650 0    50   Input ~ 0
Display_Time_LED
Text GLabel 7670 2250 0    50   Input ~ 0
Display_Date_LED
Text GLabel 7670 3450 0    50   Input ~ 0
Display_Alarm_LED
Text GLabel 7670 1950 0    50   Input ~ 0
Set_Time_LED
Text GLabel 7670 2550 0    50   Input ~ 0
Set_Date_LED
Text GLabel 7670 3750 0    50   Input ~ 0
Set_Alarm_LED
Text GLabel 7670 2850 0    50   Input ~ 0
Display_Weekday_LED
Text GLabel 7670 3150 0    50   Input ~ 0
Set_Weekday_LED
Text GLabel 7670 4050 0    50   Input ~ 0
Alarm_Enable_LED
$EndSCHEMATC

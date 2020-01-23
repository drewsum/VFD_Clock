EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 23 30
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
L Custom_Library:DS1683 U?
U 1 1 5B5039F7
P 5550 4100
F 0 "U?" H 5550 3750 60  0000 C CNN
F 1 "DS1683" H 5550 4450 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 5450 4400 60  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DS1683.pdf" H 5450 4400 60  0001 C CNN
F 4 "DS1683S+-ND" H 5650 3850 60  0001 C CNN "Digi-Key PN"
	1    5550 4100
	1    0    0    -1  
$EndComp
NoConn ~ 5150 3900
$Comp
L power:GND #PWR?
U 1 1 5B50444E
P 5070 4380
F 0 "#PWR?" H 5070 4130 50  0001 C CNN
F 1 "GND" H 5070 4230 50  0000 C CNN
F 2 "" H 5070 4380 50  0001 C CNN
F 3 "" H 5070 4380 50  0001 C CNN
	1    5070 4380
	1    0    0    -1  
$EndComp
Wire Wire Line
	5070 4380 5070 4300
Wire Wire Line
	5070 4300 5150 4300
Wire Wire Line
	6030 3820 6030 3900
Wire Wire Line
	6030 3900 5950 3900
$Comp
L power:GND #PWR?
U 1 1 5B50648E
P 3040 4200
F 0 "#PWR?" H 3040 3950 50  0001 C CNN
F 1 "GND" H 3040 4050 50  0000 C CNN
F 2 "" H 3040 4200 50  0001 C CNN
F 3 "" H 3040 4200 50  0001 C CNN
	1    3040 4200
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5B5064C1
P 3040 4000
F 0 "#PWR?" H 3040 3850 50  0001 C CNN
F 1 "+3.3V" H 3040 4140 50  0000 C CNN
F 2 "" H 3040 4000 50  0000 C CNN
F 3 "" H 3040 4000 50  0000 C CNN
	1    3040 4000
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5B506A12
P 3900 4430
AR Path="/5A0A42E8/5B506A12" Ref="R?"  Part="1" 
AR Path="/5B4B0915/5B506A12" Ref="R?"  Part="1" 
AR Path="/5E07B870/5B506A12" Ref="R?"  Part="1" 
F 0 "R?" H 3840 4430 50  0000 R CNN
F 1 "10k" V 3900 4430 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 3900 4430 50  0001 C CNN
F 3 "" H 3900 4430 50  0001 C CNN
F 4 "0603" H 3970 4510 50  0000 L CNN "display_footprint"
F 5 "1%" H 3970 4430 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 3970 4360 50  0000 L CNN "Wattage"
	1    3900 4430
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5B506A55
P 3900 4580
F 0 "#PWR?" H 3900 4330 50  0001 C CNN
F 1 "GND" H 3900 4430 50  0000 C CNN
F 2 "" H 3900 4580 50  0001 C CNN
F 3 "" H 3900 4580 50  0001 C CNN
	1    3900 4580
	1    0    0    -1  
$EndComp
Wire Wire Line
	3290 4100 3900 4100
Wire Wire Line
	3900 4280 3900 4100
Connection ~ 3900 4100
Wire Wire Line
	3900 4100 5150 4100
Text GLabel 2740 4050 0    60   Input ~ 0
VAN_PGOOD
Text GLabel 2740 4150 0    60   Input ~ 0
VFF_PGOOD
$Comp
L Custom_Library:C_Custom C?
U 1 1 5B507AC7
P 5540 3120
F 0 "C?" H 5565 3220 50  0000 L CNN
F 1 "0.1uF" H 5565 3020 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5578 2970 50  0001 C CNN
F 3 "" H 5565 3220 50  0001 C CNN
F 4 "0603" H 5390 3220 50  0000 R CNN "display_footprint"
F 5 "50V" H 5390 3120 50  0000 R CNN "Voltage"
F 6 "X7R" H 5390 3020 50  0000 R CNN "Dielectric"
	1    5540 3120
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5B507B7D
P 5540 2970
F 0 "#PWR?" H 5540 2820 50  0001 C CNN
F 1 "+3.3V" H 5540 3110 50  0000 C CNN
F 2 "" H 5540 2970 50  0000 C CNN
F 3 "" H 5540 2970 50  0000 C CNN
	1    5540 2970
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5B507BED
P 5540 3270
F 0 "#PWR?" H 5540 3020 50  0001 C CNN
F 1 "GND" H 5540 3120 50  0000 C CNN
F 2 "" H 5540 3270 50  0001 C CNN
F 3 "" H 5540 3270 50  0001 C CNN
	1    5540 3270
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5B507D27
P 2990 4890
F 0 "C?" H 3015 4990 50  0000 L CNN
F 1 "0.1uF" H 3015 4790 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3028 4740 50  0001 C CNN
F 3 "" H 3015 4990 50  0001 C CNN
F 4 "0603" H 2840 4990 50  0000 R CNN "display_footprint"
F 5 "50V" H 2840 4890 50  0000 R CNN "Voltage"
F 6 "X7R" H 2840 4790 50  0000 R CNN "Dielectric"
	1    2990 4890
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5B507D2E
P 2990 4740
F 0 "#PWR?" H 2990 4590 50  0001 C CNN
F 1 "+3.3V" H 2990 4880 50  0000 C CNN
F 2 "" H 2990 4740 50  0000 C CNN
F 3 "" H 2990 4740 50  0000 C CNN
	1    2990 4740
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5B507D34
P 2990 5040
F 0 "#PWR?" H 2990 4790 50  0001 C CNN
F 1 "GND" H 2990 4890 50  0000 C CNN
F 2 "" H 2990 5040 50  0001 C CNN
F 3 "" H 2990 5040 50  0001 C CNN
	1    2990 5040
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5B504491
P 6030 3820
F 0 "#PWR?" H 6030 3670 50  0001 C CNN
F 1 "+3.3V" H 6030 3960 50  0000 C CNN
F 2 "" H 6030 3820 50  0000 C CNN
F 3 "" H 6030 3820 50  0000 C CNN
	1    6030 3820
	1    0    0    -1  
$EndComp
Text GLabel 5950 4200 2    50   Input ~ 0
I2C_SCL
Text GLabel 5950 4300 2    50   BiDi ~ 0
I2C_SDA
$Comp
L Custom_Library:74LVC1G97_Power U?
U 1 1 5E32F245
P 3040 4100
F 0 "U?" H 3100 4250 50  0000 L CNN
F 1 "74LVC1G97" H 3100 3950 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 3090 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g97.pdf" H 3090 4100 50  0001 C CNN
	1    3040 4100
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:I2C_Address DOC?
U 1 1 5E383387
P 5750 5100
F 0 "DOC?" H 5750 5350 60  0001 C CNN
F 1 "0x3B" H 5300 5100 60  0000 L CNN
F 2 "" H 5750 5450 60  0001 C CNN
F 3 "" H 5750 5450 60  0001 C CNN
	1    5750 5100
	1    0    0    -1  
$EndComp
$EndSCHEMATC

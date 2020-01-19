EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 29 30
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
L Timer_RTC:DS3231MZ U?
U 1 1 5E217505
P 5420 3530
F 0 "U?" H 5120 3880 50  0000 R CNN
F 1 "DS3231MZ" H 5870 3880 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 5420 3030 50  0001 C CNN
F 3 "http://datasheets.maximintegrated.com/en/ds/DS3231M.pdf" H 5420 2930 50  0001 C CNN
F 4 "DS3231MZ+-ND" H 5420 3530 50  0001 C CNN "Digi-Key PN"
	1    5420 3530
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E217898
P 5420 3930
F 0 "#PWR?" H 5420 3680 50  0001 C CNN
F 1 "GND" H 5420 3780 50  0000 C CNN
F 2 "" H 5420 3930 50  0001 C CNN
F 3 "" H 5420 3930 50  0001 C CNN
	1    5420 3930
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E217DBC
P 5420 3130
F 0 "#PWR?" H 5420 2980 50  0001 C CNN
F 1 "+3.3V" H 5500 3270 50  0000 C CNN
F 2 "" H 5420 3130 50  0001 C CNN
F 3 "" H 5420 3130 50  0001 C CNN
	1    5420 3130
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:VBAT #PWR?
U 1 1 5E2180E2
P 5320 3130
F 0 "#PWR?" H 5320 2980 50  0001 C CNN
F 1 "VBAT" H 5240 3270 50  0000 C CNN
F 2 "" H 5320 3130 50  0001 C CNN
F 3 "" H 5320 3130 50  0001 C CNN
	1    5320 3130
	1    0    0    -1  
$EndComp
NoConn ~ 5920 3330
NoConn ~ 5920 3630
NoConn ~ 4920 3730
Text GLabel 4920 3430 0    50   BiDi ~ 0
I2C_SDA
Text GLabel 4920 3330 0    50   Input ~ 0
I2C_SCL
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E21E9AC
P 5840 4720
F 0 "C?" H 5865 4820 50  0000 L CNN
F 1 "0.1uF" H 5865 4620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5878 4570 50  0001 C CNN
F 3 "" H 5865 4820 50  0001 C CNN
F 4 "0603" H 5690 4820 50  0000 R CNN "display_footprint"
F 5 "50V" H 5690 4720 50  0000 R CNN "Voltage"
F 6 "X7R" H 5690 4620 50  0000 R CNN "Dielectric"
	1    5840 4720
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E21E9B2
P 5840 4570
F 0 "#PWR?" H 5840 4420 50  0001 C CNN
F 1 "+3.3V" H 5840 4710 50  0000 C CNN
F 2 "" H 5840 4570 50  0000 C CNN
F 3 "" H 5840 4570 50  0000 C CNN
	1    5840 4570
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E21E9B8
P 5840 4870
F 0 "#PWR?" H 5840 4620 50  0001 C CNN
F 1 "GND" H 5840 4720 50  0000 C CNN
F 2 "" H 5840 4870 50  0001 C CNN
F 3 "" H 5840 4870 50  0001 C CNN
	1    5840 4870
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E220EDC
P 5110 4720
F 0 "C?" H 5135 4820 50  0000 L CNN
F 1 "0.1uF" H 5135 4620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5148 4570 50  0001 C CNN
F 3 "" H 5135 4820 50  0001 C CNN
F 4 "0603" H 4960 4820 50  0000 R CNN "display_footprint"
F 5 "50V" H 4960 4720 50  0000 R CNN "Voltage"
F 6 "X7R" H 4960 4620 50  0000 R CNN "Dielectric"
	1    5110 4720
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E220EE8
P 5110 4870
F 0 "#PWR?" H 5110 4620 50  0001 C CNN
F 1 "GND" H 5110 4720 50  0000 C CNN
F 2 "" H 5110 4870 50  0001 C CNN
F 3 "" H 5110 4870 50  0001 C CNN
	1    5110 4870
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:VBAT #PWR?
U 1 1 5E220F81
P 5110 4570
F 0 "#PWR?" H 5110 4420 50  0001 C CNN
F 1 "VBAT" H 5110 4720 50  0000 C CNN
F 2 "" H 5110 4570 50  0001 C CNN
F 3 "" H 5110 4570 50  0001 C CNN
	1    5110 4570
	1    0    0    -1  
$EndComp
$EndSCHEMATC

EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 26 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 18 23
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
L Memory_EEPROM:AT24CS01-STUM U1801
U 1 1 5B2E4F43
P 4670 3590
F 0 "U1801" H 4370 3840 50  0000 C CNN
F 1 "AT24CS01-STUM" H 4770 3340 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 4670 3590 50  0001 C CNN
F 3 "" H 4670 3590 50  0001 C CNN
	1    4670 3590
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01804
U 1 1 5B2E4F8E
P 4670 3890
F 0 "#PWR01804" H 4670 3640 50  0001 C CNN
F 1 "GND" H 4670 3740 50  0000 C CNN
F 2 "" H 4670 3890 50  0001 C CNN
F 3 "" H 4670 3890 50  0001 C CNN
	1    4670 3890
	1    0    0    -1  
$EndComp
$Comp
L Custom-Library:+3.3V #PWR01803
U 1 1 5B2E537B
P 4670 3290
F 0 "#PWR01803" H 4670 3140 50  0001 C CNN
F 1 "+3.3V" H 4670 3430 50  0000 C CNN
F 2 "" H 4670 3290 50  0000 C CNN
F 3 "" H 4670 3290 50  0000 C CNN
	1    4670 3290
	1    0    0    -1  
$EndComp
$Comp
L Custom-Library:C_Custom C1801
U 1 1 5B2E5850
P 3660 3670
F 0 "C1801" H 3685 3770 50  0000 L CNN
F 1 "0.1uF" H 3685 3570 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3698 3520 50  0001 C CNN
F 3 "" H 3685 3770 50  0001 C CNN
F 4 "0603" H 3510 3770 50  0000 R CNN "display_footprint"
F 5 "50V" H 3510 3670 50  0000 R CNN "Voltage"
F 6 "X7R" H 3510 3570 50  0000 R CNN "Dielectric"
	1    3660 3670
	1    0    0    -1  
$EndComp
$Comp
L Custom-Library:+3.3V #PWR01801
U 1 1 5B2E585D
P 3660 3520
F 0 "#PWR01801" H 3660 3370 50  0001 C CNN
F 1 "+3.3V" H 3660 3660 50  0000 C CNN
F 2 "" H 3660 3520 50  0000 C CNN
F 3 "" H 3660 3520 50  0000 C CNN
	1    3660 3520
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01802
U 1 1 5B2E586E
P 3660 3820
F 0 "#PWR01802" H 3660 3570 50  0001 C CNN
F 1 "GND" H 3660 3670 50  0000 C CNN
F 2 "" H 3660 3820 50  0001 C CNN
F 3 "" H 3660 3820 50  0001 C CNN
	1    3660 3820
	1    0    0    -1  
$EndComp
$Comp
L VFD_Clock-rescue:+3.3V-RESCUE-VFD_Clock #PWR01807
U 1 1 5B2E5DE6
P 6350 3110
F 0 "#PWR01807" H 6350 2960 50  0001 C CNN
F 1 "+3.3V" H 6350 3250 50  0000 C CNN
F 2 "" H 6350 3110 50  0001 C CNN
F 3 "" H 6350 3110 50  0001 C CNN
	1    6350 3110
	1    0    0    -1  
$EndComp
$Comp
L VFD_Clock-rescue:+3.3V-RESCUE-VFD_Clock #PWR01808
U 1 1 5B2E5DEC
P 6900 3110
F 0 "#PWR01808" H 6900 2960 50  0001 C CNN
F 1 "+3.3V" H 6900 3250 50  0000 C CNN
F 2 "" H 6900 3110 50  0001 C CNN
F 3 "" H 6900 3110 50  0001 C CNN
	1    6900 3110
	1    0    0    -1  
$EndComp
Wire Wire Line
	7160 3490 6350 3490
Wire Wire Line
	6350 3410 6350 3490
Wire Wire Line
	7160 3590 6900 3590
Wire Wire Line
	6900 3590 6900 3410
Connection ~ 6350 3490
Connection ~ 6900 3590
Text GLabel 7460 3490 2    60   Output ~ 0
IIC_SCL
Text GLabel 7460 3590 2    60   BiDi ~ 0
IIC_SDA
$Comp
L VFD_Clock-rescue:Res_Custom R1805
U 1 1 5B2E5DFD
P 7310 3490
F 0 "R1805" V 7210 3490 50  0000 C CNN
F 1 "0" V 7310 3490 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7310 3490 50  0001 C CNN
F 3 "" H 7310 3490 50  0001 C CNN
F 4 "0402" V 7410 3490 50  0001 C CNN "display_footprint"
F 5 "1%" V 7510 3490 50  0001 C CNN "Tolerance"
F 6 "1/16W" V 7610 3490 50  0001 C CNN "Wattage"
	1    7310 3490
	0    1    1    0   
$EndComp
$Comp
L VFD_Clock-rescue:Res_Custom R1806
U 1 1 5B2E5E07
P 7310 3590
F 0 "R1806" V 7210 3590 50  0000 C CNN
F 1 "0" V 7300 3590 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7310 3590 50  0001 C CNN
F 3 "" H 7310 3590 50  0001 C CNN
F 4 "0402" V 7410 3590 50  0001 C CNN "display_footprint"
F 5 "1%" V 7510 3590 50  0001 C CNN "Tolerance"
F 6 "1/16W" V 7610 3590 50  0001 C CNN "Wattage"
	1    7310 3590
	0    1    -1   0   
$EndComp
$Comp
L Custom-Library:R_Custom R1804
U 1 1 5B2E5E11
P 6900 3260
F 0 "R1804" H 6840 3260 50  0000 R CNN
F 1 "10k" V 6900 3260 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6900 3260 50  0001 C CNN
F 3 "" H 6900 3260 50  0001 C CNN
F 4 "DNP" H 6960 3120 50  0000 L CNN "Config"
F 5 "0603" H 6970 3340 50  0000 L CNN "display_footprint"
F 6 "1%" H 6970 3260 50  0000 L CNN "Tolerance"
F 7 "1/10W" H 6970 3190 50  0000 L CNN "Wattage"
	1    6900 3260
	-1   0    0    1   
$EndComp
$Comp
L Custom-Library:R_Custom R1803
U 1 1 5B2E5E1B
P 6350 3260
F 0 "R1803" H 6290 3260 50  0000 R CNN
F 1 "10k" V 6350 3260 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6350 3260 50  0001 C CNN
F 3 "" H 6350 3260 50  0001 C CNN
F 4 "DNP" H 6420 3120 50  0000 L CNN "Config"
F 5 "0603" H 6420 3340 50  0000 L CNN "display_footprint"
F 6 "1%" H 6420 3260 50  0000 L CNN "Tolerance"
F 7 "1/10W" H 6420 3190 50  0000 L CNN "Wattage"
	1    6350 3260
	-1   0    0    1   
$EndComp
$Comp
L Custom-Library:R_Custom R1802
U 1 1 5B2E5EBD
P 5650 4060
F 0 "R1802" H 5590 4060 50  0000 R CNN
F 1 "10k" V 5650 4060 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 5650 4060 50  0001 C CNN
F 3 "" H 5650 4060 50  0001 C CNN
F 4 "0603" H 5720 4140 50  0000 L CNN "display_footprint"
F 5 "1%" H 5720 4060 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 5720 3990 50  0000 L CNN "Wattage"
	1    5650 4060
	1    0    0    1   
$EndComp
Wire Wire Line
	5650 3410 5650 3690
Wire Wire Line
	5650 3690 5070 3690
$Comp
L power:GND #PWR01806
U 1 1 5B2E5F39
P 5650 4210
F 0 "#PWR01806" H 5650 3960 50  0001 C CNN
F 1 "GND" H 5650 4060 50  0000 C CNN
F 2 "" H 5650 4210 50  0001 C CNN
F 3 "" H 5650 4210 50  0001 C CNN
	1    5650 4210
	1    0    0    -1  
$EndComp
$Comp
L Custom-Library:R_Custom R1801
U 1 1 5B2E5F63
P 5650 3260
F 0 "R1801" H 5590 3260 50  0000 R CNN
F 1 "0" V 5650 3260 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 5650 3260 50  0001 C CNN
F 3 "" H 5650 3260 50  0001 C CNN
F 4 "DNP" H 5720 3110 50  0000 L CNN "Config"
F 5 "0603" H 5720 3340 50  0000 L CNN "display_footprint"
F 6 "1%" H 5720 3260 50  0000 L CNN "Tolerance"
F 7 "1/10W" H 5720 3190 50  0000 L CNN "Wattage"
	1    5650 3260
	-1   0    0    1   
$EndComp
$Comp
L VFD_Clock-rescue:+3.3V-RESCUE-VFD_Clock #PWR01805
U 1 1 5B2E5FE8
P 5650 3110
F 0 "#PWR01805" H 5650 2960 50  0001 C CNN
F 1 "+3.3V" H 5650 3250 50  0000 C CNN
F 2 "" H 5650 3110 50  0001 C CNN
F 3 "" H 5650 3110 50  0001 C CNN
	1    5650 3110
	1    0    0    -1  
$EndComp
Connection ~ 5650 3690
Wire Wire Line
	6350 3490 5070 3490
Wire Wire Line
	6900 3590 5070 3590
Wire Wire Line
	5650 3690 5650 3910
$Comp
L Custom_Library:I2C_Address A1801
U 1 1 5B597DF5
P 4390 4440
F 0 "A1801" H 4390 4690 60  0001 C CNN
F 1 "0x50/0x58(UID)" H 3940 4440 60  0000 L CNN
F 2 "Oddities:Dummy_Empty" H 4390 4790 60  0001 C CNN
F 3 "" H 4390 4790 60  0001 C CNN
	1    4390 4440
	1    0    0    -1  
$EndComp
$EndSCHEMATC

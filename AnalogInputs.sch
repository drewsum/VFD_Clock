EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 26 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 14 22
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 6850 3470 2    60   Output ~ 0
VAN_ADC
Text GLabel 3850 3470 2    60   Output ~ 0
VFF_ADC
Text GLabel 6850 1970 2    60   Output ~ 0
POS24_ADC
$Comp
L Custom-Library:R_Custom R1405
U 1 1 5A4DDD84
P 6040 1740
F 0 "R1405" H 5980 1740 50  0000 R CNN
F 1 "100k" V 6040 1740 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6040 1740 50  0001 C CNN
F 3 "" H 6040 1740 50  0001 C CNN
F 4 "0603" H 6110 1820 50  0000 L CNN "display_footprint"
F 5 "1%" H 6110 1740 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 6110 1670 50  0000 L CNN "Wattage"
	1    6040 1740
	1    0    0    1   
$EndComp
$Comp
L Custom-Library:R_Custom R1406
U 1 1 5A4DDD8D
P 6040 2210
F 0 "R1406" H 5980 2210 50  0000 R CNN
F 1 "10k" V 6040 2210 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6040 2210 50  0001 C CNN
F 3 "" H 6040 2210 50  0001 C CNN
F 4 "0603" H 6110 2290 50  0000 L CNN "display_footprint"
F 5 "1%" H 6110 2210 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 6110 2140 50  0000 L CNN "Wattage"
	1    6040 2210
	1    0    0    1   
$EndComp
$Comp
L Custom-Library:C_Custom C1403
U 1 1 5A4DDD96
P 5450 2210
F 0 "C1403" H 5475 2310 50  0000 L CNN
F 1 "0.1uF" H 5475 2110 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5488 2060 50  0001 C CNN
F 3 "" H 5475 2310 50  0001 C CNN
F 4 "0603" H 5300 2310 50  0000 R CNN "display_footprint"
F 5 "50V" H 5300 2210 50  0000 R CNN "Voltage"
F 6 "X7R" H 5300 2110 50  0000 R CNN "Dielectric"
	1    5450 2210
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR1411
U 1 1 5A4DDD9C
P 6040 2360
F 0 "#PWR1411" H 6040 2110 50  0001 C CNN
F 1 "GND" H 6040 2210 50  0000 C CNN
F 2 "" H 6040 2360 50  0001 C CNN
F 3 "" H 6040 2360 50  0001 C CNN
	1    6040 2360
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR1408
U 1 1 5A4DDDA2
P 5450 2360
F 0 "#PWR1408" H 5450 2110 50  0001 C CNN
F 1 "GND" H 5450 2210 50  0000 C CNN
F 2 "" H 5450 2360 50  0001 C CNN
F 3 "" H 5450 2360 50  0001 C CNN
	1    5450 2360
	1    0    0    -1  
$EndComp
Wire Wire Line
	6040 1890 6040 1970
Wire Wire Line
	5450 1970 6040 1970
Wire Wire Line
	5450 1970 5450 2060
Connection ~ 6040 1970
$Comp
L Custom-Library:ZENER_Custom Z1402
U 1 1 5A4DDDAE
P 6770 2250
F 0 "Z1402" V 6770 2450 50  0000 C CNN
F 1 "BZT52C3V3S" V 6670 2150 50  0000 R CNN
F 2 "Diodes_SMD:D_SOD-323" H 6770 2250 60  0001 C CNN
F 3 "" H 6770 2250 60  0000 C CNN
F 4 "SOD323" V 6770 2150 50  0000 R CNN "display_footprint"
F 5 "3.3V" V 6870 2150 50  0000 R CNN "Voltage"
	1    6770 2250
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR1414
U 1 1 5A4DDDB4
P 6770 2450
F 0 "#PWR1414" H 6770 2200 50  0001 C CNN
F 1 "GND" H 6770 2300 50  0000 C CNN
F 2 "" H 6770 2450 50  0001 C CNN
F 3 "" H 6770 2450 50  0001 C CNN
	1    6770 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6770 1970 6770 2050
$Comp
L Custom-Library:R_Custom R1403
U 1 1 5A4DDF5E
P 3040 3240
F 0 "R1403" H 2980 3240 50  0000 R CNN
F 1 "100k" V 3040 3240 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 3040 3240 50  0001 C CNN
F 3 "" H 3040 3240 50  0001 C CNN
F 4 "0603" H 3110 3320 50  0000 L CNN "display_footprint"
F 5 "1%" H 3110 3240 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 3110 3170 50  0000 L CNN "Wattage"
	1    3040 3240
	1    0    0    1   
$EndComp
$Comp
L Custom-Library:R_Custom R1404
U 1 1 5A4DDF67
P 3040 3710
F 0 "R1404" H 2980 3710 50  0000 R CNN
F 1 "10k" V 3040 3710 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 3040 3710 50  0001 C CNN
F 3 "" H 3040 3710 50  0001 C CNN
F 4 "0603" H 3110 3790 50  0000 L CNN "display_footprint"
F 5 "1%" H 3110 3710 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 3110 3640 50  0000 L CNN "Wattage"
	1    3040 3710
	1    0    0    1   
$EndComp
$Comp
L Custom-Library:C_Custom C1402
U 1 1 5A4DDF70
P 2450 3710
F 0 "C1402" H 2475 3810 50  0000 L CNN
F 1 "0.1uF" H 2475 3610 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2488 3560 50  0001 C CNN
F 3 "" H 2475 3810 50  0001 C CNN
F 4 "0603" H 2300 3810 50  0000 R CNN "display_footprint"
F 5 "50V" H 2300 3710 50  0000 R CNN "Voltage"
F 6 "X7R" H 2300 3610 50  0000 R CNN "Dielectric"
	1    2450 3710
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR1406
U 1 1 5A4DDF76
P 3040 3860
F 0 "#PWR1406" H 3040 3610 50  0001 C CNN
F 1 "GND" H 3040 3710 50  0000 C CNN
F 2 "" H 3040 3860 50  0001 C CNN
F 3 "" H 3040 3860 50  0001 C CNN
	1    3040 3860
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR1402
U 1 1 5A4DDF7C
P 2450 3860
F 0 "#PWR1402" H 2450 3610 50  0001 C CNN
F 1 "GND" H 2450 3710 50  0000 C CNN
F 2 "" H 2450 3860 50  0001 C CNN
F 3 "" H 2450 3860 50  0001 C CNN
	1    2450 3860
	1    0    0    -1  
$EndComp
Wire Wire Line
	3040 3390 3040 3470
Wire Wire Line
	2450 3470 3040 3470
Wire Wire Line
	2450 3470 2450 3560
Connection ~ 3040 3470
$Comp
L Custom-Library:ZENER_Custom Z1401
U 1 1 5A4DDF88
P 3770 3750
F 0 "Z1401" V 3770 3950 50  0000 C CNN
F 1 "BZT52C3V3S" V 3670 3650 50  0000 R CNN
F 2 "Diodes_SMD:D_SOD-323" H 3770 3750 60  0001 C CNN
F 3 "" H 3770 3750 60  0000 C CNN
F 4 "SOD323" V 3770 3650 50  0000 R CNN "display_footprint"
F 5 "3.3V" V 3870 3650 50  0000 R CNN "Voltage"
	1    3770 3750
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR1407
U 1 1 5A4DDF8E
P 3770 3950
F 0 "#PWR1407" H 3770 3700 50  0001 C CNN
F 1 "GND" H 3770 3800 50  0000 C CNN
F 2 "" H 3770 3950 50  0001 C CNN
F 3 "" H 3770 3950 50  0001 C CNN
	1    3770 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3770 3470 3770 3550
$Comp
L Custom-Library:R_Custom R1407
U 1 1 5A4DDF98
P 6040 3240
F 0 "R1407" H 5980 3240 50  0000 R CNN
F 1 "100k" V 6040 3240 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6040 3240 50  0001 C CNN
F 3 "" H 6040 3240 50  0001 C CNN
F 4 "0603" H 6110 3320 50  0000 L CNN "display_footprint"
F 5 "1%" H 6110 3240 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 6110 3170 50  0000 L CNN "Wattage"
	1    6040 3240
	1    0    0    1   
$EndComp
$Comp
L Custom-Library:R_Custom R1408
U 1 1 5A4DDFA1
P 6040 3710
F 0 "R1408" H 5980 3710 50  0000 R CNN
F 1 "1k" V 6040 3710 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6040 3710 50  0001 C CNN
F 3 "" H 6040 3710 50  0001 C CNN
F 4 "0603" H 6110 3790 50  0000 L CNN "display_footprint"
F 5 "1%" H 6110 3710 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 6110 3640 50  0000 L CNN "Wattage"
	1    6040 3710
	1    0    0    1   
$EndComp
$Comp
L Custom-Library:C_Custom C1404
U 1 1 5A4DDFAA
P 5450 3710
F 0 "C1404" H 5475 3810 50  0000 L CNN
F 1 "0.1uF" H 5475 3610 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5488 3560 50  0001 C CNN
F 3 "" H 5475 3810 50  0001 C CNN
F 4 "0603" H 5300 3810 50  0000 R CNN "display_footprint"
F 5 "50V" H 5300 3710 50  0000 R CNN "Voltage"
F 6 "X7R" H 5300 3610 50  0000 R CNN "Dielectric"
	1    5450 3710
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR1413
U 1 1 5A4DDFB0
P 6040 3860
F 0 "#PWR1413" H 6040 3610 50  0001 C CNN
F 1 "GND" H 6040 3710 50  0000 C CNN
F 2 "" H 6040 3860 50  0001 C CNN
F 3 "" H 6040 3860 50  0001 C CNN
	1    6040 3860
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR1409
U 1 1 5A4DDFB6
P 5450 3860
F 0 "#PWR1409" H 5450 3610 50  0001 C CNN
F 1 "GND" H 5450 3710 50  0000 C CNN
F 2 "" H 5450 3860 50  0001 C CNN
F 3 "" H 5450 3860 50  0001 C CNN
	1    5450 3860
	1    0    0    -1  
$EndComp
Wire Wire Line
	6040 3390 6040 3470
Wire Wire Line
	5450 3470 6040 3470
Wire Wire Line
	5450 3470 5450 3560
Connection ~ 6040 3470
$Comp
L Custom-Library:ZENER_Custom Z1403
U 1 1 5A4DDFC2
P 6770 3750
F 0 "Z1403" V 6770 3950 50  0000 C CNN
F 1 "BZT52C3V3S" V 6670 3650 50  0000 R CNN
F 2 "Diodes_SMD:D_SOD-323" H 6770 3750 60  0001 C CNN
F 3 "" H 6770 3750 60  0000 C CNN
F 4 "SOD323" V 6770 3650 50  0000 R CNN "display_footprint"
F 5 "3.3V" V 6870 3650 50  0000 R CNN "Voltage"
	1    6770 3750
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR1415
U 1 1 5A4DDFC8
P 6770 3950
F 0 "#PWR1415" H 6770 3700 50  0001 C CNN
F 1 "GND" H 6770 3800 50  0000 C CNN
F 2 "" H 6770 3950 50  0001 C CNN
F 3 "" H 6770 3950 50  0001 C CNN
	1    6770 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6770 3470 6770 3550
Connection ~ 6770 1970
$Comp
L power:+24V #PWR1410
U 1 1 5A4DF4B3
P 6040 1590
F 0 "#PWR1410" H 6040 1440 50  0001 C CNN
F 1 "+24V" H 6040 1730 50  0000 C CNN
F 2 "" H 6040 1590 50  0001 C CNN
F 3 "" H 6040 1590 50  0001 C CNN
	1    6040 1590
	1    0    0    -1  
$EndComp
Connection ~ 3770 3470
$Comp
L Custom-Library:VFF #PWR1405
U 1 1 5A4DFC56
P 3040 3090
F 0 "#PWR1405" H 3040 2940 50  0001 C CNN
F 1 "VFF" H 3040 3240 50  0000 C CNN
F 2 "" H 3040 3090 60  0000 C CNN
F 3 "" H 3040 3090 60  0000 C CNN
	1    3040 3090
	1    0    0    -1  
$EndComp
Connection ~ 6770 3470
$Comp
L Custom-Library:VAN #PWR1412
U 1 1 5A4E0380
P 6040 3090
F 0 "#PWR1412" H 6040 2940 50  0001 C CNN
F 1 "VAN" H 6040 3240 50  0000 C CNN
F 2 "" H 6040 3090 50  0001 C CNN
F 3 "" H 6040 3090 50  0001 C CNN
	1    6040 3090
	1    0    0    -1  
$EndComp
Wire Wire Line
	6040 1970 6040 2060
Wire Wire Line
	6040 1970 6770 1970
Wire Wire Line
	3040 3470 3040 3560
Wire Wire Line
	3040 3470 3770 3470
Wire Wire Line
	6040 3470 6040 3560
Wire Wire Line
	6040 3470 6770 3470
Wire Wire Line
	6770 1970 6850 1970
Wire Wire Line
	3770 3470 3850 3470
Wire Wire Line
	6770 3470 6850 3470
Text GLabel 3900 1970 2    60   Output ~ 0
POS3P3_ADC
$Comp
L Custom-Library:R_Custom R?
U 1 1 5B51A213
P 3090 1740
F 0 "R?" H 3030 1740 50  0000 R CNN
F 1 "100k" V 3090 1740 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 3090 1740 50  0001 C CNN
F 3 "" H 3090 1740 50  0001 C CNN
F 4 "0603" H 3160 1820 50  0000 L CNN "display_footprint"
F 5 "1%" H 3160 1740 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 3160 1670 50  0000 L CNN "Wattage"
	1    3090 1740
	1    0    0    1   
$EndComp
$Comp
L Custom-Library:R_Custom R?
U 1 1 5B51A21D
P 3090 2210
F 0 "R?" H 3030 2210 50  0000 R CNN
F 1 "10k" V 3090 2210 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 3090 2210 50  0001 C CNN
F 3 "" H 3090 2210 50  0001 C CNN
F 4 "0603" H 3160 2290 50  0000 L CNN "display_footprint"
F 5 "1%" H 3160 2210 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 3160 2140 50  0000 L CNN "Wattage"
	1    3090 2210
	1    0    0    1   
$EndComp
$Comp
L Custom-Library:C_Custom C?
U 1 1 5B51A227
P 2500 2210
F 0 "C?" H 2525 2310 50  0000 L CNN
F 1 "0.1uF" H 2525 2110 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2538 2060 50  0001 C CNN
F 3 "" H 2525 2310 50  0001 C CNN
F 4 "0603" H 2350 2310 50  0000 R CNN "display_footprint"
F 5 "50V" H 2350 2210 50  0000 R CNN "Voltage"
F 6 "X7R" H 2350 2110 50  0000 R CNN "Dielectric"
	1    2500 2210
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5B51A22E
P 3090 2360
F 0 "#PWR?" H 3090 2110 50  0001 C CNN
F 1 "GND" H 3090 2210 50  0000 C CNN
F 2 "" H 3090 2360 50  0001 C CNN
F 3 "" H 3090 2360 50  0001 C CNN
	1    3090 2360
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5B51A234
P 2500 2360
F 0 "#PWR?" H 2500 2110 50  0001 C CNN
F 1 "GND" H 2500 2210 50  0000 C CNN
F 2 "" H 2500 2360 50  0001 C CNN
F 3 "" H 2500 2360 50  0001 C CNN
	1    2500 2360
	1    0    0    -1  
$EndComp
Wire Wire Line
	3090 1890 3090 1970
Wire Wire Line
	2500 1970 3090 1970
Wire Wire Line
	2500 1970 2500 2060
Connection ~ 3090 1970
Wire Wire Line
	3090 1970 3090 2060
$Comp
L Custom_Library:+3.3V #PWR?
U 1 1 5B51A61D
P 3090 1590
F 0 "#PWR?" H 3090 1440 50  0001 C CNN
F 1 "+3.3V" H 3090 1730 50  0000 C CNN
F 2 "" H 3090 1590 50  0000 C CNN
F 3 "" H 3090 1590 50  0000 C CNN
	1    3090 1590
	1    0    0    -1  
$EndComp
Wire Wire Line
	3090 1970 3900 1970
$EndSCHEMATC

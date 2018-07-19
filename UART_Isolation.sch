EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 26 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 9 23
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 8000 3800 2    60   Output ~ 0
USB_UART_TX_ISO
Text GLabel 8000 3600 2    60   Input ~ 0
USB_UART_RX_ISO
Text GLabel 8000 3700 2    60   Input ~ 0
USB_DTR_ISO
$Comp
L Custom-Library:GND_USB #PWR908
U 1 1 5B33B4C2
P 5770 4080
F 0 "#PWR908" H 5770 3830 50  0001 C CNN
F 1 "GND_USB" H 5770 3930 50  0000 C CNN
F 2 "" H 5770 4080 50  0001 C CNN
F 3 "" H 5770 4080 50  0001 C CNN
	1    5770 4080
	1    0    0    -1  
$EndComp
Wire Wire Line
	5770 3900 5770 4000
Wire Wire Line
	5770 4000 5690 4000
Wire Wire Line
	5770 3900 5690 3900
Connection ~ 5770 4000
$Comp
L power:GND #PWR905
U 1 1 5B33B4E7
P 4810 4080
F 0 "#PWR905" H 4810 3830 50  0001 C CNN
F 1 "GND" H 4810 3930 50  0000 C CNN
F 2 "" H 4810 4080 50  0001 C CNN
F 3 "" H 4810 4080 50  0001 C CNN
	1    4810 4080
	1    0    0    -1  
$EndComp
Wire Wire Line
	4810 3900 4810 4000
Wire Wire Line
	4810 4000 4890 4000
Wire Wire Line
	4810 3900 4890 3900
Connection ~ 4810 4000
Wire Wire Line
	5690 3600 6220 3600
Wire Wire Line
	5690 3800 6860 3800
$Comp
L Custom-Library:R_Custom R904
U 1 1 5B33344F
P 6220 4050
F 0 "R904" H 6160 4050 50  0000 R CNN
F 1 "10k" V 6220 4050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6220 4050 50  0001 C CNN
F 3 "" H 6220 4050 50  0001 C CNN
F 4 "0603" H 6290 4130 50  0000 L CNN "display_footprint"
F 5 "1%" H 6290 4050 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 6290 3980 50  0000 L CNN "Wattage"
	1    6220 4050
	1    0    0    1   
$EndComp
$Comp
L Custom-Library:R_Custom R906
U 1 1 5B333478
P 6860 4050
F 0 "R906" H 6800 4050 50  0000 R CNN
F 1 "10k" V 6860 4050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6860 4050 50  0001 C CNN
F 3 "" H 6860 4050 50  0001 C CNN
F 4 "0603" H 6930 4130 50  0000 L CNN "display_footprint"
F 5 "1%" H 6930 4050 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 6930 3980 50  0000 L CNN "Wattage"
	1    6860 4050
	1    0    0    1   
$EndComp
$Comp
L Custom-Library:GND_USB #PWR912
U 1 1 5B3334DB
P 6220 4200
F 0 "#PWR912" H 6220 3950 50  0001 C CNN
F 1 "GND_USB" H 6220 4050 50  0000 C CNN
F 2 "" H 6220 4200 50  0001 C CNN
F 3 "" H 6220 4200 50  0001 C CNN
	1    6220 4200
	1    0    0    -1  
$EndComp
$Comp
L Custom-Library:GND_USB #PWR914
U 1 1 5B3334F2
P 6860 4200
F 0 "#PWR914" H 6860 3950 50  0001 C CNN
F 1 "GND_USB" H 6860 4050 50  0000 C CNN
F 2 "" H 6860 4200 50  0001 C CNN
F 3 "" H 6860 4200 50  0001 C CNN
	1    6860 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6860 3900 6860 3800
Connection ~ 6860 3800
Wire Wire Line
	6220 3900 6220 3600
Connection ~ 6220 3600
$Comp
L Custom-Library:C_Custom C902
U 1 1 5B333AEF
P 5940 4750
F 0 "C902" H 5965 4850 50  0000 L CNN
F 1 "0.1uF" H 5965 4650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5978 4600 50  0001 C CNN
F 3 "" H 5965 4850 50  0001 C CNN
F 4 "0603" H 5790 4850 50  0000 R CNN "display_footprint"
F 5 "50V" H 5790 4750 50  0000 R CNN "Voltage"
F 6 "X7R" H 5790 4650 50  0000 R CNN "Dielectric"
	1    5940 4750
	1    0    0    -1  
$EndComp
$Comp
L Custom-Library:C_Custom C901
U 1 1 5B333B14
P 4830 4750
F 0 "C901" H 4855 4850 50  0000 L CNN
F 1 "0.1uF" H 4855 4650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4868 4600 50  0001 C CNN
F 3 "" H 4855 4850 50  0001 C CNN
F 4 "0603" H 4680 4850 50  0000 R CNN "display_footprint"
F 5 "50V" H 4680 4750 50  0000 R CNN "Voltage"
F 6 "X7R" H 4680 4650 50  0000 R CNN "Dielectric"
	1    4830 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR907
U 1 1 5B333B49
P 4830 4900
F 0 "#PWR907" H 4830 4650 50  0001 C CNN
F 1 "GND" H 4830 4750 50  0000 C CNN
F 2 "" H 4830 4900 50  0001 C CNN
F 3 "" H 4830 4900 50  0001 C CNN
	1    4830 4900
	1    0    0    -1  
$EndComp
$Comp
L Custom-Library:GND_USB #PWR910
U 1 1 5B333B66
P 5940 4900
F 0 "#PWR910" H 5940 4650 50  0001 C CNN
F 1 "GND_USB" H 5940 4750 50  0000 C CNN
F 2 "" H 5940 4900 50  0001 C CNN
F 3 "" H 5940 4900 50  0001 C CNN
	1    5940 4900
	1    0    0    -1  
$EndComp
$Comp
L Custom-Library:+5V_USB #PWR911
U 1 1 5B333B91
P 6000 3320
F 0 "#PWR911" H 6000 3170 50  0001 C CNN
F 1 "+5V_USB" H 6000 3460 50  0000 C CNN
F 2 "" H 6000 3320 50  0001 C CNN
F 3 "" H 6000 3320 50  0001 C CNN
	1    6000 3320
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 3320 6000 3400
Wire Wire Line
	6000 3400 5690 3400
Wire Wire Line
	6000 3500 5690 3500
Connection ~ 6000 3400
$Comp
L Custom-Library:+3.3V #PWR904
U 1 1 5B334082
P 4660 3320
F 0 "#PWR904" H 4660 3170 50  0001 C CNN
F 1 "+3.3V" H 4660 3460 50  0000 C CNN
F 2 "" H 4660 3320 50  0000 C CNN
F 3 "" H 4660 3320 50  0000 C CNN
	1    4660 3320
	1    0    0    -1  
$EndComp
Wire Wire Line
	4660 3320 4660 3400
Wire Wire Line
	4660 3400 4890 3400
Wire Wire Line
	4660 3500 4890 3500
Connection ~ 4660 3400
$Comp
L Custom-Library:+5V_USB #PWR909
U 1 1 5B33458B
P 5940 4600
F 0 "#PWR909" H 5940 4450 50  0001 C CNN
F 1 "+5V_USB" H 5940 4740 50  0000 C CNN
F 2 "" H 5940 4600 50  0001 C CNN
F 3 "" H 5940 4600 50  0001 C CNN
	1    5940 4600
	1    0    0    -1  
$EndComp
$Comp
L Custom-Library:+3.3V #PWR906
U 1 1 5B3345D2
P 4830 4600
F 0 "#PWR906" H 4830 4450 50  0001 C CNN
F 1 "+3.3V" H 4830 4740 50  0000 C CNN
F 2 "" H 4830 4600 50  0000 C CNN
F 3 "" H 4830 4600 50  0000 C CNN
	1    4830 4600
	1    0    0    -1  
$EndComp
Text GLabel 2580 3800 0    60   Input ~ 0
USB_UART_TX
Text GLabel 2580 3600 0    60   Output ~ 0
USB_UART_RX
Text GLabel 2580 3700 0    60   Output ~ 0
USB_DTR
$Comp
L Custom-Library:R_Custom R903
U 1 1 5B334B77
P 4360 4050
F 0 "R903" H 4300 4050 50  0000 R CNN
F 1 "10k" V 4360 4050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 4360 4050 50  0001 C CNN
F 3 "" H 4360 4050 50  0001 C CNN
F 4 "0603" H 4430 4130 50  0000 L CNN "display_footprint"
F 5 "1%" H 4430 4050 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 4430 3980 50  0000 L CNN "Wattage"
	1    4360 4050
	-1   0    0    1   
$EndComp
$Comp
L Custom-Library:R_Custom R901
U 1 1 5B334B80
P 3720 4050
F 0 "R901" H 3660 4050 50  0000 R CNN
F 1 "10k" V 3720 4050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 3720 4050 50  0001 C CNN
F 3 "" H 3720 4050 50  0001 C CNN
F 4 "0603" H 3790 4130 50  0000 L CNN "display_footprint"
F 5 "1%" H 3790 4050 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 3790 3980 50  0000 L CNN "Wattage"
	1    3720 4050
	-1   0    0    1   
$EndComp
Wire Wire Line
	3720 3900 3720 3800
Connection ~ 3720 3800
Wire Wire Line
	4360 3900 4360 3600
Connection ~ 4360 3600
$Comp
L power:GND #PWR903
U 1 1 5B334D88
P 4360 4200
F 0 "#PWR903" H 4360 3950 50  0001 C CNN
F 1 "GND" H 4360 4050 50  0000 C CNN
F 2 "" H 4360 4200 50  0001 C CNN
F 3 "" H 4360 4200 50  0001 C CNN
	1    4360 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR901
U 1 1 5B33526C
P 3720 4200
F 0 "#PWR901" H 3720 3950 50  0001 C CNN
F 1 "GND" H 3720 4050 50  0000 C CNN
F 2 "" H 3720 4200 50  0001 C CNN
F 3 "" H 3720 4200 50  0001 C CNN
	1    3720 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5770 4000 5770 4080
Wire Wire Line
	4810 4000 4810 4080
Wire Wire Line
	6000 3400 6000 3500
Wire Wire Line
	4660 3400 4660 3500
Wire Wire Line
	3720 3800 4890 3800
Wire Wire Line
	4360 3600 4890 3600
$Comp
L Isolator:ISO7331C U901
U 1 1 5B50F39B
P 5290 3700
F 0 "U901" H 5040 4150 50  0000 C CNN
F 1 "ISO7331C" H 5560 4150 50  0000 C CNN
F 2 "Package_SO:SOIC-16W_7.5x10.3mm_P1.27mm" H 5290 3200 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/iso7331c.pdf" H 5290 4100 50  0001 C CNN
	1    5290 3700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6220 3600 8000 3600
Wire Wire Line
	6860 3800 8000 3800
Wire Wire Line
	5690 3700 7530 3700
Wire Wire Line
	2580 3600 4360 3600
$Comp
L Custom-Library:R_Custom R?
U 1 1 5B51D46D
P 3110 4050
F 0 "R?" H 3050 4050 50  0000 R CNN
F 1 "10k" V 3110 4050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 3110 4050 50  0001 C CNN
F 3 "" H 3110 4050 50  0001 C CNN
F 4 "0603" H 3180 4130 50  0000 L CNN "display_footprint"
F 5 "1%" H 3180 4050 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 3180 3980 50  0000 L CNN "Wattage"
	1    3110 4050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5B51D49E
P 3110 4200
F 0 "#PWR?" H 3110 3950 50  0001 C CNN
F 1 "GND" H 3110 4050 50  0000 C CNN
F 2 "" H 3110 4200 50  0001 C CNN
F 3 "" H 3110 4200 50  0001 C CNN
	1    3110 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3110 3900 3110 3700
Wire Wire Line
	2580 3800 3720 3800
Wire Wire Line
	2580 3700 3110 3700
Connection ~ 3110 3700
Wire Wire Line
	3110 3700 4890 3700
$Comp
L Custom-Library:R_Custom R?
U 1 1 5B51DA55
P 7530 4050
F 0 "R?" H 7470 4050 50  0000 R CNN
F 1 "10k" V 7530 4050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7530 4050 50  0001 C CNN
F 3 "" H 7530 4050 50  0001 C CNN
F 4 "0603" H 7600 4130 50  0000 L CNN "display_footprint"
F 5 "1%" H 7600 4050 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 7600 3980 50  0000 L CNN "Wattage"
	1    7530 4050
	1    0    0    1   
$EndComp
$Comp
L Custom-Library:GND_USB #PWR?
U 1 1 5B51DA86
P 7530 4200
F 0 "#PWR?" H 7530 3950 50  0001 C CNN
F 1 "GND_USB" H 7530 4050 50  0000 C CNN
F 2 "" H 7530 4200 50  0001 C CNN
F 3 "" H 7530 4200 50  0001 C CNN
	1    7530 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7530 3900 7530 3700
Connection ~ 7530 3700
Wire Wire Line
	7530 3700 8000 3700
$EndSCHEMATC

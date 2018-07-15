EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 26 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 10 21
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
L Transistor_FET:2N7002 Q1001
U 1 1 5B2E089F
P 2720 1800
F 0 "Q1001" H 2930 1850 50  0000 L CNN
F 1 "2N7002" H 3220 1750 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 2920 1900 29  0001 C CNN
F 3 "" H 2720 1800 60  0000 C CNN
	1    2720 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR1003
U 1 1 5B2E08A6
P 2820 2000
F 0 "#PWR1003" H 2820 1750 50  0001 C CNN
F 1 "GND" H 2820 1850 50  0000 C CNN
F 2 "" H 2820 2000 50  0001 C CNN
F 3 "" H 2820 2000 50  0001 C CNN
	1    2820 2000
	1    0    0    -1  
$EndComp
$Comp
L Custom-Library:R_Custom R1004
U 1 1 5B2E08AF
P 2820 1450
F 0 "R1004" H 2760 1450 50  0000 R CNN
F 1 "1k" V 2820 1450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 2820 1450 50  0001 C CNN
F 3 "" H 2820 1450 50  0001 C CNN
F 4 "0603" H 2890 1530 50  0000 L CNN "display_footprint"
F 5 "1%" H 2890 1450 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 2890 1380 50  0000 L CNN "Wattage"
	1    2820 1450
	1    0    0    1   
$EndComp
Text GLabel 1580 1800 0    60   UnSpc ~ 0
ICSP_DETECT
$Comp
L Custom-Library:LED_ALT_Custom D1001
U 1 1 5B2E08B8
P 2820 1080
F 0 "D1001" H 2820 1180 50  0000 C CNN
F 1 "Orange" H 2820 980 50  0000 C CNN
F 2 "LEDs:LED_0603" H 2820 1080 50  0001 C CNN
F 3 "" H 2820 1080 50  0001 C CNN
F 4 "0603" H 2820 880 50  0000 C CNN "display_footprint"
	1    2820 1080
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2820 1230 2820 1300
$Comp
L Custom-Library:+3.3V #PWR1002
U 1 1 5B2E08C0
P 2820 930
F 0 "#PWR1002" H 2820 780 50  0001 C CNN
F 1 "+3.3V" H 2820 1070 50  0000 C CNN
F 2 "" H 2820 930 50  0000 C CNN
F 3 "" H 2820 930 50  0000 C CNN
	1    2820 930 
	1    0    0    -1  
$EndComp
$Comp
L Custom-Library:R_Custom R1003
U 1 1 5B2E1279
P 2350 2030
F 0 "R1003" H 2290 2030 50  0000 R CNN
F 1 "10k" V 2350 2030 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 2350 2030 50  0001 C CNN
F 3 "" H 2350 2030 50  0001 C CNN
F 4 "0603" H 2420 2110 50  0000 L CNN "display_footprint"
F 5 "1%" H 2420 2030 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 2420 1960 50  0000 L CNN "Wattage"
	1    2350 2030
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR1001
U 1 1 5B2E127F
P 2350 2180
F 0 "#PWR1001" H 2350 1930 50  0001 C CNN
F 1 "GND" H 2350 2030 50  0000 C CNN
F 2 "" H 2350 2180 50  0001 C CNN
F 3 "" H 2350 2180 50  0001 C CNN
	1    2350 2180
	1    0    0    -1  
$EndComp
$Comp
L Custom-Library:R_Custom R1001
U 1 1 5B2E1288
P 1730 1800
F 0 "R1001" V 1630 1800 50  0000 C CNN
F 1 "10" V 1730 1800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 1730 1800 50  0001 C CNN
F 3 "" H 1730 1800 50  0001 C CNN
F 4 "0603" V 1830 1800 50  0000 C CNN "display_footprint"
F 5 "1%" V 1930 1800 50  0000 C CNN "Tolerance"
F 6 "1/10W" V 2030 1800 50  0000 C CNN "Wattage"
	1    1730 1800
	0    1    1    0   
$EndComp
Wire Wire Line
	1880 1800 2520 1800
Wire Wire Line
	2350 1880 2350 1800
Connection ~ 2350 1800
Text GLabel 6490 1600 3    60   UnSpc ~ 0
~Status_Set_Date
Text GLabel 5700 1600 3    60   UnSpc ~ 0
~Status_Set_Time
Text GLabel 4870 1600 3    60   UnSpc ~ 0
~Status_COM_Error
Text GLabel 4080 1600 3    60   UnSpc ~ 0
~Status_Heartbeat
$Comp
L Custom-Library:R_Custom R1006
U 1 1 5B338CEC
P 4080 1450
F 0 "R1006" H 4020 1450 50  0000 R CNN
F 1 "1k" V 4080 1450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 4080 1450 50  0001 C CNN
F 3 "" H 4080 1450 50  0001 C CNN
F 4 "0603" H 4150 1530 50  0000 L CNN "display_footprint"
F 5 "1%" H 4150 1450 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 4150 1380 50  0000 L CNN "Wattage"
	1    4080 1450
	1    0    0    1   
$EndComp
$Comp
L Custom-Library:LED_ALT_Custom D1002
U 1 1 5B338CF3
P 4080 1080
F 0 "D1002" H 4080 1180 50  0000 C CNN
F 1 "Orange" H 4080 980 50  0000 C CNN
F 2 "LEDs:LED_0603" H 4080 1080 50  0001 C CNN
F 3 "" H 4080 1080 50  0001 C CNN
F 4 "0603" H 4080 880 50  0000 C CNN "display_footprint"
	1    4080 1080
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4080 1230 4080 1300
$Comp
L Custom-Library:+3.3V #PWR1007
U 1 1 5B338CFA
P 4080 930
F 0 "#PWR1007" H 4080 780 50  0001 C CNN
F 1 "+3.3V" H 4080 1070 50  0000 C CNN
F 2 "" H 4080 930 50  0000 C CNN
F 3 "" H 4080 930 50  0000 C CNN
	1    4080 930 
	1    0    0    -1  
$EndComp
$Comp
L Custom-Library:R_Custom R1007
U 1 1 5B3392C9
P 4870 1450
F 0 "R1007" H 4810 1450 50  0000 R CNN
F 1 "1k" V 4870 1450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 4870 1450 50  0001 C CNN
F 3 "" H 4870 1450 50  0001 C CNN
F 4 "0603" H 4940 1530 50  0000 L CNN "display_footprint"
F 5 "1%" H 4940 1450 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 4940 1380 50  0000 L CNN "Wattage"
	1    4870 1450
	1    0    0    1   
$EndComp
$Comp
L Custom-Library:LED_ALT_Custom D1003
U 1 1 5B3392D0
P 4870 1080
F 0 "D1003" H 4870 1180 50  0000 C CNN
F 1 "Red" H 4870 980 50  0000 C CNN
F 2 "LEDs:LED_0603" H 4870 1080 50  0001 C CNN
F 3 "" H 4870 1080 50  0001 C CNN
F 4 "0603" H 4870 880 50  0000 C CNN "display_footprint"
	1    4870 1080
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4870 1230 4870 1300
$Comp
L Custom-Library:+3.3V #PWR1008
U 1 1 5B3392D7
P 4870 930
F 0 "#PWR1008" H 4870 780 50  0001 C CNN
F 1 "+3.3V" H 4870 1070 50  0000 C CNN
F 2 "" H 4870 930 50  0000 C CNN
F 3 "" H 4870 930 50  0000 C CNN
	1    4870 930 
	1    0    0    -1  
$EndComp
$Comp
L Custom-Library:R_Custom R1008
U 1 1 5B339433
P 5700 1450
F 0 "R1008" H 5640 1450 50  0000 R CNN
F 1 "1k" V 5700 1450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 5700 1450 50  0001 C CNN
F 3 "" H 5700 1450 50  0001 C CNN
F 4 "0603" H 5770 1530 50  0000 L CNN "display_footprint"
F 5 "1%" H 5770 1450 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 5770 1380 50  0000 L CNN "Wattage"
	1    5700 1450
	1    0    0    1   
$EndComp
$Comp
L Custom-Library:LED_ALT_Custom D1004
U 1 1 5B33943A
P 5700 1080
F 0 "D1004" H 5700 1180 50  0000 C CNN
F 1 "Blue" H 5700 980 50  0000 C CNN
F 2 "LEDs:LED_0603" H 5700 1080 50  0001 C CNN
F 3 "" H 5700 1080 50  0001 C CNN
F 4 "0603" H 5700 880 50  0000 C CNN "display_footprint"
	1    5700 1080
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5700 1230 5700 1300
$Comp
L Custom-Library:+3.3V #PWR1009
U 1 1 5B339441
P 5700 930
F 0 "#PWR1009" H 5700 780 50  0001 C CNN
F 1 "+3.3V" H 5700 1070 50  0000 C CNN
F 2 "" H 5700 930 50  0000 C CNN
F 3 "" H 5700 930 50  0000 C CNN
	1    5700 930 
	1    0    0    -1  
$EndComp
$Comp
L Custom-Library:R_Custom R1009
U 1 1 5B33944A
P 6490 1450
F 0 "R1009" H 6430 1450 50  0000 R CNN
F 1 "1k" V 6490 1450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6490 1450 50  0001 C CNN
F 3 "" H 6490 1450 50  0001 C CNN
F 4 "0603" H 6560 1530 50  0000 L CNN "display_footprint"
F 5 "1%" H 6560 1450 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 6560 1380 50  0000 L CNN "Wattage"
	1    6490 1450
	1    0    0    1   
$EndComp
$Comp
L Custom-Library:LED_ALT_Custom D1005
U 1 1 5B339451
P 6490 1080
F 0 "D1005" H 6490 1180 50  0000 C CNN
F 1 "Blue" H 6490 980 50  0000 C CNN
F 2 "LEDs:LED_0603" H 6490 1080 50  0001 C CNN
F 3 "" H 6490 1080 50  0001 C CNN
F 4 "0603" H 6490 880 50  0000 C CNN "display_footprint"
	1    6490 1080
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6490 1230 6490 1300
$Comp
L Custom-Library:+3.3V #PWR1010
U 1 1 5B339458
P 6490 930
F 0 "#PWR1010" H 6490 780 50  0001 C CNN
F 1 "+3.3V" H 6490 1070 50  0000 C CNN
F 2 "" H 6490 930 50  0000 C CNN
F 3 "" H 6490 930 50  0000 C CNN
	1    6490 930 
	1    0    0    -1  
$EndComp
Text GLabel 9030 1600 3    60   UnSpc ~ 0
~Status_Battery_Low
$Comp
L Custom-Library:R_Custom R1012
U 1 1 5B3C8BD4
P 9030 1450
F 0 "R1012" H 8970 1450 50  0000 R CNN
F 1 "1k" V 9030 1450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 9030 1450 50  0001 C CNN
F 3 "" H 9030 1450 50  0001 C CNN
F 4 "0603" H 9100 1530 50  0000 L CNN "display_footprint"
F 5 "1%" H 9100 1450 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 9100 1380 50  0000 L CNN "Wattage"
	1    9030 1450
	1    0    0    1   
$EndComp
$Comp
L Custom-Library:LED_ALT_Custom D1008
U 1 1 5B3C8BDB
P 9030 1080
F 0 "D1008" H 9030 1180 50  0000 C CNN
F 1 "Orange" H 9030 980 50  0000 C CNN
F 2 "LEDs:LED_0603" H 9030 1080 50  0001 C CNN
F 3 "" H 9030 1080 50  0001 C CNN
F 4 "0603" H 9030 880 50  0000 C CNN "display_footprint"
	1    9030 1080
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9030 1230 9030 1300
$Comp
L Custom-Library:+3.3V #PWR1013
U 1 1 5B3C8BE2
P 9030 930
F 0 "#PWR1013" H 9030 780 50  0001 C CNN
F 1 "+3.3V" H 9030 1070 50  0000 C CNN
F 2 "" H 9030 930 50  0000 C CNN
F 3 "" H 9030 930 50  0000 C CNN
	1    9030 930 
	1    0    0    -1  
$EndComp
$Comp
L Custom-Library:+3.3V #PWR1012
U 1 1 5B339C69
P 8120 930
F 0 "#PWR1012" H 8120 780 50  0001 C CNN
F 1 "+3.3V" H 8120 1070 50  0000 C CNN
F 2 "" H 8120 930 50  0000 C CNN
F 3 "" H 8120 930 50  0000 C CNN
	1    8120 930 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8120 1230 8120 1300
$Comp
L Custom-Library:LED_ALT_Custom D1007
U 1 1 5B339C62
P 8120 1080
F 0 "D1007" H 8120 1180 50  0000 C CNN
F 1 "Green" H 8120 980 50  0000 C CNN
F 2 "LEDs:LED_0603" H 8120 1080 50  0001 C CNN
F 3 "" H 8120 1080 50  0001 C CNN
F 4 "0603" H 8120 880 50  0000 C CNN "display_footprint"
	1    8120 1080
	0    -1   -1   0   
$EndComp
$Comp
L Custom-Library:R_Custom R1011
U 1 1 5B339C5B
P 8120 1450
F 0 "R1011" H 8060 1450 50  0000 R CNN
F 1 "1k" V 8120 1450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 8120 1450 50  0001 C CNN
F 3 "" H 8120 1450 50  0001 C CNN
F 4 "0603" H 8190 1530 50  0000 L CNN "display_footprint"
F 5 "1%" H 8190 1450 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 8190 1380 50  0000 L CNN "Wattage"
	1    8120 1450
	1    0    0    1   
$EndComp
$Comp
L Custom-Library:+3.3V #PWR1011
U 1 1 5B339C52
P 7330 930
F 0 "#PWR1011" H 7330 780 50  0001 C CNN
F 1 "+3.3V" H 7330 1070 50  0000 C CNN
F 2 "" H 7330 930 50  0000 C CNN
F 3 "" H 7330 930 50  0000 C CNN
	1    7330 930 
	1    0    0    -1  
$EndComp
Wire Wire Line
	7330 1230 7330 1300
$Comp
L Custom-Library:LED_ALT_Custom D1006
U 1 1 5B339C4B
P 7330 1080
F 0 "D1006" H 7330 1180 50  0000 C CNN
F 1 "Blue" H 7330 980 50  0000 C CNN
F 2 "LEDs:LED_0603" H 7330 1080 50  0001 C CNN
F 3 "" H 7330 1080 50  0001 C CNN
F 4 "0603" H 7330 880 50  0000 C CNN "display_footprint"
	1    7330 1080
	0    -1   -1   0   
$EndComp
$Comp
L Custom-Library:R_Custom R1010
U 1 1 5B339C44
P 7330 1450
F 0 "R1010" H 7270 1450 50  0000 R CNN
F 1 "1k" V 7330 1450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7330 1450 50  0001 C CNN
F 3 "" H 7330 1450 50  0001 C CNN
F 4 "0603" H 7400 1530 50  0000 L CNN "display_footprint"
F 5 "1%" H 7400 1450 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 7400 1380 50  0000 L CNN "Wattage"
	1    7330 1450
	1    0    0    1   
$EndComp
Text GLabel 7330 1600 3    60   UnSpc ~ 0
~Status_Set_Alarm
Text GLabel 8120 1600 3    60   UnSpc ~ 0
~Status_Alarm_On
Text GLabel 2130 6380 0    60   Input ~ 0
Buzzer
Connection ~ 2900 6380
Wire Wire Line
	2900 6460 2900 6380
Wire Wire Line
	2430 6380 3070 6380
$Comp
L Custom-Library:R_Custom R1002
U 1 1 5A56AA4D
P 2280 6380
F 0 "R1002" V 2180 6380 50  0000 C CNN
F 1 "10" V 2280 6380 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 2280 6380 50  0001 C CNN
F 3 "" H 2280 6380 50  0001 C CNN
F 4 "0603" V 2380 6380 50  0000 C CNN "display_footprint"
F 5 "1%" V 2480 6380 50  0000 C CNN "Tolerance"
F 6 "1/10W" V 2580 6380 50  0000 C CNN "Wattage"
	1    2280 6380
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR1004
U 1 1 5A56AA44
P 2900 6760
F 0 "#PWR1004" H 2900 6510 50  0001 C CNN
F 1 "GND" H 2900 6610 50  0000 C CNN
F 2 "" H 2900 6760 50  0001 C CNN
F 3 "" H 2900 6760 50  0001 C CNN
	1    2900 6760
	1    0    0    -1  
$EndComp
$Comp
L Custom-Library:R_Custom R1005
U 1 1 5A56AA3D
P 2900 6610
F 0 "R1005" H 2840 6610 50  0000 R CNN
F 1 "10k" V 2900 6610 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 2900 6610 50  0001 C CNN
F 3 "" H 2900 6610 50  0001 C CNN
F 4 "0603" H 2970 6690 50  0000 L CNN "display_footprint"
F 5 "1%" H 2970 6610 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 2970 6540 50  0000 L CNN "Wattage"
	1    2900 6610
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR1006
U 1 1 5A56A36A
P 3370 6580
F 0 "#PWR1006" H 3370 6330 50  0001 C CNN
F 1 "GND" H 3370 6430 50  0000 C CNN
F 2 "" H 3370 6580 50  0001 C CNN
F 3 "" H 3370 6580 50  0001 C CNN
	1    3370 6580
	1    0    0    -1  
$EndComp
Wire Wire Line
	3370 6060 3370 6180
Wire Wire Line
	3490 6060 3370 6060
Wire Wire Line
	3370 5860 3490 5860
Wire Wire Line
	3370 5740 3370 5860
$Comp
L Device:Buzzer BZ1001
U 1 1 5A568FDE
P 3590 5960
F 0 "BZ1001" H 3740 6010 50  0000 L CNN
F 1 "AI-1027-TWT-3V-R" H 3740 5910 50  0000 L CNN
F 2 "Custom Footprints Library:AI-1027-TWT-3V-R" V 3565 6060 50  0001 C CNN
F 3 "" V 3565 6060 50  0001 C CNN
F 4 "AI-1027-TWT-3V-R" H 3590 5960 60  0001 C CNN "Digi-Key PN"
	1    3590 5960
	1    0    0    -1  
$EndComp
$Comp
L Custom-Library:+3.3V #PWR1005
U 1 1 5B3D62E8
P 3370 5740
F 0 "#PWR1005" H 3370 5590 50  0001 C CNN
F 1 "+3.3V" H 3370 5880 50  0000 C CNN
F 2 "" H 3370 5740 50  0000 C CNN
F 3 "" H 3370 5740 50  0000 C CNN
	1    3370 5740
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q1002
U 1 1 5B3D6E04
P 3270 6380
F 0 "Q1002" H 3480 6430 50  0000 L CNN
F 1 "2N7002" H 3770 6330 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 3470 6480 29  0001 C CNN
F 3 "" H 3270 6380 60  0000 C CNN
	1    3270 6380
	1    0    0    -1  
$EndComp
$EndSCHEMATC

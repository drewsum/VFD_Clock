EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 11 30
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 1590 2160 0    50   UnSpc ~ 0
POS60_VAN_SNS_IN+
Text GLabel 1590 2620 0    50   UnSpc ~ 0
POS60_VAN_SNS_IN-
$Comp
L power:GND #PWR?
U 1 1 5E2AA997
P 3160 5440
AR Path="/5B3E071A/5E2AA997" Ref="#PWR?"  Part="1" 
AR Path="/5E0652BA/5E2AA997" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E2AA997" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E2AA997" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E2AA997" Ref="#PWR?"  Part="1" 
AR Path="/5E164364/5E2AA997" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3160 5190 50  0001 C CNN
F 1 "GND" H 3160 5290 50  0000 C CNN
F 2 "" H 3160 5440 50  0001 C CNN
F 3 "" H 3160 5440 50  0001 C CNN
	1    3160 5440
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3160 5440 3160 5400
Wire Wire Line
	3160 5400 3160 5360
Wire Wire Line
	3160 5400 3060 5400
Wire Wire Line
	3060 5400 3060 5360
Connection ~ 3160 5400
$Comp
L power:+3.3V #PWR?
U 1 1 5E2AA999
P 3160 4360
AR Path="/5E0652BA/5E2AA999" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E2AA999" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E2AA999" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E2AA999" Ref="#PWR?"  Part="1" 
AR Path="/5E164364/5E2AA999" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3160 4210 50  0001 C CNN
F 1 "+3.3V" H 3160 4500 50  0000 C CNN
F 2 "" H 3160 4360 50  0001 C CNN
F 3 "" H 3160 4360 50  0001 C CNN
	1    3160 4360
	-1   0    0    -1  
$EndComp
$Comp
L Sensor_Temperature:MCP9804_DFN U?
U 1 1 5E2AA9A0
P 3160 4860
AR Path="/5B3E071A/5E2AA9A0" Ref="U?"  Part="1" 
AR Path="/5E0652BA/5E2AA9A0" Ref="U?"  Part="1" 
AR Path="/5E0A0E29/5E2AA9A0" Ref="U?"  Part="1" 
AR Path="/5E0DC084/5E2AA9A0" Ref="U?"  Part="1" 
AR Path="/5E0F9112/5E2AA9A0" Ref="U?"  Part="1" 
AR Path="/5E164364/5E2AA9A0" Ref="U?"  Part="1" 
F 0 "U?" H 2910 5310 50  0000 C CNN
F 1 "MCP9804" H 3560 5310 50  0000 C CNN
F 2 "Package_DFN_QFN:DFN-8-1EP_3x2mm_P0.5mm_EP1.3x1.5mm" H 2060 4360 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 2910 5310 50  0001 C CNN
	1    3160 4860
	-1   0    0    -1  
$EndComp
Text GLabel 3560 4660 2    50   Input ~ 0
I2C_SCL
Text GLabel 3560 4560 2    50   BiDi ~ 0
I2C_SDA
NoConn ~ 2760 4860
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E2AA9A3
P 3160 6010
AR Path="/5B3E071A/5E2AA9A3" Ref="C?"  Part="1" 
AR Path="/5E0652BA/5E2AA9A3" Ref="C?"  Part="1" 
AR Path="/5E0A0E29/5E2AA9A3" Ref="C?"  Part="1" 
AR Path="/5E0DC084/5E2AA9A3" Ref="C?"  Part="1" 
AR Path="/5E0F9112/5E2AA9A3" Ref="C?"  Part="1" 
AR Path="/5E164364/5E2AA9A3" Ref="C?"  Part="1" 
F 0 "C?" H 3185 6110 50  0000 L CNN
F 1 "0.1uF" H 3185 5910 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3198 5860 50  0001 C CNN
F 3 "" H 3185 6110 50  0001 C CNN
F 4 "0603" H 3010 6110 50  0000 R CNN "display_footprint"
F 5 "50V" H 3010 6010 50  0000 R CNN "Voltage"
F 6 "X7R" H 3010 5910 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H -750 -870 50  0001 C CNN "Digi-Key PN"
	1    3160 6010
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E0CB7B0
P 3160 5860
AR Path="/5E0652BA/5E0CB7B0" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E0CB7B0" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E0CB7B0" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E0CB7B0" Ref="#PWR?"  Part="1" 
AR Path="/5E164364/5E0CB7B0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3160 5710 50  0001 C CNN
F 1 "+3.3V" H 3160 6000 50  0000 C CNN
F 2 "" H 3160 5860 50  0001 C CNN
F 3 "" H 3160 5860 50  0001 C CNN
	1    3160 5860
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0CB7B6
P 3160 6160
AR Path="/5E0652BA/5E0CB7B6" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E0CB7B6" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E0CB7B6" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E0CB7B6" Ref="#PWR?"  Part="1" 
AR Path="/5E164364/5E0CB7B6" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3160 5910 50  0001 C CNN
F 1 "GND" H 3160 6010 50  0000 C CNN
F 2 "" H 3160 6160 50  0001 C CNN
F 3 "" H 3160 6160 50  0001 C CNN
	1    3160 6160
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:I2C_Address DOC?
U 1 1 5E2AA9B1
P 4060 5880
AR Path="/5E0652BA/5E2AA9B1" Ref="DOC?"  Part="1" 
AR Path="/5E0A0E29/5E2AA9B1" Ref="DOC?"  Part="1" 
AR Path="/5E0DC084/5E2AA9B1" Ref="DOC?"  Part="1" 
AR Path="/5E0F9112/5E2AA9B1" Ref="DOC?"  Part="1" 
AR Path="/5E164364/5E2AA9B1" Ref="DOC?"  Part="1" 
F 0 "DOC?" H 4060 6130 60  0001 C CNN
F 1 "askjdfasdf" H 3610 5880 60  0000 L CNN
F 2 "" H 4060 6230 60  0001 C CNN
F 3 "" H 4060 6230 60  0001 C CNN
	1    4060 5880
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:LTC4151DD U?
U 1 1 5E11F17D
P 7730 2310
F 0 "U?" H 8180 2860 50  0000 R CNN
F 1 "LTC4151DD" H 7730 2460 50  0000 C CNN
F 2 "Housings_DFN_QFN:DFN-10-1EP_3x3mm_Pitch0.5mm" H 7730 2310 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/4151ff.pdf" H 7730 2310 50  0001 C CNN
F 4 "LTC4151CDD#PBF-ND" H 7730 2310 50  0001 C CNN "Digi-Key PN"
	1    7730 2310
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E1215D9
P 7730 2990
F 0 "#PWR?" H 7730 2740 50  0001 C CNN
F 1 "GND" H 7730 2840 50  0000 C CNN
F 2 "" H 7730 2990 50  0001 C CNN
F 3 "" H 7730 2990 50  0001 C CNN
	1    7730 2990
	1    0    0    -1  
$EndComp
Wire Wire Line
	7730 2990 7730 2950
Wire Wire Line
	7730 2950 7680 2950
Wire Wire Line
	7680 2950 7680 2910
Wire Wire Line
	7730 2950 7780 2950
Wire Wire Line
	7780 2950 7780 2910
Connection ~ 7730 2950
$Comp
L Custom_Library:I2C_Address DOC?
U 1 1 5E123985
P 9250 3180
AR Path="/5E0652BA/5E123985" Ref="DOC?"  Part="1" 
AR Path="/5E0A0E29/5E123985" Ref="DOC?"  Part="1" 
AR Path="/5E0DC084/5E123985" Ref="DOC?"  Part="1" 
AR Path="/5E0F9112/5E123985" Ref="DOC?"  Part="1" 
AR Path="/5E164364/5E123985" Ref="DOC?"  Part="1" 
F 0 "DOC?" H 9250 3430 60  0001 C CNN
F 1 "kjwqenflkjndsf" H 8800 3180 60  0000 L CNN
F 2 "" H 9250 3530 60  0001 C CNN
F 3 "" H 9250 3530 60  0001 C CNN
	1    9250 3180
	1    0    0    -1  
$EndComp
Text GLabel 8280 2310 2    50   Input ~ 0
I2C_SCL
Text GLabel 8280 2410 2    50   BiDi ~ 0
I2C_SDA
NoConn ~ 8280 1910
$Comp
L Custom_Library:+60VAN #PWR?
U 1 1 5E12E158
P 7730 1710
F 0 "#PWR?" H 7730 1560 50  0001 C CNN
F 1 "+60VAN" H 7730 1850 50  0000 C CNN
F 2 "" H 7730 1710 50  0000 C CNN
F 3 "" H 7730 1710 50  0000 C CNN
	1    7730 1710
	1    0    0    -1  
$EndComp
Text GLabel 5960 2130 0    50   UnSpc ~ 0
POS60_VAN_SNS_OUT+
Text GLabel 5960 2590 0    50   UnSpc ~ 0
POS60_VAN_SNS_OUT-
Wire Wire Line
	6700 2590 6700 2510
Wire Wire Line
	6700 2210 6700 2130
Wire Wire Line
	6700 2590 7140 2590
Wire Wire Line
	7140 2590 7140 2410
Wire Wire Line
	7140 2410 7180 2410
Connection ~ 6700 2590
Wire Wire Line
	6700 2130 7140 2130
Wire Wire Line
	7140 2130 7140 2310
Wire Wire Line
	7140 2310 7180 2310
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E1334DD
P 6700 2360
AR Path="/5B3E071A/5E1334DD" Ref="C?"  Part="1" 
AR Path="/5E0652BA/5E1334DD" Ref="C?"  Part="1" 
AR Path="/5E0A0E29/5E1334DD" Ref="C?"  Part="1" 
AR Path="/5E0DC084/5E1334DD" Ref="C?"  Part="1" 
AR Path="/5E0F9112/5E1334DD" Ref="C?"  Part="1" 
AR Path="/5E164364/5E1334DD" Ref="C?"  Part="1" 
F 0 "C?" H 6725 2460 50  0000 L CNN
F 1 "0.1uF" H 6725 2260 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6738 2210 50  0001 C CNN
F 3 "" H 6725 2460 50  0001 C CNN
F 4 "0603" H 6550 2460 50  0000 R CNN "display_footprint"
F 5 "50V" H 6550 2360 50  0000 R CNN "Voltage"
F 6 "X7R" H 6550 2260 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H 2790 -4520 50  0001 C CNN "Digi-Key PN"
	1    6700 2360
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E1334EB
P 6110 2590
AR Path="/5CB6F1ED/5E1334EB" Ref="R?"  Part="1" 
AR Path="/5E0652BA/5E1334EB" Ref="R?"  Part="1" 
AR Path="/5E0A0E29/5E1334EB" Ref="R?"  Part="1" 
AR Path="/5E0DC084/5E1334EB" Ref="R?"  Part="1" 
AR Path="/5E0F9112/5E1334EB" Ref="R?"  Part="1" 
AR Path="/5E164364/5E1334EB" Ref="R?"  Part="1" 
F 0 "R?" V 6010 2590 50  0000 C CNN
F 1 "10" V 6110 2590 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6110 2590 50  0001 C CNN
F 3 "" H 6110 2590 50  0001 C CNN
F 4 "YAG3351CT-ND" H 6410 2990 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 6210 2590 50  0000 C CNN "display_footprint"
F 6 "1%" V 6310 2590 50  0000 C CNN "Tolerance"
F 7 "1/10W" V 6410 2590 50  0000 C CNN "Wattage"
	1    6110 2590
	0    1    1    0   
$EndComp
Wire Wire Line
	6260 2590 6700 2590
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E1334FA
P 6110 2130
AR Path="/5CB6F1ED/5E1334FA" Ref="R?"  Part="1" 
AR Path="/5E0652BA/5E1334FA" Ref="R?"  Part="1" 
AR Path="/5E0A0E29/5E1334FA" Ref="R?"  Part="1" 
AR Path="/5E0DC084/5E1334FA" Ref="R?"  Part="1" 
AR Path="/5E0F9112/5E1334FA" Ref="R?"  Part="1" 
AR Path="/5E164364/5E1334FA" Ref="R?"  Part="1" 
F 0 "R?" V 6010 2130 50  0000 C CNN
F 1 "10" V 6110 2130 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6110 2130 50  0001 C CNN
F 3 "" H 6110 2130 50  0001 C CNN
F 4 "YAG3351CT-ND" H 6410 2530 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 6210 2130 50  0000 C CNN "display_footprint"
F 6 "1%" V 6310 2130 50  0000 C CNN "Tolerance"
F 7 "1/10W" V 6410 2130 50  0000 C CNN "Wattage"
	1    6110 2130
	0    1    -1   0   
$EndComp
Wire Wire Line
	6260 2130 6700 2130
Connection ~ 6700 2130
$Comp
L power:GND #PWR?
U 1 1 5E137C8A
P 7100 2790
F 0 "#PWR?" H 7100 2540 50  0001 C CNN
F 1 "GND" H 7100 2640 50  0000 C CNN
F 2 "" H 7100 2790 50  0001 C CNN
F 3 "" H 7100 2790 50  0001 C CNN
	1    7100 2790
	1    0    0    -1  
$EndComp
Wire Wire Line
	7180 2710 7100 2710
Wire Wire Line
	7100 2710 7100 2790
$Comp
L power:GND #PWR?
U 1 1 5E1F5539
P 3210 2800
AR Path="/5E0652BA/5E1F5539" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E1F5539" Ref="#PWR?"  Part="1" 
AR Path="/5E052856/5E1F5539" Ref="#PWR?"  Part="1" 
AR Path="/5E164364/5E1F5539" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3210 2550 50  0001 C CNN
F 1 "GND" H 3210 2650 50  0000 C CNN
F 2 "" H 3210 2800 50  0001 C CNN
F 3 "" H 3210 2800 50  0001 C CNN
	1    3210 2800
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E1F553F
P 3210 2000
AR Path="/5E0652BA/5E1F553F" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E1F553F" Ref="#PWR?"  Part="1" 
AR Path="/5E052856/5E1F553F" Ref="#PWR?"  Part="1" 
AR Path="/5E164364/5E1F553F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3210 1850 50  0001 C CNN
F 1 "+3.3V" H 3210 2140 50  0000 C CNN
F 2 "" H 3210 2000 50  0001 C CNN
F 3 "" H 3210 2000 50  0001 C CNN
	1    3210 2000
	1    0    0    -1  
$EndComp
Text GLabel 3610 2300 2    50   Input ~ 0
I2C_SCL
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E1F554A
P 3210 3370
AR Path="/5B3E071A/5E1F554A" Ref="C?"  Part="1" 
AR Path="/5E0652BA/5E1F554A" Ref="C?"  Part="1" 
AR Path="/5E0A0E29/5E1F554A" Ref="C?"  Part="1" 
AR Path="/5E052856/5E1F554A" Ref="C?"  Part="1" 
AR Path="/5E164364/5E1F554A" Ref="C?"  Part="1" 
F 0 "C?" H 3235 3470 50  0000 L CNN
F 1 "0.1uF" H 3235 3270 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3248 3220 50  0001 C CNN
F 3 "" H 3235 3470 50  0001 C CNN
F 4 "0603" H 3060 3470 50  0000 R CNN "display_footprint"
F 5 "50V" H 3060 3370 50  0000 R CNN "Voltage"
F 6 "X7R" H 3060 3270 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H -700 -3510 50  0001 C CNN "Digi-Key PN"
	1    3210 3370
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E1F5550
P 3210 3220
AR Path="/5E0652BA/5E1F5550" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E1F5550" Ref="#PWR?"  Part="1" 
AR Path="/5E052856/5E1F5550" Ref="#PWR?"  Part="1" 
AR Path="/5E164364/5E1F5550" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3210 3070 50  0001 C CNN
F 1 "+3.3V" H 3210 3360 50  0000 C CNN
F 2 "" H 3210 3220 50  0001 C CNN
F 3 "" H 3210 3220 50  0001 C CNN
	1    3210 3220
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E1F5556
P 3210 3520
AR Path="/5E0652BA/5E1F5556" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E1F5556" Ref="#PWR?"  Part="1" 
AR Path="/5E052856/5E1F5556" Ref="#PWR?"  Part="1" 
AR Path="/5E164364/5E1F5556" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3210 3270 50  0001 C CNN
F 1 "GND" H 3210 3370 50  0000 C CNN
F 2 "" H 3210 3520 50  0001 C CNN
F 3 "" H 3210 3520 50  0001 C CNN
	1    3210 3520
	1    0    0    -1  
$EndComp
Text GLabel 3610 2200 2    50   BiDi ~ 0
I2C_SDA
$Comp
L Custom_Library:I2C_Address DOC?
U 1 1 5E1F555D
P 4110 3240
AR Path="/5E0652BA/5E1F555D" Ref="DOC?"  Part="1" 
AR Path="/5E0A0E29/5E1F555D" Ref="DOC?"  Part="1" 
AR Path="/5E052856/5E1F555D" Ref="DOC?"  Part="1" 
AR Path="/5E164364/5E1F555D" Ref="DOC?"  Part="1" 
F 0 "DOC?" H 4110 3490 60  0001 C CNN
F 1 "ljbfadsf" H 3660 3240 60  0000 L CNN
F 2 "" H 4110 3590 60  0001 C CNN
F 3 "" H 4110 3590 60  0001 C CNN
	1    4110 3240
	1    0    0    -1  
$EndComp
Wire Wire Line
	2330 2620 2330 2540
Wire Wire Line
	2330 2240 2330 2160
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E1F5569
P 2330 2390
AR Path="/5B3E071A/5E1F5569" Ref="C?"  Part="1" 
AR Path="/5E0652BA/5E1F5569" Ref="C?"  Part="1" 
AR Path="/5E0A0E29/5E1F5569" Ref="C?"  Part="1" 
AR Path="/5E052856/5E1F5569" Ref="C?"  Part="1" 
AR Path="/5E164364/5E1F5569" Ref="C?"  Part="1" 
F 0 "C?" H 2355 2490 50  0000 L CNN
F 1 "0.1uF" H 2355 2290 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2368 2240 50  0001 C CNN
F 3 "" H 2355 2490 50  0001 C CNN
F 4 "0603" H 2180 2490 50  0000 R CNN "display_footprint"
F 5 "50V" H 2180 2390 50  0000 R CNN "Voltage"
F 6 "X7R" H 2180 2290 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H -1580 -4490 50  0001 C CNN "Digi-Key PN"
	1    2330 2390
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E1F5573
P 1740 2620
AR Path="/5CB6F1ED/5E1F5573" Ref="R?"  Part="1" 
AR Path="/5E0652BA/5E1F5573" Ref="R?"  Part="1" 
AR Path="/5E0A0E29/5E1F5573" Ref="R?"  Part="1" 
AR Path="/5E052856/5E1F5573" Ref="R?"  Part="1" 
AR Path="/5E164364/5E1F5573" Ref="R?"  Part="1" 
F 0 "R?" V 1640 2620 50  0000 C CNN
F 1 "10" V 1740 2620 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 1740 2620 50  0001 C CNN
F 3 "" H 1740 2620 50  0001 C CNN
F 4 "YAG3351CT-ND" H 2040 3020 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 1840 2620 50  0000 C CNN "display_footprint"
F 6 "1%" V 1940 2620 50  0000 C CNN "Tolerance"
F 7 "1/10W" V 2040 2620 50  0000 C CNN "Wattage"
	1    1740 2620
	0    1    1    0   
$EndComp
Wire Wire Line
	1890 2620 2330 2620
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E1F557E
P 1740 2160
AR Path="/5CB6F1ED/5E1F557E" Ref="R?"  Part="1" 
AR Path="/5E0652BA/5E1F557E" Ref="R?"  Part="1" 
AR Path="/5E0A0E29/5E1F557E" Ref="R?"  Part="1" 
AR Path="/5E052856/5E1F557E" Ref="R?"  Part="1" 
AR Path="/5E164364/5E1F557E" Ref="R?"  Part="1" 
F 0 "R?" V 1640 2160 50  0000 C CNN
F 1 "10" V 1740 2160 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 1740 2160 50  0001 C CNN
F 3 "" H 1740 2160 50  0001 C CNN
F 4 "YAG3351CT-ND" H 2040 2560 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 1840 2160 50  0000 C CNN "display_footprint"
F 6 "1%" V 1940 2160 50  0000 C CNN "Tolerance"
F 7 "1/10W" V 2040 2160 50  0000 C CNN "Wattage"
	1    1740 2160
	0    1    -1   0   
$EndComp
Wire Wire Line
	1890 2160 2330 2160
$Comp
L Analog_ADC:INA219BxDCN U?
U 1 1 5E1F5586
P 3210 2400
AR Path="/5E0652BA/5E1F5586" Ref="U?"  Part="1" 
AR Path="/5E164364/5E1F5586" Ref="U?"  Part="1" 
F 0 "U?" H 2960 2750 50  0000 C CNN
F 1 "INA219BxDCN" H 3460 2750 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-8" H 3860 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina219.pdf" H 3560 2300 50  0001 C CNN
F 4 "296-46420-1-ND" H 3210 2400 50  0001 C CNN "Digi-Key PN"
	1    3210 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2810 2300 2640 2300
Wire Wire Line
	2640 2300 2640 2160
Wire Wire Line
	2640 2160 2330 2160
Connection ~ 2330 2160
Wire Wire Line
	2810 2500 2640 2500
Wire Wire Line
	2640 2500 2640 2620
Wire Wire Line
	2640 2620 2330 2620
Connection ~ 2330 2620
$EndSCHEMATC

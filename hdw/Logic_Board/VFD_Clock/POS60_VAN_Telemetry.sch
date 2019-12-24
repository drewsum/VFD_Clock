EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 25 26
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
L Custom_Library:INA231A U?
U 1 1 5E073058
P 3210 2240
AR Path="/5E0652BA/5E073058" Ref="U?"  Part="1" 
AR Path="/5E0A0E29/5E073058" Ref="U?"  Part="1" 
AR Path="/5E0DC084/5E073058" Ref="U?"  Part="1" 
AR Path="/5E0F9112/5E073058" Ref="U?"  Part="1" 
AR Path="/5E164364/5E073058" Ref="U?"  Part="1" 
F 0 "U?" H 2960 2690 50  0000 C CNN
F 1 "INA231A" H 3360 2690 50  0000 C CNN
F 2 "Custom Footprints Library:Texas_DSBGA-12_1.65x1.39mm_Layout3x4_P0.4mm" H 4010 1790 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina231.pdf" H 3560 2140 50  0001 C CNN
F 4 "296-41263-1-ND" H 3210 2240 50  0001 C CNN "Digi-Key PN"
	1    3210 2240
	1    0    0    -1  
$EndComp
Text GLabel 1590 2160 0    50   UnSpc ~ 0
POS60_VAN_SNS_IN+
Text GLabel 1590 2620 0    50   UnSpc ~ 0
POS60_VAN_SNS_IN-
$Comp
L power:GND #PWR?
U 1 1 5E0ACFF2
P 3210 2740
AR Path="/5E0652BA/5E0ACFF2" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E0ACFF2" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E0ACFF2" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E0ACFF2" Ref="#PWR?"  Part="1" 
AR Path="/5E164364/5E0ACFF2" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3210 2490 50  0001 C CNN
F 1 "GND" H 3210 2590 50  0000 C CNN
F 2 "" H 3210 2740 50  0001 C CNN
F 3 "" H 3210 2740 50  0001 C CNN
	1    3210 2740
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E0AD665
P 3210 1740
AR Path="/5E0652BA/5E0AD665" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E0AD665" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E0AD665" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E0AD665" Ref="#PWR?"  Part="1" 
AR Path="/5E164364/5E0AD665" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3210 1590 50  0001 C CNN
F 1 "+3.3V" H 3210 1880 50  0000 C CNN
F 2 "" H 3210 1740 50  0001 C CNN
F 3 "" H 3210 1740 50  0001 C CNN
	1    3210 1740
	1    0    0    -1  
$EndComp
Text GLabel 3610 2040 2    50   Input ~ 0
TELEM_I2C_SCL
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E0B2427
P 3210 3310
AR Path="/5B3E071A/5E0B2427" Ref="C?"  Part="1" 
AR Path="/5E0652BA/5E0B2427" Ref="C?"  Part="1" 
AR Path="/5E0A0E29/5E0B2427" Ref="C?"  Part="1" 
AR Path="/5E0DC084/5E0B2427" Ref="C?"  Part="1" 
AR Path="/5E0F9112/5E0B2427" Ref="C?"  Part="1" 
AR Path="/5E164364/5E0B2427" Ref="C?"  Part="1" 
F 0 "C?" H 3235 3410 50  0000 L CNN
F 1 "0.1uF" H 3235 3210 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3248 3160 50  0001 C CNN
F 3 "" H 3235 3410 50  0001 C CNN
F 4 "0603" H 3060 3410 50  0000 R CNN "display_footprint"
F 5 "50V" H 3060 3310 50  0000 R CNN "Voltage"
F 6 "X7R" H 3060 3210 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H -700 -3570 50  0001 C CNN "Digi-Key PN"
	1    3210 3310
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E0B535B
P 3210 3160
AR Path="/5E0652BA/5E0B535B" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E0B535B" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E0B535B" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E0B535B" Ref="#PWR?"  Part="1" 
AR Path="/5E164364/5E0B535B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3210 3010 50  0001 C CNN
F 1 "+3.3V" H 3210 3300 50  0000 C CNN
F 2 "" H 3210 3160 50  0001 C CNN
F 3 "" H 3210 3160 50  0001 C CNN
	1    3210 3160
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0B592B
P 3210 3460
AR Path="/5E0652BA/5E0B592B" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E0B592B" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E0B592B" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E0B592B" Ref="#PWR?"  Part="1" 
AR Path="/5E164364/5E0B592B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3210 3210 50  0001 C CNN
F 1 "GND" H 3210 3310 50  0000 C CNN
F 2 "" H 3210 3460 50  0001 C CNN
F 3 "" H 3210 3460 50  0001 C CNN
	1    3210 3460
	1    0    0    -1  
$EndComp
Text GLabel 3610 1940 2    50   BiDi ~ 0
TELEM_I2C_SDA
NoConn ~ 3610 2240
$Comp
L Custom_Library:I2C_Address DOC?
U 1 1 5E0B8BC8
P 4110 3180
AR Path="/5E0652BA/5E0B8BC8" Ref="DOC?"  Part="1" 
AR Path="/5E0A0E29/5E0B8BC8" Ref="DOC?"  Part="1" 
AR Path="/5E0DC084/5E0B8BC8" Ref="DOC?"  Part="1" 
AR Path="/5E0F9112/5E0B8BC8" Ref="DOC?"  Part="1" 
AR Path="/5E164364/5E0B8BC8" Ref="DOC?"  Part="1" 
F 0 "DOC?" H 4110 3430 60  0001 C CNN
F 1 "kjwqenflkjndsf" H 3660 3180 60  0000 L CNN
F 2 "" H 4110 3530 60  0001 C CNN
F 3 "" H 4110 3530 60  0001 C CNN
	1    4110 3180
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0BDB8A
P 3160 5440
AR Path="/5B3E071A/5E0BDB8A" Ref="#PWR?"  Part="1" 
AR Path="/5E0652BA/5E0BDB8A" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E0BDB8A" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E0BDB8A" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E0BDB8A" Ref="#PWR?"  Part="1" 
AR Path="/5E164364/5E0BDB8A" Ref="#PWR?"  Part="1" 
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
U 1 1 5E0BDB95
P 3160 4360
AR Path="/5E0652BA/5E0BDB95" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E0BDB95" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E0BDB95" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E0BDB95" Ref="#PWR?"  Part="1" 
AR Path="/5E164364/5E0BDB95" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3160 4210 50  0001 C CNN
F 1 "+3.3V" H 3160 4500 50  0000 C CNN
F 2 "" H 3160 4360 50  0001 C CNN
F 3 "" H 3160 4360 50  0001 C CNN
	1    3160 4360
	-1   0    0    -1  
$EndComp
$Comp
L Sensor_Temperature:MCP9804_DFN U?
U 1 1 5E0BDB9D
P 3160 4860
AR Path="/5B3E071A/5E0BDB9D" Ref="U?"  Part="1" 
AR Path="/5E0652BA/5E0BDB9D" Ref="U?"  Part="1" 
AR Path="/5E0A0E29/5E0BDB9D" Ref="U?"  Part="1" 
AR Path="/5E0DC084/5E0BDB9D" Ref="U?"  Part="1" 
AR Path="/5E0F9112/5E0BDB9D" Ref="U?"  Part="1" 
AR Path="/5E164364/5E0BDB9D" Ref="U?"  Part="1" 
F 0 "U?" H 2910 5310 50  0000 C CNN
F 1 "MCP9804" H 3560 5310 50  0000 C CNN
F 2 "Package_DFN_QFN:DFN-8-1EP_3x2mm_P0.5mm_EP1.3x1.5mm" H 2060 4360 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 2910 5310 50  0001 C CNN
	1    3160 4860
	-1   0    0    -1  
$EndComp
Text GLabel 3560 4660 2    50   Input ~ 0
TELEM_I2C_SCL
Text GLabel 3560 4560 2    50   BiDi ~ 0
TELEM_I2C_SDA
NoConn ~ 2760 4860
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E0CB7AA
P 3160 6010
AR Path="/5B3E071A/5E0CB7AA" Ref="C?"  Part="1" 
AR Path="/5E0652BA/5E0CB7AA" Ref="C?"  Part="1" 
AR Path="/5E0A0E29/5E0CB7AA" Ref="C?"  Part="1" 
AR Path="/5E0DC084/5E0CB7AA" Ref="C?"  Part="1" 
AR Path="/5E0F9112/5E0CB7AA" Ref="C?"  Part="1" 
AR Path="/5E164364/5E0CB7AA" Ref="C?"  Part="1" 
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
U 1 1 5E0CB7BC
P 4060 5880
AR Path="/5E0652BA/5E0CB7BC" Ref="DOC?"  Part="1" 
AR Path="/5E0A0E29/5E0CB7BC" Ref="DOC?"  Part="1" 
AR Path="/5E0DC084/5E0CB7BC" Ref="DOC?"  Part="1" 
AR Path="/5E0F9112/5E0CB7BC" Ref="DOC?"  Part="1" 
AR Path="/5E164364/5E0CB7BC" Ref="DOC?"  Part="1" 
F 0 "DOC?" H 4060 6130 60  0001 C CNN
F 1 "askjdfasdf" H 3610 5880 60  0000 L CNN
F 2 "" H 4060 6230 60  0001 C CNN
F 3 "" H 4060 6230 60  0001 C CNN
	1    4060 5880
	1    0    0    -1  
$EndComp
Wire Wire Line
	2330 2620 2330 2540
Wire Wire Line
	2330 2240 2330 2160
Wire Wire Line
	2330 2620 2770 2620
Wire Wire Line
	2770 2620 2770 2440
Wire Wire Line
	2770 2440 2810 2440
Connection ~ 2330 2620
Wire Wire Line
	2330 2160 2770 2160
Wire Wire Line
	2770 2160 2770 2340
Wire Wire Line
	2770 2340 2810 2340
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E07E0FD
P 2330 2390
AR Path="/5B3E071A/5E07E0FD" Ref="C?"  Part="1" 
AR Path="/5E0652BA/5E07E0FD" Ref="C?"  Part="1" 
AR Path="/5E0A0E29/5E07E0FD" Ref="C?"  Part="1" 
AR Path="/5E0DC084/5E07E0FD" Ref="C?"  Part="1" 
AR Path="/5E0F9112/5E07E0FD" Ref="C?"  Part="1" 
AR Path="/5E164364/5E07E0FD" Ref="C?"  Part="1" 
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
U 1 1 5E082EBB
P 1740 2620
AR Path="/5CB6F1ED/5E082EBB" Ref="R?"  Part="1" 
AR Path="/5E0652BA/5E082EBB" Ref="R?"  Part="1" 
AR Path="/5E0A0E29/5E082EBB" Ref="R?"  Part="1" 
AR Path="/5E0DC084/5E082EBB" Ref="R?"  Part="1" 
AR Path="/5E0F9112/5E082EBB" Ref="R?"  Part="1" 
AR Path="/5E164364/5E082EBB" Ref="R?"  Part="1" 
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
U 1 1 5E083C4C
P 1740 2160
AR Path="/5CB6F1ED/5E083C4C" Ref="R?"  Part="1" 
AR Path="/5E0652BA/5E083C4C" Ref="R?"  Part="1" 
AR Path="/5E0A0E29/5E083C4C" Ref="R?"  Part="1" 
AR Path="/5E0DC084/5E083C4C" Ref="R?"  Part="1" 
AR Path="/5E0F9112/5E083C4C" Ref="R?"  Part="1" 
AR Path="/5E164364/5E083C4C" Ref="R?"  Part="1" 
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
Connection ~ 2330 2160
Text GLabel 7870 1520 0    50   UnSpc ~ 0
POS60_VAN_SNS_OUT+
Text GLabel 7870 1720 0    50   UnSpc ~ 0
POS60_VAN_SNS_OUT-
$Comp
L power:+12V #PWR?
U 1 1 5E0AD80E
P 2810 1940
AR Path="/5E0652BA/5E0AD80E" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E0AD80E" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E0AD80E" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E0AD80E" Ref="#PWR?"  Part="1" 
AR Path="/5E164364/5E0AD80E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2810 1790 50  0001 C CNN
F 1 "+12V" V 2810 2070 50  0000 L CNN
F 2 "" H 2810 1940 50  0001 C CNN
F 3 "" H 2810 1940 50  0001 C CNN
	1    2810 1940
	0    -1   -1   0   
$EndComp
Text Notes 7160 3890 0    50   ~ 0
High voltage analog current sense amp bullshit,\n+60VAN voltage measurement op amp stuff
$Comp
L Amplifier_Current:INA138 U?
U 1 1 5E0BE8A1
P 8170 1620
F 0 "U?" H 8320 1820 50  0000 L CNN
F 1 "INA138" H 8320 1720 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 8170 1620 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina138.pdf" H 8170 1625 50  0001 C CNN
	1    8170 1620
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+60VAN #PWR?
U 1 1 5E0BF1DE
P 8070 1320
F 0 "#PWR?" H 8070 1170 50  0001 C CNN
F 1 "+60VAN" H 8070 1460 50  0000 C CNN
F 2 "" H 8070 1320 50  0000 C CNN
F 3 "" H 8070 1320 50  0000 C CNN
	1    8070 1320
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D?
U 1 1 5E0C1B2E
P 5980 1620
F 0 "D?" H 5980 1720 50  0000 C CNN
F 1 "DDZ12CSF" H 5980 1520 50  0000 C CNN
F 2 "" H 5980 1620 50  0001 C CNN
F 3 "~" H 5980 1620 50  0001 C CNN
F 4 "DDZ12CSF-7DICT-ND" H 5980 1620 50  0001 C CNN "Digi-Key PN"
	1    5980 1620
	0    1    1    0   
$EndComp
Wire Wire Line
	5980 1770 5980 2000
Wire Wire Line
	5980 2000 6510 2000
Wire Wire Line
	8070 2000 8070 1920
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E0C2803
P 5470 1620
AR Path="/5B3E071A/5E0C2803" Ref="C?"  Part="1" 
AR Path="/5E0652BA/5E0C2803" Ref="C?"  Part="1" 
AR Path="/5E0A0E29/5E0C2803" Ref="C?"  Part="1" 
AR Path="/5E0DC084/5E0C2803" Ref="C?"  Part="1" 
AR Path="/5E0F9112/5E0C2803" Ref="C?"  Part="1" 
AR Path="/5E164364/5E0C2803" Ref="C?"  Part="1" 
F 0 "C?" H 5495 1720 50  0000 L CNN
F 1 "0.1uF" H 5495 1520 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5508 1470 50  0001 C CNN
F 3 "" H 5495 1720 50  0001 C CNN
F 4 "0603" H 5320 1720 50  0000 R CNN "display_footprint"
F 5 "50V" H 5320 1620 50  0000 R CNN "Voltage"
F 6 "X7R" H 5320 1520 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H 1560 -5260 50  0001 C CNN "Digi-Key PN"
	1    5470 1620
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+60VAN #PWR?
U 1 1 5E0C38BC
P 5980 1470
F 0 "#PWR?" H 5980 1320 50  0001 C CNN
F 1 "+60VAN" H 5980 1610 50  0000 C CNN
F 2 "" H 5980 1470 50  0000 C CNN
F 3 "" H 5980 1470 50  0000 C CNN
	1    5980 1470
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+60VAN #PWR?
U 1 1 5E0C3D9B
P 5470 1470
F 0 "#PWR?" H 5470 1320 50  0001 C CNN
F 1 "+60VAN" H 5470 1610 50  0000 C CNN
F 2 "" H 5470 1470 50  0000 C CNN
F 3 "" H 5470 1470 50  0000 C CNN
	1    5470 1470
	1    0    0    -1  
$EndComp
Wire Wire Line
	5470 1770 5470 2000
Wire Wire Line
	5470 2000 5980 2000
Connection ~ 5980 2000
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E0C55DC
P 5980 2230
AR Path="/5BB2595E/5E0C55DC" Ref="R?"  Part="1" 
AR Path="/5BAAE0FA/5E0C55DC" Ref="R?"  Part="1" 
AR Path="/5BB86F23/5E0C55DC" Ref="R?"  Part="1" 
AR Path="/5C1D5C9E/5E0C55DC" Ref="R?"  Part="1" 
AR Path="/5CB6F1ED/5E0C55DC" Ref="R?"  Part="1" 
AR Path="/5E164364/5E0C55DC" Ref="R?"  Part="1" 
F 0 "R?" H 5920 2230 50  0000 R CNN
F 1 "100k" V 5980 2230 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 5980 2230 50  0001 C CNN
F 3 "" H 5980 2230 50  0001 C CNN
F 4 "A106046CT-ND" H 6280 2630 60  0001 C CNN "Digi-Key PN"
F 5 "0603" H 6060 2310 50  0000 L CNN "display_footprint"
F 6 "1%" H 6060 2230 50  0000 L CNN "Tolerance"
F 7 "1/10W" H 6060 2150 50  0000 L CNN "Wattage"
	1    5980 2230
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E0C5750
P 5980 2530
AR Path="/5BB2595E/5E0C5750" Ref="R?"  Part="1" 
AR Path="/5BAAE0FA/5E0C5750" Ref="R?"  Part="1" 
AR Path="/5BB86F23/5E0C5750" Ref="R?"  Part="1" 
AR Path="/5C1D5C9E/5E0C5750" Ref="R?"  Part="1" 
AR Path="/5CB6F1ED/5E0C5750" Ref="R?"  Part="1" 
AR Path="/5E164364/5E0C5750" Ref="R?"  Part="1" 
F 0 "R?" H 5920 2530 50  0000 R CNN
F 1 "100k" V 5980 2530 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 5980 2530 50  0001 C CNN
F 3 "" H 5980 2530 50  0001 C CNN
F 4 "A106046CT-ND" H 6280 2930 60  0001 C CNN "Digi-Key PN"
F 5 "0603" H 6060 2610 50  0000 L CNN "display_footprint"
F 6 "1%" H 6060 2530 50  0000 L CNN "Tolerance"
F 7 "1/10W" H 6060 2450 50  0000 L CNN "Wattage"
	1    5980 2530
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0C5B5B
P 5980 2680
F 0 "#PWR?" H 5980 2430 50  0001 C CNN
F 1 "GND" H 5980 2530 50  0000 C CNN
F 2 "" H 5980 2680 50  0001 C CNN
F 3 "" H 5980 2680 50  0001 C CNN
	1    5980 2680
	1    0    0    -1  
$EndComp
Wire Wire Line
	5980 2080 5980 2000
$Comp
L Device:Q_PNP_BEC Q?
U 1 1 5E0C6D59
P 8790 2000
F 0 "Q?" H 8990 2050 50  0000 L CNN
F 1 "STR2550" H 8990 1950 50  0000 L CNN
F 2 "" H 8990 2100 50  0001 C CNN
F 3 "~" H 8790 2000 50  0001 C CNN
F 4 "497-13848-1-ND" H 8790 2000 50  0001 C CNN "Digi-Key PN"
	1    8790 2000
	1    0    0    1   
$EndComp
Wire Wire Line
	8890 1800 8890 1620
Wire Wire Line
	8890 1620 8470 1620
Wire Wire Line
	8590 2000 8070 2000
Connection ~ 8070 2000
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E0C9F97
P 6510 1620
AR Path="/5B3E071A/5E0C9F97" Ref="C?"  Part="1" 
AR Path="/5E0652BA/5E0C9F97" Ref="C?"  Part="1" 
AR Path="/5E0A0E29/5E0C9F97" Ref="C?"  Part="1" 
AR Path="/5E0DC084/5E0C9F97" Ref="C?"  Part="1" 
AR Path="/5E0F9112/5E0C9F97" Ref="C?"  Part="1" 
AR Path="/5E164364/5E0C9F97" Ref="C?"  Part="1" 
F 0 "C?" H 6535 1720 50  0000 L CNN
F 1 "0.1uF" H 6535 1520 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6548 1470 50  0001 C CNN
F 3 "" H 6535 1720 50  0001 C CNN
F 4 "0603" H 6360 1720 50  0000 R CNN "display_footprint"
F 5 "50V" H 6360 1620 50  0000 R CNN "Voltage"
F 6 "X7R" H 6360 1520 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H 2600 -5260 50  0001 C CNN "Digi-Key PN"
	1    6510 1620
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+60VAN #PWR?
U 1 1 5E0C9F9D
P 6510 1470
F 0 "#PWR?" H 6510 1320 50  0001 C CNN
F 1 "+60VAN" H 6510 1610 50  0000 C CNN
F 2 "" H 6510 1470 50  0000 C CNN
F 3 "" H 6510 1470 50  0000 C CNN
	1    6510 1470
	1    0    0    -1  
$EndComp
Wire Wire Line
	6510 1770 6510 2000
Wire Wire Line
	6510 2000 8070 2000
Connection ~ 6510 2000
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E0CDA3A
P 8890 2510
AR Path="/5BB2595E/5E0CDA3A" Ref="R?"  Part="1" 
AR Path="/5BAAE0FA/5E0CDA3A" Ref="R?"  Part="1" 
AR Path="/5BB86F23/5E0CDA3A" Ref="R?"  Part="1" 
AR Path="/5C1D5C9E/5E0CDA3A" Ref="R?"  Part="1" 
AR Path="/5CB6F1ED/5E0CDA3A" Ref="R?"  Part="1" 
AR Path="/5E164364/5E0CDA3A" Ref="R?"  Part="1" 
F 0 "R?" H 8830 2510 50  0000 R CNN
F 1 "100k" V 8890 2510 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 8890 2510 50  0001 C CNN
F 3 "" H 8890 2510 50  0001 C CNN
F 4 "A106046CT-ND" H 9190 2910 60  0001 C CNN "Digi-Key PN"
F 5 "0603" H 8970 2590 50  0000 L CNN "display_footprint"
F 6 "1%" H 8970 2510 50  0000 L CNN "Tolerance"
F 7 "1/10W" H 8970 2430 50  0000 L CNN "Wattage"
	1    8890 2510
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0CE9FF
P 8890 2660
F 0 "#PWR?" H 8890 2410 50  0001 C CNN
F 1 "GND" H 8890 2510 50  0000 C CNN
F 2 "" H 8890 2660 50  0001 C CNN
F 3 "" H 8890 2660 50  0001 C CNN
	1    8890 2660
	1    0    0    -1  
$EndComp
Wire Wire Line
	8890 2360 8890 2280
Text GLabel 9190 2280 2    50   Output ~ 0
POS60_VAN_OUT_ISEN
Wire Wire Line
	9190 2280 8890 2280
Connection ~ 8890 2280
Wire Wire Line
	8890 2280 8890 2200
Text Notes 7070 1110 0    50   ~ 0
From TIDU-833
$EndSCHEMATC

EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 18 30
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
L power:GND #PWR?
U 1 1 5E28BBE9
P 2970 2110
AR Path="/5B3E071A/5E28BBE9" Ref="#PWR?"  Part="1" 
AR Path="/5E0652BA/5E28BBE9" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E28BBE9" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E28BBE9" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E28BBE9" Ref="#PWR?"  Part="1" 
AR Path="/5E2843EF/5E28BBE9" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2970 1860 50  0001 C CNN
F 1 "GND" H 2970 1960 50  0000 C CNN
F 2 "" H 2970 2110 50  0001 C CNN
F 3 "" H 2970 2110 50  0001 C CNN
	1    2970 2110
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2970 2110 2970 2070
Wire Wire Line
	2970 2070 2970 2030
Wire Wire Line
	2970 2070 2870 2070
Wire Wire Line
	2870 2070 2870 2030
Connection ~ 2970 2070
$Comp
L power:+3.3V #PWR?
U 1 1 5E28BBF4
P 2970 1030
AR Path="/5E0652BA/5E28BBF4" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E28BBF4" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E28BBF4" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E28BBF4" Ref="#PWR?"  Part="1" 
AR Path="/5E2843EF/5E28BBF4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2970 880 50  0001 C CNN
F 1 "+3.3V" H 2970 1170 50  0000 C CNN
F 2 "" H 2970 1030 50  0001 C CNN
F 3 "" H 2970 1030 50  0001 C CNN
	1    2970 1030
	-1   0    0    -1  
$EndComp
$Comp
L Sensor_Temperature:MCP9804_DFN U?
U 1 1 5E28BBFA
P 2970 1530
AR Path="/5B3E071A/5E28BBFA" Ref="U?"  Part="1" 
AR Path="/5E0652BA/5E28BBFA" Ref="U?"  Part="1" 
AR Path="/5E0A0E29/5E28BBFA" Ref="U?"  Part="1" 
AR Path="/5E0DC084/5E28BBFA" Ref="U?"  Part="1" 
AR Path="/5E0F9112/5E28BBFA" Ref="U?"  Part="1" 
AR Path="/5E2843EF/5E28BBFA" Ref="U?"  Part="1" 
F 0 "U?" H 2720 1980 50  0000 C CNN
F 1 "MCP9804" H 3370 1980 50  0000 C CNN
F 2 "Package_DFN_QFN:DFN-8-1EP_3x2mm_P0.5mm_EP1.3x1.5mm" H 1870 1030 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 2720 1980 50  0001 C CNN
	1    2970 1530
	-1   0    0    -1  
$EndComp
Text GLabel 3370 1330 2    50   Input ~ 0
I2C_SCL
Text GLabel 3370 1230 2    50   BiDi ~ 0
I2C_SDA
NoConn ~ 2570 1530
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E28BC07
P 2970 2680
AR Path="/5B3E071A/5E28BC07" Ref="C?"  Part="1" 
AR Path="/5E0652BA/5E28BC07" Ref="C?"  Part="1" 
AR Path="/5E0A0E29/5E28BC07" Ref="C?"  Part="1" 
AR Path="/5E0DC084/5E28BC07" Ref="C?"  Part="1" 
AR Path="/5E0F9112/5E28BC07" Ref="C?"  Part="1" 
AR Path="/5E2843EF/5E28BC07" Ref="C?"  Part="1" 
F 0 "C?" H 2995 2780 50  0000 L CNN
F 1 "0.1uF" H 2995 2580 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3008 2530 50  0001 C CNN
F 3 "" H 2995 2780 50  0001 C CNN
F 4 "0603" H 2820 2780 50  0000 R CNN "display_footprint"
F 5 "50V" H 2820 2680 50  0000 R CNN "Voltage"
F 6 "X7R" H 2820 2580 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H -940 -4200 50  0001 C CNN "Digi-Key PN"
	1    2970 2680
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E28BC0D
P 2970 2530
AR Path="/5E0652BA/5E28BC0D" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E28BC0D" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E28BC0D" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E28BC0D" Ref="#PWR?"  Part="1" 
AR Path="/5E2843EF/5E28BC0D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2970 2380 50  0001 C CNN
F 1 "+3.3V" H 2970 2670 50  0000 C CNN
F 2 "" H 2970 2530 50  0001 C CNN
F 3 "" H 2970 2530 50  0001 C CNN
	1    2970 2530
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E28BC13
P 2970 2830
AR Path="/5E0652BA/5E28BC13" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E28BC13" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E28BC13" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E28BC13" Ref="#PWR?"  Part="1" 
AR Path="/5E2843EF/5E28BC13" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2970 2580 50  0001 C CNN
F 1 "GND" H 2970 2680 50  0000 C CNN
F 2 "" H 2970 2830 50  0001 C CNN
F 3 "" H 2970 2830 50  0001 C CNN
	1    2970 2830
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:I2C_Address DOC?
U 1 1 5E28BC19
P 3870 2550
AR Path="/5E0652BA/5E28BC19" Ref="DOC?"  Part="1" 
AR Path="/5E0A0E29/5E28BC19" Ref="DOC?"  Part="1" 
AR Path="/5E0DC084/5E28BC19" Ref="DOC?"  Part="1" 
AR Path="/5E0F9112/5E28BC19" Ref="DOC?"  Part="1" 
AR Path="/5E2843EF/5E28BC19" Ref="DOC?"  Part="1" 
F 0 "DOC?" H 3870 2800 60  0001 C CNN
F 1 "askjdfasdf" H 3420 2550 60  0000 L CNN
F 2 "" H 3870 2900 60  0001 C CNN
F 3 "" H 3870 2900 60  0001 C CNN
	1    3870 2550
	1    0    0    -1  
$EndComp
Text Notes 1000 1990 0    50   ~ 0
Place near ideal diode
$Comp
L power:GND #PWR?
U 1 1 5E28E1DA
P 7570 2110
AR Path="/5B3E071A/5E28E1DA" Ref="#PWR?"  Part="1" 
AR Path="/5E0652BA/5E28E1DA" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E28E1DA" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E28E1DA" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E28E1DA" Ref="#PWR?"  Part="1" 
AR Path="/5E2843EF/5E28E1DA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7570 1860 50  0001 C CNN
F 1 "GND" H 7570 1960 50  0000 C CNN
F 2 "" H 7570 2110 50  0001 C CNN
F 3 "" H 7570 2110 50  0001 C CNN
	1    7570 2110
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7570 2110 7570 2070
Wire Wire Line
	7570 2070 7570 2030
Wire Wire Line
	7570 2070 7470 2070
Wire Wire Line
	7470 2070 7470 2030
Connection ~ 7570 2070
$Comp
L power:+3.3V #PWR?
U 1 1 5E28E1E9
P 7570 1030
AR Path="/5E0652BA/5E28E1E9" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E28E1E9" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E28E1E9" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E28E1E9" Ref="#PWR?"  Part="1" 
AR Path="/5E2843EF/5E28E1E9" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7570 880 50  0001 C CNN
F 1 "+3.3V" H 7570 1170 50  0000 C CNN
F 2 "" H 7570 1030 50  0001 C CNN
F 3 "" H 7570 1030 50  0001 C CNN
	1    7570 1030
	-1   0    0    -1  
$EndComp
$Comp
L Sensor_Temperature:MCP9804_DFN U?
U 1 1 5E28E1F3
P 7570 1530
AR Path="/5B3E071A/5E28E1F3" Ref="U?"  Part="1" 
AR Path="/5E0652BA/5E28E1F3" Ref="U?"  Part="1" 
AR Path="/5E0A0E29/5E28E1F3" Ref="U?"  Part="1" 
AR Path="/5E0DC084/5E28E1F3" Ref="U?"  Part="1" 
AR Path="/5E0F9112/5E28E1F3" Ref="U?"  Part="1" 
AR Path="/5E2843EF/5E28E1F3" Ref="U?"  Part="1" 
F 0 "U?" H 7320 1980 50  0000 C CNN
F 1 "MCP9804" H 7970 1980 50  0000 C CNN
F 2 "Package_DFN_QFN:DFN-8-1EP_3x2mm_P0.5mm_EP1.3x1.5mm" H 6470 1030 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 7320 1980 50  0001 C CNN
	1    7570 1530
	-1   0    0    -1  
$EndComp
Text GLabel 7970 1330 2    50   Input ~ 0
I2C_SCL
Text GLabel 7970 1230 2    50   BiDi ~ 0
I2C_SDA
NoConn ~ 7170 1530
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E28E204
P 7570 2680
AR Path="/5B3E071A/5E28E204" Ref="C?"  Part="1" 
AR Path="/5E0652BA/5E28E204" Ref="C?"  Part="1" 
AR Path="/5E0A0E29/5E28E204" Ref="C?"  Part="1" 
AR Path="/5E0DC084/5E28E204" Ref="C?"  Part="1" 
AR Path="/5E0F9112/5E28E204" Ref="C?"  Part="1" 
AR Path="/5E2843EF/5E28E204" Ref="C?"  Part="1" 
F 0 "C?" H 7595 2780 50  0000 L CNN
F 1 "0.1uF" H 7595 2580 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 7608 2530 50  0001 C CNN
F 3 "" H 7595 2780 50  0001 C CNN
F 4 "0603" H 7420 2780 50  0000 R CNN "display_footprint"
F 5 "50V" H 7420 2680 50  0000 R CNN "Voltage"
F 6 "X7R" H 7420 2580 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H 3660 -4200 50  0001 C CNN "Digi-Key PN"
	1    7570 2680
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E28E20E
P 7570 2530
AR Path="/5E0652BA/5E28E20E" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E28E20E" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E28E20E" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E28E20E" Ref="#PWR?"  Part="1" 
AR Path="/5E2843EF/5E28E20E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7570 2380 50  0001 C CNN
F 1 "+3.3V" H 7570 2670 50  0000 C CNN
F 2 "" H 7570 2530 50  0001 C CNN
F 3 "" H 7570 2530 50  0001 C CNN
	1    7570 2530
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E28E218
P 7570 2830
AR Path="/5E0652BA/5E28E218" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E28E218" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E28E218" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E28E218" Ref="#PWR?"  Part="1" 
AR Path="/5E2843EF/5E28E218" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7570 2580 50  0001 C CNN
F 1 "GND" H 7570 2680 50  0000 C CNN
F 2 "" H 7570 2830 50  0001 C CNN
F 3 "" H 7570 2830 50  0001 C CNN
	1    7570 2830
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:I2C_Address DOC?
U 1 1 5E28E222
P 8470 2550
AR Path="/5E0652BA/5E28E222" Ref="DOC?"  Part="1" 
AR Path="/5E0A0E29/5E28E222" Ref="DOC?"  Part="1" 
AR Path="/5E0DC084/5E28E222" Ref="DOC?"  Part="1" 
AR Path="/5E0F9112/5E28E222" Ref="DOC?"  Part="1" 
AR Path="/5E2843EF/5E28E222" Ref="DOC?"  Part="1" 
F 0 "DOC?" H 8470 2800 60  0001 C CNN
F 1 "askjdfasdf" H 8020 2550 60  0000 L CNN
F 2 "" H 8470 2900 60  0001 C CNN
F 3 "" H 8470 2900 60  0001 C CNN
	1    8470 2550
	1    0    0    -1  
$EndComp
Text Notes 5600 1990 0    50   ~ 0
Place away from power components
$Comp
L Device:Buzzer BZ?
U 1 1 5E2951F3
P 8090 4750
F 0 "BZ?" H 8240 4800 50  0000 L CNN
F 1 "CST-931RP-A" H 8240 4700 50  0000 L CNN
F 2 "Buzzer_Beeper:MagneticBuzzer_CUI_CST-931RP-A" V 8065 4850 50  0001 C CNN
F 3 "~" V 8065 4850 50  0001 C CNN
	1    8090 4750
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:BSS214NW Q?
U 1 1 5E2991CF
P 7810 5210
AR Path="/5BAAE16C/5E2991CF" Ref="Q?"  Part="1" 
AR Path="/5BB844FD/5E2991CF" Ref="Q?"  Part="1" 
AR Path="/5C1D5CB6/5E2991CF" Ref="Q?"  Part="1" 
AR Path="/5CB0BC26/5E2991CF" Ref="Q?"  Part="1" 
AR Path="/5E1352F5/5E2991CF" Ref="Q?"  Part="1" 
AR Path="/5E2843EF/5E2991CF" Ref="Q?"  Part="1" 
F 0 "Q?" H 8010 5285 50  0000 L CNN
F 1 "BSS214NW" H 8010 5210 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-323_SC-70" H 8010 5135 50  0001 L CIN
F 3 "https://www.infineon.com/dgdl/Infineon-BSS214NW-DS-v02_02-en.pdf?fileId=db3a30431b3e89eb011b695aebc01bde" H 7810 5210 50  0001 L CNN
F 4 "BSS214NWH6327XTSA1CT-ND" H 1400 2440 50  0001 C CNN "Digi-Key PN"
	1    7810 5210
	1    0    0    -1  
$EndComp
Wire Wire Line
	7990 4850 7910 4850
Wire Wire Line
	7910 4850 7910 4960
$Comp
L Diode:MBR0570 D?
U 1 1 5E29BE22
P 7670 4730
AR Path="/5A0BC776/5E29BE22" Ref="D?"  Part="1" 
AR Path="/5E2843EF/5E29BE22" Ref="D?"  Part="1" 
F 0 "D?" H 7670 4830 50  0000 C CNN
F 1 "MBR0570" H 7670 4630 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 7670 4555 50  0001 C CNN
F 3 "http://www.mccsemi.com/up_pdf/MBR0520~MBR0580(SOD123).pdf" H 7670 4730 50  0001 C CNN
	1    7670 4730
	0    1    1    0   
$EndComp
Wire Wire Line
	7990 4650 7910 4650
Wire Wire Line
	7910 4650 7910 4500
Wire Wire Line
	7670 4880 7670 4960
Wire Wire Line
	7670 4960 7910 4960
Connection ~ 7910 4960
Wire Wire Line
	7910 4960 7910 5010
Wire Wire Line
	7670 4580 7670 4500
Wire Wire Line
	7670 4500 7910 4500
$Comp
L power:+3.3V #PWR?
U 1 1 5E29CC65
P 7910 4420
F 0 "#PWR?" H 7910 4270 50  0001 C CNN
F 1 "+3.3V" H 7910 4560 50  0000 C CNN
F 2 "" H 7910 4420 50  0001 C CNN
F 3 "" H 7910 4420 50  0001 C CNN
	1    7910 4420
	1    0    0    -1  
$EndComp
Wire Wire Line
	7910 4420 7910 4500
Connection ~ 7910 4500
$Comp
L power:GND #PWR?
U 1 1 5E29F69F
P 7910 5410
F 0 "#PWR?" H 7910 5160 50  0001 C CNN
F 1 "GND" H 7910 5260 50  0000 C CNN
F 2 "" H 7910 5410 50  0001 C CNN
F 3 "" H 7910 5410 50  0001 C CNN
	1    7910 5410
	1    0    0    -1  
$EndComp
$Comp
L Timer:LMC555xMM U?
U 1 1 5E2B0520
P 2690 5360
F 0 "U?" H 2290 5710 50  0000 L CNN
F 1 "LMC555xMM" H 2790 5710 50  0000 L CNN
F 2 "" H 2690 5360 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lmc555.pdf" H 2690 5360 50  0001 C CNN
	1    2690 5360
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E2B1FF8
P 2690 4960
F 0 "#PWR?" H 2690 4810 50  0001 C CNN
F 1 "+3.3V" H 2690 5100 50  0000 C CNN
F 2 "" H 2690 4960 50  0001 C CNN
F 3 "" H 2690 4960 50  0001 C CNN
	1    2690 4960
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2B2764
P 2690 5760
F 0 "#PWR?" H 2690 5510 50  0001 C CNN
F 1 "GND" H 2690 5610 50  0000 C CNN
F 2 "" H 2690 5760 50  0001 C CNN
F 3 "" H 2690 5760 50  0001 C CNN
	1    2690 5760
	1    0    0    -1  
$EndComp
Wire Wire Line
	2190 5160 2030 5160
Wire Wire Line
	2030 5160 2030 6010
Wire Wire Line
	2030 6010 3280 6010
Wire Wire Line
	3280 6010 3280 5560
Wire Wire Line
	3280 5560 3190 5560
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E2B5968
P 3280 6240
F 0 "C?" H 3305 6340 50  0000 L CNN
F 1 "C_Custom" H 3305 6140 50  0000 L CNN
F 2 "" H 3318 6090 50  0001 C CNN
F 3 "" H 3305 6340 50  0001 C CNN
F 4 "Foot" H 3130 6340 50  0000 R CNN "display_footprint"
F 5 "V" H 3130 6240 50  0000 R CNN "Voltage"
F 6 "Er" H 3130 6140 50  0000 R CNN "Dielectric"
F 7 "PN" H 3705 6740 60  0001 C CNN "Digi-Key PN"
	1    3280 6240
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2B6144
P 3280 6390
F 0 "#PWR?" H 3280 6140 50  0001 C CNN
F 1 "GND" H 3280 6240 50  0000 C CNN
F 2 "" H 3280 6390 50  0001 C CNN
F 3 "" H 3280 6390 50  0001 C CNN
	1    3280 6390
	1    0    0    -1  
$EndComp
Wire Wire Line
	3280 6090 3280 6010
Connection ~ 3280 6010
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2B8E9C
P 3610 5560
F 0 "R?" V 3510 5560 50  0000 C CNN
F 1 "R" V 3610 5560 50  0000 C CNN
F 2 "" H 3610 5560 50  0001 C CNN
F 3 "" H 3610 5560 50  0001 C CNN
F 4 "Foot" V 3710 5560 50  0000 C CNN "display_footprint"
F 5 "Tol" V 3810 5560 50  0000 C CNN "Tolerance"
F 6 "W" V 3910 5560 50  0000 C CNN "Wattage"
F 7 "PN" H 3910 5960 60  0001 C CNN "Digi-Key PN"
	1    3610 5560
	0    1    1    0   
$EndComp
Wire Wire Line
	3460 5560 3280 5560
Connection ~ 3280 5560
Wire Wire Line
	3760 5560 3880 5560
Wire Wire Line
	3880 5560 3880 5160
Wire Wire Line
	3880 5160 3190 5160
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2BD6E4
P 3720 4880
AR Path="/5A0BC776/5E2BD6E4" Ref="R?"  Part="1" 
AR Path="/5E2843EF/5E2BD6E4" Ref="R?"  Part="1" 
F 0 "R?" H 3660 4880 50  0000 R CNN
F 1 "10k" V 3720 4880 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 3720 4880 50  0001 C CNN
F 3 "" H 3720 4880 50  0001 C CNN
F 4 "0603" H 3790 4960 50  0000 L CNN "display_footprint"
F 5 "1%" H 3790 4880 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 3790 4810 50  0000 L CNN "Wattage"
F 7 "P10.0KHCT-ND" H -370 -710 50  0001 C CNN "Digi-Key PN"
	1    3720 4880
	-1   0    0    1   
$EndComp
Wire Wire Line
	3190 5360 3720 5360
Wire Wire Line
	3720 5360 3720 5030
$Comp
L power:+3.3V #PWR?
U 1 1 5E2BF48C
P 3720 4730
F 0 "#PWR?" H 3720 4580 50  0001 C CNN
F 1 "+3.3V" H 3720 4870 50  0000 C CNN
F 2 "" H 3720 4730 50  0001 C CNN
F 3 "" H 3720 4730 50  0001 C CNN
	1    3720 4730
	1    0    0    -1  
$EndComp
NoConn ~ 2190 5360
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2C4914
P 1820 4880
AR Path="/5A0BC776/5E2C4914" Ref="R?"  Part="1" 
AR Path="/5E2843EF/5E2C4914" Ref="R?"  Part="1" 
F 0 "R?" H 1760 4880 50  0000 R CNN
F 1 "10k" V 1820 4880 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 1820 4880 50  0001 C CNN
F 3 "" H 1820 4880 50  0001 C CNN
F 4 "0603" H 1890 4960 50  0000 L CNN "display_footprint"
F 5 "1%" H 1890 4880 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 1890 4810 50  0000 L CNN "Wattage"
F 7 "P10.0KHCT-ND" H -2270 -710 50  0001 C CNN "Digi-Key PN"
	1    1820 4880
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E2C50FA
P 1820 4730
F 0 "#PWR?" H 1820 4580 50  0001 C CNN
F 1 "+3.3V" H 1820 4870 50  0000 C CNN
F 2 "" H 1820 4730 50  0001 C CNN
F 3 "" H 1820 4730 50  0001 C CNN
	1    1820 4730
	1    0    0    -1  
$EndComp
Wire Wire Line
	1820 5030 1820 5560
Wire Wire Line
	1820 5560 2190 5560
$Comp
L Custom_Library:74LVC1G97_Power U?
U 1 1 5E2CE828
P 5830 5210
F 0 "U?" H 5890 5360 50  0000 L CNN
F 1 "74LVC1G97" H 5890 5060 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 5880 5210 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g97.pdf" H 5880 5210 50  0001 C CNN
	1    5830 5210
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2DD231
P 5380 5490
AR Path="/5A0BC776/5E2DD231" Ref="R?"  Part="1" 
AR Path="/5E2843EF/5E2DD231" Ref="R?"  Part="1" 
F 0 "R?" H 5320 5490 50  0000 R CNN
F 1 "10k" V 5380 5490 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 5380 5490 50  0001 C CNN
F 3 "" H 5380 5490 50  0001 C CNN
F 4 "0603" H 5450 5570 50  0000 L CNN "display_footprint"
F 5 "1%" H 5450 5490 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 5450 5420 50  0000 L CNN "Wattage"
F 7 "P10.0KHCT-ND" H 1290 -100 50  0001 C CNN "Digi-Key PN"
	1    5380 5490
	-1   0    0    1   
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2DDD5F
P 4750 5490
AR Path="/5A0BC776/5E2DDD5F" Ref="R?"  Part="1" 
AR Path="/5E2843EF/5E2DDD5F" Ref="R?"  Part="1" 
F 0 "R?" H 4690 5490 50  0000 R CNN
F 1 "10k" V 4750 5490 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 4750 5490 50  0001 C CNN
F 3 "" H 4750 5490 50  0001 C CNN
F 4 "0603" H 4820 5570 50  0000 L CNN "display_footprint"
F 5 "1%" H 4820 5490 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 4820 5420 50  0000 L CNN "Wattage"
F 7 "P10.0KHCT-ND" H 660 -100 50  0001 C CNN "Digi-Key PN"
	1    4750 5490
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2DE657
P 4750 5640
F 0 "#PWR?" H 4750 5390 50  0001 C CNN
F 1 "GND" H 4750 5490 50  0000 C CNN
F 2 "" H 4750 5640 50  0001 C CNN
F 3 "" H 4750 5640 50  0001 C CNN
	1    4750 5640
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2DEBD7
P 5380 5640
F 0 "#PWR?" H 5380 5390 50  0001 C CNN
F 1 "GND" H 5380 5490 50  0000 C CNN
F 2 "" H 5380 5640 50  0001 C CNN
F 3 "" H 5380 5640 50  0001 C CNN
	1    5380 5640
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2DEFF7
P 5830 5310
F 0 "#PWR?" H 5830 5060 50  0001 C CNN
F 1 "GND" H 5830 5160 50  0000 C CNN
F 2 "" H 5830 5310 50  0001 C CNN
F 3 "" H 5830 5310 50  0001 C CNN
	1    5830 5310
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E2DF499
P 5830 5110
F 0 "#PWR?" H 5830 4960 50  0001 C CNN
F 1 "+3.3V" H 5830 5250 50  0000 C CNN
F 2 "" H 5830 5110 50  0001 C CNN
F 3 "" H 5830 5110 50  0001 C CNN
	1    5830 5110
	1    0    0    -1  
$EndComp
Wire Wire Line
	5530 5160 4750 5160
Wire Wire Line
	5530 5260 5380 5260
Wire Wire Line
	4750 5340 4750 5160
Connection ~ 4750 5160
Wire Wire Line
	5380 5340 5380 5260
Connection ~ 5380 5260
Wire Wire Line
	5380 5260 4670 5260
Text GLabel 4670 5260 0    50   Input ~ 0
Buzzer_Enable
Wire Wire Line
	3880 5160 4750 5160
Connection ~ 3880 5160
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E2EA983
P 2410 6450
AR Path="/5B3E071A/5E2EA983" Ref="C?"  Part="1" 
AR Path="/5E0652BA/5E2EA983" Ref="C?"  Part="1" 
AR Path="/5E0A0E29/5E2EA983" Ref="C?"  Part="1" 
AR Path="/5E0DC084/5E2EA983" Ref="C?"  Part="1" 
AR Path="/5E0F9112/5E2EA983" Ref="C?"  Part="1" 
AR Path="/5E2843EF/5E2EA983" Ref="C?"  Part="1" 
F 0 "C?" H 2435 6550 50  0000 L CNN
F 1 "0.1uF" H 2435 6350 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2448 6300 50  0001 C CNN
F 3 "" H 2435 6550 50  0001 C CNN
F 4 "0603" H 2260 6550 50  0000 R CNN "display_footprint"
F 5 "50V" H 2260 6450 50  0000 R CNN "Voltage"
F 6 "X7R" H 2260 6350 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H -1500 -430 50  0001 C CNN "Digi-Key PN"
	1    2410 6450
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E2EA98D
P 2410 6300
AR Path="/5E0652BA/5E2EA98D" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E2EA98D" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E2EA98D" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E2EA98D" Ref="#PWR?"  Part="1" 
AR Path="/5E2843EF/5E2EA98D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2410 6150 50  0001 C CNN
F 1 "+3.3V" H 2410 6440 50  0000 C CNN
F 2 "" H 2410 6300 50  0001 C CNN
F 3 "" H 2410 6300 50  0001 C CNN
	1    2410 6300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2EA997
P 2410 6600
AR Path="/5E0652BA/5E2EA997" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E2EA997" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E2EA997" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E2EA997" Ref="#PWR?"  Part="1" 
AR Path="/5E2843EF/5E2EA997" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2410 6350 50  0001 C CNN
F 1 "GND" H 2410 6450 50  0000 C CNN
F 2 "" H 2410 6600 50  0001 C CNN
F 3 "" H 2410 6600 50  0001 C CNN
	1    2410 6600
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E2EC7D3
P 5990 5900
AR Path="/5B3E071A/5E2EC7D3" Ref="C?"  Part="1" 
AR Path="/5E0652BA/5E2EC7D3" Ref="C?"  Part="1" 
AR Path="/5E0A0E29/5E2EC7D3" Ref="C?"  Part="1" 
AR Path="/5E0DC084/5E2EC7D3" Ref="C?"  Part="1" 
AR Path="/5E0F9112/5E2EC7D3" Ref="C?"  Part="1" 
AR Path="/5E2843EF/5E2EC7D3" Ref="C?"  Part="1" 
F 0 "C?" H 6015 6000 50  0000 L CNN
F 1 "0.1uF" H 6015 5800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6028 5750 50  0001 C CNN
F 3 "" H 6015 6000 50  0001 C CNN
F 4 "0603" H 5840 6000 50  0000 R CNN "display_footprint"
F 5 "50V" H 5840 5900 50  0000 R CNN "Voltage"
F 6 "X7R" H 5840 5800 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H 2080 -980 50  0001 C CNN "Digi-Key PN"
	1    5990 5900
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E2EC7DD
P 5990 5750
AR Path="/5E0652BA/5E2EC7DD" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E2EC7DD" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E2EC7DD" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E2EC7DD" Ref="#PWR?"  Part="1" 
AR Path="/5E2843EF/5E2EC7DD" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5990 5600 50  0001 C CNN
F 1 "+3.3V" H 5990 5890 50  0000 C CNN
F 2 "" H 5990 5750 50  0001 C CNN
F 3 "" H 5990 5750 50  0001 C CNN
	1    5990 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2EC7E7
P 5990 6050
AR Path="/5E0652BA/5E2EC7E7" Ref="#PWR?"  Part="1" 
AR Path="/5E0A0E29/5E2EC7E7" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC084/5E2EC7E7" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9112/5E2EC7E7" Ref="#PWR?"  Part="1" 
AR Path="/5E2843EF/5E2EC7E7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5990 5800 50  0001 C CNN
F 1 "GND" H 5990 5900 50  0000 C CNN
F 2 "" H 5990 6050 50  0001 C CNN
F 3 "" H 5990 6050 50  0001 C CNN
	1    5990 6050
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2F537E
P 7530 5440
AR Path="/5A0BC776/5E2F537E" Ref="R?"  Part="1" 
AR Path="/5E2843EF/5E2F537E" Ref="R?"  Part="1" 
F 0 "R?" H 7470 5440 50  0000 R CNN
F 1 "10k" V 7530 5440 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7530 5440 50  0001 C CNN
F 3 "" H 7530 5440 50  0001 C CNN
F 4 "0603" H 7600 5520 50  0000 L CNN "display_footprint"
F 5 "1%" H 7600 5440 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 7600 5370 50  0000 L CNN "Wattage"
F 7 "P10.0KHCT-ND" H 3440 -150 50  0001 C CNN "Digi-Key PN"
	1    7530 5440
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2F5BEE
P 7530 5590
F 0 "#PWR?" H 7530 5340 50  0001 C CNN
F 1 "GND" H 7530 5440 50  0000 C CNN
F 2 "" H 7530 5590 50  0001 C CNN
F 3 "" H 7530 5590 50  0001 C CNN
	1    7530 5590
	1    0    0    -1  
$EndComp
Wire Wire Line
	7610 5210 7530 5210
Wire Wire Line
	7530 5210 7530 5290
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2FB0E2
P 6900 5210
F 0 "R?" V 6800 5210 50  0000 C CNN
F 1 "10" V 6900 5210 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6900 5210 50  0001 C CNN
F 3 "" H 6900 5210 50  0001 C CNN
F 4 "YAG3351CT-ND" H 7200 5610 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 7000 5210 50  0000 C CNN "display_footprint"
F 6 "1%" V 7100 5210 50  0000 C CNN "Tolerance"
F 7 "1/10W" V 7200 5210 50  0000 C CNN "Wattage"
	1    6900 5210
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 5210 7530 5210
Connection ~ 7530 5210
Wire Wire Line
	6750 5210 6080 5210
$EndSCHEMATC

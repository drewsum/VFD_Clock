EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 29 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 8 14
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
L Sensor_Temperature:MCP9804_DFN U?
U 1 1 5CB2647F
P 3510 1630
F 0 "U?" H 3260 2080 50  0000 C CNN
F 1 "MCP9804_DFN" H 3910 2080 50  0000 C CNN
F 2 "Package_DFN_QFN:DFN-8-1EP_3x3mm_P0.65mm_EP1.55x2.4mm" H 2410 1130 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 3260 2080 50  0001 C CNN
	1    3510 1630
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5CB276FF
P 3510 2210
F 0 "#PWR?" H 3510 1960 50  0001 C CNN
F 1 "GND" H 3510 2060 50  0000 C CNN
F 2 "" H 3510 2210 50  0001 C CNN
F 3 "" H 3510 2210 50  0001 C CNN
	1    3510 2210
	1    0    0    -1  
$EndComp
Wire Wire Line
	3510 2210 3510 2170
Wire Wire Line
	3510 2170 3510 2130
Wire Wire Line
	3510 2170 3610 2170
Wire Wire Line
	3610 2170 3610 2130
Connection ~ 3510 2170
$Comp
L power:+3.3V #PWR?
U 1 1 5CB27E4E
P 3510 1130
F 0 "#PWR?" H 3510 980 50  0001 C CNN
F 1 "+3.3V" H 3510 1270 50  0000 C CNN
F 2 "" H 3510 1130 50  0001 C CNN
F 3 "" H 3510 1130 50  0001 C CNN
	1    3510 1130
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5CB2CD24
P 2290 990
AR Path="/5BAAE1F3/5CB2CD24" Ref="R?"  Part="1" 
AR Path="/5BAAE1DC/5CB2CD24" Ref="R?"  Part="1" 
AR Path="/5CAD2DA3/5CB2CD24" Ref="R?"  Part="1" 
F 0 "R?" H 2230 990 50  0000 R CNN
F 1 "10k" V 2290 990 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 2290 990 50  0001 C CNN
F 3 "" H 2290 990 50  0001 C CNN
F 4 "0603" H 2480 1070 50  0000 C CNN "display_footprint"
F 5 "1%" H 2470 990 50  0000 C CNN "Tolerance"
F 6 "1/10W" H 2500 920 50  0000 C CNN "Wattage"
F 7 "RMCF0603FT10K0CT-ND" H 2590 1390 60  0001 C CNN "Digi-Key PN"
	1    2290 990 
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5CB2CD2E
P 2990 990
AR Path="/5BAAE1F3/5CB2CD2E" Ref="R?"  Part="1" 
AR Path="/5BAAE1DC/5CB2CD2E" Ref="R?"  Part="1" 
AR Path="/5CAD2DA3/5CB2CD2E" Ref="R?"  Part="1" 
F 0 "R?" H 2930 990 50  0000 R CNN
F 1 "10k" V 2990 990 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 2990 990 50  0001 C CNN
F 3 "" H 2990 990 50  0001 C CNN
F 4 "0603" H 3180 1070 50  0000 C CNN "display_footprint"
F 5 "1%" H 3170 990 50  0000 C CNN "Tolerance"
F 6 "1/10W" H 3200 920 50  0000 C CNN "Wattage"
F 7 "RMCF0603FT10K0CT-ND" H 3290 1390 60  0001 C CNN "Digi-Key PN"
	1    2990 990 
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5CB2CD36
P 2990 840
F 0 "#PWR?" H 2990 690 50  0001 C CNN
F 1 "+3.3V" H 2990 980 50  0000 C CNN
F 2 "" H 2990 840 50  0001 C CNN
F 3 "" H 2990 840 50  0001 C CNN
	1    2990 840 
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5CB2CD3C
P 2290 840
F 0 "#PWR?" H 2290 690 50  0001 C CNN
F 1 "+3.3V" H 2290 980 50  0000 C CNN
F 2 "" H 2290 840 50  0001 C CNN
F 3 "" H 2290 840 50  0001 C CNN
	1    2290 840 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2290 1140 2290 1330
Wire Wire Line
	2990 1140 2990 1430
Wire Wire Line
	2990 1430 3110 1430
$Comp
L Custom_Library:R_Custom R?
U 1 1 5CB2CD4A
P 1700 1330
AR Path="/5BAAE2B6/5CB2CD4A" Ref="R?"  Part="1" 
AR Path="/5BB6CF6D/5CB2CD4A" Ref="R?"  Part="1" 
AR Path="/5BBE424C/5CB2CD4A" Ref="R?"  Part="1" 
AR Path="/5BAAE1DC/5CB2CD4A" Ref="R?"  Part="1" 
AR Path="/5CAD2DA3/5CB2CD4A" Ref="R?"  Part="1" 
F 0 "R?" V 1660 1190 50  0000 R CNN
F 1 "100" V 1700 1330 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 1700 1330 50  0001 C CNN
F 3 "" H 1700 1330 50  0001 C CNN
F 4 "0603" V 1800 1330 50  0001 C CNN "display_footprint"
F 5 "1%" V 1900 1330 50  0001 C CNN "Tolerance"
F 6 "1/10W" V 2000 1330 50  0001 C CNN "Wattage"
F 7 "A106047CT-ND" H 2000 1730 60  0001 C CNN "Digi-Key PN"
	1    1700 1330
	0    -1   1    0   
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5CB2CD54
P 1700 1430
AR Path="/5BAAE2B6/5CB2CD54" Ref="R?"  Part="1" 
AR Path="/5BB6CF6D/5CB2CD54" Ref="R?"  Part="1" 
AR Path="/5BBE424C/5CB2CD54" Ref="R?"  Part="1" 
AR Path="/5BAAE1DC/5CB2CD54" Ref="R?"  Part="1" 
AR Path="/5CAD2DA3/5CB2CD54" Ref="R?"  Part="1" 
F 0 "R?" V 1660 1290 50  0000 R CNN
F 1 "100" V 1700 1430 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 1700 1430 50  0001 C CNN
F 3 "" H 1700 1430 50  0001 C CNN
F 4 "0603" V 1800 1430 50  0001 C CNN "display_footprint"
F 5 "1%" V 1900 1430 50  0001 C CNN "Tolerance"
F 6 "1/10W" V 2000 1430 50  0001 C CNN "Wattage"
F 7 "A106047CT-ND" H 2000 1830 60  0001 C CNN "Digi-Key PN"
	1    1700 1430
	0    -1   1    0   
$EndComp
Wire Wire Line
	2290 1330 3110 1330
Wire Wire Line
	2290 1330 1850 1330
Connection ~ 2290 1330
Wire Wire Line
	1850 1430 2990 1430
Connection ~ 2990 1430
Text GLabel 1550 1330 0    50   BiDi ~ 0
TEMP_ISC_SDA
Text GLabel 1550 1430 0    50   Input ~ 0
TEMP_ISC_SCL
$EndSCHEMATC

EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 26 26
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
P 5110 1940
AR Path="/5E0652BA/5E073058" Ref="U?"  Part="1" 
AR Path="/5E0A0E29/5E073058" Ref="U?"  Part="1" 
AR Path="/5E052856/5E073058" Ref="U?"  Part="1" 
F 0 "U?" H 4860 2390 50  0000 C CNN
F 1 "INA231A" H 5260 2390 50  0000 C CNN
F 2 "Custom Footprints Library:Texas_DSBGA-12_1.65x1.39mm_Layout3x4_P0.4mm" H 5910 1490 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina231.pdf" H 5460 1840 50  0001 C CNN
F 4 "296-41263-1-ND" H 5110 1940 50  0001 C CNN "Digi-Key PN"
	1    5110 1940
	1    0    0    -1  
$EndComp
Text GLabel 3490 1860 0    50   UnSpc ~ 0
POS5_USB_SNS+
Text GLabel 3490 2320 0    50   UnSpc ~ 0
POS5_USB_SNS-
Text GLabel 5510 1740 2    50   Input ~ 0
TELEM_I2C_SCL_USB
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E0B2427
P 5110 3010
AR Path="/5B3E071A/5E0B2427" Ref="C?"  Part="1" 
AR Path="/5E0652BA/5E0B2427" Ref="C?"  Part="1" 
AR Path="/5E0A0E29/5E0B2427" Ref="C?"  Part="1" 
AR Path="/5E052856/5E0B2427" Ref="C?"  Part="1" 
F 0 "C?" H 5135 3110 50  0000 L CNN
F 1 "0.1uF" H 5135 2910 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5148 2860 50  0001 C CNN
F 3 "" H 5135 3110 50  0001 C CNN
F 4 "0603" H 4960 3110 50  0000 R CNN "display_footprint"
F 5 "50V" H 4960 3010 50  0000 R CNN "Voltage"
F 6 "X7R" H 4960 2910 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H 1200 -3870 50  0001 C CNN "Digi-Key PN"
	1    5110 3010
	1    0    0    -1  
$EndComp
Text GLabel 5510 1640 2    50   BiDi ~ 0
TELEM_I2C_SDA_USB
NoConn ~ 5510 1940
$Comp
L Custom_Library:I2C_Address DOC?
U 1 1 5E0B8BC8
P 6010 2880
AR Path="/5E0652BA/5E0B8BC8" Ref="DOC?"  Part="1" 
AR Path="/5E0A0E29/5E0B8BC8" Ref="DOC?"  Part="1" 
AR Path="/5E052856/5E0B8BC8" Ref="DOC?"  Part="1" 
F 0 "DOC?" H 6010 3130 60  0001 C CNN
F 1 "kuygadkjfdsa" H 5560 2880 60  0000 L CNN
F 2 "" H 6010 3230 60  0001 C CNN
F 3 "" H 6010 3230 60  0001 C CNN
	1    6010 2880
	1    0    0    -1  
$EndComp
Wire Wire Line
	5110 5120 5110 5080
Wire Wire Line
	5110 5080 5110 5040
Wire Wire Line
	5110 5080 5010 5080
Wire Wire Line
	5010 5080 5010 5040
Connection ~ 5110 5080
$Comp
L Sensor_Temperature:MCP9804_DFN U?
U 1 1 5E0BDB9D
P 5110 4540
AR Path="/5B3E071A/5E0BDB9D" Ref="U?"  Part="1" 
AR Path="/5E0652BA/5E0BDB9D" Ref="U?"  Part="1" 
AR Path="/5E0A0E29/5E0BDB9D" Ref="U?"  Part="1" 
AR Path="/5E052856/5E0BDB9D" Ref="U?"  Part="1" 
F 0 "U?" H 4860 4990 50  0000 C CNN
F 1 "MCP9804" H 5510 4990 50  0000 C CNN
F 2 "Package_DFN_QFN:DFN-8-1EP_3x2mm_P0.5mm_EP1.3x1.5mm" H 4010 4040 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 4860 4990 50  0001 C CNN
	1    5110 4540
	-1   0    0    -1  
$EndComp
Text GLabel 5510 4340 2    50   Input ~ 0
TELEM_I2C_SCL_USB
Text GLabel 5510 4240 2    50   BiDi ~ 0
TELEM_I2C_SDA_USB
NoConn ~ 4710 4540
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E0CB7AA
P 5110 5690
AR Path="/5B3E071A/5E0CB7AA" Ref="C?"  Part="1" 
AR Path="/5E0652BA/5E0CB7AA" Ref="C?"  Part="1" 
AR Path="/5E0A0E29/5E0CB7AA" Ref="C?"  Part="1" 
AR Path="/5E052856/5E0CB7AA" Ref="C?"  Part="1" 
F 0 "C?" H 5135 5790 50  0000 L CNN
F 1 "0.1uF" H 5135 5590 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5148 5540 50  0001 C CNN
F 3 "" H 5135 5790 50  0001 C CNN
F 4 "0603" H 4960 5790 50  0000 R CNN "display_footprint"
F 5 "50V" H 4960 5690 50  0000 R CNN "Voltage"
F 6 "X7R" H 4960 5590 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H 1200 -1190 50  0001 C CNN "Digi-Key PN"
	1    5110 5690
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:I2C_Address DOC?
U 1 1 5E0CB7BC
P 6010 5560
AR Path="/5E0652BA/5E0CB7BC" Ref="DOC?"  Part="1" 
AR Path="/5E0A0E29/5E0CB7BC" Ref="DOC?"  Part="1" 
AR Path="/5E052856/5E0CB7BC" Ref="DOC?"  Part="1" 
F 0 "DOC?" H 6010 5810 60  0001 C CNN
F 1 "lqwehqewf" H 5560 5560 60  0000 L CNN
F 2 "" H 6010 5910 60  0001 C CNN
F 3 "" H 6010 5910 60  0001 C CNN
	1    6010 5560
	1    0    0    -1  
$EndComp
Wire Wire Line
	4230 2320 4230 2240
Wire Wire Line
	4230 1940 4230 1860
Wire Wire Line
	4230 2320 4670 2320
Wire Wire Line
	4670 2320 4670 2140
Wire Wire Line
	4670 2140 4710 2140
Connection ~ 4230 2320
Wire Wire Line
	4230 1860 4670 1860
Wire Wire Line
	4670 1860 4670 2040
Wire Wire Line
	4670 2040 4710 2040
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E07E0FD
P 4230 2090
AR Path="/5B3E071A/5E07E0FD" Ref="C?"  Part="1" 
AR Path="/5E0652BA/5E07E0FD" Ref="C?"  Part="1" 
AR Path="/5E0A0E29/5E07E0FD" Ref="C?"  Part="1" 
AR Path="/5E052856/5E07E0FD" Ref="C?"  Part="1" 
F 0 "C?" H 4255 2190 50  0000 L CNN
F 1 "0.1uF" H 4255 1990 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4268 1940 50  0001 C CNN
F 3 "" H 4255 2190 50  0001 C CNN
F 4 "0603" H 4080 2190 50  0000 R CNN "display_footprint"
F 5 "50V" H 4080 2090 50  0000 R CNN "Voltage"
F 6 "X7R" H 4080 1990 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H 320 -4790 50  0001 C CNN "Digi-Key PN"
	1    4230 2090
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E082EBB
P 3640 2320
AR Path="/5CB6F1ED/5E082EBB" Ref="R?"  Part="1" 
AR Path="/5E0652BA/5E082EBB" Ref="R?"  Part="1" 
AR Path="/5E0A0E29/5E082EBB" Ref="R?"  Part="1" 
AR Path="/5E052856/5E082EBB" Ref="R?"  Part="1" 
F 0 "R?" V 3540 2320 50  0000 C CNN
F 1 "10" V 3640 2320 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 3640 2320 50  0001 C CNN
F 3 "" H 3640 2320 50  0001 C CNN
F 4 "YAG3351CT-ND" H 3940 2720 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 3740 2320 50  0000 C CNN "display_footprint"
F 6 "1%" V 3840 2320 50  0000 C CNN "Tolerance"
F 7 "1/10W" V 3940 2320 50  0000 C CNN "Wattage"
	1    3640 2320
	0    1    1    0   
$EndComp
Wire Wire Line
	3790 2320 4230 2320
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E083C4C
P 3640 1860
AR Path="/5CB6F1ED/5E083C4C" Ref="R?"  Part="1" 
AR Path="/5E0652BA/5E083C4C" Ref="R?"  Part="1" 
AR Path="/5E0A0E29/5E083C4C" Ref="R?"  Part="1" 
AR Path="/5E052856/5E083C4C" Ref="R?"  Part="1" 
F 0 "R?" V 3540 1860 50  0000 C CNN
F 1 "10" V 3640 1860 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 3640 1860 50  0001 C CNN
F 3 "" H 3640 1860 50  0001 C CNN
F 4 "YAG3351CT-ND" H 3940 2260 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 3740 1860 50  0000 C CNN "display_footprint"
F 6 "1%" V 3840 1860 50  0000 C CNN "Tolerance"
F 7 "1/10W" V 3940 1860 50  0000 C CNN "Wattage"
	1    3640 1860
	0    1    -1   0   
$EndComp
Wire Wire Line
	3790 1860 4230 1860
Connection ~ 4230 1860
$Comp
L Custom_Library:+5V_USB #PWR?
U 1 1 5E057B11
P 4710 1640
F 0 "#PWR?" H 4710 1490 50  0001 C CNN
F 1 "+5V_USB" V 4710 1760 50  0000 L CNN
F 2 "" H 4710 1640 50  0001 C CNN
F 3 "" H 4710 1640 50  0001 C CNN
	1    4710 1640
	0    -1   -1   0   
$EndComp
$Comp
L Custom_Library:+5V_USB #PWR?
U 1 1 5E057FA0
P 5110 1440
F 0 "#PWR?" H 5110 1290 50  0001 C CNN
F 1 "+5V_USB" H 5110 1580 50  0000 C CNN
F 2 "" H 5110 1440 50  0001 C CNN
F 3 "" H 5110 1440 50  0001 C CNN
	1    5110 1440
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+5V_USB #PWR?
U 1 1 5E0583C3
P 5110 2860
F 0 "#PWR?" H 5110 2710 50  0001 C CNN
F 1 "+5V_USB" H 5110 3000 50  0000 C CNN
F 2 "" H 5110 2860 50  0001 C CNN
F 3 "" H 5110 2860 50  0001 C CNN
	1    5110 2860
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+5V_USB #PWR?
U 1 1 5E0588FF
P 5110 4040
F 0 "#PWR?" H 5110 3890 50  0001 C CNN
F 1 "+5V_USB" H 5110 4180 50  0000 C CNN
F 2 "" H 5110 4040 50  0001 C CNN
F 3 "" H 5110 4040 50  0001 C CNN
	1    5110 4040
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+5V_USB #PWR?
U 1 1 5E058F97
P 5110 5540
F 0 "#PWR?" H 5110 5390 50  0001 C CNN
F 1 "+5V_USB" H 5110 5680 50  0000 C CNN
F 2 "" H 5110 5540 50  0001 C CNN
F 3 "" H 5110 5540 50  0001 C CNN
	1    5110 5540
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:GND_USB #PWR?
U 1 1 5E0596E5
P 5110 2440
F 0 "#PWR?" H 5110 2190 50  0001 C CNN
F 1 "GND_USB" H 5110 2290 50  0000 C CNN
F 2 "" H 5110 2440 50  0001 C CNN
F 3 "" H 5110 2440 50  0001 C CNN
	1    5110 2440
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:GND_USB #PWR?
U 1 1 5E059DCD
P 5110 3160
F 0 "#PWR?" H 5110 2910 50  0001 C CNN
F 1 "GND_USB" H 5110 3010 50  0000 C CNN
F 2 "" H 5110 3160 50  0001 C CNN
F 3 "" H 5110 3160 50  0001 C CNN
	1    5110 3160
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:GND_USB #PWR?
U 1 1 5E05A2DA
P 5110 5120
F 0 "#PWR?" H 5110 4870 50  0001 C CNN
F 1 "GND_USB" H 5110 4970 50  0000 C CNN
F 2 "" H 5110 5120 50  0001 C CNN
F 3 "" H 5110 5120 50  0001 C CNN
	1    5110 5120
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:GND_USB #PWR?
U 1 1 5E05A9FB
P 5110 5840
F 0 "#PWR?" H 5110 5590 50  0001 C CNN
F 1 "GND_USB" H 5110 5690 50  0000 C CNN
F 2 "" H 5110 5840 50  0001 C CNN
F 3 "" H 5110 5840 50  0001 C CNN
	1    5110 5840
	1    0    0    -1  
$EndComp
$EndSCHEMATC

EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 27 30
Title "Electronic Display Logic Board"
Date "2018-12-15"
Rev "A"
Comp "Marquette University Senior Design 2018/2019 Group E44"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR?
U 1 1 5BB6DBF5
P 6400 3020
AR Path="/5BAAE2B6/5BB6DBF5" Ref="#PWR?"  Part="1" 
AR Path="/5BB6CF6D/5BB6DBF5" Ref="#PWR?"  Part="1" 
AR Path="/5BBE424C/5BB6DBF5" Ref="#PWR?"  Part="1" 
AR Path="/5CB8A16A/5BB6DBF5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6400 2770 50  0001 C CNN
F 1 "GND" H 6400 2870 50  0000 C CNN
F 2 "" H 6400 3020 50  0001 C CNN
F 3 "" H 6400 3020 50  0001 C CNN
	1    6400 3020
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 2720 5840 2720
Wire Wire Line
	5840 2720 5840 2620
Wire Wire Line
	5840 2620 5900 2620
$Comp
L Custom_Library:C_Custom C?
U 1 1 5BB8B996
P 3420 3090
AR Path="/5BAAE16C/5BB8B996" Ref="C?"  Part="1" 
AR Path="/5BB6CF6D/5BB8B996" Ref="C?"  Part="1" 
AR Path="/5BBE424C/5BB8B996" Ref="C?"  Part="1" 
AR Path="/5CB8A16A/5BB8B996" Ref="C?"  Part="1" 
F 0 "C?" H 3445 3190 50  0000 L CNN
F 1 "0.1uF" H 3445 2990 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3458 2940 50  0001 C CNN
F 3 "" H 3445 3190 50  0001 C CNN
F 4 "0603" H 3270 3190 50  0000 R CNN "display_footprint"
F 5 "50V" H 3270 3090 50  0000 R CNN "Voltage"
F 6 "X7R" H 3270 2990 50  0000 R CNN "Dielectric"
F 7 "311-1344-1-ND" H 3845 3590 60  0001 C CNN "Digi-Key PN"
	1    3420 3090
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5BB8B9A1
P 3720 3090
AR Path="/5BAAE16C/5BB8B9A1" Ref="C?"  Part="1" 
AR Path="/5BB6CF6D/5BB8B9A1" Ref="C?"  Part="1" 
AR Path="/5BBE424C/5BB8B9A1" Ref="C?"  Part="1" 
AR Path="/5CB8A16A/5BB8B9A1" Ref="C?"  Part="1" 
F 0 "C?" H 3745 3190 50  0000 L CNN
F 1 "10nF" H 3745 2990 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3758 2940 50  0001 C CNN
F 3 "" H 3745 3190 50  0001 C CNN
F 4 "0603" H 3570 3190 50  0001 R CNN "display_footprint"
F 5 "50V" H 3570 3090 50  0001 R CNN "Voltage"
F 6 "X7R" H 3570 2990 50  0001 R CNN "Dielectric"
F 7 "1276-1921-1-ND" H 4145 3590 60  0001 C CNN "Digi-Key PN"
	1    3720 3090
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5BB8B9AC
P 4020 3090
AR Path="/5BAAE16C/5BB8B9AC" Ref="C?"  Part="1" 
AR Path="/5BB6CF6D/5BB8B9AC" Ref="C?"  Part="1" 
AR Path="/5BBE424C/5BB8B9AC" Ref="C?"  Part="1" 
AR Path="/5CB8A16A/5BB8B9AC" Ref="C?"  Part="1" 
F 0 "C?" H 4045 3190 50  0000 L CNN
F 1 "1nF" H 4045 2990 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4058 2940 50  0001 C CNN
F 3 "" H 4045 3190 50  0001 C CNN
F 4 "0603" H 3870 3190 50  0001 R CNN "display_footprint"
F 5 "50V" H 3870 3090 50  0001 R CNN "Voltage"
F 6 "X7R" H 3870 2990 50  0001 R CNN "Dielectric"
F 7 "1276-1018-1-ND" H 4445 3590 60  0001 C CNN "Digi-Key PN"
	1    4020 3090
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BB8B9B3
P 3720 3320
AR Path="/5BAAE16C/5BB8B9B3" Ref="#PWR?"  Part="1" 
AR Path="/5BB6CF6D/5BB8B9B3" Ref="#PWR?"  Part="1" 
AR Path="/5BBE424C/5BB8B9B3" Ref="#PWR?"  Part="1" 
AR Path="/5CB8A16A/5BB8B9B3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3720 3070 50  0001 C CNN
F 1 "GND" H 3720 3170 50  0000 C CNN
F 2 "" H 3720 3320 50  0001 C CNN
F 3 "" H 3720 3320 50  0001 C CNN
	1    3720 3320
	1    0    0    -1  
$EndComp
Wire Wire Line
	3720 3320 3720 3280
Wire Wire Line
	3720 3280 3420 3280
Wire Wire Line
	3420 3280 3420 3240
Connection ~ 3720 3280
Wire Wire Line
	3720 3280 3720 3240
Wire Wire Line
	3720 3280 4020 3280
Wire Wire Line
	4020 3280 4020 3240
Wire Wire Line
	3720 2860 3720 2900
Wire Wire Line
	3420 2940 3420 2900
Wire Wire Line
	3420 2900 3720 2900
Wire Wire Line
	4020 2900 4020 2940
Connection ~ 3720 2900
Wire Wire Line
	3720 2900 3720 2940
Wire Wire Line
	3720 2900 4020 2900
$Comp
L power:+5V #PWR?
U 1 1 5BF4791B
P 6400 1420
F 0 "#PWR?" H 6400 1270 50  0001 C CNN
F 1 "+5V" H 6400 1560 50  0000 C CNN
F 2 "" H 6400 1420 50  0001 C CNN
F 3 "" H 6400 1420 50  0001 C CNN
	1    6400 1420
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5BF47ADF
P 3720 2860
F 0 "#PWR?" H 3720 2710 50  0001 C CNN
F 1 "+5V" H 3720 3000 50  0000 C CNN
F 2 "" H 3720 2860 50  0001 C CNN
F 3 "" H 3720 2860 50  0001 C CNN
	1    3720 2860
	1    0    0    -1  
$EndComp
Text Notes 550  700  0    100  ~ 20
I/O Buffers
$Comp
L power:+3.3V #PWR?
U 1 1 5BB6DC87
P 4220 1310
AR Path="/5BAAE2B6/5BB6DC87" Ref="#PWR?"  Part="1" 
AR Path="/5BB6CF6D/5BB6DC87" Ref="#PWR?"  Part="1" 
AR Path="/5BBE424C/5BB6DC87" Ref="#PWR?"  Part="1" 
AR Path="/5CB8A16A/5BB6DC87" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4220 1160 50  0001 C CNN
F 1 "+3.3V" H 4220 1450 50  0000 C CNN
F 2 "" H 4220 1310 50  0001 C CNN
F 3 "" H 4220 1310 50  0001 C CNN
	1    4220 1310
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5BB6DBFF
P 4220 1460
AR Path="/5BAAE2B6/5BB6DBFF" Ref="R?"  Part="1" 
AR Path="/5BB6CF6D/5BB6DBFF" Ref="R?"  Part="1" 
AR Path="/5BBE424C/5BB6DBFF" Ref="R?"  Part="1" 
AR Path="/5CB8A16A/5BB6DBFF" Ref="R?"  Part="1" 
F 0 "R?" H 4160 1460 50  0000 R CNN
F 1 "10K" V 4220 1460 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 4220 1460 50  0001 C CNN
F 3 "" H 4220 1460 50  0001 C CNN
F 4 "0603" H 4290 1550 50  0001 L CNN "display_footprint"
F 5 "1%" H 4290 1460 50  0001 L CNN "Tolerance"
F 6 "1/10W" H 4290 1380 50  0001 L CNN "Wattage"
F 7 "RMCF0603FT10K0CT-ND" H 4520 1860 60  0001 C CNN "Digi-Key PN"
	1    4220 1460
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5840 2620 4220 2620
Wire Wire Line
	4220 2620 4220 1610
Connection ~ 5840 2620
$Comp
L power:GND #PWR?
U 1 1 5CBF014C
P 6400 5420
AR Path="/5BAAE2B6/5CBF014C" Ref="#PWR?"  Part="1" 
AR Path="/5BB6CF6D/5CBF014C" Ref="#PWR?"  Part="1" 
AR Path="/5BBE424C/5CBF014C" Ref="#PWR?"  Part="1" 
AR Path="/5CB8A16A/5CBF014C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6400 5170 50  0001 C CNN
F 1 "GND" H 6400 5270 50  0000 C CNN
F 2 "" H 6400 5420 50  0001 C CNN
F 3 "" H 6400 5420 50  0001 C CNN
	1    6400 5420
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 5120 5840 5120
Wire Wire Line
	5840 5120 5840 5020
Wire Wire Line
	5840 5020 5900 5020
$Comp
L Custom_Library:C_Custom C?
U 1 1 5CBF015E
P 3420 5490
AR Path="/5BAAE16C/5CBF015E" Ref="C?"  Part="1" 
AR Path="/5BB6CF6D/5CBF015E" Ref="C?"  Part="1" 
AR Path="/5BBE424C/5CBF015E" Ref="C?"  Part="1" 
AR Path="/5CB8A16A/5CBF015E" Ref="C?"  Part="1" 
F 0 "C?" H 3445 5590 50  0000 L CNN
F 1 "0.1uF" H 3445 5390 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3458 5340 50  0001 C CNN
F 3 "" H 3445 5590 50  0001 C CNN
F 4 "0603" H 3270 5590 50  0000 R CNN "display_footprint"
F 5 "50V" H 3270 5490 50  0000 R CNN "Voltage"
F 6 "X7R" H 3270 5390 50  0000 R CNN "Dielectric"
F 7 "311-1344-1-ND" H 3845 5990 60  0001 C CNN "Digi-Key PN"
	1    3420 5490
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5CBF016C
P 3720 5490
AR Path="/5BAAE16C/5CBF016C" Ref="C?"  Part="1" 
AR Path="/5BB6CF6D/5CBF016C" Ref="C?"  Part="1" 
AR Path="/5BBE424C/5CBF016C" Ref="C?"  Part="1" 
AR Path="/5CB8A16A/5CBF016C" Ref="C?"  Part="1" 
F 0 "C?" H 3745 5590 50  0000 L CNN
F 1 "10nF" H 3745 5390 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3758 5340 50  0001 C CNN
F 3 "" H 3745 5590 50  0001 C CNN
F 4 "0603" H 3570 5590 50  0001 R CNN "display_footprint"
F 5 "50V" H 3570 5490 50  0001 R CNN "Voltage"
F 6 "X7R" H 3570 5390 50  0001 R CNN "Dielectric"
F 7 "1276-1921-1-ND" H 4145 5990 60  0001 C CNN "Digi-Key PN"
	1    3720 5490
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5CBF017A
P 4020 5490
AR Path="/5BAAE16C/5CBF017A" Ref="C?"  Part="1" 
AR Path="/5BB6CF6D/5CBF017A" Ref="C?"  Part="1" 
AR Path="/5BBE424C/5CBF017A" Ref="C?"  Part="1" 
AR Path="/5CB8A16A/5CBF017A" Ref="C?"  Part="1" 
F 0 "C?" H 4045 5590 50  0000 L CNN
F 1 "1nF" H 4045 5390 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4058 5340 50  0001 C CNN
F 3 "" H 4045 5590 50  0001 C CNN
F 4 "0603" H 3870 5590 50  0001 R CNN "display_footprint"
F 5 "50V" H 3870 5490 50  0001 R CNN "Voltage"
F 6 "X7R" H 3870 5390 50  0001 R CNN "Dielectric"
F 7 "1276-1018-1-ND" H 4445 5990 60  0001 C CNN "Digi-Key PN"
	1    4020 5490
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5CBF0184
P 3720 5720
AR Path="/5BAAE16C/5CBF0184" Ref="#PWR?"  Part="1" 
AR Path="/5BB6CF6D/5CBF0184" Ref="#PWR?"  Part="1" 
AR Path="/5BBE424C/5CBF0184" Ref="#PWR?"  Part="1" 
AR Path="/5CB8A16A/5CBF0184" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3720 5470 50  0001 C CNN
F 1 "GND" H 3720 5570 50  0000 C CNN
F 2 "" H 3720 5720 50  0001 C CNN
F 3 "" H 3720 5720 50  0001 C CNN
	1    3720 5720
	1    0    0    -1  
$EndComp
Wire Wire Line
	3720 5720 3720 5680
Wire Wire Line
	3720 5680 3420 5680
Wire Wire Line
	3420 5680 3420 5640
Connection ~ 3720 5680
Wire Wire Line
	3720 5680 3720 5640
Wire Wire Line
	3720 5680 4020 5680
Wire Wire Line
	4020 5680 4020 5640
Wire Wire Line
	3720 5260 3720 5300
Wire Wire Line
	3420 5340 3420 5300
Wire Wire Line
	3420 5300 3720 5300
Wire Wire Line
	4020 5300 4020 5340
Connection ~ 3720 5300
Wire Wire Line
	3720 5300 3720 5340
Wire Wire Line
	3720 5300 4020 5300
$Comp
L power:+5V #PWR?
U 1 1 5CBF019C
P 6400 3820
F 0 "#PWR?" H 6400 3670 50  0001 C CNN
F 1 "+5V" H 6400 3960 50  0000 C CNN
F 2 "" H 6400 3820 50  0001 C CNN
F 3 "" H 6400 3820 50  0001 C CNN
	1    6400 3820
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5CBF01A6
P 3720 5260
F 0 "#PWR?" H 3720 5110 50  0001 C CNN
F 1 "+5V" H 3720 5400 50  0000 C CNN
F 2 "" H 3720 5260 50  0001 C CNN
F 3 "" H 3720 5260 50  0001 C CNN
	1    3720 5260
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5CBF01BB
P 4220 3710
AR Path="/5BAAE2B6/5CBF01BB" Ref="#PWR?"  Part="1" 
AR Path="/5BB6CF6D/5CBF01BB" Ref="#PWR?"  Part="1" 
AR Path="/5BBE424C/5CBF01BB" Ref="#PWR?"  Part="1" 
AR Path="/5CB8A16A/5CBF01BB" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4220 3560 50  0001 C CNN
F 1 "+3.3V" H 4220 3850 50  0000 C CNN
F 2 "" H 4220 3710 50  0001 C CNN
F 3 "" H 4220 3710 50  0001 C CNN
	1    4220 3710
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5CBF01C9
P 4220 3860
AR Path="/5BAAE2B6/5CBF01C9" Ref="R?"  Part="1" 
AR Path="/5BB6CF6D/5CBF01C9" Ref="R?"  Part="1" 
AR Path="/5BBE424C/5CBF01C9" Ref="R?"  Part="1" 
AR Path="/5CB8A16A/5CBF01C9" Ref="R?"  Part="1" 
F 0 "R?" H 4160 3860 50  0000 R CNN
F 1 "10K" V 4220 3860 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 4220 3860 50  0001 C CNN
F 3 "" H 4220 3860 50  0001 C CNN
F 4 "0603" H 4290 3950 50  0001 L CNN "display_footprint"
F 5 "1%" H 4290 3860 50  0001 L CNN "Tolerance"
F 6 "1/10W" H 4290 3780 50  0001 L CNN "Wattage"
F 7 "RMCF0603FT10K0CT-ND" H 4520 4260 60  0001 C CNN "Digi-Key PN"
	1    4220 3860
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5840 5020 4220 5020
Wire Wire Line
	4220 5020 4220 4010
Connection ~ 5840 5020
Text GLabel 3850 1720 0    50   Input ~ 0
Anode_A
Text GLabel 3850 1820 0    50   Input ~ 0
Anode_B
Text GLabel 3850 1920 0    50   Input ~ 0
Anode_C
Text GLabel 3850 2020 0    50   Input ~ 0
Anode_D
Text GLabel 3850 2120 0    50   Input ~ 0
Anode_E
Text GLabel 3850 2220 0    50   Input ~ 0
Anode_F
Text GLabel 3850 2320 0    50   Input ~ 0
Anode_G
Text GLabel 3850 2420 0    50   Input ~ 0
Anode_DP
Text GLabel 3850 4120 0    50   Input ~ 0
Grid_0
Text GLabel 3850 4220 0    50   Input ~ 0
Grid_1
Text GLabel 3850 4320 0    50   Input ~ 0
Grid_2
Text GLabel 3850 4420 0    50   Input ~ 0
Grid_3
Text GLabel 3850 4520 0    50   Input ~ 0
Grid_4
Text GLabel 3850 4620 0    50   Input ~ 0
Grid_5
Text GLabel 3850 4720 0    50   Input ~ 0
Colon_0
Text GLabel 3850 4820 0    50   Input ~ 0
Colon_1
Text GLabel 3550 2620 0    40   Input ~ 0
~IO_Level_Shift_Enable
Wire Wire Line
	3550 2620 4220 2620
Connection ~ 4220 2620
Text GLabel 3550 5020 0    40   Input ~ 0
~IO_Level_Shift_Enable
Wire Wire Line
	3550 5020 4220 5020
Connection ~ 4220 5020
Text GLabel 6900 1720 2    50   Output ~ 0
Anode_A_DSP
Text GLabel 6900 1820 2    50   Output ~ 0
Anode_B_DSP
Text GLabel 6900 1920 2    50   Output ~ 0
Anode_C_DSP
Text GLabel 6900 2020 2    50   Output ~ 0
Anode_D_DSP
Text GLabel 6900 2120 2    50   Output ~ 0
Anode_E_DSP
Text GLabel 6900 2220 2    50   Output ~ 0
Anode_F_DSP
Text GLabel 6900 2320 2    50   Output ~ 0
Anode_G_DSP
Text GLabel 6900 2420 2    50   Output ~ 0
Anode_DP_DSP
Text GLabel 6900 4120 2    50   Output ~ 0
Grid_0_DSP
Text GLabel 6900 4220 2    50   Output ~ 0
Grid_1_DSP
Text GLabel 6900 4320 2    50   Output ~ 0
Grid_2_DSP
Text GLabel 6900 4420 2    50   Output ~ 0
Grid_3_DSP
Text GLabel 6900 4520 2    50   Output ~ 0
Grid_4_DSP
Text GLabel 6900 4620 2    50   Output ~ 0
Grid_5_DSP
Text GLabel 6900 4720 2    50   Output ~ 0
Colon_0_DSP
Text GLabel 6900 4820 2    50   Output ~ 0
Colon_1_DSP
$Comp
L Custom_Library:74VHC541 U?
U 1 1 5E1A8051
P 6400 2220
F 0 "U?" H 6100 2870 50  0000 C CNN
F 1 "74VHC541" H 6100 1570 50  0000 C CNN
F 2 "Package_DFN_QFN:Texas_S-PWQFN-N20" H 6400 2220 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74VHC_VHCT541.pdf" H 6400 2220 50  0001 C CNN
F 4 "1727-7068-1-ND" H 6400 2220 50  0001 C CNN "Digi-Key PN"
	1    6400 2220
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:74VHC541 U?
U 1 1 5E1A88E3
P 6400 4620
F 0 "U?" H 6100 5270 50  0000 C CNN
F 1 "74VHC541" H 6100 3970 50  0000 C CNN
F 2 "Package_DFN_QFN:Texas_S-PWQFN-N20" H 6400 4620 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74VHC_VHCT541.pdf" H 6400 4620 50  0001 C CNN
F 4 "1727-7068-1-ND" H 6400 4620 50  0001 C CNN "Digi-Key PN"
	1    6400 4620
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 2120 5040 2120
Wire Wire Line
	3850 2020 4940 2020
Wire Wire Line
	3850 1920 4840 1920
Wire Wire Line
	3850 1820 4740 1820
Wire Wire Line
	3850 1720 4640 1720
Wire Wire Line
	3850 2220 5140 2220
Wire Wire Line
	3850 2420 5340 2420
Wire Wire Line
	3850 2320 5240 2320
$Comp
L Device:R_Pack08 RN?
U 1 1 5E1B6674
P 5040 3020
F 0 "RN?" H 5430 2930 50  0000 L CNN
F 1 "10k" H 5430 3030 50  0000 L CNN
F 2 "Resistors_SMD:R_Array_Convex_8x0602" V 5515 3020 50  0001 C CNN
F 3 "~" H 5040 3020 50  0001 C CNN
F 4 "Y1103CT-ND" H 5040 3020 50  0001 C CNN "Digi-Key PN"
	1    5040 3020
	1    0    0    -1  
$EndComp
Wire Wire Line
	4640 2820 4640 1720
Connection ~ 4640 1720
Wire Wire Line
	4640 1720 5900 1720
Wire Wire Line
	4740 2820 4740 1820
Connection ~ 4740 1820
Wire Wire Line
	4740 1820 5900 1820
Wire Wire Line
	4840 2820 4840 1920
Connection ~ 4840 1920
Wire Wire Line
	4840 1920 5900 1920
Wire Wire Line
	4940 2820 4940 2020
Connection ~ 4940 2020
Wire Wire Line
	4940 2020 5900 2020
Wire Wire Line
	5040 2820 5040 2120
Connection ~ 5040 2120
Wire Wire Line
	5040 2120 5900 2120
Wire Wire Line
	5140 2820 5140 2220
Connection ~ 5140 2220
Wire Wire Line
	5140 2220 5900 2220
Wire Wire Line
	5240 2820 5240 2320
Connection ~ 5240 2320
Wire Wire Line
	5240 2320 5900 2320
Wire Wire Line
	5340 2820 5340 2420
Connection ~ 5340 2420
Wire Wire Line
	5340 2420 5900 2420
$Comp
L power:GND #PWR?
U 1 1 5E1CF451
P 4990 3300
AR Path="/5BAAE2B6/5E1CF451" Ref="#PWR?"  Part="1" 
AR Path="/5BB6CF6D/5E1CF451" Ref="#PWR?"  Part="1" 
AR Path="/5BBE424C/5E1CF451" Ref="#PWR?"  Part="1" 
AR Path="/5CB8A16A/5E1CF451" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4990 3050 50  0001 C CNN
F 1 "GND" H 4990 3150 50  0000 C CNN
F 2 "" H 4990 3300 50  0001 C CNN
F 3 "" H 4990 3300 50  0001 C CNN
	1    4990 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4990 3300 4990 3260
Wire Wire Line
	4990 3260 4940 3260
Wire Wire Line
	4640 3260 4640 3220
Wire Wire Line
	4990 3260 5040 3260
Wire Wire Line
	5340 3260 5340 3220
Connection ~ 4990 3260
Wire Wire Line
	5240 3220 5240 3260
Connection ~ 5240 3260
Wire Wire Line
	5240 3260 5340 3260
Wire Wire Line
	5140 3220 5140 3260
Connection ~ 5140 3260
Wire Wire Line
	5140 3260 5240 3260
Wire Wire Line
	5040 3220 5040 3260
Connection ~ 5040 3260
Wire Wire Line
	5040 3260 5140 3260
Wire Wire Line
	4940 3220 4940 3260
Connection ~ 4940 3260
Wire Wire Line
	4940 3260 4840 3260
Wire Wire Line
	4840 3220 4840 3260
Connection ~ 4840 3260
Wire Wire Line
	4840 3260 4740 3260
Wire Wire Line
	4740 3220 4740 3260
Connection ~ 4740 3260
Wire Wire Line
	4740 3260 4640 3260
Wire Wire Line
	3850 4520 5040 4520
Wire Wire Line
	3850 4420 4940 4420
Wire Wire Line
	3850 4320 4840 4320
Wire Wire Line
	3850 4220 4740 4220
Wire Wire Line
	3850 4120 4640 4120
Wire Wire Line
	3850 4620 5140 4620
Wire Wire Line
	3850 4820 5340 4820
Wire Wire Line
	3850 4720 5240 4720
$Comp
L Device:R_Pack08 RN?
U 1 1 5E1EC35D
P 5040 5420
F 0 "RN?" H 5430 5330 50  0000 L CNN
F 1 "10k" H 5430 5430 50  0000 L CNN
F 2 "Resistors_SMD:R_Array_Convex_8x0602" V 5515 5420 50  0001 C CNN
F 3 "~" H 5040 5420 50  0001 C CNN
F 4 "Y1103CT-ND" H 5040 5420 50  0001 C CNN "Digi-Key PN"
	1    5040 5420
	1    0    0    -1  
$EndComp
Wire Wire Line
	4640 5220 4640 4120
Wire Wire Line
	4740 5220 4740 4220
Wire Wire Line
	4840 5220 4840 4320
Wire Wire Line
	4940 5220 4940 4420
Wire Wire Line
	5040 5220 5040 4520
Wire Wire Line
	5140 5220 5140 4620
Wire Wire Line
	5240 5220 5240 4720
Wire Wire Line
	5340 5220 5340 4820
$Comp
L power:GND #PWR?
U 1 1 5E1EC36B
P 4990 5700
AR Path="/5BAAE2B6/5E1EC36B" Ref="#PWR?"  Part="1" 
AR Path="/5BB6CF6D/5E1EC36B" Ref="#PWR?"  Part="1" 
AR Path="/5BBE424C/5E1EC36B" Ref="#PWR?"  Part="1" 
AR Path="/5CB8A16A/5E1EC36B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4990 5450 50  0001 C CNN
F 1 "GND" H 4990 5550 50  0000 C CNN
F 2 "" H 4990 5700 50  0001 C CNN
F 3 "" H 4990 5700 50  0001 C CNN
	1    4990 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4990 5700 4990 5660
Wire Wire Line
	4990 5660 4940 5660
Wire Wire Line
	4640 5660 4640 5620
Wire Wire Line
	4990 5660 5040 5660
Wire Wire Line
	5340 5660 5340 5620
Connection ~ 4990 5660
Wire Wire Line
	5240 5620 5240 5660
Connection ~ 5240 5660
Wire Wire Line
	5240 5660 5340 5660
Wire Wire Line
	5140 5620 5140 5660
Connection ~ 5140 5660
Wire Wire Line
	5140 5660 5240 5660
Wire Wire Line
	5040 5620 5040 5660
Connection ~ 5040 5660
Wire Wire Line
	5040 5660 5140 5660
Wire Wire Line
	4940 5620 4940 5660
Connection ~ 4940 5660
Wire Wire Line
	4940 5660 4840 5660
Wire Wire Line
	4840 5620 4840 5660
Connection ~ 4840 5660
Wire Wire Line
	4840 5660 4740 5660
Wire Wire Line
	4740 5620 4740 5660
Connection ~ 4740 5660
Wire Wire Line
	4740 5660 4640 5660
Connection ~ 4640 4120
Wire Wire Line
	4640 4120 5900 4120
Connection ~ 4740 4220
Wire Wire Line
	4740 4220 5900 4220
Connection ~ 4840 4320
Wire Wire Line
	4840 4320 5900 4320
Connection ~ 4940 4420
Wire Wire Line
	4940 4420 5900 4420
Connection ~ 5040 4520
Wire Wire Line
	5040 4520 5900 4520
Connection ~ 5140 4620
Wire Wire Line
	5140 4620 5900 4620
Connection ~ 5240 4720
Wire Wire Line
	5240 4720 5900 4720
Connection ~ 5340 4820
Wire Wire Line
	5340 4820 5900 4820
$EndSCHEMATC

EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 30 31
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
L Connector_Generic:Conn_02x30_Odd_Even J3001
U 1 1 5E205E81
P 5340 3770
F 0 "J3001" H 5390 5270 50  0000 C CNN
F 1 "DSP_IO_Connector" H 5390 2170 50  0000 C CNN
F 2 "Connector_Samtec:Samtec_LSHM-130-xx.x-x-DV-N_2x30_P0.50mm_Vertical" H 5340 3770 50  0001 C CNN
F 3 "~" H 5340 3770 50  0001 C CNN
F 4 "SAM14116CT-ND" H 5340 3770 50  0001 C CNN "Digi-Key PN"
	1    5340 3770
	1    0    0    -1  
$EndComp
Text GLabel 5140 4570 0    50   Input ~ 0
Anode_A_DSP
Text GLabel 5140 4470 0    50   Input ~ 0
Anode_B_DSP
Text GLabel 5140 4370 0    50   Input ~ 0
Anode_C_DSP
Text GLabel 5140 4270 0    50   Input ~ 0
Anode_D_DSP
Text GLabel 5140 4170 0    50   Input ~ 0
Anode_E_DSP
Text GLabel 5140 4070 0    50   Input ~ 0
Anode_F_DSP
Text GLabel 5140 3970 0    50   Input ~ 0
Anode_G_DSP
Text GLabel 5140 3870 0    50   Input ~ 0
Anode_DP_DSP
Text GLabel 5640 4570 2    50   Input ~ 0
Grid_0_DSP
Text GLabel 5640 4470 2    50   Input ~ 0
Grid_1_DSP
Text GLabel 5640 4370 2    50   Input ~ 0
Grid_2_DSP
Text GLabel 5640 4270 2    50   Input ~ 0
Grid_3_DSP
Text GLabel 5640 4170 2    50   Input ~ 0
Grid_4_DSP
Text GLabel 5640 4070 2    50   Input ~ 0
Grid_5_DSP
Text GLabel 5640 3970 2    50   Input ~ 0
Colon_0_DSP
Text GLabel 5640 3870 2    50   Input ~ 0
Colon_1_DSP
Text GLabel 5140 4770 0    50   Output ~ 0
Cap_Touch_Left_DSP
Text GLabel 5140 4870 0    50   Output ~ 0
Cap_Touch_Right_DSP
Text GLabel 5140 4970 0    50   Output ~ 0
Cap_Touch_Up_DSP
Text GLabel 5140 5070 0    50   Output ~ 0
Cap_Touch_Down_DSP
Text GLabel 5140 5170 0    50   Output ~ 0
Cap_Touch_Power_DSP
Text GLabel 5140 5270 0    40   Output ~ 0
~Display_Detect_DSP
Text GLabel 5640 4870 2    50   BiDi ~ 0
I2C_DSP_SDA
Text GLabel 5640 4770 2    50   Input ~ 0
I2C_DSP_SCL
$Comp
L Custom_Library:+60VAN #PWR03001
U 1 1 5E467E46
P 5140 2370
F 0 "#PWR03001" H 5140 2220 50  0001 C CNN
F 1 "+60VAN" V 5140 2510 50  0000 L CNN
F 2 "" H 5140 2370 50  0000 C CNN
F 3 "" H 5140 2370 50  0000 C CNN
	1    5140 2370
	0    -1   1    0   
$EndComp
$Comp
L Custom_Library:+60VAN #PWR03002
U 1 1 5E46869B
P 5140 2470
F 0 "#PWR03002" H 5140 2320 50  0001 C CNN
F 1 "+60VAN" V 5140 2610 50  0000 L CNN
F 2 "" H 5140 2470 50  0000 C CNN
F 3 "" H 5140 2470 50  0000 C CNN
	1    5140 2470
	0    -1   1    0   
$EndComp
$Comp
L Custom_Library:+60VAN #PWR03003
U 1 1 5E468940
P 5140 2570
F 0 "#PWR03003" H 5140 2420 50  0001 C CNN
F 1 "+60VAN" V 5140 2710 50  0000 L CNN
F 2 "" H 5140 2570 50  0000 C CNN
F 3 "" H 5140 2570 50  0000 C CNN
	1    5140 2570
	0    -1   1    0   
$EndComp
$Comp
L Custom_Library:+60VAN #PWR03004
U 1 1 5E468BE6
P 5140 2670
F 0 "#PWR03004" H 5140 2520 50  0001 C CNN
F 1 "+60VAN" V 5140 2810 50  0000 L CNN
F 2 "" H 5140 2670 50  0000 C CNN
F 3 "" H 5140 2670 50  0000 C CNN
	1    5140 2670
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR03014
U 1 1 5E46B5F5
P 5640 2370
F 0 "#PWR03014" H 5640 2120 50  0001 C CNN
F 1 "GND" V 5640 2220 50  0000 R CNN
F 2 "" H 5640 2370 50  0001 C CNN
F 3 "" H 5640 2370 50  0001 C CNN
	1    5640 2370
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03015
U 1 1 5E46BBBE
P 5640 2470
F 0 "#PWR03015" H 5640 2220 50  0001 C CNN
F 1 "GND" V 5640 2320 50  0000 R CNN
F 2 "" H 5640 2470 50  0001 C CNN
F 3 "" H 5640 2470 50  0001 C CNN
	1    5640 2470
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03016
U 1 1 5E46BDD7
P 5640 2570
F 0 "#PWR03016" H 5640 2320 50  0001 C CNN
F 1 "GND" V 5640 2420 50  0000 R CNN
F 2 "" H 5640 2570 50  0001 C CNN
F 3 "" H 5640 2570 50  0001 C CNN
	1    5640 2570
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03017
U 1 1 5E46C008
P 5640 2670
F 0 "#PWR03017" H 5640 2420 50  0001 C CNN
F 1 "GND" V 5640 2520 50  0000 R CNN
F 2 "" H 5640 2670 50  0001 C CNN
F 3 "" H 5640 2670 50  0001 C CNN
	1    5640 2670
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03018
U 1 1 5E46EB1D
P 5640 2770
F 0 "#PWR03018" H 5640 2520 50  0001 C CNN
F 1 "GND" V 5640 2620 50  0000 R CNN
F 2 "" H 5640 2770 50  0001 C CNN
F 3 "" H 5640 2770 50  0001 C CNN
	1    5640 2770
	0    -1   -1   0   
$EndComp
NoConn ~ 5140 2770
$Comp
L power:+5V #PWR03009
U 1 1 5E471586
P 5140 3370
F 0 "#PWR03009" H 5140 3220 50  0001 C CNN
F 1 "+5V" V 5140 3510 50  0000 L CNN
F 2 "" H 5140 3370 50  0001 C CNN
F 3 "" H 5140 3370 50  0001 C CNN
	1    5140 3370
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR03010
U 1 1 5E471A42
P 5140 3470
F 0 "#PWR03010" H 5140 3320 50  0001 C CNN
F 1 "+5V" V 5140 3610 50  0000 L CNN
F 2 "" H 5140 3470 50  0001 C CNN
F 3 "" H 5140 3470 50  0001 C CNN
	1    5140 3470
	0    -1   -1   0   
$EndComp
$Comp
L Custom_Library:+1.2VFF #PWR03005
U 1 1 5E474818
P 5140 2870
F 0 "#PWR03005" H 5140 2720 50  0001 C CNN
F 1 "+1.2VFF" V 5140 3010 50  0000 L CNN
F 2 "" H 5140 2870 50  0000 C CNN
F 3 "" H 5140 2870 50  0000 C CNN
	1    5140 2870
	0    -1   -1   0   
$EndComp
$Comp
L Custom_Library:+1.2VFF #PWR03006
U 1 1 5E474F97
P 5140 2970
F 0 "#PWR03006" H 5140 2820 50  0001 C CNN
F 1 "+1.2VFF" V 5140 3110 50  0000 L CNN
F 2 "" H 5140 2970 50  0000 C CNN
F 3 "" H 5140 2970 50  0000 C CNN
	1    5140 2970
	0    -1   -1   0   
$EndComp
$Comp
L Custom_Library:+1.2VFF #PWR03007
U 1 1 5E47521D
P 5140 3070
F 0 "#PWR03007" H 5140 2920 50  0001 C CNN
F 1 "+1.2VFF" V 5140 3210 50  0000 L CNN
F 2 "" H 5140 3070 50  0000 C CNN
F 3 "" H 5140 3070 50  0000 C CNN
	1    5140 3070
	0    -1   -1   0   
$EndComp
$Comp
L Custom_Library:+1.2VFF #PWR03008
U 1 1 5E47547E
P 5140 3170
F 0 "#PWR03008" H 5140 3020 50  0001 C CNN
F 1 "+1.2VFF" V 5140 3310 50  0000 L CNN
F 2 "" H 5140 3170 50  0000 C CNN
F 3 "" H 5140 3170 50  0000 C CNN
	1    5140 3170
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03019
U 1 1 5E475795
P 5640 2870
F 0 "#PWR03019" H 5640 2620 50  0001 C CNN
F 1 "GND" V 5640 2720 50  0000 R CNN
F 2 "" H 5640 2870 50  0001 C CNN
F 3 "" H 5640 2870 50  0001 C CNN
	1    5640 2870
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03020
U 1 1 5E47579F
P 5640 2970
F 0 "#PWR03020" H 5640 2720 50  0001 C CNN
F 1 "GND" V 5640 2820 50  0000 R CNN
F 2 "" H 5640 2970 50  0001 C CNN
F 3 "" H 5640 2970 50  0001 C CNN
	1    5640 2970
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03021
U 1 1 5E4757A9
P 5640 3070
F 0 "#PWR03021" H 5640 2820 50  0001 C CNN
F 1 "GND" V 5640 2920 50  0000 R CNN
F 2 "" H 5640 3070 50  0001 C CNN
F 3 "" H 5640 3070 50  0001 C CNN
	1    5640 3070
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03022
U 1 1 5E4757B3
P 5640 3170
F 0 "#PWR03022" H 5640 2920 50  0001 C CNN
F 1 "GND" V 5640 3020 50  0000 R CNN
F 2 "" H 5640 3170 50  0001 C CNN
F 3 "" H 5640 3170 50  0001 C CNN
	1    5640 3170
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR03011
U 1 1 5E479A6B
P 5140 3570
F 0 "#PWR03011" H 5140 3420 50  0001 C CNN
F 1 "+5V" V 5140 3710 50  0000 L CNN
F 2 "" H 5140 3570 50  0001 C CNN
F 3 "" H 5140 3570 50  0001 C CNN
	1    5140 3570
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR03012
U 1 1 5E479CD1
P 5140 3670
F 0 "#PWR03012" H 5140 3520 50  0001 C CNN
F 1 "+5V" V 5140 3810 50  0000 L CNN
F 2 "" H 5140 3670 50  0001 C CNN
F 3 "" H 5140 3670 50  0001 C CNN
	1    5140 3670
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03023
U 1 1 5E47C65B
P 5640 3270
F 0 "#PWR03023" H 5640 3020 50  0001 C CNN
F 1 "GND" V 5640 3120 50  0000 R CNN
F 2 "" H 5640 3270 50  0001 C CNN
F 3 "" H 5640 3270 50  0001 C CNN
	1    5640 3270
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03024
U 1 1 5E47C665
P 5640 3370
F 0 "#PWR03024" H 5640 3120 50  0001 C CNN
F 1 "GND" V 5640 3220 50  0000 R CNN
F 2 "" H 5640 3370 50  0001 C CNN
F 3 "" H 5640 3370 50  0001 C CNN
	1    5640 3370
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03025
U 1 1 5E47C66F
P 5640 3470
F 0 "#PWR03025" H 5640 3220 50  0001 C CNN
F 1 "GND" V 5640 3320 50  0000 R CNN
F 2 "" H 5640 3470 50  0001 C CNN
F 3 "" H 5640 3470 50  0001 C CNN
	1    5640 3470
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03026
U 1 1 5E47C679
P 5640 3570
F 0 "#PWR03026" H 5640 3320 50  0001 C CNN
F 1 "GND" V 5640 3420 50  0000 R CNN
F 2 "" H 5640 3570 50  0001 C CNN
F 3 "" H 5640 3570 50  0001 C CNN
	1    5640 3570
	0    -1   -1   0   
$EndComp
NoConn ~ 5140 3270
NoConn ~ 5140 3770
$Comp
L power:GND #PWR03027
U 1 1 5E492BA0
P 5640 3670
F 0 "#PWR03027" H 5640 3420 50  0001 C CNN
F 1 "GND" V 5640 3520 50  0000 R CNN
F 2 "" H 5640 3670 50  0001 C CNN
F 3 "" H 5640 3670 50  0001 C CNN
	1    5640 3670
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03028
U 1 1 5E492DDD
P 5640 3770
F 0 "#PWR03028" H 5640 3520 50  0001 C CNN
F 1 "GND" V 5640 3620 50  0000 R CNN
F 2 "" H 5640 3770 50  0001 C CNN
F 3 "" H 5640 3770 50  0001 C CNN
	1    5640 3770
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03030
U 1 1 5E49ACDD
P 5640 4970
F 0 "#PWR03030" H 5640 4720 50  0001 C CNN
F 1 "GND" V 5640 4820 50  0000 R CNN
F 2 "" H 5640 4970 50  0001 C CNN
F 3 "" H 5640 4970 50  0001 C CNN
	1    5640 4970
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03031
U 1 1 5E49ACE7
P 5640 5070
F 0 "#PWR03031" H 5640 4820 50  0001 C CNN
F 1 "GND" V 5640 4920 50  0000 R CNN
F 2 "" H 5640 5070 50  0001 C CNN
F 3 "" H 5640 5070 50  0001 C CNN
	1    5640 5070
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03032
U 1 1 5E49ACF1
P 5640 5170
F 0 "#PWR03032" H 5640 4920 50  0001 C CNN
F 1 "GND" V 5640 5020 50  0000 R CNN
F 2 "" H 5640 5170 50  0001 C CNN
F 3 "" H 5640 5170 50  0001 C CNN
	1    5640 5170
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03033
U 1 1 5E49ACFB
P 5640 5270
F 0 "#PWR03033" H 5640 5020 50  0001 C CNN
F 1 "GND" V 5640 5120 50  0000 R CNN
F 2 "" H 5640 5270 50  0001 C CNN
F 3 "" H 5640 5270 50  0001 C CNN
	1    5640 5270
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03029
U 1 1 5E49E86A
P 5640 4670
F 0 "#PWR03029" H 5640 4420 50  0001 C CNN
F 1 "GND" V 5640 4520 50  0000 R CNN
F 2 "" H 5640 4670 50  0001 C CNN
F 3 "" H 5640 4670 50  0001 C CNN
	1    5640 4670
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03013
U 1 1 5E49ED22
P 5140 4670
F 0 "#PWR03013" H 5140 4420 50  0001 C CNN
F 1 "GND" V 5140 4520 50  0000 R CNN
F 2 "" H 5140 4670 50  0001 C CNN
F 3 "" H 5140 4670 50  0001 C CNN
	1    5140 4670
	0    1    1    0   
$EndComp
$EndSCHEMATC

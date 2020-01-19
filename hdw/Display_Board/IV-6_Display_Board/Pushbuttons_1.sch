EESchema Schematic File Version 4
LIBS:IV-6_Display_Board-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 6 12
Title "Incrementor"
Date "2019-09-03"
Rev "A"
Comp "Drew Maatman"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Sensor_Touch:AT42QT1010-TSHR U?
U 1 1 5DF3B23F
P 4720 2360
AR Path="/5E28CFDF/5DF3B23F" Ref="U?"  Part="1" 
AR Path="/5E36CE18/5DF3B23F" Ref="U?"  Part="1" 
AR Path="/5E3C80C8/5DF3B23F" Ref="U?"  Part="1" 
AR Path="/5E3C97B4/5DF3B23F" Ref="U?"  Part="1" 
F 0 "U?" H 4620 2685 50  0000 R CNN
F 1 "AT42QT1010-TSHR" H 4620 2610 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6" H 4770 2110 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-9541-AT42-QTouch-BSW-AT42QT1010_Datasheet.pdf" H 4990 2910 50  0001 C CNN
F 4 "AT42QT1010-TSHRCT-ND" H 4720 2360 50  0001 C CNN "Digi-Key PN"
	1    4720 2360
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF3B249
P 4720 2660
AR Path="/5E28CFDF/5DF3B249" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5DF3B249" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5DF3B249" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5DF3B249" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4720 2410 50  0001 C CNN
F 1 "GND" H 4720 2510 50  0000 C CNN
F 2 "" H 4720 2660 50  0001 C CNN
F 3 "" H 4720 2660 50  0001 C CNN
	1    4720 2660
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5DF3B257
P 4000 2460
AR Path="/5C1D5CD8/5DF3B257" Ref="C?"  Part="1" 
AR Path="/5C1D5CCA/5DF3B257" Ref="C?"  Part="1" 
AR Path="/5C1E3A0B/5DF3B257" Ref="C?"  Part="1" 
AR Path="/5C26E09A/5DF3B257" Ref="C?"  Part="1" 
AR Path="/5D739492/5DF3B257" Ref="C?"  Part="1" 
AR Path="/5E28CFDF/5DF3B257" Ref="C?"  Part="1" 
AR Path="/5E36CE18/5DF3B257" Ref="C?"  Part="1" 
AR Path="/5E3C80C8/5DF3B257" Ref="C?"  Part="1" 
AR Path="/5E3C97B4/5DF3B257" Ref="C?"  Part="1" 
F 0 "C?" V 3476 2460 50  0000 C CNN
F 1 "10nF" V 3567 2460 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 4038 2310 50  0001 C CNN
F 3 "" H 4025 2560 50  0001 C CNN
F 4 "1276-1921-1-ND" H -790 240 50  0001 C CNN "Digi-Key PN"
F 5 "0603" V 3658 2460 50  0000 C CNN "display_footprint"
F 6 "50V" V 3749 2460 50  0000 C CNN "Voltage"
F 7 "X7R" V 3840 2460 50  0000 C CNN "Dielectric"
	1    4000 2460
	0    1    -1   0   
$EndComp
Wire Wire Line
	4150 2460 4320 2460
$Comp
L Custom_Library:R_Custom R?
U 1 1 5DF3B266
P 3200 2260
AR Path="/5C3165D8/5DF3B266" Ref="R?"  Part="1" 
AR Path="/5C26E09A/5DF3B266" Ref="R?"  Part="1" 
AR Path="/5D739492/5DF3B266" Ref="R?"  Part="1" 
AR Path="/5E28CFDF/5DF3B266" Ref="R?"  Part="1" 
AR Path="/5E36CE18/5DF3B266" Ref="R?"  Part="1" 
AR Path="/5E3C80C8/5DF3B266" Ref="R?"  Part="1" 
AR Path="/5E3C97B4/5DF3B266" Ref="R?"  Part="1" 
F 0 "R?" V 3100 2260 50  0000 C CNN
F 1 "499" V 3200 2260 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 3200 2260 50  0001 C CNN
F 3 "" H 3200 2260 50  0001 C CNN
F 4 "P499HCT-ND" H 3500 2660 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 3300 2260 50  0000 C CNN "display_footprint"
F 6 "1%" V 3400 2260 50  0000 C CNN "Tolerance"
F 7 "1/10W" V 3500 2260 50  0000 C CNN "Wattage"
	1    3200 2260
	0    -1   1    0   
$EndComp
Wire Wire Line
	3350 2260 3680 2260
Wire Wire Line
	3850 2460 3680 2460
Wire Wire Line
	3680 2460 3680 2260
Connection ~ 3680 2260
Wire Wire Line
	3680 2260 4320 2260
$Comp
L Custom_Library:Cap_Touch SW?
U 1 1 5DF3B275
P 2740 2260
AR Path="/5E28CFDF/5DF3B275" Ref="SW?"  Part="1" 
AR Path="/5E36CE18/5DF3B275" Ref="SW?"  Part="1" 
AR Path="/5E3C80C8/5DF3B275" Ref="SW?"  Part="1" 
AR Path="/5E3C97B4/5DF3B275" Ref="SW?"  Part="1" 
F 0 "SW?" V 2740 2410 50  0000 L CNN
F 1 "Cap_Touch" H 2740 2410 50  0001 C CNN
F 2 "Custom Footprints Library:Capacitive_Touch_Pad" H 2740 2260 60  0001 C CNN
F 3 "" H 2740 2260 60  0000 C CNN
	1    2740 2260
	0    -1   1    0   
$EndComp
Wire Wire Line
	2740 2260 3050 2260
$Comp
L Custom_Library:R_Custom R?
U 1 1 5DF3B284
P 5570 2750
AR Path="/5D6B2673/5DF3B284" Ref="R?"  Part="1" 
AR Path="/5D784813/5DF3B284" Ref="R?"  Part="1" 
AR Path="/5D739492/5DF3B284" Ref="R?"  Part="1" 
AR Path="/5E28CFDF/5DF3B284" Ref="R?"  Part="1" 
AR Path="/5E36CE18/5DF3B284" Ref="R?"  Part="1" 
AR Path="/5E3C80C8/5DF3B284" Ref="R?"  Part="1" 
AR Path="/5E3C97B4/5DF3B284" Ref="R?"  Part="1" 
F 0 "R?" H 5670 2910 50  0000 L CNN
F 1 "10k" V 5570 2680 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 5570 2750 50  0001 C CNN
F 3 "" H 5570 2750 50  0001 C CNN
F 4 "0603" H 5670 2820 50  0000 L CNN "display_footprint"
F 5 "1%" H 5670 2720 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 5670 2620 50  0000 L CNN "Wattage"
F 7 "RMCF0603FT10K0CT-ND" H 5870 3150 60  0001 C CNN "Digi-Key PN"
	1    5570 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF3B28E
P 5570 2900
AR Path="/5D6B2673/5DF3B28E" Ref="#PWR?"  Part="1" 
AR Path="/5D784813/5DF3B28E" Ref="#PWR?"  Part="1" 
AR Path="/5D739492/5DF3B28E" Ref="#PWR?"  Part="1" 
AR Path="/5E28CFDF/5DF3B28E" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5DF3B28E" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5DF3B28E" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5DF3B28E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5570 2650 50  0001 C CNN
F 1 "GND" H 5575 2727 50  0000 C CNN
F 2 "" H 5570 2900 50  0001 C CNN
F 3 "" H 5570 2900 50  0001 C CNN
	1    5570 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5570 2600 5570 2460
Wire Wire Line
	5570 2460 5120 2460
$Comp
L Custom_Library:R_Custom R?
U 1 1 5DF3B29D
P 6190 2460
AR Path="/5C3165D8/5DF3B29D" Ref="R?"  Part="1" 
AR Path="/5C26E09A/5DF3B29D" Ref="R?"  Part="1" 
AR Path="/5D739492/5DF3B29D" Ref="R?"  Part="1" 
AR Path="/5E28CFDF/5DF3B29D" Ref="R?"  Part="1" 
AR Path="/5E36CE18/5DF3B29D" Ref="R?"  Part="1" 
AR Path="/5E3C80C8/5DF3B29D" Ref="R?"  Part="1" 
AR Path="/5E3C97B4/5DF3B29D" Ref="R?"  Part="1" 
F 0 "R?" V 6090 2460 50  0000 C CNN
F 1 "10k" V 6190 2460 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6190 2460 50  0001 C CNN
F 3 "" H 6190 2460 50  0001 C CNN
F 4 "0603" V 6290 2460 50  0000 C CNN "display_footprint"
F 5 "1%" V 6390 2460 50  0000 C CNN "Tolerance"
F 6 "1/10W" V 6490 2460 50  0000 C CNN "Wattage"
F 7 "RMCF0603FT10K0CT-ND" H 6190 2460 50  0001 C CNN "Digi-Key PN"
	1    6190 2460
	0    1    -1   0   
$EndComp
Wire Wire Line
	6040 2460 5570 2460
Connection ~ 5570 2460
$Comp
L Custom_Library:C_Custom C?
U 1 1 5DF3B2AD
P 6450 2750
AR Path="/5C1D5CD8/5DF3B2AD" Ref="C?"  Part="1" 
AR Path="/5C1D5CCA/5DF3B2AD" Ref="C?"  Part="1" 
AR Path="/5C26E09A/5DF3B2AD" Ref="C?"  Part="1" 
AR Path="/5D739492/5DF3B2AD" Ref="C?"  Part="1" 
AR Path="/5E28CFDF/5DF3B2AD" Ref="C?"  Part="1" 
AR Path="/5E36CE18/5DF3B2AD" Ref="C?"  Part="1" 
AR Path="/5E3C80C8/5DF3B2AD" Ref="C?"  Part="1" 
AR Path="/5E3C97B4/5DF3B2AD" Ref="C?"  Part="1" 
F 0 "C?" H 6475 2850 50  0000 L CNN
F 1 "10uF" H 6475 2650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6488 2600 50  0001 C CNN
F 3 "" H 6475 2850 50  0001 C CNN
F 4 "490-14372-1-ND" H 6875 3250 60  0001 C CNN "Digi-Key PN"
F 5 "0603" H 6300 2850 50  0000 R CNN "display_footprint"
F 6 "10V" H 6300 2750 50  0000 R CNN "Voltage"
F 7 "X5R" H 6300 2650 50  0000 R CNN "Dielectric"
	1    6450 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF3B2B7
P 6450 2900
AR Path="/5D6B2673/5DF3B2B7" Ref="#PWR?"  Part="1" 
AR Path="/5D784813/5DF3B2B7" Ref="#PWR?"  Part="1" 
AR Path="/5D739492/5DF3B2B7" Ref="#PWR?"  Part="1" 
AR Path="/5E28CFDF/5DF3B2B7" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5DF3B2B7" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5DF3B2B7" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5DF3B2B7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6450 2650 50  0001 C CNN
F 1 "GND" H 6455 2727 50  0000 C CNN
F 2 "" H 6450 2900 50  0001 C CNN
F 3 "" H 6450 2900 50  0001 C CNN
	1    6450 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 2600 6450 2460
Wire Wire Line
	6450 2460 6340 2460
Wire Wire Line
	6690 2460 6450 2460
Connection ~ 6450 2460
$Comp
L power:GND #PWR?
U 1 1 5DF3B2C5
P 6990 2560
AR Path="/5D6B2673/5DF3B2C5" Ref="#PWR?"  Part="1" 
AR Path="/5D784813/5DF3B2C5" Ref="#PWR?"  Part="1" 
AR Path="/5D739492/5DF3B2C5" Ref="#PWR?"  Part="1" 
AR Path="/5E28CFDF/5DF3B2C5" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5DF3B2C5" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5DF3B2C5" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5DF3B2C5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6990 2310 50  0001 C CNN
F 1 "GND" H 6995 2387 50  0000 C CNN
F 2 "" H 6990 2560 50  0001 C CNN
F 3 "" H 6990 2560 50  0001 C CNN
	1    6990 2560
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5DF3B31F
P 5100 1640
AR Path="/5C1D5CD8/5DF3B31F" Ref="C?"  Part="1" 
AR Path="/5C1D5CCA/5DF3B31F" Ref="C?"  Part="1" 
AR Path="/5C26E09A/5DF3B31F" Ref="C?"  Part="1" 
AR Path="/5D739492/5DF3B31F" Ref="C?"  Part="1" 
AR Path="/5E28CFDF/5DF3B31F" Ref="C?"  Part="1" 
AR Path="/5E36CE18/5DF3B31F" Ref="C?"  Part="1" 
AR Path="/5E3C80C8/5DF3B31F" Ref="C?"  Part="1" 
AR Path="/5E3C97B4/5DF3B31F" Ref="C?"  Part="1" 
F 0 "C?" H 5125 1740 50  0000 L CNN
F 1 "0.1uF" H 5125 1540 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5138 1490 50  0001 C CNN
F 3 "" H 5125 1740 50  0001 C CNN
F 4 "311-1344-1-ND" H 5525 2140 60  0001 C CNN "Digi-Key PN"
F 5 "0603" H 4950 1740 50  0000 R CNN "display_footprint"
F 6 "50V" H 4950 1640 50  0000 R CNN "Voltage"
F 7 "X7R" H 4950 1540 50  0000 R CNN "Dielectric"
	1    5100 1640
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF3B356
P 5100 1790
AR Path="/5E28CFDF/5DF3B356" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5DF3B356" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5DF3B356" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5DF3B356" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5100 1540 50  0001 C CNN
F 1 "GND" H 5100 1640 50  0000 C CNN
F 2 "" H 5100 1790 50  0001 C CNN
F 3 "" H 5100 1790 50  0001 C CNN
	1    5100 1790
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5DF3B2FC
P 7220 2770
AR Path="/5E28CFDF/5DF3B2FC" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5DF3B2FC" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5DF3B2FC" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5DF3B2FC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7220 2620 50  0001 C CNN
F 1 "+3.3V" H 7220 2910 50  0000 C CNN
F 2 "" H 7220 2770 50  0001 C CNN
F 3 "" H 7220 2770 50  0001 C CNN
	1    7220 2770
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF3B2F2
P 7220 3070
AR Path="/5D6B2673/5DF3B2F2" Ref="#PWR?"  Part="1" 
AR Path="/5D784813/5DF3B2F2" Ref="#PWR?"  Part="1" 
AR Path="/5D739492/5DF3B2F2" Ref="#PWR?"  Part="1" 
AR Path="/5E28CFDF/5DF3B2F2" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5DF3B2F2" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5DF3B2F2" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5DF3B2F2" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7220 2820 50  0001 C CNN
F 1 "GND" H 7225 2897 50  0000 C CNN
F 2 "" H 7220 3070 50  0001 C CNN
F 3 "" H 7220 3070 50  0001 C CNN
	1    7220 3070
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5DF3B2E8
P 7220 2920
AR Path="/5C1D5CD8/5DF3B2E8" Ref="C?"  Part="1" 
AR Path="/5C1D5CCA/5DF3B2E8" Ref="C?"  Part="1" 
AR Path="/5C26E09A/5DF3B2E8" Ref="C?"  Part="1" 
AR Path="/5D739492/5DF3B2E8" Ref="C?"  Part="1" 
AR Path="/5E28CFDF/5DF3B2E8" Ref="C?"  Part="1" 
AR Path="/5E36CE18/5DF3B2E8" Ref="C?"  Part="1" 
AR Path="/5E3C80C8/5DF3B2E8" Ref="C?"  Part="1" 
AR Path="/5E3C97B4/5DF3B2E8" Ref="C?"  Part="1" 
F 0 "C?" H 7245 3020 50  0000 L CNN
F 1 "0.1uF" H 7245 2820 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 7258 2770 50  0001 C CNN
F 3 "" H 7245 3020 50  0001 C CNN
F 4 "311-1344-1-ND" H 7645 3420 60  0001 C CNN "Digi-Key PN"
F 5 "0603" H 7070 3020 50  0000 R CNN "display_footprint"
F 6 "50V" H 7070 2920 50  0000 R CNN "Voltage"
F 7 "X7R" H 7070 2820 50  0000 R CNN "Dielectric"
	1    7220 2920
	1    0    0    -1  
$EndComp
Text GLabel 7240 2460 2    50   Output ~ 0
Cap_Touch_Left_DSP
$Comp
L Custom_Library:74LVC1G97_Power U?
U 8 1 5E346B24
P 6990 2460
AR Path="/5E28CFDF/5E346B24" Ref="U?"  Part="8" 
AR Path="/5E36CE18/5E346B24" Ref="U?"  Part="8" 
AR Path="/5E3C80C8/5E346B24" Ref="U?"  Part="8" 
AR Path="/5E3C97B4/5E346B24" Ref="U?"  Part="8" 
F 0 "U?" H 7050 2610 50  0000 L CNN
F 1 "74LVC1G97" H 6880 2610 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 7040 2460 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g97.pdf" H 7040 2460 50  0001 C CNN
	8    6990 2460
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:TLV71333PDBV U?
U 1 1 5E361FE3
P 4110 1510
AR Path="/5E28CFDF/5E361FE3" Ref="U?"  Part="1" 
AR Path="/5E36CE18/5E361FE3" Ref="U?"  Part="1" 
AR Path="/5E3C80C8/5E361FE3" Ref="U?"  Part="1" 
AR Path="/5E3C97B4/5E361FE3" Ref="U?"  Part="1" 
F 0 "U?" H 3960 1735 50  0000 C CNN
F 1 "TLV71333PDBV" H 4110 1735 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 4110 1810 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tlv713p.pdf" H 4110 1510 50  0001 C CNN
	1    4110 1510
	1    0    0    -1  
$EndComp
Wire Wire Line
	4410 1410 4720 1410
Wire Wire Line
	5100 1410 5100 1490
Wire Wire Line
	5100 1410 5570 1410
Wire Wire Line
	5570 1410 5570 2260
Wire Wire Line
	5570 2260 5120 2260
Connection ~ 5100 1410
Wire Wire Line
	4720 2060 4720 1410
Connection ~ 4720 1410
Wire Wire Line
	4720 1410 5100 1410
$Comp
L power:GND #PWR?
U 1 1 5E3683B7
P 4110 1810
AR Path="/5E28CFDF/5E3683B7" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5E3683B7" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5E3683B7" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5E3683B7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4110 1560 50  0001 C CNN
F 1 "GND" H 4110 1660 50  0000 C CNN
F 2 "" H 4110 1810 50  0001 C CNN
F 3 "" H 4110 1810 50  0001 C CNN
	1    4110 1810
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E36A67A
P 3340 1640
AR Path="/5C1D5CD8/5E36A67A" Ref="C?"  Part="1" 
AR Path="/5C1D5CCA/5E36A67A" Ref="C?"  Part="1" 
AR Path="/5C26E09A/5E36A67A" Ref="C?"  Part="1" 
AR Path="/5D739492/5E36A67A" Ref="C?"  Part="1" 
AR Path="/5E28CFDF/5E36A67A" Ref="C?"  Part="1" 
AR Path="/5E36CE18/5E36A67A" Ref="C?"  Part="1" 
AR Path="/5E3C80C8/5E36A67A" Ref="C?"  Part="1" 
AR Path="/5E3C97B4/5E36A67A" Ref="C?"  Part="1" 
F 0 "C?" H 3365 1740 50  0000 L CNN
F 1 "0.1uF" H 3365 1540 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3378 1490 50  0001 C CNN
F 3 "" H 3365 1740 50  0001 C CNN
F 4 "311-1344-1-ND" H 3765 2140 60  0001 C CNN "Digi-Key PN"
F 5 "0603" H 3190 1740 50  0000 R CNN "display_footprint"
F 6 "50V" H 3190 1640 50  0000 R CNN "Voltage"
F 7 "X7R" H 3190 1540 50  0000 R CNN "Dielectric"
	1    3340 1640
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E36A680
P 3340 1790
AR Path="/5E28CFDF/5E36A680" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5E36A680" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5E36A680" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5E36A680" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3340 1540 50  0001 C CNN
F 1 "GND" H 3340 1640 50  0000 C CNN
F 2 "" H 3340 1790 50  0001 C CNN
F 3 "" H 3340 1790 50  0001 C CNN
	1    3340 1790
	1    0    0    -1  
$EndComp
Wire Wire Line
	3810 1410 3730 1410
Wire Wire Line
	3340 1410 3340 1490
$Comp
L power:+5V #PWR?
U 1 1 5E36AD8C
P 3340 1330
AR Path="/5E28CFDF/5E36AD8C" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5E36AD8C" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5E36AD8C" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5E36AD8C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3340 1180 50  0001 C CNN
F 1 "+5V" H 3340 1470 50  0000 C CNN
F 2 "" H 3340 1330 50  0001 C CNN
F 3 "" H 3340 1330 50  0001 C CNN
	1    3340 1330
	1    0    0    -1  
$EndComp
Wire Wire Line
	3340 1330 3340 1410
Connection ~ 3340 1410
Wire Wire Line
	3810 1510 3730 1510
Wire Wire Line
	3730 1510 3730 1410
Connection ~ 3730 1410
Wire Wire Line
	3730 1410 3340 1410
$Comp
L Sensor_Touch:AT42QT1010-TSHR U?
U 1 1 5E36F13C
P 4710 4850
AR Path="/5E28CFDF/5E36F13C" Ref="U?"  Part="1" 
AR Path="/5E36CE18/5E36F13C" Ref="U?"  Part="1" 
AR Path="/5E3C80C8/5E36F13C" Ref="U?"  Part="1" 
AR Path="/5E3C97B4/5E36F13C" Ref="U?"  Part="1" 
F 0 "U?" H 4610 5175 50  0000 R CNN
F 1 "AT42QT1010-TSHR" H 4610 5100 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6" H 4760 4600 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-9541-AT42-QTouch-BSW-AT42QT1010_Datasheet.pdf" H 4980 5400 50  0001 C CNN
F 4 "AT42QT1010-TSHRCT-ND" H 4710 4850 50  0001 C CNN "Digi-Key PN"
	1    4710 4850
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E36F146
P 4710 5150
AR Path="/5E28CFDF/5E36F146" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5E36F146" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5E36F146" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5E36F146" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4710 4900 50  0001 C CNN
F 1 "GND" H 4710 5000 50  0000 C CNN
F 2 "" H 4710 5150 50  0001 C CNN
F 3 "" H 4710 5150 50  0001 C CNN
	1    4710 5150
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E36F154
P 3990 4950
AR Path="/5C1D5CD8/5E36F154" Ref="C?"  Part="1" 
AR Path="/5C1D5CCA/5E36F154" Ref="C?"  Part="1" 
AR Path="/5C1E3A0B/5E36F154" Ref="C?"  Part="1" 
AR Path="/5C26E09A/5E36F154" Ref="C?"  Part="1" 
AR Path="/5D739492/5E36F154" Ref="C?"  Part="1" 
AR Path="/5E28CFDF/5E36F154" Ref="C?"  Part="1" 
AR Path="/5E36CE18/5E36F154" Ref="C?"  Part="1" 
AR Path="/5E3C80C8/5E36F154" Ref="C?"  Part="1" 
AR Path="/5E3C97B4/5E36F154" Ref="C?"  Part="1" 
F 0 "C?" V 3466 4950 50  0000 C CNN
F 1 "10nF" V 3557 4950 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 4028 4800 50  0001 C CNN
F 3 "" H 4015 5050 50  0001 C CNN
F 4 "1276-1921-1-ND" H -800 2730 50  0001 C CNN "Digi-Key PN"
F 5 "0603" V 3648 4950 50  0000 C CNN "display_footprint"
F 6 "50V" V 3739 4950 50  0000 C CNN "Voltage"
F 7 "X7R" V 3830 4950 50  0000 C CNN "Dielectric"
	1    3990 4950
	0    1    -1   0   
$EndComp
Wire Wire Line
	4140 4950 4310 4950
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E36F163
P 3190 4750
AR Path="/5C3165D8/5E36F163" Ref="R?"  Part="1" 
AR Path="/5C26E09A/5E36F163" Ref="R?"  Part="1" 
AR Path="/5D739492/5E36F163" Ref="R?"  Part="1" 
AR Path="/5E28CFDF/5E36F163" Ref="R?"  Part="1" 
AR Path="/5E36CE18/5E36F163" Ref="R?"  Part="1" 
AR Path="/5E3C80C8/5E36F163" Ref="R?"  Part="1" 
AR Path="/5E3C97B4/5E36F163" Ref="R?"  Part="1" 
F 0 "R?" V 3090 4750 50  0000 C CNN
F 1 "499" V 3190 4750 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 3190 4750 50  0001 C CNN
F 3 "" H 3190 4750 50  0001 C CNN
F 4 "P499HCT-ND" H 3490 5150 60  0001 C CNN "Digi-Key PN"
F 5 "0603" V 3290 4750 50  0000 C CNN "display_footprint"
F 6 "1%" V 3390 4750 50  0000 C CNN "Tolerance"
F 7 "1/10W" V 3490 4750 50  0000 C CNN "Wattage"
	1    3190 4750
	0    -1   1    0   
$EndComp
Wire Wire Line
	3340 4750 3670 4750
Wire Wire Line
	3840 4950 3670 4950
Wire Wire Line
	3670 4950 3670 4750
Connection ~ 3670 4750
Wire Wire Line
	3670 4750 4310 4750
$Comp
L Custom_Library:Cap_Touch SW?
U 1 1 5E36F172
P 2730 4750
AR Path="/5E28CFDF/5E36F172" Ref="SW?"  Part="1" 
AR Path="/5E36CE18/5E36F172" Ref="SW?"  Part="1" 
AR Path="/5E3C80C8/5E36F172" Ref="SW?"  Part="1" 
AR Path="/5E3C97B4/5E36F172" Ref="SW?"  Part="1" 
F 0 "SW?" V 2730 4900 50  0000 L CNN
F 1 "Cap_Touch" H 2730 4900 50  0001 C CNN
F 2 "Custom Footprints Library:Capacitive_Touch_Pad" H 2730 4750 60  0001 C CNN
F 3 "" H 2730 4750 60  0000 C CNN
	1    2730 4750
	0    -1   1    0   
$EndComp
Wire Wire Line
	2730 4750 3040 4750
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E36F181
P 5560 5240
AR Path="/5D6B2673/5E36F181" Ref="R?"  Part="1" 
AR Path="/5D784813/5E36F181" Ref="R?"  Part="1" 
AR Path="/5D739492/5E36F181" Ref="R?"  Part="1" 
AR Path="/5E28CFDF/5E36F181" Ref="R?"  Part="1" 
AR Path="/5E36CE18/5E36F181" Ref="R?"  Part="1" 
AR Path="/5E3C80C8/5E36F181" Ref="R?"  Part="1" 
AR Path="/5E3C97B4/5E36F181" Ref="R?"  Part="1" 
F 0 "R?" H 5660 5400 50  0000 L CNN
F 1 "10k" V 5560 5170 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 5560 5240 50  0001 C CNN
F 3 "" H 5560 5240 50  0001 C CNN
F 4 "0603" H 5660 5310 50  0000 L CNN "display_footprint"
F 5 "1%" H 5660 5210 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 5660 5110 50  0000 L CNN "Wattage"
F 7 "RMCF0603FT10K0CT-ND" H 5860 5640 60  0001 C CNN "Digi-Key PN"
	1    5560 5240
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E36F18B
P 5560 5390
AR Path="/5D6B2673/5E36F18B" Ref="#PWR?"  Part="1" 
AR Path="/5D784813/5E36F18B" Ref="#PWR?"  Part="1" 
AR Path="/5D739492/5E36F18B" Ref="#PWR?"  Part="1" 
AR Path="/5E28CFDF/5E36F18B" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5E36F18B" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5E36F18B" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5E36F18B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5560 5140 50  0001 C CNN
F 1 "GND" H 5565 5217 50  0000 C CNN
F 2 "" H 5560 5390 50  0001 C CNN
F 3 "" H 5560 5390 50  0001 C CNN
	1    5560 5390
	1    0    0    -1  
$EndComp
Wire Wire Line
	5560 5090 5560 4950
Wire Wire Line
	5560 4950 5110 4950
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E36F19B
P 6180 4950
AR Path="/5C3165D8/5E36F19B" Ref="R?"  Part="1" 
AR Path="/5C26E09A/5E36F19B" Ref="R?"  Part="1" 
AR Path="/5D739492/5E36F19B" Ref="R?"  Part="1" 
AR Path="/5E28CFDF/5E36F19B" Ref="R?"  Part="1" 
AR Path="/5E36CE18/5E36F19B" Ref="R?"  Part="1" 
AR Path="/5E3C80C8/5E36F19B" Ref="R?"  Part="1" 
AR Path="/5E3C97B4/5E36F19B" Ref="R?"  Part="1" 
F 0 "R?" V 6080 4950 50  0000 C CNN
F 1 "10k" V 6180 4950 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6180 4950 50  0001 C CNN
F 3 "" H 6180 4950 50  0001 C CNN
F 4 "0603" V 6280 4950 50  0000 C CNN "display_footprint"
F 5 "1%" V 6380 4950 50  0000 C CNN "Tolerance"
F 6 "1/10W" V 6480 4950 50  0000 C CNN "Wattage"
F 7 "RMCF0603FT10K0CT-ND" H 6180 4950 50  0001 C CNN "Digi-Key PN"
	1    6180 4950
	0    1    -1   0   
$EndComp
Wire Wire Line
	6030 4950 5560 4950
Connection ~ 5560 4950
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E36F1AB
P 6440 5240
AR Path="/5C1D5CD8/5E36F1AB" Ref="C?"  Part="1" 
AR Path="/5C1D5CCA/5E36F1AB" Ref="C?"  Part="1" 
AR Path="/5C26E09A/5E36F1AB" Ref="C?"  Part="1" 
AR Path="/5D739492/5E36F1AB" Ref="C?"  Part="1" 
AR Path="/5E28CFDF/5E36F1AB" Ref="C?"  Part="1" 
AR Path="/5E36CE18/5E36F1AB" Ref="C?"  Part="1" 
AR Path="/5E3C80C8/5E36F1AB" Ref="C?"  Part="1" 
AR Path="/5E3C97B4/5E36F1AB" Ref="C?"  Part="1" 
F 0 "C?" H 6465 5340 50  0000 L CNN
F 1 "10uF" H 6465 5140 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6478 5090 50  0001 C CNN
F 3 "" H 6465 5340 50  0001 C CNN
F 4 "490-14372-1-ND" H 6865 5740 60  0001 C CNN "Digi-Key PN"
F 5 "0603" H 6290 5340 50  0000 R CNN "display_footprint"
F 6 "10V" H 6290 5240 50  0000 R CNN "Voltage"
F 7 "X5R" H 6290 5140 50  0000 R CNN "Dielectric"
	1    6440 5240
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E36F1B5
P 6440 5390
AR Path="/5D6B2673/5E36F1B5" Ref="#PWR?"  Part="1" 
AR Path="/5D784813/5E36F1B5" Ref="#PWR?"  Part="1" 
AR Path="/5D739492/5E36F1B5" Ref="#PWR?"  Part="1" 
AR Path="/5E28CFDF/5E36F1B5" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5E36F1B5" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5E36F1B5" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5E36F1B5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6440 5140 50  0001 C CNN
F 1 "GND" H 6445 5217 50  0000 C CNN
F 2 "" H 6440 5390 50  0001 C CNN
F 3 "" H 6440 5390 50  0001 C CNN
	1    6440 5390
	1    0    0    -1  
$EndComp
Wire Wire Line
	6440 5090 6440 4950
Wire Wire Line
	6440 4950 6330 4950
Wire Wire Line
	6680 4950 6440 4950
Connection ~ 6440 4950
$Comp
L power:GND #PWR?
U 1 1 5E36F1C3
P 6980 5050
AR Path="/5D6B2673/5E36F1C3" Ref="#PWR?"  Part="1" 
AR Path="/5D784813/5E36F1C3" Ref="#PWR?"  Part="1" 
AR Path="/5D739492/5E36F1C3" Ref="#PWR?"  Part="1" 
AR Path="/5E28CFDF/5E36F1C3" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5E36F1C3" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5E36F1C3" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5E36F1C3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6980 4800 50  0001 C CNN
F 1 "GND" H 6985 4877 50  0000 C CNN
F 2 "" H 6980 5050 50  0001 C CNN
F 3 "" H 6980 5050 50  0001 C CNN
	1    6980 5050
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E36F1DB
P 5090 4130
AR Path="/5C1D5CD8/5E36F1DB" Ref="C?"  Part="1" 
AR Path="/5C1D5CCA/5E36F1DB" Ref="C?"  Part="1" 
AR Path="/5C26E09A/5E36F1DB" Ref="C?"  Part="1" 
AR Path="/5D739492/5E36F1DB" Ref="C?"  Part="1" 
AR Path="/5E28CFDF/5E36F1DB" Ref="C?"  Part="1" 
AR Path="/5E36CE18/5E36F1DB" Ref="C?"  Part="1" 
AR Path="/5E3C80C8/5E36F1DB" Ref="C?"  Part="1" 
AR Path="/5E3C97B4/5E36F1DB" Ref="C?"  Part="1" 
F 0 "C?" H 5115 4230 50  0000 L CNN
F 1 "0.1uF" H 5115 4030 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5128 3980 50  0001 C CNN
F 3 "" H 5115 4230 50  0001 C CNN
F 4 "311-1344-1-ND" H 5515 4630 60  0001 C CNN "Digi-Key PN"
F 5 "0603" H 4940 4230 50  0000 R CNN "display_footprint"
F 6 "50V" H 4940 4130 50  0000 R CNN "Voltage"
F 7 "X7R" H 4940 4030 50  0000 R CNN "Dielectric"
	1    5090 4130
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E36F1E5
P 5090 4280
AR Path="/5E28CFDF/5E36F1E5" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5E36F1E5" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5E36F1E5" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5E36F1E5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5090 4030 50  0001 C CNN
F 1 "GND" H 5090 4130 50  0000 C CNN
F 2 "" H 5090 4280 50  0001 C CNN
F 3 "" H 5090 4280 50  0001 C CNN
	1    5090 4280
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E36F1EF
P 7210 5260
AR Path="/5E28CFDF/5E36F1EF" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5E36F1EF" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5E36F1EF" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5E36F1EF" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7210 5110 50  0001 C CNN
F 1 "+3.3V" H 7210 5400 50  0000 C CNN
F 2 "" H 7210 5260 50  0001 C CNN
F 3 "" H 7210 5260 50  0001 C CNN
	1    7210 5260
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E36F1F9
P 7210 5560
AR Path="/5D6B2673/5E36F1F9" Ref="#PWR?"  Part="1" 
AR Path="/5D784813/5E36F1F9" Ref="#PWR?"  Part="1" 
AR Path="/5D739492/5E36F1F9" Ref="#PWR?"  Part="1" 
AR Path="/5E28CFDF/5E36F1F9" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5E36F1F9" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5E36F1F9" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5E36F1F9" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7210 5310 50  0001 C CNN
F 1 "GND" H 7215 5387 50  0000 C CNN
F 2 "" H 7210 5560 50  0001 C CNN
F 3 "" H 7210 5560 50  0001 C CNN
	1    7210 5560
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E36F207
P 7210 5410
AR Path="/5C1D5CD8/5E36F207" Ref="C?"  Part="1" 
AR Path="/5C1D5CCA/5E36F207" Ref="C?"  Part="1" 
AR Path="/5C26E09A/5E36F207" Ref="C?"  Part="1" 
AR Path="/5D739492/5E36F207" Ref="C?"  Part="1" 
AR Path="/5E28CFDF/5E36F207" Ref="C?"  Part="1" 
AR Path="/5E36CE18/5E36F207" Ref="C?"  Part="1" 
AR Path="/5E3C80C8/5E36F207" Ref="C?"  Part="1" 
AR Path="/5E3C97B4/5E36F207" Ref="C?"  Part="1" 
F 0 "C?" H 7235 5510 50  0000 L CNN
F 1 "0.1uF" H 7235 5310 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 7248 5260 50  0001 C CNN
F 3 "" H 7235 5510 50  0001 C CNN
F 4 "311-1344-1-ND" H 7635 5910 60  0001 C CNN "Digi-Key PN"
F 5 "0603" H 7060 5510 50  0000 R CNN "display_footprint"
F 6 "50V" H 7060 5410 50  0000 R CNN "Voltage"
F 7 "X7R" H 7060 5310 50  0000 R CNN "Dielectric"
	1    7210 5410
	1    0    0    -1  
$EndComp
Text GLabel 7230 4950 2    50   Output ~ 0
Cap_Touch_Right_DSP
$Comp
L Custom_Library:74LVC1G97_Power U?
U 8 1 5E36F212
P 6980 4950
AR Path="/5E28CFDF/5E36F212" Ref="U?"  Part="8" 
AR Path="/5E36CE18/5E36F212" Ref="U?"  Part="8" 
AR Path="/5E3C80C8/5E36F212" Ref="U?"  Part="8" 
AR Path="/5E3C97B4/5E36F212" Ref="U?"  Part="8" 
F 0 "U?" H 7040 5100 50  0000 L CNN
F 1 "74LVC1G97" H 6870 5100 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 7030 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g97.pdf" H 7030 4950 50  0001 C CNN
	8    6980 4950
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:TLV71333PDBV U?
U 1 1 5E36F21C
P 4100 4000
AR Path="/5E28CFDF/5E36F21C" Ref="U?"  Part="1" 
AR Path="/5E36CE18/5E36F21C" Ref="U?"  Part="1" 
AR Path="/5E3C80C8/5E36F21C" Ref="U?"  Part="1" 
AR Path="/5E3C97B4/5E36F21C" Ref="U?"  Part="1" 
F 0 "U?" H 3950 4225 50  0000 C CNN
F 1 "TLV71333PDBV" H 4100 4225 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 4100 4300 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tlv713p.pdf" H 4100 4000 50  0001 C CNN
	1    4100 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3900 4710 3900
Wire Wire Line
	5090 3900 5090 3980
Wire Wire Line
	5090 3900 5560 3900
Wire Wire Line
	5560 3900 5560 4750
Wire Wire Line
	5560 4750 5110 4750
Connection ~ 5090 3900
Wire Wire Line
	4710 4550 4710 3900
Connection ~ 4710 3900
Wire Wire Line
	4710 3900 5090 3900
$Comp
L power:GND #PWR?
U 1 1 5E36F22F
P 4100 4300
AR Path="/5E28CFDF/5E36F22F" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5E36F22F" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5E36F22F" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5E36F22F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4100 4050 50  0001 C CNN
F 1 "GND" H 4100 4150 50  0000 C CNN
F 2 "" H 4100 4300 50  0001 C CNN
F 3 "" H 4100 4300 50  0001 C CNN
	1    4100 4300
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E36F23D
P 3330 4130
AR Path="/5C1D5CD8/5E36F23D" Ref="C?"  Part="1" 
AR Path="/5C1D5CCA/5E36F23D" Ref="C?"  Part="1" 
AR Path="/5C26E09A/5E36F23D" Ref="C?"  Part="1" 
AR Path="/5D739492/5E36F23D" Ref="C?"  Part="1" 
AR Path="/5E28CFDF/5E36F23D" Ref="C?"  Part="1" 
AR Path="/5E36CE18/5E36F23D" Ref="C?"  Part="1" 
AR Path="/5E3C80C8/5E36F23D" Ref="C?"  Part="1" 
AR Path="/5E3C97B4/5E36F23D" Ref="C?"  Part="1" 
F 0 "C?" H 3355 4230 50  0000 L CNN
F 1 "0.1uF" H 3355 4030 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3368 3980 50  0001 C CNN
F 3 "" H 3355 4230 50  0001 C CNN
F 4 "311-1344-1-ND" H 3755 4630 60  0001 C CNN "Digi-Key PN"
F 5 "0603" H 3180 4230 50  0000 R CNN "display_footprint"
F 6 "50V" H 3180 4130 50  0000 R CNN "Voltage"
F 7 "X7R" H 3180 4030 50  0000 R CNN "Dielectric"
	1    3330 4130
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E36F247
P 3330 4280
AR Path="/5E28CFDF/5E36F247" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5E36F247" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5E36F247" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5E36F247" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3330 4030 50  0001 C CNN
F 1 "GND" H 3330 4130 50  0000 C CNN
F 2 "" H 3330 4280 50  0001 C CNN
F 3 "" H 3330 4280 50  0001 C CNN
	1    3330 4280
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 3900 3720 3900
Wire Wire Line
	3330 3900 3330 3980
$Comp
L power:+5V #PWR?
U 1 1 5E36F253
P 3330 3820
AR Path="/5E28CFDF/5E36F253" Ref="#PWR?"  Part="1" 
AR Path="/5E36CE18/5E36F253" Ref="#PWR?"  Part="1" 
AR Path="/5E3C80C8/5E36F253" Ref="#PWR?"  Part="1" 
AR Path="/5E3C97B4/5E36F253" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3330 3670 50  0001 C CNN
F 1 "+5V" H 3330 3960 50  0000 C CNN
F 2 "" H 3330 3820 50  0001 C CNN
F 3 "" H 3330 3820 50  0001 C CNN
	1    3330 3820
	1    0    0    -1  
$EndComp
Wire Wire Line
	3330 3820 3330 3900
Connection ~ 3330 3900
Wire Wire Line
	3800 4000 3720 4000
Wire Wire Line
	3720 4000 3720 3900
Connection ~ 3720 3900
Wire Wire Line
	3720 3900 3330 3900
$Comp
L power:+5V #PWR?
U 1 1 5E24FB82
P 6990 2360
F 0 "#PWR?" H 6990 2210 50  0001 C CNN
F 1 "+5V" H 6990 2500 50  0000 C CNN
F 2 "" H 6990 2360 50  0001 C CNN
F 3 "" H 6990 2360 50  0001 C CNN
	1    6990 2360
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E250396
P 6980 4850
F 0 "#PWR?" H 6980 4700 50  0001 C CNN
F 1 "+5V" H 6980 4990 50  0000 C CNN
F 2 "" H 6980 4850 50  0001 C CNN
F 3 "" H 6980 4850 50  0001 C CNN
	1    6980 4850
	1    0    0    -1  
$EndComp
$EndSCHEMATC

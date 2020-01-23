EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 10 30
Title "VFD Clock"
Date "2019-04-11"
Rev "A"
Comp "Drew Maatman"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR?
U 1 1 5A0BD1A1
P 9410 1980
F 0 "#PWR?" H 9410 1730 50  0001 C CNN
F 1 "GND" H 9410 1830 50  0000 C CNN
F 2 "" H 9410 1980 50  0001 C CNN
F 3 "" H 9410 1980 50  0001 C CNN
	1    9410 1980
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5A175076
P 9410 1830
F 0 "C?" H 9435 1930 50  0000 L CNN
F 1 "0.1uF" H 9435 1730 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 9448 1680 50  0001 C CNN
F 3 "" H 9435 1930 50  0001 C CNN
F 4 "0805" H 9260 1930 50  0000 R CNN "display_footprint"
F 5 "100V" H 9260 1830 50  0000 R CNN "Voltage"
F 6 "X7R" H 9260 1730 50  0000 R CNN "Dielectric"
F 7 "490-4789-1-ND" H 200 -400 50  0001 C CNN "Digi-Key PN"
	1    9410 1830
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5A4AC392
P 4230 7580
F 0 "#PWR?" H 4230 7330 50  0001 C CNN
F 1 "GND" H 4230 7430 50  0000 C CNN
F 2 "" H 4230 7580 50  0000 C CNN
F 3 "" H 4230 7580 50  0000 C CNN
	1    4230 7580
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5A4AC3A5
P 3910 7350
F 0 "C?" H 3935 7450 50  0000 L CNN
F 1 "0.1uF" H 3935 7250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3948 7200 50  0001 C CNN
F 3 "" H 3935 7450 50  0001 C CNN
F 4 "0603" H 3760 7450 50  0000 R CNN "display_footprint"
F 5 "50V" H 3760 7350 50  0000 R CNN "Voltage"
F 6 "X7R" H 3760 7250 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H 0   470 50  0001 C CNN "Digi-Key PN"
	1    3910 7350
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5A4AC3AF
P 4550 7350
F 0 "C?" H 4575 7450 50  0000 L CNN
F 1 "1nF" H 4575 7250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4588 7200 50  0001 C CNN
F 3 "" H 4575 7450 50  0001 C CNN
F 4 "0603" H 4400 7450 50  0001 R CNN "display_footprint"
F 5 "50V" H 4400 7350 50  0001 R CNN "Voltage"
F 6 "X7R" H 4400 7250 50  0001 R CNN "Dielectric"
F 7 "399-1083-1-ND" H 0   470 50  0001 C CNN "Digi-Key PN"
	1    4550 7350
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5A4AC3B9
P 4230 7350
F 0 "C?" H 4255 7450 50  0000 L CNN
F 1 "10nF" H 4255 7250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4268 7200 50  0001 C CNN
F 3 "" H 4255 7450 50  0001 C CNN
F 4 "0603" H 4080 7450 50  0001 R CNN "display_footprint"
F 5 "50V" H 4080 7350 50  0001 R CNN "Voltage"
F 6 "X7R" H 4080 7250 50  0001 R CNN "Dielectric"
F 7 "399-1092-1-ND" H 0   470 50  0001 C CNN "Digi-Key PN"
	1    4230 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5A4AC3C0
P 4230 7120
F 0 "#PWR?" H 4230 6970 50  0001 C CNN
F 1 "+3.3V" H 4230 7260 50  0000 C CNN
F 2 "" H 4230 7120 50  0000 C CNN
F 3 "" H 4230 7120 50  0000 C CNN
	1    4230 7120
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5A4AC47C
P 2850 7200
F 0 "#PWR?" H 2850 6950 50  0001 C CNN
F 1 "GND" H 2850 7050 50  0000 C CNN
F 2 "" H 2850 7200 50  0000 C CNN
F 3 "" H 2850 7200 50  0000 C CNN
	1    2850 7200
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5A4AC509
P 2850 6000
F 0 "#PWR?" H 2850 5850 50  0001 C CNN
F 1 "+3.3V" H 2850 6140 50  0000 C CNN
F 2 "" H 2850 6000 50  0000 C CNN
F 3 "" H 2850 6000 50  0000 C CNN
	1    2850 6000
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5A4ACAE7
P 2050 6600
F 0 "R?" V 1950 6600 50  0000 C CNN
F 1 "237" V 2050 6600 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 2050 6600 50  0001 C CNN
F 3 "" H 2050 6600 50  0001 C CNN
F 4 "0603" H 2120 6500 50  0000 L CNN "display_footprint"
F 5 "1%" H 2120 6580 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 2110 6650 50  0000 L CNN "Wattage"
F 7 "541-237HCT-ND" H 0   470 50  0001 C CNN "Digi-Key PN"
	1    2050 6600
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5A4ACC5C
P 2050 6100
F 0 "R?" V 1950 6100 50  0000 C CNN
F 1 "196k" V 2050 6100 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 2050 6100 50  0001 C CNN
F 3 "" H 2050 6100 50  0001 C CNN
F 4 "0603" H 2120 6000 50  0000 L CNN "display_footprint"
F 5 "1%" H 2120 6080 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 2110 6150 50  0000 L CNN "Wattage"
F 7 "P196KHCT-ND" H 0   470 50  0001 C CNN "Digi-Key PN"
	1    2050 6100
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5A4ACD20
P 2050 7100
F 0 "R?" V 1950 7100 50  0000 C CNN
F 1 "1.2k" V 2050 7100 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 2050 7100 50  0001 C CNN
F 3 "" H 2050 7100 50  0001 C CNN
F 4 "0603" H 2120 7000 50  0000 L CNN "display_footprint"
F 5 "1%" H 2120 7080 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 2110 7150 50  0000 L CNN "Wattage"
F 7 "P1.20KHCT-ND" H 0   470 50  0001 C CNN "Digi-Key PN"
	1    2050 7100
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5A4ADA73
P 2050 7250
F 0 "#PWR?" H 2050 7000 50  0001 C CNN
F 1 "GND" H 2050 7100 50  0000 C CNN
F 2 "" H 2050 7250 50  0000 C CNN
F 3 "" H 2050 7250 50  0000 C CNN
	1    2050 7250
	1    0    0    -1  
$EndComp
Text GLabel 4190 6350 2    50   Output ~ 0
POS60_VAN_PGOOD
$Comp
L Custom_Library:R_Custom R?
U 1 1 5A4AE119
P 4090 6060
F 0 "R?" H 4030 6060 50  0000 R CNN
F 1 "10k" V 4090 6060 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 4090 6060 50  0001 C CNN
F 3 "" H 4090 6060 50  0001 C CNN
F 4 "0603" H 4160 6140 50  0000 L CNN "display_footprint"
F 5 "1%" H 4160 6060 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 4160 5990 50  0000 L CNN "Wattage"
F 7 "P10.0KHCT-ND" H 0   470 50  0001 C CNN "Digi-Key PN"
	1    4090 6060
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5A4AE12A
P 4090 5910
F 0 "#PWR?" H 4090 5760 50  0001 C CNN
F 1 "+3.3V" H 4090 6050 50  0000 C CNN
F 2 "" H 4090 5910 50  0000 C CNN
F 3 "" H 4090 5910 50  0000 C CNN
	1    4090 5910
	1    0    0    -1  
$EndComp
Wire Wire Line
	9410 1440 9410 1520
Wire Wire Line
	3910 7160 3910 7200
Connection ~ 4230 7160
Wire Wire Line
	4550 7160 4550 7200
Wire Wire Line
	3910 7160 4230 7160
Wire Wire Line
	4230 7120 4230 7160
Wire Wire Line
	3910 7540 3910 7500
Connection ~ 4230 7540
Wire Wire Line
	4550 7540 4550 7500
Wire Wire Line
	3910 7540 4230 7540
Wire Wire Line
	4230 7500 4230 7540
Wire Wire Line
	3490 6350 3490 6850
Wire Wire Line
	2050 6750 2050 6850
Connection ~ 2050 6850
Wire Wire Line
	2050 6250 2050 6350
Connection ~ 2050 6350
Wire Wire Line
	4090 6210 4090 6350
Connection ~ 4090 6350
Connection ~ 3490 6350
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5B3D0D46
P 9970 1450
F 0 "#FLG?" H 9970 1525 50  0001 C CNN
F 1 "PWR_FLAG" H 9970 1600 50  0000 C CNN
F 2 "" H 9970 1450 50  0001 C CNN
F 3 "" H 9970 1450 50  0001 C CNN
	1    9970 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9410 1520 9410 1680
Wire Wire Line
	4230 7160 4550 7160
Wire Wire Line
	4230 7160 4230 7200
Wire Wire Line
	4230 7540 4550 7540
Wire Wire Line
	4230 7540 4230 7580
Wire Wire Line
	2050 6850 2050 6950
Wire Wire Line
	2050 6350 2050 6450
Wire Wire Line
	4090 6350 4190 6350
Wire Wire Line
	3490 6350 4090 6350
$Comp
L Custom_Library:TP TP?
U 1 1 5B52EF33
P 9030 1440
AR Path="/5A557C58/5B52EF33" Ref="TP?"  Part="1" 
AR Path="/5A0BC776/5B52EF33" Ref="TP?"  Part="1" 
F 0 "TP?" H 9030 1590 50  0000 C CNN
F 1 "TP" H 9030 1590 50  0001 C CNN
F 2 "Measurement_Points:Measurement_Point_Round-SMD-Pad_Small" H 9030 1440 60  0001 C CNN
F 3 "" H 9030 1440 60  0000 C CNN
	1    9030 1440
	1    0    0    -1  
$EndComp
Wire Wire Line
	9030 1440 9030 1520
Text Notes 2960 1060 0    100  ~ 20
Anode/Grid +60V, 50mA Power Supply
Wire Wire Line
	3400 6350 3490 6350
Wire Wire Line
	3400 6850 3490 6850
Wire Wire Line
	2050 6350 2300 6350
Wire Wire Line
	2050 6850 2300 6850
Connection ~ 9410 1520
Connection ~ 9030 1520
Wire Wire Line
	9030 1520 9410 1520
Wire Wire Line
	3660 3360 3820 3360
Wire Wire Line
	3120 3160 3820 3160
Wire Wire Line
	2740 1520 3460 1520
Wire Wire Line
	2740 1600 2740 1520
$Comp
L power:GND #PWR?
U 1 1 5B5E6C6E
P 2740 1900
F 0 "#PWR?" H 2740 1650 50  0001 C CNN
F 1 "GND" H 2740 1750 50  0000 C CNN
F 2 "" H 2740 1900 50  0001 C CNN
F 3 "" H 2740 1900 50  0001 C CNN
	1    2740 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 1520 4150 1600
$Comp
L power:GND #PWR?
U 1 1 5B5DD1B7
P 4150 1900
F 0 "#PWR?" H 4150 1650 50  0001 C CNN
F 1 "GND" H 4150 1750 50  0000 C CNN
F 2 "" H 4150 1900 50  0001 C CNN
F 3 "" H 4150 1900 50  0001 C CNN
	1    4150 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3460 1520 3460 1600
Wire Wire Line
	9970 3810 9970 3980
Wire Wire Line
	6100 1520 6440 1520
Wire Wire Line
	6100 3210 6100 3250
Connection ~ 3460 1520
Wire Wire Line
	3460 1520 4150 1520
Wire Wire Line
	7620 1520 7620 1680
Wire Wire Line
	3580 2760 3580 2720
Wire Wire Line
	3580 2360 3820 2360
Wire Wire Line
	3420 2360 3580 2360
Connection ~ 3580 2360
Wire Wire Line
	3580 2420 3580 2360
Wire Wire Line
	3780 2760 3820 2760
Wire Wire Line
	3780 2760 3780 2800
Connection ~ 9970 3810
Wire Wire Line
	9970 2930 9970 3810
Wire Wire Line
	3660 3440 3660 3360
Wire Wire Line
	3120 3440 3120 3160
Connection ~ 6100 1520
Wire Wire Line
	5480 1520 6100 1520
Wire Wire Line
	4620 1520 5180 1520
Wire Wire Line
	6100 3210 5420 3210
Connection ~ 6100 3210
Wire Wire Line
	6100 2560 6100 3210
Wire Wire Line
	5800 2360 5760 2360
Wire Wire Line
	5420 2360 5460 2360
Wire Wire Line
	4370 4150 4370 4110
Wire Wire Line
	4370 4490 4370 4450
Wire Wire Line
	4870 4350 4870 4110
Text Notes 5880 4890 0    60   ~ 0
Designed for 50mA max output
Text Notes 2200 3230 0    60   ~ 0
fsw = 650 kHz
$Comp
L power:GND #PWR?
U 1 1 5A2AD90B
P 3460 1900
F 0 "#PWR?" H 3460 1650 50  0001 C CNN
F 1 "GND" H 3460 1750 50  0000 C CNN
F 2 "" H 3460 1900 50  0001 C CNN
F 3 "" H 3460 1900 50  0001 C CNN
	1    3460 1900
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5A178B40
P 5610 2360
F 0 "R?" V 5510 2360 50  0000 C CNN
F 1 "2" V 5610 2360 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 5610 2360 50  0001 C CNN
F 3 "" H 5610 2360 50  0001 C CNN
F 4 "0603" V 5710 2360 50  0000 C CNN "display_footprint"
F 5 "1%" V 5810 2360 50  0000 C CNN "Tolerance"
F 6 "1/16W" V 5910 2360 50  0000 C CNN "Wattage"
F 7 "541-2.00SCT-ND" H -1030 -60 50  0001 C CNN "Digi-Key PN"
	1    5610 2360
	0    1    1    0   
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5A174FAD
P 7620 1830
F 0 "C?" H 7645 1930 50  0000 L CNN
F 1 "1uF" H 7645 1730 50  0000 L CNN
F 2 "Capacitors_SMD:C_1210" H 7658 1680 50  0001 C CNN
F 3 "" H 7645 1930 50  0001 C CNN
F 4 "1210" H 7470 1930 50  0000 R CNN "display_footprint"
F 5 "100V" H 7470 1830 50  0000 R CNN "Voltage"
F 6 "X7R" H 7470 1730 50  0000 R CNN "Dielectric"
F 7 "490-1857-1-ND" H -1030 -400 50  0001 C CNN "Digi-Key PN"
	1    7620 1830
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5A174CC6
P 4870 4500
F 0 "C?" H 4895 4600 50  0000 L CNN
F 1 "4.7uF" H 4895 4400 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 4908 4350 50  0001 C CNN
F 3 "" H 4895 4600 50  0001 C CNN
F 4 "0805" H 4720 4600 50  0000 R CNN "display_footprint"
F 5 "16V" H 4720 4500 50  0000 R CNN "Voltage"
F 6 "X7R" H 4720 4400 50  0000 R CNN "Dielectric"
F 7 "1276-2970-1-ND" H -1030 -60 50  0001 C CNN "Digi-Key PN"
	1    4870 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5A0BD1B1
P 7620 1980
F 0 "#PWR?" H 7620 1730 50  0001 C CNN
F 1 "GND" H 7620 1830 50  0000 C CNN
F 2 "" H 7620 1980 50  0001 C CNN
F 3 "" H 7620 1980 50  0001 C CNN
	1    7620 1980
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5A0BD15A
P 3580 2760
F 0 "#PWR?" H 3580 2510 50  0001 C CNN
F 1 "GND" H 3580 2610 50  0000 C CNN
F 2 "" H 3580 2760 50  0001 C CNN
F 3 "" H 3580 2760 50  0001 C CNN
	1    3580 2760
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5A0BD154
P 9970 4280
F 0 "#PWR?" H 9970 4030 50  0001 C CNN
F 1 "GND" H 9970 4130 50  0000 C CNN
F 2 "" H 9970 4280 50  0001 C CNN
F 3 "" H 9970 4280 50  0001 C CNN
	1    9970 4280
	1    0    0    -1  
$EndComp
Text GLabel 3420 2360 0    50   Input ~ 0
POS60_VAN_RUN
$Comp
L power:GND #PWR?
U 1 1 5A0BD134
P 3780 2800
F 0 "#PWR?" H 3780 2550 50  0001 C CNN
F 1 "GND" H 3780 2650 50  0000 C CNN
F 2 "" H 3780 2800 50  0001 C CNN
F 3 "" H 3780 2800 50  0001 C CNN
	1    3780 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5A0BD107
P 3120 3740
F 0 "#PWR?" H 3120 3490 50  0001 C CNN
F 1 "GND" H 3120 3590 50  0000 C CNN
F 2 "" H 3120 3740 50  0001 C CNN
F 3 "" H 3120 3740 50  0001 C CNN
	1    3120 3740
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5A0BD101
P 3660 3740
F 0 "#PWR?" H 3660 3490 50  0001 C CNN
F 1 "GND" H 3660 3590 50  0000 C CNN
F 2 "" H 3660 3740 50  0001 C CNN
F 3 "" H 3660 3740 50  0001 C CNN
	1    3660 3740
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5A0BD0DA
P 6100 3550
F 0 "#PWR?" H 6100 3300 50  0001 C CNN
F 1 "GND" H 6100 3400 50  0000 C CNN
F 2 "" H 6100 3550 50  0001 C CNN
F 3 "" H 6100 3550 50  0001 C CNN
	1    6100 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q?
U 1 1 5A0BD0BA
P 6000 2360
F 0 "Q?" H 6200 2410 50  0000 L CNN
F 1 "IRFL214TRPBF" H 6200 2310 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-223-3_TabPin2" H 6200 2460 50  0001 C CNN
F 3 "" H 6000 2360 50  0001 C CNN
F 4 "IRFL214PBFCT-ND" H -1030 -60 50  0001 C CNN "Digi-Key PN"
	1    6000 2360
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5A0BD0B2
P 4370 4790
F 0 "#PWR?" H 4370 4540 50  0001 C CNN
F 1 "GND" H 4370 4640 50  0000 C CNN
F 2 "" H 4370 4790 50  0001 C CNN
F 3 "" H 4370 4790 50  0001 C CNN
	1    4370 4790
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5A0BD097
P 4870 4650
F 0 "#PWR?" H 4870 4400 50  0001 C CNN
F 1 "GND" H 4870 4500 50  0000 C CNN
F 2 "" H 4870 4650 50  0001 C CNN
F 3 "" H 4870 4650 50  0001 C CNN
	1    4870 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5A0BD087
P 4620 4110
F 0 "#PWR?" H 4620 3860 50  0001 C CNN
F 1 "GND" H 4620 3960 50  0000 C CNN
F 2 "" H 4620 4110 50  0001 C CNN
F 3 "" H 4620 4110 50  0001 C CNN
	1    4620 4110
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:LT3757 U?
U 1 1 5A0BD080
P 4620 2910
F 0 "U?" H 5120 1860 50  0000 C CNN
F 1 "LT3757" H 4620 2910 50  0000 C CNN
F 2 "Housings_DFN_QFN:DFN-10-1EP_3x3mm_Pitch0.5mm" H 4620 3610 60  0001 C CNN
F 3 "" H 4620 3610 60  0001 C CNN
F 4 "LT3757EDD#PBF-ND" H -1030 -60 50  0001 C CNN "Digi-Key PN"
	1    4620 2910
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:L_Custom L?
U 1 1 5CB70EBB
P 5330 1520
F 0 "L?" V 5280 1520 50  0000 C CNN
F 1 "100uH" V 5405 1520 50  0000 C CNN
F 2 "" H 5330 1520 50  0001 C CNN
F 3 "" H 5330 1520 50  0001 C CNN
F 4 "IHLP-4040" V 5480 1520 50  0000 C CNN "display_footprint"
F 5 "2.25A" V 5580 1520 50  0000 C CNN "Ampacity"
F 6 "20%" V 5680 1520 50  0000 C CNN "Tolerance"
F 7 "541-1310-1-ND" H 5330 1520 50  0001 C CNN "Digi-Key PN"
	1    5330 1520
	0    -1   -1   0   
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5CB762F8
P 4150 1750
F 0 "C?" H 4175 1850 50  0000 L CNN
F 1 "0.1uF" H 4175 1650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4188 1600 50  0001 C CNN
F 3 "" H 4175 1850 50  0001 C CNN
F 4 "0603" H 4000 1850 50  0000 R CNN "display_footprint"
F 5 "50V" H 4000 1750 50  0000 R CNN "Voltage"
F 6 "X7R" H 4000 1650 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H 240 -5130 50  0001 C CNN "Digi-Key PN"
	1    4150 1750
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5CB7907B
P 3120 3590
F 0 "R?" H 3190 3720 50  0000 L CNN
F 1 "17.4k" V 3120 3590 40  0000 C CNN
F 2 "" H 3120 3590 50  0001 C CNN
F 3 "" H 3120 3590 50  0001 C CNN
F 4 "0603" H 3190 3640 50  0000 L CNN "display_footprint"
F 5 "1%" H 3190 3550 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 3190 3460 50  0000 L CNN "Wattage"
F 7 "PN" H 3420 3990 60  0001 C CNN "Digi-Key PN"
	1    3120 3590
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5CB8700E
P 9970 2780
F 0 "R?" H 10040 2910 50  0000 L CNN
F 1 "36.5k" V 9970 2780 40  0000 C CNN
F 2 "" H 9970 2780 50  0001 C CNN
F 3 "" H 9970 2780 50  0001 C CNN
F 4 "0603" H 10040 2830 50  0000 L CNN "display_footprint"
F 5 "1%" H 10040 2740 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 10040 2650 50  0000 L CNN "Wattage"
F 7 "PN" H 10270 3180 60  0001 C CNN "Digi-Key PN"
	1    9970 2780
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5CB87A40
P 9970 4130
F 0 "R?" H 10040 4260 50  0000 L CNN
F 1 "1k" V 9970 4130 50  0000 C CNN
F 2 "" H 9970 4130 50  0001 C CNN
F 3 "" H 9970 4130 50  0001 C CNN
F 4 "0603" H 10040 4180 50  0000 L CNN "display_footprint"
F 5 "1%" H 10040 4090 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 10040 4000 50  0000 L CNN "Wattage"
F 7 "PN" H 10270 4530 60  0001 C CNN "Digi-Key PN"
	1    9970 4130
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5CB8AD60
P 4370 4300
F 0 "R?" H 4440 4430 50  0000 L CNN
F 1 "22k" V 4370 4300 40  0000 C CNN
F 2 "" H 4370 4300 50  0001 C CNN
F 3 "" H 4370 4300 50  0001 C CNN
F 4 "0603" H 4440 4350 50  0000 L CNN "display_footprint"
F 5 "1%" H 4440 4260 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 4440 4170 50  0000 L CNN "Wattage"
F 7 "PN" H 4670 4700 60  0001 C CNN "Digi-Key PN"
	1    4370 4300
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5CB8EF0B
P 3460 1750
F 0 "C?" H 3485 1850 50  0000 L CNN
F 1 "10uF" H 3485 1650 50  0000 L CNN
F 2 "" H 3498 1600 50  0001 C CNN
F 3 "" H 3485 1850 50  0001 C CNN
F 4 "1206" H 3310 1850 50  0000 R CNN "display_footprint"
F 5 "25V" H 3310 1750 50  0000 R CNN "Voltage"
F 6 "X7R" H 3310 1650 50  0000 R CNN "Dielectric"
F 7 "1276-1804-6-ND" H -450 -5130 50  0001 C CNN "Digi-Key PN"
	1    3460 1750
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5CB90AED
P 2740 1750
F 0 "C?" H 2765 1850 50  0000 L CNN
F 1 "10uF" H 2765 1650 50  0000 L CNN
F 2 "" H 2778 1600 50  0001 C CNN
F 3 "" H 2765 1850 50  0001 C CNN
F 4 "1206" H 2590 1850 50  0000 R CNN "display_footprint"
F 5 "25V" H 2590 1750 50  0000 R CNN "Voltage"
F 6 "X7R" H 2590 1650 50  0000 R CNN "Dielectric"
F 7 "1276-1804-6-ND" H -1170 -5130 50  0001 C CNN "Digi-Key PN"
	1    2740 1750
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5CB88EC1
P 6100 3400
F 0 "R?" H 6170 3530 50  0000 L CNN
F 1 "0.16" V 6100 3400 40  0000 C CNN
F 2 "" H 6100 3400 50  0001 C CNN
F 3 "" H 6100 3400 50  0001 C CNN
F 4 "0805" H 6170 3450 50  0000 L CNN "display_footprint"
F 5 "1%" H 6170 3360 50  0000 L CNN "Tolerance"
F 6 "1/4W" H 6170 3270 50  0000 L CNN "Wattage"
F 7 "PN" H 6400 3800 60  0001 C CNN "Digi-Key PN"
	1    6100 3400
	1    0    0    -1  
$EndComp
$Comp
L Diode:MBR0570 D?
U 1 1 5CB9AEAB
P 6590 1520
F 0 "D?" H 6590 1620 50  0000 C CNN
F 1 "MBR0570" H 6590 1420 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 6590 1345 50  0001 C CNN
F 3 "http://www.mccsemi.com/up_pdf/MBR0520~MBR0580(SOD123).pdf" H 6590 1520 50  0001 C CNN
	1    6590 1520
	-1   0    0    1   
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5CBA7DE4
P 4370 4640
AR Path="/5A557C58/5CBA7DE4" Ref="C?"  Part="1" 
AR Path="/5A0BC776/5CBA7DE4" Ref="C?"  Part="1" 
F 0 "C?" H 4395 4740 50  0000 L CNN
F 1 "6.8nF" H 4395 4540 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4408 4490 50  0001 C CNN
F 3 "" H 4395 4740 50  0001 C CNN
F 4 "0603" H 4220 4740 50  0000 R CNN "display_footprint"
F 5 "50V" H 4220 4640 50  0000 R CNN "Voltage"
F 6 "X7R" H 4220 4540 50  0000 R CNN "Dielectric"
	1    4370 4640
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5CBAA2CC
P 3660 3590
F 0 "C?" H 3685 3690 50  0000 L CNN
F 1 "0.1uF" H 3685 3490 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3698 3440 50  0001 C CNN
F 3 "" H 3685 3690 50  0001 C CNN
F 4 "0603" H 3510 3690 50  0000 R CNN "display_footprint"
F 5 "50V" H 3510 3590 50  0000 R CNN "Voltage"
F 6 "X7R" H 3510 3490 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H -250 -3290 50  0001 C CNN "Digi-Key PN"
	1    3660 3590
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5CBB26F5
P 7960 1830
F 0 "R?" H 8030 1960 50  0000 L CNN
F 1 "10k" V 7960 1830 50  0000 C CNN
F 2 "" H 7960 1830 50  0001 C CNN
F 3 "" H 7960 1830 50  0001 C CNN
F 4 "2512" H 8030 1880 50  0000 L CNN "display_footprint"
F 5 "1%" H 8030 1790 50  0000 L CNN "Tolerance"
F 6 "1W" H 8030 1700 50  0000 L CNN "Wattage"
F 7 "PN" H 8260 2230 60  0001 C CNN "Digi-Key PN"
	1    7960 1830
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5CBB3C91
P 7960 1980
F 0 "#PWR?" H 7960 1730 50  0001 C CNN
F 1 "GND" H 7960 1830 50  0000 C CNN
F 2 "" H 7960 1980 50  0001 C CNN
F 3 "" H 7960 1980 50  0001 C CNN
	1    7960 1980
	1    0    0    -1  
$EndComp
Wire Wire Line
	7960 1680 7960 1520
Wire Wire Line
	7960 1520 7620 1520
Connection ~ 7620 1520
Connection ~ 7960 1520
$Comp
L Custom_Library:R_Custom R?
U 1 1 5A176428
P 3580 2570
F 0 "R?" V 3480 2570 50  0000 C CNN
F 1 "10k" V 3580 2570 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 3580 2570 50  0001 C CNN
F 3 "" H 3580 2570 50  0001 C CNN
F 4 "0603" H 3650 2470 50  0000 L CNN "display_footprint"
F 5 "1%" H 3650 2550 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 3640 2620 50  0000 L CNN "Wattage"
F 7 "P10.0KHCT-ND" H -1030 -60 50  0001 C CNN "Digi-Key PN"
	1    3580 2570
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6740 1520 7620 1520
Wire Wire Line
	9970 1520 9410 1520
Wire Wire Line
	5420 3810 9970 3810
$Comp
L Custom_Library:+60VAN #PWR?
U 1 1 5E11CF57
P 9410 1440
F 0 "#PWR?" H 9410 1290 50  0001 C CNN
F 1 "+60VAN" H 9410 1580 50  0000 C CNN
F 2 "" H 9410 1440 50  0000 C CNN
F 3 "" H 9410 1440 50  0000 C CNN
	1    9410 1440
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+60VAN #PWR?
U 1 1 5E121BE1
P 2050 5950
F 0 "#PWR?" H 2050 5800 50  0001 C CNN
F 1 "+60VAN" H 2050 6090 50  0000 C CNN
F 2 "" H 2050 5950 50  0000 C CNN
F 3 "" H 2050 5950 50  0000 C CNN
	1    2050 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 1520 6100 2160
Wire Wire Line
	4620 1520 4620 2060
Wire Wire Line
	9970 1520 9970 2630
Wire Wire Line
	4620 1520 4150 1520
Connection ~ 4620 1520
Connection ~ 4150 1520
$Comp
L Custom_Library:R_Custom R?
U 1 1 5CB5F9AD
P 8650 1520
AR Path="/5CB364CC/5CB5F9AD" Ref="R?"  Part="1" 
AR Path="/5A0A7E5F/5CB5F9AD" Ref="R?"  Part="1" 
AR Path="/5A0BC776/5CB5F9AD" Ref="R?"  Part="1" 
F 0 "R?" V 8550 1520 50  0000 C CNN
F 1 "3.3" V 8650 1520 40  0000 C CNN
F 2 "Resistors_SMD:R_0612" H 8650 1520 50  0001 C CNN
F 3 "" H 8650 1520 50  0001 C CNN
F 4 "1206" V 8750 1520 50  0000 C CNN "display_footprint"
F 5 "1%" V 8850 1520 50  0000 C CNN "Tolerance"
F 6 "1/4W" V 8950 1520 50  0000 C CNN "Wattage"
F 7 "P3.3RCT-ND" H 8650 1520 50  0001 C CNN "Digi-Key PN"
	1    8650 1520
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5E157C2B
P 1810 1440
AR Path="/5CB7718D/5E157C2B" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC082/5E157C2B" Ref="#PWR?"  Part="1" 
AR Path="/5E0F263A/5E157C2B" Ref="#PWR?"  Part="1" 
AR Path="/5A0BC776/5E157C2B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1810 1290 50  0001 C CNN
F 1 "+12V" H 1810 1580 50  0000 C CNN
F 2 "" H 1810 1440 50  0001 C CNN
F 3 "" H 1810 1440 50  0001 C CNN
	1    1810 1440
	1    0    0    -1  
$EndComp
Wire Wire Line
	1810 1440 1810 1520
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E157C36
P 2040 1520
AR Path="/5CB6F1ED/5E157C36" Ref="R?"  Part="1" 
AR Path="/5CB7718D/5E157C36" Ref="R?"  Part="1" 
AR Path="/5E0DC082/5E157C36" Ref="R?"  Part="1" 
AR Path="/5E0F263A/5E157C36" Ref="R?"  Part="1" 
AR Path="/5A0BC776/5E157C36" Ref="R?"  Part="1" 
F 0 "R?" V 1940 1520 50  0000 C CNN
F 1 "0.02" V 2040 1520 40  0000 C CNN
F 2 "Resistors_SMD:R_0612" H 2040 1520 50  0001 C CNN
F 3 "" H 2040 1520 50  0001 C CNN
F 4 "P16010CT-ND" H 2340 1920 60  0001 C CNN "Digi-Key PN"
F 5 "0612" V 2140 1520 50  0000 C CNN "display_footprint"
F 6 "1%" V 2240 1520 50  0000 C CNN "Tolerance"
F 7 "1W" V 2340 1520 50  0000 C CNN "Wattage"
	1    2040 1520
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2190 1520 2270 1520
Wire Wire Line
	2270 1680 2270 1520
Connection ~ 2270 1520
Wire Wire Line
	2270 1520 2740 1520
Wire Wire Line
	1810 1680 1810 1520
Wire Wire Line
	1810 1520 1890 1520
Connection ~ 1810 1520
Connection ~ 2740 1520
Wire Wire Line
	7960 1520 8410 1520
Wire Wire Line
	8800 1520 8870 1520
Text GLabel 8410 1980 3    50   UnSpc ~ 0
POS60_VAN_SNS_OUT+
Text GLabel 8870 1980 3    50   UnSpc ~ 0
POS60_VAN_SNS_OUT-
Wire Wire Line
	8870 1680 8870 1520
Wire Wire Line
	8410 1680 8410 1520
Connection ~ 8410 1520
Wire Wire Line
	8410 1520 8500 1520
Connection ~ 8870 1520
Wire Wire Line
	8870 1520 9030 1520
$Comp
L Custom_Library:TLV6700 U?
U 1 1 5E1F15CF
P 2850 6600
F 0 "U?" H 3150 6100 50  0000 C CNN
F 1 "TLV6700" H 2850 6600 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:TSOT-23-6" H 2850 7200 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlv6700.pdf" H 2850 6600 60  0001 C CNN
F 4 "296-51696-1-ND" H 2850 6600 50  0001 C CNN "Digi-Key PN"
	1    2850 6600
	1    0    0    -1  
$EndComp
Text GLabel 2270 1980 3    50   UnSpc ~ 0
POS60_VAN_SNS_IN-
Text GLabel 1810 1980 3    50   UnSpc ~ 0
POS60_VAN_SNS_IN+
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2D21F2
P 1810 1830
AR Path="/5CB0BC26/5E2D21F2" Ref="R?"  Part="1" 
AR Path="/5E1352F5/5E2D21F2" Ref="R?"  Part="1" 
AR Path="/5CB6F1ED/5E2D21F2" Ref="R?"  Part="1" 
AR Path="/5E0F9110/5E2D21F2" Ref="R?"  Part="1" 
AR Path="/5A0BC776/5E2D21F2" Ref="R?"  Part="1" 
F 0 "R?" V 1710 1830 50  0000 C CNN
F 1 "100" V 1810 1830 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 1810 1830 50  0001 C CNN
F 3 "" H 1810 1830 50  0001 C CNN
F 4 "0603" V 1910 1830 50  0001 C CNN "display_footprint"
F 5 "1%" V 2010 1830 50  0001 C CNN "Tolerance"
F 6 "1/10W" V 2110 1830 50  0001 C CNN "Wattage"
F 7 "A106047CT-ND" H 2110 2230 60  0001 C CNN "Digi-Key PN"
	1    1810 1830
	-1   0    0    1   
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2D21FC
P 2270 1830
AR Path="/5CB0BC26/5E2D21FC" Ref="R?"  Part="1" 
AR Path="/5E1352F5/5E2D21FC" Ref="R?"  Part="1" 
AR Path="/5CB6F1ED/5E2D21FC" Ref="R?"  Part="1" 
AR Path="/5E0F9110/5E2D21FC" Ref="R?"  Part="1" 
AR Path="/5A0BC776/5E2D21FC" Ref="R?"  Part="1" 
F 0 "R?" V 2170 1830 50  0000 C CNN
F 1 "100" V 2270 1830 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 2270 1830 50  0001 C CNN
F 3 "" H 2270 1830 50  0001 C CNN
F 4 "0603" V 2370 1830 50  0001 C CNN "display_footprint"
F 5 "1%" V 2470 1830 50  0001 C CNN "Tolerance"
F 6 "1/10W" V 2570 1830 50  0001 C CNN "Wattage"
F 7 "A106047CT-ND" H 2570 2230 60  0001 C CNN "Digi-Key PN"
	1    2270 1830
	-1   0    0    1   
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2D7420
P 8410 1830
AR Path="/5CB0BC26/5E2D7420" Ref="R?"  Part="1" 
AR Path="/5E1352F5/5E2D7420" Ref="R?"  Part="1" 
AR Path="/5CB6F1ED/5E2D7420" Ref="R?"  Part="1" 
AR Path="/5E0F9110/5E2D7420" Ref="R?"  Part="1" 
AR Path="/5A0BC776/5E2D7420" Ref="R?"  Part="1" 
F 0 "R?" V 8310 1830 50  0000 C CNN
F 1 "100" V 8410 1830 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 8410 1830 50  0001 C CNN
F 3 "" H 8410 1830 50  0001 C CNN
F 4 "0603" V 8510 1830 50  0001 C CNN "display_footprint"
F 5 "1%" V 8610 1830 50  0001 C CNN "Tolerance"
F 6 "1/10W" V 8710 1830 50  0001 C CNN "Wattage"
F 7 "A106047CT-ND" H 8710 2230 60  0001 C CNN "Digi-Key PN"
	1    8410 1830
	-1   0    0    1   
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2D742A
P 8870 1830
AR Path="/5CB0BC26/5E2D742A" Ref="R?"  Part="1" 
AR Path="/5E1352F5/5E2D742A" Ref="R?"  Part="1" 
AR Path="/5CB6F1ED/5E2D742A" Ref="R?"  Part="1" 
AR Path="/5E0F9110/5E2D742A" Ref="R?"  Part="1" 
AR Path="/5A0BC776/5E2D742A" Ref="R?"  Part="1" 
F 0 "R?" V 8770 1830 50  0000 C CNN
F 1 "100" V 8870 1830 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 8870 1830 50  0001 C CNN
F 3 "" H 8870 1830 50  0001 C CNN
F 4 "0603" V 8970 1830 50  0001 C CNN "display_footprint"
F 5 "1%" V 9070 1830 50  0001 C CNN "Tolerance"
F 6 "1/10W" V 9170 1830 50  0001 C CNN "Wattage"
F 7 "A106047CT-ND" H 9170 2230 60  0001 C CNN "Digi-Key PN"
	1    8870 1830
	-1   0    0    1   
$EndComp
Wire Wire Line
	9970 1450 9970 1520
Connection ~ 9970 1520
$EndSCHEMATC

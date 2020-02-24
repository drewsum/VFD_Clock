EESchema Schematic File Version 4
LIBS:IV-6_Display_Board-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 3 14
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
L Transistor_BJT:BC856W Q303
U 1 1 5A2FAE73
P 2380 1920
F 0 "Q303" H 2580 1995 50  0000 L CNN
F 1 "BC856W" H 2580 1920 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-323_SC-70" H 2580 1845 50  0001 L CIN
F 3 "" H 2380 1920 50  0001 L CNN
F 4 "1727-4865-1-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    2380 1920
	1    0    0    1   
$EndComp
Wire Wire Line
	2100 1840 2100 1920
Wire Wire Line
	2100 1920 2180 1920
Connection ~ 2100 1920
Wire Wire Line
	2480 1540 2480 1720
$Comp
L Transistor_BJT:BC847W Q301
U 1 1 5A2FAE9E
P 2000 2500
F 0 "Q301" H 2170 2620 50  0000 L CNN
F 1 "PMSTA06" H 1640 2610 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-323_SC-70" H 2200 2425 50  0001 L CIN
F 3 "" H 2000 2500 50  0001 L CNN
F 4 "1727-6293-1-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    2000 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2480 2400 2480 2260
$Comp
L power:GND #PWR0302
U 1 1 5A2FAEA6
P 2100 2700
F 0 "#PWR0302" H 2100 2450 50  0001 C CNN
F 1 "GND" H 2100 2550 50  0000 C CNN
F 2 "" H 2100 2700 50  0001 C CNN
F 3 "" H 2100 2700 50  0001 C CNN
	1    2100 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0306
U 1 1 5A2FAEAC
P 2480 2700
F 0 "#PWR0306" H 2480 2450 50  0001 C CNN
F 1 "GND" H 2480 2550 50  0000 C CNN
F 2 "" H 2480 2700 50  0001 C CNN
F 3 "" H 2480 2700 50  0001 C CNN
	1    2480 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2500 1590 2500
Text GLabel 1290 2500 0    50   Input ~ 0
Grid_0_DSP
Text GLabel 3620 2500 0    50   Input ~ 0
Grid_1_DSP
Text GLabel 6030 2500 0    50   Input ~ 0
Grid_2_DSP
Text GLabel 1290 4830 0    50   Input ~ 0
Grid_3_DSP
Text GLabel 3620 4830 0    50   Input ~ 0
Grid_4_DSP
Text GLabel 6030 4830 0    50   Input ~ 0
Grid_5_DSP
Wire Wire Line
	2540 2260 2480 2260
Connection ~ 2480 2260
$Comp
L Transistor_BJT:BC856W Q307
U 1 1 5A2FAEC8
P 4710 1920
F 0 "Q307" H 4910 1995 50  0000 L CNN
F 1 "BC856W" H 4910 1920 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-323_SC-70" H 4910 1845 50  0001 L CIN
F 3 "" H 4710 1920 50  0001 L CNN
F 4 "1727-4865-1-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    4710 1920
	1    0    0    1   
$EndComp
Wire Wire Line
	4430 1840 4430 1920
Wire Wire Line
	4430 1920 4510 1920
Connection ~ 4430 1920
Wire Wire Line
	4810 1540 4810 1720
$Comp
L Transistor_BJT:BC847W Q305
U 1 1 5A2FAEDF
P 4330 2500
F 0 "Q305" H 4510 2620 50  0000 L CNN
F 1 "PMSTA06" H 3970 2610 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-323_SC-70" H 4530 2425 50  0001 L CIN
F 3 "" H 4330 2500 50  0001 L CNN
F 4 "1727-6293-1-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    4330 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4810 2400 4810 2260
$Comp
L power:GND #PWR0310
U 1 1 5A2FAEE7
P 4430 2700
F 0 "#PWR0310" H 4430 2450 50  0001 C CNN
F 1 "GND" H 4430 2550 50  0000 C CNN
F 2 "" H 4430 2700 50  0001 C CNN
F 3 "" H 4430 2700 50  0001 C CNN
	1    4430 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0314
U 1 1 5A2FAEED
P 4810 2700
F 0 "#PWR0314" H 4810 2450 50  0001 C CNN
F 1 "GND" H 4810 2550 50  0000 C CNN
F 2 "" H 4810 2700 50  0001 C CNN
F 3 "" H 4810 2700 50  0001 C CNN
	1    4810 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4130 2500 3920 2500
Wire Wire Line
	4870 2260 4810 2260
Connection ~ 4810 2260
$Comp
L Transistor_BJT:BC856W Q311
U 1 1 5A2FAF01
P 7120 1920
F 0 "Q311" H 7320 1995 50  0000 L CNN
F 1 "BC856W" H 7320 1920 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-323_SC-70" H 7320 1845 50  0001 L CIN
F 3 "" H 7120 1920 50  0001 L CNN
F 4 "1727-4865-1-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    7120 1920
	1    0    0    1   
$EndComp
Wire Wire Line
	6840 1840 6840 1920
Wire Wire Line
	6840 1920 6920 1920
Connection ~ 6840 1920
Wire Wire Line
	7220 1540 7220 1720
$Comp
L Transistor_BJT:BC847W Q309
U 1 1 5A2FAF18
P 6740 2500
F 0 "Q309" H 6920 2610 50  0000 L CNN
F 1 "PMSTA06" H 6380 2610 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-323_SC-70" H 6940 2425 50  0001 L CIN
F 3 "" H 6740 2500 50  0001 L CNN
F 4 "1727-6293-1-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    6740 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7220 2400 7220 2260
$Comp
L power:GND #PWR0318
U 1 1 5A2FAF20
P 6840 2700
F 0 "#PWR0318" H 6840 2450 50  0001 C CNN
F 1 "GND" H 6840 2550 50  0000 C CNN
F 2 "" H 6840 2700 50  0001 C CNN
F 3 "" H 6840 2700 50  0001 C CNN
	1    6840 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0322
U 1 1 5A2FAF26
P 7220 2700
F 0 "#PWR0322" H 7220 2450 50  0001 C CNN
F 1 "GND" H 7220 2550 50  0000 C CNN
F 2 "" H 7220 2700 50  0001 C CNN
F 3 "" H 7220 2700 50  0001 C CNN
	1    7220 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6540 2500 6330 2500
Wire Wire Line
	7280 2260 7220 2260
Connection ~ 7220 2260
$Comp
L Transistor_BJT:BC856W Q304
U 1 1 5A2FAF73
P 2380 4250
F 0 "Q304" H 2580 4325 50  0000 L CNN
F 1 "BC856W" H 2580 4250 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-323_SC-70" H 2580 4175 50  0001 L CIN
F 3 "" H 2380 4250 50  0001 L CNN
F 4 "1727-4865-1-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    2380 4250
	1    0    0    1   
$EndComp
Wire Wire Line
	2100 4170 2100 4250
Wire Wire Line
	2100 4250 2180 4250
Connection ~ 2100 4250
Wire Wire Line
	2480 3870 2480 4050
$Comp
L Transistor_BJT:BC847W Q302
U 1 1 5A2FAF8A
P 2000 4830
F 0 "Q302" H 2180 4950 50  0000 L CNN
F 1 "PMSTA06" H 1640 4940 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-323_SC-70" H 2200 4755 50  0001 L CIN
F 3 "" H 2000 4830 50  0001 L CNN
F 4 "1727-6293-1-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    2000 4830
	1    0    0    -1  
$EndComp
Wire Wire Line
	2480 4730 2480 4590
$Comp
L power:GND #PWR0304
U 1 1 5A2FAF92
P 2100 5030
F 0 "#PWR0304" H 2100 4780 50  0001 C CNN
F 1 "GND" H 2100 4880 50  0000 C CNN
F 2 "" H 2100 5030 50  0001 C CNN
F 3 "" H 2100 5030 50  0001 C CNN
	1    2100 5030
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0308
U 1 1 5A2FAF98
P 2480 5030
F 0 "#PWR0308" H 2480 4780 50  0001 C CNN
F 1 "GND" H 2480 4880 50  0000 C CNN
F 2 "" H 2480 5030 50  0001 C CNN
F 3 "" H 2480 5030 50  0001 C CNN
	1    2480 5030
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 4830 1590 4830
Wire Wire Line
	2540 4590 2480 4590
Connection ~ 2480 4590
$Comp
L Transistor_BJT:BC856W Q308
U 1 1 5A2FAFAC
P 4710 4250
F 0 "Q308" H 4910 4325 50  0000 L CNN
F 1 "BC856W" H 4910 4250 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-323_SC-70" H 4910 4175 50  0001 L CIN
F 3 "" H 4710 4250 50  0001 L CNN
F 4 "1727-4865-1-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    4710 4250
	1    0    0    1   
$EndComp
Wire Wire Line
	4430 4170 4430 4250
Wire Wire Line
	4430 4250 4510 4250
Connection ~ 4430 4250
Wire Wire Line
	4810 3870 4810 4050
$Comp
L Transistor_BJT:BC847W Q306
U 1 1 5A2FAFC3
P 4330 4830
F 0 "Q306" H 4510 4940 50  0000 L CNN
F 1 "PMSTA06" H 3970 4940 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-323_SC-70" H 4530 4755 50  0001 L CIN
F 3 "" H 4330 4830 50  0001 L CNN
F 4 "1727-6293-1-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    4330 4830
	1    0    0    -1  
$EndComp
Wire Wire Line
	4810 4730 4810 4590
$Comp
L power:GND #PWR0312
U 1 1 5A2FAFCB
P 4430 5030
F 0 "#PWR0312" H 4430 4780 50  0001 C CNN
F 1 "GND" H 4430 4880 50  0000 C CNN
F 2 "" H 4430 5030 50  0001 C CNN
F 3 "" H 4430 5030 50  0001 C CNN
	1    4430 5030
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0316
U 1 1 5A2FAFD1
P 4810 5030
F 0 "#PWR0316" H 4810 4780 50  0001 C CNN
F 1 "GND" H 4810 4880 50  0000 C CNN
F 2 "" H 4810 5030 50  0001 C CNN
F 3 "" H 4810 5030 50  0001 C CNN
	1    4810 5030
	1    0    0    -1  
$EndComp
Wire Wire Line
	4130 4830 3920 4830
Wire Wire Line
	4870 4590 4810 4590
Connection ~ 4810 4590
$Comp
L Transistor_BJT:BC856W Q312
U 1 1 5A2FAFE5
P 7120 4250
F 0 "Q312" H 7320 4325 50  0000 L CNN
F 1 "BC856W" H 7320 4250 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-323_SC-70" H 7320 4175 50  0001 L CIN
F 3 "" H 7120 4250 50  0001 L CNN
F 4 "1727-4865-1-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    7120 4250
	1    0    0    1   
$EndComp
Wire Wire Line
	6840 4170 6840 4250
Wire Wire Line
	6840 4250 6920 4250
Connection ~ 6840 4250
Wire Wire Line
	7220 3870 7220 4050
$Comp
L Transistor_BJT:BC847W Q310
U 1 1 5A2FAFFC
P 6740 4830
F 0 "Q310" H 6920 4940 50  0000 L CNN
F 1 "PMSTA06" H 6380 4940 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-323_SC-70" H 6940 4755 50  0001 L CIN
F 3 "" H 6740 4830 50  0001 L CNN
F 4 "1727-6293-1-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    6740 4830
	1    0    0    -1  
$EndComp
Wire Wire Line
	7220 4730 7220 4590
$Comp
L power:GND #PWR0320
U 1 1 5A2FB004
P 6840 5030
F 0 "#PWR0320" H 6840 4780 50  0001 C CNN
F 1 "GND" H 6840 4880 50  0000 C CNN
F 2 "" H 6840 5030 50  0001 C CNN
F 3 "" H 6840 5030 50  0001 C CNN
	1    6840 5030
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0324
U 1 1 5A2FB00A
P 7220 5030
F 0 "#PWR0324" H 7220 4780 50  0001 C CNN
F 1 "GND" H 7220 4880 50  0000 C CNN
F 2 "" H 7220 5030 50  0001 C CNN
F 3 "" H 7220 5030 50  0001 C CNN
	1    7220 5030
	1    0    0    -1  
$EndComp
Wire Wire Line
	6540 4830 6330 4830
Wire Wire Line
	7280 4590 7220 4590
Connection ~ 7220 4590
Text GLabel 2540 2260 2    50   Output ~ 0
Grid_0_VFD
Text GLabel 4870 2260 2    50   Output ~ 0
Grid_1_VFD
Text GLabel 7280 2260 2    50   Output ~ 0
Grid_2_VFD
Text GLabel 2540 4590 2    50   Output ~ 0
Grid_3_VFD
Text GLabel 4870 4590 2    50   Output ~ 0
Grid_4_VFD
Text GLabel 7280 4590 2    50   Output ~ 0
Grid_5_VFD
$Comp
L Device:R R301
U 1 1 5A34ED94
P 1440 2500
F 0 "R301" V 1520 2500 50  0000 C CNN
F 1 "10k" V 1440 2500 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 1370 2500 50  0001 C CNN
F 3 "" V 1520 2500 50  0001 C CNN
F 4 "1%" V 1180 2500 50  0000 C CNN "Tolerance"
F 5 "1/10W" V 1340 2500 50  0000 C CNN "Wattage"
F 6 "0603" V 1260 2500 50  0000 C CNN "display_footprint"
F 7 "P10.0KHCT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    1440 2500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R309
U 1 1 5A34EE73
P 3770 2500
F 0 "R309" V 3850 2500 50  0000 C CNN
F 1 "10k" V 3770 2500 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 3700 2500 50  0001 C CNN
F 3 "" V 3850 2500 50  0001 C CNN
F 4 "1%" V 3510 2500 50  0000 C CNN "Tolerance"
F 5 "1/10W" V 3670 2500 50  0000 C CNN "Wattage"
F 6 "0603" V 3590 2500 50  0000 C CNN "display_footprint"
F 7 "P10.0KHCT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    3770 2500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R317
U 1 1 5A34EF5C
P 6180 2500
F 0 "R317" V 6260 2500 50  0000 C CNN
F 1 "10k" V 6180 2500 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 6110 2500 50  0001 C CNN
F 3 "" V 6260 2500 50  0001 C CNN
F 4 "1%" V 5920 2500 50  0000 C CNN "Tolerance"
F 5 "1/10W" V 6080 2500 50  0000 C CNN "Wattage"
F 6 "0603" V 6000 2500 50  0000 C CNN "display_footprint"
F 7 "P10.0KHCT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    6180 2500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R318
U 1 1 5A34F07A
P 6180 4830
F 0 "R318" V 6260 4830 50  0000 C CNN
F 1 "10k" V 6180 4830 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 6110 4830 50  0001 C CNN
F 3 "" V 6260 4830 50  0001 C CNN
F 4 "1%" V 5920 4830 50  0000 C CNN "Tolerance"
F 5 "1/10W" V 6080 4830 50  0000 C CNN "Wattage"
F 6 "0603" V 6000 4830 50  0000 C CNN "display_footprint"
F 7 "P10.0KHCT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    6180 4830
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R310
U 1 1 5A34F167
P 3770 4830
F 0 "R310" V 3850 4830 50  0000 C CNN
F 1 "10k" V 3770 4830 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 3700 4830 50  0001 C CNN
F 3 "" V 3850 4830 50  0001 C CNN
F 4 "1%" V 3510 4830 50  0000 C CNN "Tolerance"
F 5 "1/10W" V 3670 4830 50  0000 C CNN "Wattage"
F 6 "0603" V 3590 4830 50  0000 C CNN "display_footprint"
F 7 "P10.0KHCT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    3770 4830
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R302
U 1 1 5A34F1EF
P 1440 4830
F 0 "R302" V 1520 4830 50  0000 C CNN
F 1 "10k" V 1440 4830 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 1370 4830 50  0001 C CNN
F 3 "" V 1520 4830 50  0001 C CNN
F 4 "1%" V 1180 4830 50  0000 C CNN "Tolerance"
F 5 "1/10W" V 1340 4830 50  0000 C CNN "Wattage"
F 6 "0603" V 1260 4830 50  0000 C CNN "display_footprint"
F 7 "P10.0KHCT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    1440 4830
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R303
U 1 1 5A34F3D6
P 2100 1690
F 0 "R303" V 2180 1690 50  0000 C CNN
F 1 "220k" V 2100 1690 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 2030 1690 50  0001 C CNN
F 3 "" V 2180 1690 50  0001 C CNN
F 4 "1%" H 2000 1690 50  0000 R CNN "Tolerance"
F 5 "1/10W" H 2000 1590 50  0000 R CNN "Wattage"
F 6 "0603" H 2010 1780 50  0000 R CNN "display_footprint"
F 7 "P220KHCT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    2100 1690
	1    0    0    -1  
$EndComp
$Comp
L Device:R R311
U 1 1 5A34F493
P 4430 1690
F 0 "R311" V 4510 1690 50  0000 C CNN
F 1 "220k" V 4430 1690 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 4360 1690 50  0001 C CNN
F 3 "" V 4510 1690 50  0001 C CNN
F 4 "1%" H 4330 1690 50  0000 R CNN "Tolerance"
F 5 "1/10W" H 4330 1590 50  0000 R CNN "Wattage"
F 6 "0603" H 4340 1770 50  0000 R CNN "display_footprint"
F 7 "P220KHCT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    4430 1690
	1    0    0    -1  
$EndComp
$Comp
L Device:R R319
U 1 1 5A34F514
P 6840 1690
F 0 "R319" V 6920 1690 50  0000 C CNN
F 1 "220k" V 6840 1690 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 6770 1690 50  0001 C CNN
F 3 "" V 6920 1690 50  0001 C CNN
F 4 "1%" H 6740 1690 50  0000 R CNN "Tolerance"
F 5 "1/10W" H 6740 1590 50  0000 R CNN "Wattage"
F 6 "0603" H 6750 1780 50  0000 R CNN "display_footprint"
F 7 "P220KHCT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    6840 1690
	1    0    0    -1  
$EndComp
$Comp
L Device:R R321
U 1 1 5A34F7E3
P 6840 4020
F 0 "R321" V 6920 4020 50  0000 C CNN
F 1 "220k" V 6840 4020 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 6770 4020 50  0001 C CNN
F 3 "" V 6920 4020 50  0001 C CNN
F 4 "1%" H 6740 4020 50  0000 R CNN "Tolerance"
F 5 "1/10W" H 6740 3920 50  0000 R CNN "Wattage"
F 6 "0603" H 6750 4110 50  0000 R CNN "display_footprint"
F 7 "P220KHCT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    6840 4020
	1    0    0    -1  
$EndComp
$Comp
L Device:R R313
U 1 1 5A34F9E8
P 4430 4020
F 0 "R313" V 4510 4020 50  0000 C CNN
F 1 "220k" V 4430 4020 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 4360 4020 50  0001 C CNN
F 3 "" V 4510 4020 50  0001 C CNN
F 4 "1%" H 4330 4020 50  0000 R CNN "Tolerance"
F 5 "1/10W" H 4330 3920 50  0000 R CNN "Wattage"
F 6 "0603" H 4330 4110 50  0000 R CNN "display_footprint"
F 7 "P220KHCT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    4430 4020
	1    0    0    -1  
$EndComp
$Comp
L Device:R R305
U 1 1 5A34FB01
P 2100 4020
F 0 "R305" V 2180 4020 50  0000 C CNN
F 1 "220k" V 2100 4020 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 2030 4020 50  0001 C CNN
F 3 "" V 2180 4020 50  0001 C CNN
F 4 "1%" H 2000 4020 50  0000 R CNN "Tolerance"
F 5 "1/10W" H 2000 3920 50  0000 R CNN "Wattage"
F 6 "0603" H 2010 4110 50  0000 R CNN "display_footprint"
F 7 "P220KHCT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    2100 4020
	1    0    0    -1  
$EndComp
$Comp
L Device:R R304
U 1 1 5A34FD01
P 2100 2150
F 0 "R304" V 2180 2150 50  0000 C CNN
F 1 "68k" V 2100 2150 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 2030 2150 50  0001 C CNN
F 3 "" V 2180 2150 50  0001 C CNN
F 4 "1%" H 2000 2150 50  0000 R CNN "Tolerance"
F 5 "1/10W" H 2000 2050 50  0000 R CNN "Wattage"
F 6 "0603" H 2010 2240 50  0000 R CNN "display_footprint"
F 7 "P68KDBCT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    2100 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R312
U 1 1 5A34FE30
P 4430 2150
F 0 "R312" V 4510 2150 50  0000 C CNN
F 1 "68k" V 4430 2150 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 4360 2150 50  0001 C CNN
F 3 "" V 4510 2150 50  0001 C CNN
F 4 "1%" H 4330 2150 50  0000 R CNN "Tolerance"
F 5 "1/10W" H 4330 2050 50  0000 R CNN "Wattage"
F 6 "0603" H 4330 2230 50  0000 R CNN "display_footprint"
F 7 "P68KDBCT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    4430 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R320
U 1 1 5A34FFAB
P 6840 2150
F 0 "R320" V 6920 2150 50  0000 C CNN
F 1 "68k" V 6840 2150 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 6770 2150 50  0001 C CNN
F 3 "" V 6920 2150 50  0001 C CNN
F 4 "1%" H 6740 2150 50  0000 R CNN "Tolerance"
F 5 "1/10W" H 6740 2050 50  0000 R CNN "Wattage"
F 6 "0603" H 6750 2240 50  0000 R CNN "display_footprint"
F 7 "P68KDBCT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    6840 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R322
U 1 1 5A35015C
P 6840 4480
F 0 "R322" V 6920 4480 50  0000 C CNN
F 1 "68k" V 6840 4480 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 6770 4480 50  0001 C CNN
F 3 "" V 6920 4480 50  0001 C CNN
F 4 "1%" H 6740 4480 50  0000 R CNN "Tolerance"
F 5 "1/10W" H 6740 4380 50  0000 R CNN "Wattage"
F 6 "0603" H 6750 4570 50  0000 R CNN "display_footprint"
F 7 "P68KDBCT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    6840 4480
	1    0    0    -1  
$EndComp
$Comp
L Device:R R314
U 1 1 5A35038E
P 4430 4480
F 0 "R314" V 4510 4480 50  0000 C CNN
F 1 "68k" V 4430 4480 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 4360 4480 50  0001 C CNN
F 3 "" V 4510 4480 50  0001 C CNN
F 4 "1%" H 4330 4480 50  0000 R CNN "Tolerance"
F 5 "1/10W" H 4330 4380 50  0000 R CNN "Wattage"
F 6 "0603" H 4330 4560 50  0000 R CNN "display_footprint"
F 7 "P68KDBCT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    4430 4480
	1    0    0    -1  
$EndComp
$Comp
L Device:R R306
U 1 1 5A3505EB
P 2100 4480
F 0 "R306" V 2180 4480 50  0000 C CNN
F 1 "68k" V 2100 4480 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 2030 4480 50  0001 C CNN
F 3 "" V 2180 4480 50  0001 C CNN
F 4 "1%" H 2000 4480 50  0000 R CNN "Tolerance"
F 5 "1/10W" H 2000 4380 50  0000 R CNN "Wattage"
F 6 "0603" H 2010 4570 50  0000 R CNN "display_footprint"
F 7 "P68KDBCT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    2100 4480
	1    0    0    -1  
$EndComp
$Comp
L Device:R R307
U 1 1 5A35086E
P 2480 2550
F 0 "R307" V 2560 2550 50  0000 C CNN
F 1 "100k" V 2480 2550 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 2410 2550 50  0001 C CNN
F 3 "" V 2560 2550 50  0001 C CNN
F 4 "1%" H 2380 2550 50  0000 R CNN "Tolerance"
F 5 "1/10W" H 2380 2450 50  0000 R CNN "Wattage"
F 6 "0603" H 2380 2640 50  0000 R CNN "display_footprint"
F 7 "P16019CT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    2480 2550
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R315
U 1 1 5A350A47
P 4810 2550
F 0 "R315" V 4890 2550 50  0000 C CNN
F 1 "100k" V 4810 2550 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 4740 2550 50  0001 C CNN
F 3 "" V 4890 2550 50  0001 C CNN
F 4 "1%" H 4710 2550 50  0000 R CNN "Tolerance"
F 5 "1/10W" H 4710 2450 50  0000 R CNN "Wattage"
F 6 "0603" H 4710 2640 50  0000 R CNN "display_footprint"
F 7 "P16019CT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    4810 2550
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R323
U 1 1 5A350B93
P 7220 2550
F 0 "R323" V 7300 2550 50  0000 C CNN
F 1 "100k" V 7220 2550 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 7150 2550 50  0001 C CNN
F 3 "" V 7300 2550 50  0001 C CNN
F 4 "1%" H 7120 2550 50  0000 R CNN "Tolerance"
F 5 "1/10W" H 7120 2450 50  0000 R CNN "Wattage"
F 6 "0603" H 7120 2640 50  0000 R CNN "display_footprint"
F 7 "P16019CT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    7220 2550
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R324
U 1 1 5A350D14
P 7220 4880
F 0 "R324" V 7300 4880 50  0000 C CNN
F 1 "100k" V 7220 4880 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 7150 4880 50  0001 C CNN
F 3 "" V 7300 4880 50  0001 C CNN
F 4 "1%" H 7120 4880 50  0000 R CNN "Tolerance"
F 5 "1/10W" H 7120 4780 50  0000 R CNN "Wattage"
F 6 "0603" H 7120 4970 50  0000 R CNN "display_footprint"
F 7 "P16019CT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    7220 4880
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R316
U 1 1 5A350F25
P 4810 4880
F 0 "R316" V 4890 4880 50  0000 C CNN
F 1 "100k" V 4810 4880 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 4740 4880 50  0001 C CNN
F 3 "" V 4890 4880 50  0001 C CNN
F 4 "1%" H 4710 4880 50  0000 R CNN "Tolerance"
F 5 "1/10W" H 4710 4780 50  0000 R CNN "Wattage"
F 6 "0603" H 4710 4980 50  0000 R CNN "display_footprint"
F 7 "P16019CT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    4810 4880
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R308
U 1 1 5A351108
P 2480 4880
F 0 "R308" V 2560 4880 50  0000 C CNN
F 1 "100k" V 2480 4880 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 2410 4880 50  0001 C CNN
F 3 "" V 2560 4880 50  0001 C CNN
F 4 "1%" H 2380 4880 50  0000 R CNN "Tolerance"
F 5 "1/10W" H 2380 4780 50  0000 R CNN "Wattage"
F 6 "0603" H 2380 4960 50  0000 R CNN "display_footprint"
F 7 "P16019CT-ND" H 0   0   50  0001 C CNN "Digi-Key PN"
	1    2480 4880
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2100 1920 2100 2000
Wire Wire Line
	2480 2260 2480 2120
Wire Wire Line
	4430 1920 4430 2000
Wire Wire Line
	4810 2260 4810 2120
Wire Wire Line
	6840 1920 6840 2000
Wire Wire Line
	7220 2260 7220 2120
Wire Wire Line
	2100 4250 2100 4330
Wire Wire Line
	2480 4590 2480 4450
Wire Wire Line
	4430 4250 4430 4330
Wire Wire Line
	4810 4590 4810 4450
Wire Wire Line
	6840 4250 6840 4330
Wire Wire Line
	7220 4590 7220 4450
Text Notes 4490 780  0    100  ~ 20
Grid Drivers
$Comp
L Custom_Library:+60VAN #PWR0301
U 1 1 5E09EEE2
P 2100 1540
F 0 "#PWR0301" H 2100 1390 50  0001 C CNN
F 1 "+60VAN" H 2100 1680 50  0000 C CNN
F 2 "" H 2100 1540 50  0000 C CNN
F 3 "" H 2100 1540 50  0000 C CNN
	1    2100 1540
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+60VAN #PWR0305
U 1 1 5E09F221
P 2480 1540
F 0 "#PWR0305" H 2480 1390 50  0001 C CNN
F 1 "+60VAN" H 2480 1680 50  0000 C CNN
F 2 "" H 2480 1540 50  0000 C CNN
F 3 "" H 2480 1540 50  0000 C CNN
	1    2480 1540
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+60VAN #PWR0309
U 1 1 5E09F61C
P 4430 1540
F 0 "#PWR0309" H 4430 1390 50  0001 C CNN
F 1 "+60VAN" H 4430 1680 50  0000 C CNN
F 2 "" H 4430 1540 50  0000 C CNN
F 3 "" H 4430 1540 50  0000 C CNN
	1    4430 1540
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+60VAN #PWR0313
U 1 1 5E09FC6C
P 4810 1540
F 0 "#PWR0313" H 4810 1390 50  0001 C CNN
F 1 "+60VAN" H 4810 1680 50  0000 C CNN
F 2 "" H 4810 1540 50  0000 C CNN
F 3 "" H 4810 1540 50  0000 C CNN
	1    4810 1540
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+60VAN #PWR0317
U 1 1 5E09FFAE
P 6840 1540
F 0 "#PWR0317" H 6840 1390 50  0001 C CNN
F 1 "+60VAN" H 6840 1680 50  0000 C CNN
F 2 "" H 6840 1540 50  0000 C CNN
F 3 "" H 6840 1540 50  0000 C CNN
	1    6840 1540
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+60VAN #PWR0321
U 1 1 5E0A057E
P 7220 1540
F 0 "#PWR0321" H 7220 1390 50  0001 C CNN
F 1 "+60VAN" H 7220 1680 50  0000 C CNN
F 2 "" H 7220 1540 50  0000 C CNN
F 3 "" H 7220 1540 50  0000 C CNN
	1    7220 1540
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+60VAN #PWR0323
U 1 1 5E0A0984
P 7220 3870
F 0 "#PWR0323" H 7220 3720 50  0001 C CNN
F 1 "+60VAN" H 7220 4010 50  0000 C CNN
F 2 "" H 7220 3870 50  0000 C CNN
F 3 "" H 7220 3870 50  0000 C CNN
	1    7220 3870
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+60VAN #PWR0319
U 1 1 5E0A104D
P 6840 3870
F 0 "#PWR0319" H 6840 3720 50  0001 C CNN
F 1 "+60VAN" H 6840 4010 50  0000 C CNN
F 2 "" H 6840 3870 50  0000 C CNN
F 3 "" H 6840 3870 50  0000 C CNN
	1    6840 3870
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+60VAN #PWR0315
U 1 1 5E0A216B
P 4810 3870
F 0 "#PWR0315" H 4810 3720 50  0001 C CNN
F 1 "+60VAN" H 4810 4010 50  0000 C CNN
F 2 "" H 4810 3870 50  0000 C CNN
F 3 "" H 4810 3870 50  0000 C CNN
	1    4810 3870
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+60VAN #PWR0311
U 1 1 5E0A2757
P 4430 3870
F 0 "#PWR0311" H 4430 3720 50  0001 C CNN
F 1 "+60VAN" H 4430 4010 50  0000 C CNN
F 2 "" H 4430 3870 50  0000 C CNN
F 3 "" H 4430 3870 50  0000 C CNN
	1    4430 3870
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+60VAN #PWR0307
U 1 1 5E0A2AD3
P 2480 3870
F 0 "#PWR0307" H 2480 3720 50  0001 C CNN
F 1 "+60VAN" H 2480 4010 50  0000 C CNN
F 2 "" H 2480 3870 50  0000 C CNN
F 3 "" H 2480 3870 50  0000 C CNN
	1    2480 3870
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+60VAN #PWR0303
U 1 1 5E0A2FEC
P 2100 3870
F 0 "#PWR0303" H 2100 3720 50  0001 C CNN
F 1 "+60VAN" H 2100 4010 50  0000 C CNN
F 2 "" H 2100 3870 50  0000 C CNN
F 3 "" H 2100 3870 50  0000 C CNN
	1    2100 3870
	1    0    0    -1  
$EndComp
$EndSCHEMATC

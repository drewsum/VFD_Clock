EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 16 31
Title "VFD Clock"
Date "2020-10-12"
Rev "B"
Comp "Drew Maatman"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR01604
U 1 1 5CB29D2D
P 2920 3630
F 0 "#PWR01604" H 2920 3380 50  0001 C CNN
F 1 "GND" H 2920 3480 50  0000 C CNN
F 2 "" H 2920 3630 50  0000 C CNN
F 3 "" H 2920 3630 50  0000 C CNN
	1    2920 3630
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C1601
U 1 1 5CB29D37
P 2600 3400
F 0 "C1601" H 2625 3500 50  0000 L CNN
F 1 "0.1uF" H 2625 3300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2638 3250 50  0001 C CNN
F 3 "" H 2625 3500 50  0001 C CNN
F 4 "0603" H 2450 3500 50  0000 R CNN "display_footprint"
F 5 "50V" H 2450 3400 50  0000 R CNN "Voltage"
F 6 "X7R" H 2450 3300 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H -1310 -3480 50  0001 C CNN "Digi-Key PN"
	1    2600 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 3210 2600 3250
Wire Wire Line
	3240 3210 3240 3250
Wire Wire Line
	2600 3590 2600 3550
Connection ~ 2920 3590
Wire Wire Line
	3240 3590 3240 3550
Wire Wire Line
	2600 3590 2920 3590
Wire Wire Line
	2920 3590 3240 3590
Wire Wire Line
	2920 3590 2920 3630
$Comp
L power:GND #PWR01610
U 1 1 5CB1558B
P 4220 3630
F 0 "#PWR01610" H 4220 3380 50  0001 C CNN
F 1 "GND" H 4220 3480 50  0000 C CNN
F 2 "" H 4220 3630 50  0000 C CNN
F 3 "" H 4220 3630 50  0000 C CNN
	1    4220 3630
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C1608
U 1 1 5CB15599
P 3900 3400
F 0 "C1608" H 3925 3500 50  0000 L CNN
F 1 "0.1uF" H 3925 3300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3938 3250 50  0001 C CNN
F 3 "" H 3925 3500 50  0001 C CNN
F 4 "0603" H 3750 3500 50  0000 R CNN "display_footprint"
F 5 "50V" H 3750 3400 50  0000 R CNN "Voltage"
F 6 "X7R" H 3750 3300 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H -10 -3480 50  0001 C CNN "Digi-Key PN"
	1    3900 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3210 3900 3250
Wire Wire Line
	4540 3210 4540 3250
Wire Wire Line
	3900 3590 3900 3550
Connection ~ 4220 3590
Wire Wire Line
	4540 3590 4540 3550
Wire Wire Line
	3900 3590 4220 3590
Wire Wire Line
	4220 3590 4540 3590
Wire Wire Line
	4220 3590 4220 3630
$Comp
L power:GND #PWR01616
U 1 1 5CB1993B
P 5520 3630
F 0 "#PWR01616" H 5520 3380 50  0001 C CNN
F 1 "GND" H 5520 3480 50  0000 C CNN
F 2 "" H 5520 3630 50  0000 C CNN
F 3 "" H 5520 3630 50  0000 C CNN
	1    5520 3630
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C1615
U 1 1 5CB19945
P 5200 3400
F 0 "C1615" H 5225 3500 50  0000 L CNN
F 1 "0.1uF" H 5225 3300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5238 3250 50  0001 C CNN
F 3 "" H 5225 3500 50  0001 C CNN
F 4 "0603" H 5050 3500 50  0000 R CNN "display_footprint"
F 5 "50V" H 5050 3400 50  0000 R CNN "Voltage"
F 6 "X7R" H 5050 3300 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H 1290 -3480 50  0001 C CNN "Digi-Key PN"
	1    5200 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 3210 5200 3250
Wire Wire Line
	5840 3210 5840 3250
Wire Wire Line
	5200 3590 5200 3550
Wire Wire Line
	5840 3590 5840 3550
Wire Wire Line
	5520 3590 5520 3630
$Comp
L power:GND #PWR01622
U 1 1 5CB219B2
P 6820 3630
F 0 "#PWR01622" H 6820 3380 50  0001 C CNN
F 1 "GND" H 6820 3480 50  0000 C CNN
F 2 "" H 6820 3630 50  0000 C CNN
F 3 "" H 6820 3630 50  0000 C CNN
	1    6820 3630
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C1622
U 1 1 5CB219C0
P 6500 3400
F 0 "C1622" H 6525 3500 50  0000 L CNN
F 1 "0.1uF" H 6525 3300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6538 3250 50  0001 C CNN
F 3 "" H 6525 3500 50  0001 C CNN
F 4 "0603" H 6350 3500 50  0000 R CNN "display_footprint"
F 5 "50V" H 6350 3400 50  0000 R CNN "Voltage"
F 6 "X7R" H 6350 3300 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H 2590 -3480 50  0001 C CNN "Digi-Key PN"
	1    6500 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3210 6500 3250
Wire Wire Line
	7140 3210 7140 3250
Wire Wire Line
	6500 3590 6500 3550
Connection ~ 6820 3590
Wire Wire Line
	7140 3590 7140 3550
Wire Wire Line
	6500 3590 6820 3590
Wire Wire Line
	6820 3590 7140 3590
Wire Wire Line
	6820 3590 6820 3630
$Comp
L power:GND #PWR01606
U 1 1 5CB24EB8
P 2920 4630
F 0 "#PWR01606" H 2920 4380 50  0001 C CNN
F 1 "GND" H 2920 4480 50  0000 C CNN
F 2 "" H 2920 4630 50  0000 C CNN
F 3 "" H 2920 4630 50  0000 C CNN
	1    2920 4630
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C1602
U 1 1 5CB24EC6
P 2600 4400
F 0 "C1602" H 2625 4500 50  0000 L CNN
F 1 "0.1uF" H 2625 4300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2638 4250 50  0001 C CNN
F 3 "" H 2625 4500 50  0001 C CNN
F 4 "0603" H 2450 4500 50  0000 R CNN "display_footprint"
F 5 "50V" H 2450 4400 50  0000 R CNN "Voltage"
F 6 "X7R" H 2450 4300 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H -1310 -2480 50  0001 C CNN "Digi-Key PN"
	1    2600 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 4210 2600 4250
Connection ~ 2920 4210
Wire Wire Line
	3240 4210 3240 4250
Wire Wire Line
	2600 4210 2920 4210
Wire Wire Line
	2920 4170 2920 4210
Wire Wire Line
	2600 4590 2600 4550
Connection ~ 2920 4590
Wire Wire Line
	3240 4590 3240 4550
Wire Wire Line
	2600 4590 2920 4590
Wire Wire Line
	2920 4210 3240 4210
Wire Wire Line
	2920 4590 3240 4590
Wire Wire Line
	2920 4590 2920 4630
$Comp
L power:GND #PWR01612
U 1 1 5CB24F04
P 4220 4630
F 0 "#PWR01612" H 4220 4380 50  0001 C CNN
F 1 "GND" H 4220 4480 50  0000 C CNN
F 2 "" H 4220 4630 50  0000 C CNN
F 3 "" H 4220 4630 50  0000 C CNN
	1    4220 4630
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C1609
U 1 1 5CB24F12
P 3900 4400
F 0 "C1609" H 3925 4500 50  0000 L CNN
F 1 "0.1uF" H 3925 4300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3938 4250 50  0001 C CNN
F 3 "" H 3925 4500 50  0001 C CNN
F 4 "0603" H 3750 4500 50  0000 R CNN "display_footprint"
F 5 "50V" H 3750 4400 50  0000 R CNN "Voltage"
F 6 "X7R" H 3750 4300 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H -10 -2480 50  0001 C CNN "Digi-Key PN"
	1    3900 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4210 3900 4250
Connection ~ 4220 4210
Wire Wire Line
	4540 4210 4540 4250
Wire Wire Line
	3900 4210 4220 4210
Wire Wire Line
	4220 4170 4220 4210
Wire Wire Line
	3900 4590 3900 4550
Connection ~ 4220 4590
Wire Wire Line
	4540 4590 4540 4550
Wire Wire Line
	3900 4590 4220 4590
Wire Wire Line
	4220 4210 4540 4210
Wire Wire Line
	4220 4590 4540 4590
Wire Wire Line
	4220 4590 4220 4630
$Comp
L power:GND #PWR01618
U 1 1 5CB24F50
P 5520 4630
F 0 "#PWR01618" H 5520 4380 50  0001 C CNN
F 1 "GND" H 5520 4480 50  0000 C CNN
F 2 "" H 5520 4630 50  0000 C CNN
F 3 "" H 5520 4630 50  0000 C CNN
	1    5520 4630
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C1616
U 1 1 5CB24F5E
P 5200 4400
F 0 "C1616" H 5225 4500 50  0000 L CNN
F 1 "0.1uF" H 5225 4300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5238 4250 50  0001 C CNN
F 3 "" H 5225 4500 50  0001 C CNN
F 4 "0603" H 5050 4500 50  0000 R CNN "display_footprint"
F 5 "50V" H 5050 4400 50  0000 R CNN "Voltage"
F 6 "X7R" H 5050 4300 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H 1290 -2480 50  0001 C CNN "Digi-Key PN"
	1    5200 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 4210 5200 4250
Connection ~ 5520 4210
Wire Wire Line
	5840 4210 5840 4250
Wire Wire Line
	5200 4210 5520 4210
Wire Wire Line
	5520 4170 5520 4210
Wire Wire Line
	5200 4590 5200 4550
Connection ~ 5520 4590
Wire Wire Line
	5840 4590 5840 4550
Wire Wire Line
	5200 4590 5520 4590
Wire Wire Line
	5520 4210 5840 4210
Wire Wire Line
	5520 4590 5840 4590
Wire Wire Line
	5520 4590 5520 4630
Wire Wire Line
	6820 4590 6820 4630
Wire Wire Line
	7140 4590 7140 4550
Wire Wire Line
	6820 4590 7140 4590
Wire Wire Line
	6500 4590 6820 4590
Connection ~ 6820 4590
Wire Wire Line
	6500 4590 6500 4550
Wire Wire Line
	6820 4170 6820 4210
Wire Wire Line
	7140 4210 7140 4250
Wire Wire Line
	6820 4210 7140 4210
Wire Wire Line
	6500 4210 6820 4210
Connection ~ 6820 4210
Wire Wire Line
	6500 4210 6500 4250
$Comp
L Custom_Library:C_Custom C1623
U 1 1 5CB24FAA
P 6500 4400
F 0 "C1623" H 6525 4500 50  0000 L CNN
F 1 "0.1uF" H 6525 4300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6538 4250 50  0001 C CNN
F 3 "" H 6525 4500 50  0001 C CNN
F 4 "0603" H 6350 4500 50  0000 R CNN "display_footprint"
F 5 "50V" H 6350 4400 50  0000 R CNN "Voltage"
F 6 "X7R" H 6350 4300 50  0000 R CNN "Dielectric"
F 7 "399-6856-1-ND" H 2590 -2480 50  0001 C CNN "Digi-Key PN"
	1    6500 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:Ferrite_Bead L?
U 1 1 5CB5F840
P 8260 4120
AR Path="/5CAD2D97/5CB5F840" Ref="L?"  Part="1" 
AR Path="/5CB25152/5CB5F840" Ref="L1601"  Part="1" 
F 0 "L1601" V 8110 4145 50  0000 C CNN
F 1 "600R 0.5A" V 8410 4120 50  0000 C CNN
F 2 "Inductors_SMD:L_0603" V 8190 4120 50  0001 C CNN
F 3 "~" H 8260 4120 50  0001 C CNN
F 4 "732-2389-1-ND" H -1270 360 50  0001 C CNN "Digi-Key PN"
	1    8260 4120
	0    1    1    0   
$EndComp
$Comp
L Device:Ferrite_Bead L?
U 1 1 5CB61DC3
P 8260 4680
AR Path="/5CAD2D97/5CB61DC3" Ref="L?"  Part="1" 
AR Path="/5CB25152/5CB61DC3" Ref="L1602"  Part="1" 
F 0 "L1602" V 8110 4705 50  0000 C CNN
F 1 "600R 0.5A" V 8410 4680 50  0000 C CNN
F 2 "Inductors_SMD:L_0603" V 8190 4680 50  0001 C CNN
F 3 "~" H 8260 4680 50  0001 C CNN
F 4 "732-2389-1-ND" H -1270 920 50  0001 C CNN "Digi-Key PN"
	1    8260 4680
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR01626
U 1 1 5CB62D81
P 8110 4680
F 0 "#PWR01626" H 8110 4430 50  0001 C CNN
F 1 "GND" V 8110 4530 50  0000 R CNN
F 2 "" H 8110 4680 50  0001 C CNN
F 3 "" H 8110 4680 50  0001 C CNN
	1    8110 4680
	0    1    1    0   
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E32800A
P 4540 3400
AR Path="/5CB7718D/5E32800A" Ref="C?"  Part="1" 
AR Path="/5E0DC082/5E32800A" Ref="C?"  Part="1" 
AR Path="/5E0F9110/5E32800A" Ref="C?"  Part="1" 
AR Path="/5A557C58/5E32800A" Ref="C?"  Part="1" 
AR Path="/5CB25152/5E32800A" Ref="C1610"  Part="1" 
F 0 "C1610" H 4565 3500 50  0000 L CNN
F 1 "10uF" H 4565 3300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4578 3250 50  0001 C CNN
F 3 "" H 4565 3500 50  0001 C CNN
F 4 "0603" H 4390 3500 50  0000 R CNN "display_footprint"
F 5 "6.3V" H 4390 3400 50  0000 R CNN "Voltage"
F 6 "X5R" H 4390 3300 50  0000 R CNN "Dielectric"
F 7 "490-12538-1-ND" H 4540 3400 50  0001 C CNN "Digi-Key PN"
	1    4540 3400
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E32A559
P 5840 3400
AR Path="/5CB7718D/5E32A559" Ref="C?"  Part="1" 
AR Path="/5E0DC082/5E32A559" Ref="C?"  Part="1" 
AR Path="/5E0F9110/5E32A559" Ref="C?"  Part="1" 
AR Path="/5A557C58/5E32A559" Ref="C?"  Part="1" 
AR Path="/5CB25152/5E32A559" Ref="C1617"  Part="1" 
F 0 "C1617" H 5865 3500 50  0000 L CNN
F 1 "10uF" H 5865 3300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5878 3250 50  0001 C CNN
F 3 "" H 5865 3500 50  0001 C CNN
F 4 "0603" H 5690 3500 50  0000 R CNN "display_footprint"
F 5 "6.3V" H 5690 3400 50  0000 R CNN "Voltage"
F 6 "X5R" H 5690 3300 50  0000 R CNN "Dielectric"
F 7 "490-12538-1-ND" H 5840 3400 50  0001 C CNN "Digi-Key PN"
	1    5840 3400
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E32DC13
P 7140 3400
AR Path="/5CB7718D/5E32DC13" Ref="C?"  Part="1" 
AR Path="/5E0DC082/5E32DC13" Ref="C?"  Part="1" 
AR Path="/5E0F9110/5E32DC13" Ref="C?"  Part="1" 
AR Path="/5A557C58/5E32DC13" Ref="C?"  Part="1" 
AR Path="/5CB25152/5E32DC13" Ref="C1624"  Part="1" 
F 0 "C1624" H 7165 3500 50  0000 L CNN
F 1 "10uF" H 7165 3300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 7178 3250 50  0001 C CNN
F 3 "" H 7165 3500 50  0001 C CNN
F 4 "0603" H 6990 3500 50  0000 R CNN "display_footprint"
F 5 "6.3V" H 6990 3400 50  0000 R CNN "Voltage"
F 6 "X5R" H 6990 3300 50  0000 R CNN "Dielectric"
F 7 "490-12538-1-ND" H 7140 3400 50  0001 C CNN "Digi-Key PN"
	1    7140 3400
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01601
U 1 1 5E44A219
P 9510 4120
F 0 "#FLG01601" H 9510 4195 50  0001 C CNN
F 1 "PWR_FLAG" V 9510 4270 50  0000 L CNN
F 2 "" H 9510 4120 50  0001 C CNN
F 3 "~" H 9510 4120 50  0001 C CNN
	1    9510 4120
	0    -1   -1   0   
$EndComp
$Comp
L power:PWR_FLAG #FLG01602
U 1 1 5E44AB17
P 9510 4680
F 0 "#FLG01602" H 9510 4755 50  0001 C CNN
F 1 "PWR_FLAG" V 9510 4830 50  0000 L CNN
F 2 "" H 9510 4680 50  0001 C CNN
F 3 "~" H 9510 4680 50  0001 C CNN
	1    9510 4680
	0    -1   -1   0   
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5F83E0B6
P 3240 3400
AR Path="/5CB7718D/5F83E0B6" Ref="C?"  Part="1" 
AR Path="/5E0DC082/5F83E0B6" Ref="C?"  Part="1" 
AR Path="/5E0F9110/5F83E0B6" Ref="C?"  Part="1" 
AR Path="/5A557C58/5F83E0B6" Ref="C?"  Part="1" 
AR Path="/5CB25152/5F83E0B6" Ref="C1603"  Part="1" 
F 0 "C1603" H 3265 3500 50  0000 L CNN
F 1 "10uF" H 3265 3300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3278 3250 50  0001 C CNN
F 3 "" H 3265 3500 50  0001 C CNN
F 4 "0603" H 3090 3500 50  0000 R CNN "display_footprint"
F 5 "6.3V" H 3090 3400 50  0000 R CNN "Voltage"
F 6 "X5R" H 3090 3300 50  0000 R CNN "Dielectric"
F 7 "490-12538-1-ND" H 3240 3400 50  0001 C CNN "Digi-Key PN"
	1    3240 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 3210 2920 3210
$Comp
L Custom_Library:C_Custom C?
U 1 1 5F856176
P 3240 4400
AR Path="/5CB7718D/5F856176" Ref="C?"  Part="1" 
AR Path="/5E0DC082/5F856176" Ref="C?"  Part="1" 
AR Path="/5E0F9110/5F856176" Ref="C?"  Part="1" 
AR Path="/5A557C58/5F856176" Ref="C?"  Part="1" 
AR Path="/5CB25152/5F856176" Ref="C1604"  Part="1" 
F 0 "C1604" H 3265 4500 50  0000 L CNN
F 1 "10uF" H 3265 4300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3278 4250 50  0001 C CNN
F 3 "" H 3265 4500 50  0001 C CNN
F 4 "0603" H 3090 4500 50  0000 R CNN "display_footprint"
F 5 "6.3V" H 3090 4400 50  0000 R CNN "Voltage"
F 6 "X5R" H 3090 4300 50  0000 R CNN "Dielectric"
F 7 "490-12538-1-ND" H 3240 4400 50  0001 C CNN "Digi-Key PN"
	1    3240 4400
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5F856A04
P 4540 4400
AR Path="/5CB7718D/5F856A04" Ref="C?"  Part="1" 
AR Path="/5E0DC082/5F856A04" Ref="C?"  Part="1" 
AR Path="/5E0F9110/5F856A04" Ref="C?"  Part="1" 
AR Path="/5A557C58/5F856A04" Ref="C?"  Part="1" 
AR Path="/5CB25152/5F856A04" Ref="C1605"  Part="1" 
F 0 "C1605" H 4565 4500 50  0000 L CNN
F 1 "10uF" H 4565 4300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4578 4250 50  0001 C CNN
F 3 "" H 4565 4500 50  0001 C CNN
F 4 "0603" H 4390 4500 50  0000 R CNN "display_footprint"
F 5 "6.3V" H 4390 4400 50  0000 R CNN "Voltage"
F 6 "X5R" H 4390 4300 50  0000 R CNN "Dielectric"
F 7 "490-12538-1-ND" H 4540 4400 50  0001 C CNN "Digi-Key PN"
	1    4540 4400
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5F856FC7
P 5840 4400
AR Path="/5CB7718D/5F856FC7" Ref="C?"  Part="1" 
AR Path="/5E0DC082/5F856FC7" Ref="C?"  Part="1" 
AR Path="/5E0F9110/5F856FC7" Ref="C?"  Part="1" 
AR Path="/5A557C58/5F856FC7" Ref="C?"  Part="1" 
AR Path="/5CB25152/5F856FC7" Ref="C1606"  Part="1" 
F 0 "C1606" H 5865 4500 50  0000 L CNN
F 1 "10uF" H 5865 4300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5878 4250 50  0001 C CNN
F 3 "" H 5865 4500 50  0001 C CNN
F 4 "0603" H 5690 4500 50  0000 R CNN "display_footprint"
F 5 "6.3V" H 5690 4400 50  0000 R CNN "Voltage"
F 6 "X5R" H 5690 4300 50  0000 R CNN "Dielectric"
F 7 "490-12538-1-ND" H 5840 4400 50  0001 C CNN "Digi-Key PN"
	1    5840 4400
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5F857789
P 7140 4400
AR Path="/5CB7718D/5F857789" Ref="C?"  Part="1" 
AR Path="/5E0DC082/5F857789" Ref="C?"  Part="1" 
AR Path="/5E0F9110/5F857789" Ref="C?"  Part="1" 
AR Path="/5A557C58/5F857789" Ref="C?"  Part="1" 
AR Path="/5CB25152/5F857789" Ref="C1607"  Part="1" 
F 0 "C1607" H 7165 4500 50  0000 L CNN
F 1 "10uF" H 7165 4300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 7178 4250 50  0001 C CNN
F 3 "" H 7165 4500 50  0001 C CNN
F 4 "0603" H 6990 4500 50  0000 R CNN "display_footprint"
F 5 "6.3V" H 6990 4400 50  0000 R CNN "Voltage"
F 6 "X5R" H 6990 4300 50  0000 R CNN "Dielectric"
F 7 "490-12538-1-ND" H 7140 4400 50  0001 C CNN "Digi-Key PN"
	1    7140 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3210 4220 3210
Wire Wire Line
	5200 3590 5520 3590
Wire Wire Line
	5200 3210 5520 3210
Connection ~ 5520 3590
Wire Wire Line
	5520 3590 5840 3590
Wire Wire Line
	6500 3210 6820 3210
$Comp
L power:+3.3V #PWR01602
U 1 1 5F8625B8
P 2920 4170
F 0 "#PWR01602" H 2920 4020 50  0001 C CNN
F 1 "+3.3V" H 2920 4310 50  0000 C CNN
F 2 "" H 2920 4170 50  0001 C CNN
F 3 "" H 2920 4170 50  0001 C CNN
	1    2920 4170
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR01605
U 1 1 5F862EBB
P 4220 4170
F 0 "#PWR01605" H 4220 4020 50  0001 C CNN
F 1 "+3.3V" H 4220 4310 50  0000 C CNN
F 2 "" H 4220 4170 50  0001 C CNN
F 3 "" H 4220 4170 50  0001 C CNN
	1    4220 4170
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR01608
U 1 1 5F86590A
P 5520 4170
F 0 "#PWR01608" H 5520 4020 50  0001 C CNN
F 1 "+3.3V" H 5520 4310 50  0000 C CNN
F 2 "" H 5520 4170 50  0001 C CNN
F 3 "" H 5520 4170 50  0001 C CNN
	1    5520 4170
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:GNDA_MZ #PWR01613
U 1 1 5F866EF4
P 6820 4630
F 0 "#PWR01613" H 6820 4380 50  0001 C CNN
F 1 "GNDA_MZ" H 6820 4480 50  0000 C CNN
F 2 "" H 6820 4630 50  0001 C CNN
F 3 "" H 6820 4630 50  0001 C CNN
	1    6820 4630
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:GNDA_MZ #PWR01617
U 1 1 5F867C66
P 8410 4680
F 0 "#PWR01617" H 8410 4430 50  0001 C CNN
F 1 "GNDA_MZ" V 8410 4530 50  0000 R CNN
F 2 "" H 8410 4680 50  0001 C CNN
F 3 "" H 8410 4680 50  0001 C CNN
	1    8410 4680
	0    -1   -1   0   
$EndComp
$Comp
L Custom_Library:GNDA_MZ #PWR01620
U 1 1 5F868125
P 9510 4680
F 0 "#PWR01620" H 9510 4430 50  0001 C CNN
F 1 "GNDA_MZ" V 9510 4530 50  0000 R CNN
F 2 "" H 9510 4680 50  0001 C CNN
F 3 "" H 9510 4680 50  0001 C CNN
	1    9510 4680
	0    -1   -1   0   
$EndComp
$Comp
L Custom_Library:+3.3VA_MZ #PWR01611
U 1 1 5F868E0B
P 6820 4170
F 0 "#PWR01611" H 6820 4020 50  0001 C CNN
F 1 "+3.3VA_MZ" H 6820 4310 50  0000 C CNN
F 2 "" H 6820 4170 50  0001 C CNN
F 3 "" H 6820 4170 50  0001 C CNN
	1    6820 4170
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+3.3VA_MZ #PWR01615
U 1 1 5F869363
P 8410 4120
F 0 "#PWR01615" H 8410 3970 50  0001 C CNN
F 1 "+3.3VA_MZ" V 8410 4260 50  0000 L CNN
F 2 "" H 8410 4120 50  0001 C CNN
F 3 "" H 8410 4120 50  0001 C CNN
	1    8410 4120
	0    1    1    0   
$EndComp
$Comp
L Custom_Library:+3.3VA_MZ #PWR01619
U 1 1 5F86AF0B
P 9510 4120
F 0 "#PWR01619" H 9510 3970 50  0001 C CNN
F 1 "+3.3VA_MZ" V 9510 4260 50  0000 L CNN
F 2 "" H 9510 4120 50  0001 C CNN
F 3 "" H 9510 4120 50  0001 C CNN
	1    9510 4120
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR01614
U 1 1 5F86B456
P 8110 4120
F 0 "#PWR01614" H 8110 3970 50  0001 C CNN
F 1 "+3.3V" V 8110 4260 50  0000 L CNN
F 2 "" H 8110 4120 50  0001 C CNN
F 3 "" H 8110 4120 50  0001 C CNN
	1    8110 4120
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR01601
U 1 1 5F86E7D0
P 2920 3170
F 0 "#PWR01601" H 2920 3020 50  0001 C CNN
F 1 "+3.3V" H 2920 3310 50  0000 C CNN
F 2 "" H 2920 3170 50  0001 C CNN
F 3 "" H 2920 3170 50  0001 C CNN
	1    2920 3170
	1    0    0    -1  
$EndComp
Wire Wire Line
	2920 3170 2920 3210
Connection ~ 2920 3210
Wire Wire Line
	2920 3210 3240 3210
$Comp
L power:+3.3V #PWR01603
U 1 1 5F870EF0
P 4220 3170
F 0 "#PWR01603" H 4220 3020 50  0001 C CNN
F 1 "+3.3V" H 4220 3310 50  0000 C CNN
F 2 "" H 4220 3170 50  0001 C CNN
F 3 "" H 4220 3170 50  0001 C CNN
	1    4220 3170
	1    0    0    -1  
$EndComp
Wire Wire Line
	4220 3170 4220 3210
Connection ~ 4220 3210
Wire Wire Line
	4220 3210 4540 3210
$Comp
L power:+3.3V #PWR01607
U 1 1 5F8744F8
P 5520 3170
F 0 "#PWR01607" H 5520 3020 50  0001 C CNN
F 1 "+3.3V" H 5520 3310 50  0000 C CNN
F 2 "" H 5520 3170 50  0001 C CNN
F 3 "" H 5520 3170 50  0001 C CNN
	1    5520 3170
	1    0    0    -1  
$EndComp
Wire Wire Line
	5520 3170 5520 3210
Connection ~ 5520 3210
Wire Wire Line
	5520 3210 5840 3210
$Comp
L power:+3.3V #PWR01609
U 1 1 5F87773B
P 6820 3170
F 0 "#PWR01609" H 6820 3020 50  0001 C CNN
F 1 "+3.3V" H 6820 3310 50  0000 C CNN
F 2 "" H 6820 3170 50  0001 C CNN
F 3 "" H 6820 3170 50  0001 C CNN
	1    6820 3170
	1    0    0    -1  
$EndComp
Wire Wire Line
	6820 3170 6820 3210
Connection ~ 6820 3210
Wire Wire Line
	6820 3210 7140 3210
$EndSCHEMATC
EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 25 30
Title "VFD Clock"
Date "2019-04-11"
Rev "A"
Comp "Drew Maatman"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 8290 1700 2    50   Input ~ 0
USB_UART_RX_ISO
Text GLabel 8290 1800 2    50   Output ~ 0
USB_UART_TX_ISO
$Comp
L Custom_Library:+5V_USB #PWR?
U 1 1 5BB15594
P 6270 1240
AR Path="/5BAAE1F3/5BB15594" Ref="#PWR?"  Part="1" 
AR Path="/5BAAE1DC/5BB15594" Ref="#PWR?"  Part="1" 
AR Path="/5CAD2DA3/5BB15594" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6270 1090 50  0001 C CNN
F 1 "+5V_USB" H 6270 1380 50  0000 C CNN
F 2 "" H 6270 1240 50  0001 C CNN
F 3 "" H 6270 1240 50  0001 C CNN
	1    6270 1240
	1    0    0    -1  
$EndComp
Wire Wire Line
	4690 1240 4690 1400
Wire Wire Line
	5100 1400 4690 1400
Wire Wire Line
	5900 1400 6270 1400
Wire Wire Line
	6270 1240 6270 1400
$Comp
L power:GND #PWR?
U 1 1 5BB167BA
P 4690 1950
F 0 "#PWR?" H 4690 1700 50  0001 C CNN
F 1 "GND" H 4690 1810 50  0000 C CNN
F 2 "" H 4690 1950 50  0001 C CNN
F 3 "" H 4690 1950 50  0001 C CNN
	1    4690 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4690 1950 4690 1500
Wire Wire Line
	4690 1500 5100 1500
$Comp
L Custom_Library:GND_USB #PWR?
U 1 1 5BB169D6
P 6270 1950
F 0 "#PWR?" H 6270 1700 50  0001 C CNN
F 1 "GND_USB" H 6270 1810 50  0000 C CNN
F 2 "" H 6270 1950 50  0001 C CNN
F 3 "" H 6270 1950 50  0001 C CNN
	1    6270 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 1500 6270 1500
Wire Wire Line
	6270 1500 6270 1950
$Comp
L Custom_Library:R_Custom R?
U 1 1 5BB17511
P 3430 1360
AR Path="/5BAAE1F3/5BB17511" Ref="R?"  Part="1" 
AR Path="/5BAAE1DC/5BB17511" Ref="R?"  Part="1" 
AR Path="/5CAD2DA3/5BB17511" Ref="R?"  Part="1" 
F 0 "R?" H 3370 1360 50  0000 R CNN
F 1 "10k" V 3430 1360 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 3430 1360 50  0001 C CNN
F 3 "" H 3430 1360 50  0001 C CNN
F 4 "0603" H 3620 1440 50  0000 C CNN "display_footprint"
F 5 "1%" H 3610 1360 50  0000 C CNN "Tolerance"
F 6 "1/10W" H 3640 1290 50  0000 C CNN "Wattage"
F 7 "RMCF0603FT10K0CT-ND" H 3730 1760 60  0001 C CNN "Digi-Key PN"
	1    3430 1360
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5BB17551
P 4100 1360
AR Path="/5BAAE1F3/5BB17551" Ref="R?"  Part="1" 
AR Path="/5BAAE1DC/5BB17551" Ref="R?"  Part="1" 
AR Path="/5CAD2DA3/5BB17551" Ref="R?"  Part="1" 
F 0 "R?" H 4040 1360 50  0000 R CNN
F 1 "10k" V 4100 1360 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 4100 1360 50  0001 C CNN
F 3 "" H 4100 1360 50  0001 C CNN
F 4 "0603" H 4290 1440 50  0000 C CNN "display_footprint"
F 5 "1%" H 4280 1360 50  0000 C CNN "Tolerance"
F 6 "1/10W" H 4310 1290 50  0000 C CNN "Wattage"
F 7 "RMCF0603FT10K0CT-ND" H 4400 1760 60  0001 C CNN "Digi-Key PN"
	1    4100 1360
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5BB1788F
P 6880 1260
AR Path="/5BAAE1F3/5BB1788F" Ref="R?"  Part="1" 
AR Path="/5BAAE1DC/5BB1788F" Ref="R?"  Part="1" 
AR Path="/5CAD2DA3/5BB1788F" Ref="R?"  Part="1" 
F 0 "R?" H 6820 1260 50  0000 R CNN
F 1 "10k" V 6880 1260 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6880 1260 50  0001 C CNN
F 3 "" H 6880 1260 50  0001 C CNN
F 4 "0603" H 7070 1340 50  0000 C CNN "display_footprint"
F 5 "1%" H 7060 1260 50  0000 C CNN "Tolerance"
F 6 "1/10W" H 7090 1190 50  0000 C CNN "Wattage"
F 7 "RMCF0603FT10K0CT-ND" H 7180 1660 60  0001 C CNN "Digi-Key PN"
	1    6880 1260
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5BB1789A
P 7570 1260
AR Path="/5BAAE1F3/5BB1789A" Ref="R?"  Part="1" 
AR Path="/5BAAE1DC/5BB1789A" Ref="R?"  Part="1" 
AR Path="/5CAD2DA3/5BB1789A" Ref="R?"  Part="1" 
F 0 "R?" H 7510 1260 50  0000 R CNN
F 1 "10k" V 7570 1260 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7570 1260 50  0001 C CNN
F 3 "" H 7570 1260 50  0001 C CNN
F 4 "0603" H 7760 1340 50  0000 C CNN "display_footprint"
F 5 "1%" H 7750 1260 50  0000 C CNN "Tolerance"
F 6 "1/10W" H 7780 1190 50  0000 C CNN "Wattage"
F 7 "RMCF0603FT10K0CT-ND" H 7870 1660 60  0001 C CNN "Digi-Key PN"
	1    7570 1260
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5BB18B68
P 4420 2930
F 0 "C?" H 4445 3030 50  0000 L CNN
F 1 "0.1uF" H 4445 2830 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4458 2780 50  0001 C CNN
F 3 "" H 4445 3030 50  0001 C CNN
F 4 "0603" H 4270 3030 50  0000 R CNN "display_footprint"
F 5 "50V" H 4270 2930 50  0000 R CNN "Voltage"
F 6 "X7R" H 4270 2830 50  0000 R CNN "Dielectric"
F 7 "311-1344-1-ND" H 4845 3430 60  0001 C CNN "Digi-Key PN"
	1    4420 2930
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5BB18CF0
P 6570 2930
F 0 "C?" H 6595 3030 50  0000 L CNN
F 1 "0.1uF" H 6595 2830 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6608 2780 50  0001 C CNN
F 3 "" H 6595 3030 50  0001 C CNN
F 4 "0603" H 6420 3030 50  0000 R CNN "display_footprint"
F 5 "50V" H 6420 2930 50  0000 R CNN "Voltage"
F 6 "X7R" H 6420 2830 50  0000 R CNN "Dielectric"
F 7 "311-1344-1-ND" H 6995 3430 60  0001 C CNN "Digi-Key PN"
	1    6570 2930
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BB18D76
P 4420 3080
F 0 "#PWR?" H 4420 2830 50  0001 C CNN
F 1 "GND" H 4420 2930 50  0000 C CNN
F 2 "" H 4420 3080 50  0001 C CNN
F 3 "" H 4420 3080 50  0001 C CNN
	1    4420 3080
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+5V_USB #PWR?
U 1 1 5BB18EFD
P 6570 2780
AR Path="/5BAAE1F3/5BB18EFD" Ref="#PWR?"  Part="1" 
AR Path="/5BAAE1DC/5BB18EFD" Ref="#PWR?"  Part="1" 
AR Path="/5CAD2DA3/5BB18EFD" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6570 2630 50  0001 C CNN
F 1 "+5V_USB" H 6570 2920 50  0000 C CNN
F 2 "" H 6570 2780 50  0001 C CNN
F 3 "" H 6570 2780 50  0001 C CNN
	1    6570 2780
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:GND_USB #PWR?
U 1 1 5BB18F1A
P 6570 3080
F 0 "#PWR?" H 6570 2830 50  0001 C CNN
F 1 "GND_USB" H 6570 2930 50  0000 C CNN
F 2 "" H 6570 3080 50  0001 C CNN
F 3 "" H 6570 3080 50  0001 C CNN
	1    6570 3080
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5BB19187
P 5500 3130
F 0 "C?" V 6024 3130 50  0000 C CNN
F 1 "0.56uF" V 5933 3130 50  0000 C CNN
F 2 "Capacitors_SMD:C_2220" H 5538 2980 50  0001 C CNN
F 3 "" H 5525 3230 50  0001 C CNN
F 4 "565-4707-1-ND" H 5925 3630 60  0001 C CNN "Digi-Key PN"
F 5 "2220" V 5842 3130 50  0000 C CNN "display_footprint"
F 6 "250VAC" V 5751 3130 50  0000 C CNN "Voltage"
F 7 "X7R" V 5660 3130 50  0000 C CNN "Dielectric"
	1    5500 3130
	0    -1   -1   0   
$EndComp
$Comp
L Custom_Library:GND_USB #PWR?
U 1 1 5BB196CB
P 5950 3200
F 0 "#PWR?" H 5950 2950 50  0001 C CNN
F 1 "GND_USB" H 5950 3050 50  0000 C CNN
F 2 "" H 5950 3200 50  0001 C CNN
F 3 "" H 5950 3200 50  0001 C CNN
	1    5950 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BB196EC
P 5010 3200
F 0 "#PWR?" H 5010 2950 50  0001 C CNN
F 1 "GND" H 5010 3050 50  0000 C CNN
F 2 "" H 5010 3200 50  0001 C CNN
F 3 "" H 5010 3200 50  0001 C CNN
	1    5010 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5010 3200 5010 3130
Wire Wire Line
	5010 3130 5350 3130
Wire Wire Line
	5650 3130 5950 3130
Wire Wire Line
	5950 3130 5950 3200
$Comp
L Isolator:ISO7321C U?
U 1 1 5BB4118F
P 5500 1600
F 0 "U?" H 5500 2025 50  0000 C CNN
F 1 "ISO7321C" H 5500 1950 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 5500 1250 50  0001 C CIN
F 3 "http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=iso7321c&fileType=pdf" H 5500 1600 50  0001 C CNN
F 4 "296-42102-1-ND" H -20 -1770 50  0001 C CNN "Digi-Key PN"
	1    5500 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5BBE892D
P 4420 2780
F 0 "#PWR?" H 4420 2630 50  0001 C CNN
F 1 "+3.3V" H 4420 2920 50  0000 C CNN
F 2 "" H 4420 2780 50  0001 C CNN
F 3 "" H 4420 2780 50  0001 C CNN
	1    4420 2780
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5BBE896C
P 4690 1240
F 0 "#PWR?" H 4690 1090 50  0001 C CNN
F 1 "+3.3V" H 4690 1380 50  0000 C CNN
F 2 "" H 4690 1240 50  0001 C CNN
F 3 "" H 4690 1240 50  0001 C CNN
	1    4690 1240
	1    0    0    -1  
$EndComp
Wire Wire Line
	2830 1700 3430 1700
Wire Wire Line
	2830 1800 4100 1800
Wire Wire Line
	5900 1800 6880 1800
$Comp
L Custom_Library:+5V_USB #PWR?
U 1 1 5BC8FC49
P 6880 1110
AR Path="/5BAAE1F3/5BC8FC49" Ref="#PWR?"  Part="1" 
AR Path="/5BAAE1DC/5BC8FC49" Ref="#PWR?"  Part="1" 
AR Path="/5CAD2DA3/5BC8FC49" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6880 960 50  0001 C CNN
F 1 "+5V_USB" H 6880 1250 50  0000 C CNN
F 2 "" H 6880 1110 50  0001 C CNN
F 3 "" H 6880 1110 50  0001 C CNN
	1    6880 1110
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+5V_USB #PWR?
U 1 1 5BC8FC74
P 7570 1110
AR Path="/5BAAE1F3/5BC8FC74" Ref="#PWR?"  Part="1" 
AR Path="/5BAAE1DC/5BC8FC74" Ref="#PWR?"  Part="1" 
AR Path="/5CAD2DA3/5BC8FC74" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7570 960 50  0001 C CNN
F 1 "+5V_USB" H 7570 1250 50  0000 C CNN
F 2 "" H 7570 1110 50  0001 C CNN
F 3 "" H 7570 1110 50  0001 C CNN
	1    7570 1110
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5BC8FCA7
P 4100 1210
F 0 "#PWR?" H 4100 1060 50  0001 C CNN
F 1 "+3.3V" H 4100 1350 50  0000 C CNN
F 2 "" H 4100 1210 50  0001 C CNN
F 3 "" H 4100 1210 50  0001 C CNN
	1    4100 1210
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5BC8FCC2
P 3430 1210
F 0 "#PWR?" H 3430 1060 50  0001 C CNN
F 1 "+3.3V" H 3430 1350 50  0000 C CNN
F 2 "" H 3430 1210 50  0001 C CNN
F 3 "" H 3430 1210 50  0001 C CNN
	1    3430 1210
	1    0    0    -1  
$EndComp
Wire Wire Line
	3430 1510 3430 1700
Wire Wire Line
	4100 1510 4100 1800
Connection ~ 4100 1800
Wire Wire Line
	4100 1800 5100 1800
Wire Wire Line
	6880 1410 6880 1800
Connection ~ 6880 1800
Wire Wire Line
	6880 1800 8290 1800
Wire Wire Line
	7570 1410 7570 1700
Connection ~ 3430 1700
Wire Wire Line
	3430 1700 5100 1700
Connection ~ 7570 1700
Wire Wire Line
	7570 1700 8290 1700
Wire Wire Line
	5900 1700 7570 1700
$Comp
L Isolator:ISO1541 U?
U 1 1 5E070BDE
P 5500 4200
F 0 "U?" H 5250 4450 50  0000 C CNN
F 1 "ISO1541" H 5650 4450 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 5500 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/iso1541.pdf" H 5500 4250 50  0001 C CNN
F 4 "296-34872-1-ND" H 5500 4200 50  0001 C CNN "Digi-Key PN"
	1    5500 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E072B09
P 5020 4480
F 0 "#PWR?" H 5020 4230 50  0001 C CNN
F 1 "GND" H 5020 4330 50  0000 C CNN
F 2 "" H 5020 4480 50  0001 C CNN
F 3 "" H 5020 4480 50  0001 C CNN
	1    5020 4480
	1    0    0    -1  
$EndComp
Wire Wire Line
	5020 4480 5020 4400
Wire Wire Line
	5020 4400 5100 4400
$Comp
L power:+3.3V #PWR?
U 1 1 5E073757
P 5020 4020
F 0 "#PWR?" H 5020 3870 50  0001 C CNN
F 1 "+3.3V" H 5020 4160 50  0000 C CNN
F 2 "" H 5020 4020 50  0001 C CNN
F 3 "" H 5020 4020 50  0001 C CNN
	1    5020 4020
	1    0    0    -1  
$EndComp
Wire Wire Line
	5020 4020 5020 4100
Wire Wire Line
	5020 4100 5100 4100
$Comp
L Custom_Library:GND_USB #PWR?
U 1 1 5E07437A
P 5980 4480
F 0 "#PWR?" H 5980 4230 50  0001 C CNN
F 1 "GND_USB" H 5980 4330 50  0000 C CNN
F 2 "" H 5980 4480 50  0001 C CNN
F 3 "" H 5980 4480 50  0001 C CNN
	1    5980 4480
	1    0    0    -1  
$EndComp
Wire Wire Line
	5980 4480 5980 4400
Wire Wire Line
	5980 4400 5900 4400
$Comp
L Custom_Library:+5V_USB #PWR?
U 1 1 5E075176
P 5980 4020
F 0 "#PWR?" H 5980 3870 50  0001 C CNN
F 1 "+5V_USB" H 5980 4160 50  0000 C CNN
F 2 "" H 5980 4020 50  0001 C CNN
F 3 "" H 5980 4020 50  0001 C CNN
	1    5980 4020
	1    0    0    -1  
$EndComp
Wire Wire Line
	5980 4020 5980 4100
Wire Wire Line
	5980 4100 5900 4100
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E078108
P 6740 3970
AR Path="/5BAAE1F3/5E078108" Ref="R?"  Part="1" 
AR Path="/5BAAE1DC/5E078108" Ref="R?"  Part="1" 
AR Path="/5BAAE16C/5E078108" Ref="R?"  Part="1" 
AR Path="/5BB844FD/5E078108" Ref="R?"  Part="1" 
AR Path="/5C1D5CB6/5E078108" Ref="R?"  Part="1" 
AR Path="/5CB0BC26/5E078108" Ref="R?"  Part="1" 
AR Path="/5E0CF7BC/5E078108" Ref="R?"  Part="1" 
AR Path="/5CAD2DA3/5E078108" Ref="R?"  Part="1" 
F 0 "R?" H 6680 3970 50  0000 R CNN
F 1 "10k" V 6740 3970 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6740 3970 50  0001 C CNN
F 3 "" H 6740 3970 50  0001 C CNN
F 4 "0603" H 6930 4050 50  0000 C CNN "display_footprint"
F 5 "1%" H 6920 3970 50  0000 C CNN "Tolerance"
F 6 "1/10W" H 6950 3900 50  0000 C CNN "Wattage"
F 7 "RMCF0603FT10K0CT-ND" H 7040 4370 60  0001 C CNN "Digi-Key PN"
	1    6740 3970
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E078112
P 7320 3970
AR Path="/5BAAE1F3/5E078112" Ref="R?"  Part="1" 
AR Path="/5BAAE1DC/5E078112" Ref="R?"  Part="1" 
AR Path="/5BAAE16C/5E078112" Ref="R?"  Part="1" 
AR Path="/5BB844FD/5E078112" Ref="R?"  Part="1" 
AR Path="/5C1D5CB6/5E078112" Ref="R?"  Part="1" 
AR Path="/5CB0BC26/5E078112" Ref="R?"  Part="1" 
AR Path="/5E0CF7BC/5E078112" Ref="R?"  Part="1" 
AR Path="/5CAD2DA3/5E078112" Ref="R?"  Part="1" 
F 0 "R?" H 7260 3970 50  0000 R CNN
F 1 "10k" V 7320 3970 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7320 3970 50  0001 C CNN
F 3 "" H 7320 3970 50  0001 C CNN
F 4 "0603" H 7510 4050 50  0000 C CNN "display_footprint"
F 5 "1%" H 7500 3970 50  0000 C CNN "Tolerance"
F 6 "1/10W" H 7530 3900 50  0000 C CNN "Wattage"
F 7 "RMCF0603FT10K0CT-ND" H 7620 4370 60  0001 C CNN "Digi-Key PN"
	1    7320 3970
	-1   0    0    -1  
$EndComp
Text GLabel 5100 4200 0    50   BiDi ~ 0
I2C_SDA
Text GLabel 5100 4300 0    50   Input ~ 0
I2C_SCL
Wire Wire Line
	7660 4200 7320 4200
Wire Wire Line
	7660 4300 6740 4300
Wire Wire Line
	7320 4120 7320 4200
Connection ~ 7320 4200
Wire Wire Line
	6740 4120 6740 4300
Connection ~ 6740 4300
Wire Wire Line
	5900 4200 7320 4200
Wire Wire Line
	5900 4300 6740 4300
$Comp
L Custom_Library:+5V_USB #PWR?
U 1 1 5E07E764
P 6740 3820
F 0 "#PWR?" H 6740 3670 50  0001 C CNN
F 1 "+5V_USB" H 6740 3960 50  0000 C CNN
F 2 "" H 6740 3820 50  0001 C CNN
F 3 "" H 6740 3820 50  0001 C CNN
	1    6740 3820
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+5V_USB #PWR?
U 1 1 5E07EB59
P 7320 3820
F 0 "#PWR?" H 7320 3670 50  0001 C CNN
F 1 "+5V_USB" H 7320 3960 50  0000 C CNN
F 2 "" H 7320 3820 50  0001 C CNN
F 3 "" H 7320 3820 50  0001 C CNN
	1    7320 3820
	1    0    0    -1  
$EndComp
Text GLabel 7660 4300 2    50   Output ~ 0
I2C_USB_SCL
Text GLabel 7660 4200 2    50   BiDi ~ 0
I2C_USB_SDA
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E091062
P 4420 5170
F 0 "C?" H 4445 5270 50  0000 L CNN
F 1 "0.1uF" H 4445 5070 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4458 5020 50  0001 C CNN
F 3 "" H 4445 5270 50  0001 C CNN
F 4 "0603" H 4270 5270 50  0000 R CNN "display_footprint"
F 5 "50V" H 4270 5170 50  0000 R CNN "Voltage"
F 6 "X7R" H 4270 5070 50  0000 R CNN "Dielectric"
F 7 "311-1344-1-ND" H 4845 5670 60  0001 C CNN "Digi-Key PN"
	1    4420 5170
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E09106C
P 6570 5170
F 0 "C?" H 6595 5270 50  0000 L CNN
F 1 "0.1uF" H 6595 5070 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6608 5020 50  0001 C CNN
F 3 "" H 6595 5270 50  0001 C CNN
F 4 "0603" H 6420 5270 50  0000 R CNN "display_footprint"
F 5 "50V" H 6420 5170 50  0000 R CNN "Voltage"
F 6 "X7R" H 6420 5070 50  0000 R CNN "Dielectric"
F 7 "311-1344-1-ND" H 6995 5670 60  0001 C CNN "Digi-Key PN"
	1    6570 5170
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E091072
P 4420 5320
F 0 "#PWR?" H 4420 5070 50  0001 C CNN
F 1 "GND" H 4420 5170 50  0000 C CNN
F 2 "" H 4420 5320 50  0001 C CNN
F 3 "" H 4420 5320 50  0001 C CNN
	1    4420 5320
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+5V_USB #PWR?
U 1 1 5E091078
P 6570 5020
AR Path="/5BAAE1F3/5E091078" Ref="#PWR?"  Part="1" 
AR Path="/5BAAE1DC/5E091078" Ref="#PWR?"  Part="1" 
AR Path="/5CAD2DA3/5E091078" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6570 4870 50  0001 C CNN
F 1 "+5V_USB" H 6570 5160 50  0000 C CNN
F 2 "" H 6570 5020 50  0001 C CNN
F 3 "" H 6570 5020 50  0001 C CNN
	1    6570 5020
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:GND_USB #PWR?
U 1 1 5E09107E
P 6570 5320
F 0 "#PWR?" H 6570 5070 50  0001 C CNN
F 1 "GND_USB" H 6570 5170 50  0000 C CNN
F 2 "" H 6570 5320 50  0001 C CNN
F 3 "" H 6570 5320 50  0001 C CNN
	1    6570 5320
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E09109E
P 4420 5020
F 0 "#PWR?" H 4420 4870 50  0001 C CNN
F 1 "+3.3V" H 4420 5160 50  0000 C CNN
F 2 "" H 4420 5020 50  0001 C CNN
F 3 "" H 4420 5020 50  0001 C CNN
	1    4420 5020
	1    0    0    -1  
$EndComp
$Comp
L Isolator:TLP185xSE U?
U 1 1 5E0AA033
P 5500 6100
F 0 "U?" H 5300 6300 50  0000 L CNN
F 1 "TLP185xSE" H 5300 5900 50  0000 L CNN
F 2 "Package_SO:SOIC-4_4.55x3.7mm_P2.54mm" H 5500 5800 50  0001 C CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=14111&prodName=TLP185(SE" H 5500 6100 50  0001 L CNN
	1    5500 6100
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0AC2FC
P 5120 6280
F 0 "#PWR?" H 5120 6030 50  0001 C CNN
F 1 "GND" H 5120 6130 50  0000 C CNN
F 2 "" H 5120 6280 50  0001 C CNN
F 3 "" H 5120 6280 50  0001 C CNN
	1    5120 6280
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E0ADD6E
P 5120 5660
AR Path="/5BAAE1F3/5E0ADD6E" Ref="R?"  Part="1" 
AR Path="/5BAAE1DC/5E0ADD6E" Ref="R?"  Part="1" 
AR Path="/5BAAE16C/5E0ADD6E" Ref="R?"  Part="1" 
AR Path="/5BB844FD/5E0ADD6E" Ref="R?"  Part="1" 
AR Path="/5C1D5CB6/5E0ADD6E" Ref="R?"  Part="1" 
AR Path="/5CB0BC26/5E0ADD6E" Ref="R?"  Part="1" 
AR Path="/5E0CF7BC/5E0ADD6E" Ref="R?"  Part="1" 
AR Path="/5CAD2DA3/5E0ADD6E" Ref="R?"  Part="1" 
F 0 "R?" H 5060 5660 50  0000 R CNN
F 1 "10k" V 5120 5660 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 5120 5660 50  0001 C CNN
F 3 "" H 5120 5660 50  0001 C CNN
F 4 "0603" H 5310 5740 50  0000 C CNN "display_footprint"
F 5 "1%" H 5300 5660 50  0000 C CNN "Tolerance"
F 6 "1/10W" H 5330 5590 50  0000 C CNN "Wattage"
F 7 "RMCF0603FT10K0CT-ND" H 5420 6060 60  0001 C CNN "Digi-Key PN"
	1    5120 5660
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E0AF637
P 5120 5510
F 0 "#PWR?" H 5120 5360 50  0001 C CNN
F 1 "+3.3V" H 5120 5650 50  0000 C CNN
F 2 "" H 5120 5510 50  0001 C CNN
F 3 "" H 5120 5510 50  0001 C CNN
	1    5120 5510
	1    0    0    -1  
$EndComp
Wire Wire Line
	5120 6280 5120 6200
Wire Wire Line
	5120 6200 5200 6200
Wire Wire Line
	5200 6000 5120 6000
Wire Wire Line
	5120 6000 5120 5810
Text GLabel 4800 6000 0    50   Output ~ 0
~USB_Detect
Wire Wire Line
	4800 6000 5120 6000
Connection ~ 5120 6000
$Comp
L Custom_Library:+5V_USB #PWR?
U 1 1 5E0BA4BC
P 5880 5510
AR Path="/5BAAE1F3/5E0BA4BC" Ref="#PWR?"  Part="1" 
AR Path="/5BAAE1DC/5E0BA4BC" Ref="#PWR?"  Part="1" 
AR Path="/5CAD2DA3/5E0BA4BC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5880 5360 50  0001 C CNN
F 1 "+5V_USB" H 5880 5650 50  0000 C CNN
F 2 "" H 5880 5510 50  0001 C CNN
F 3 "" H 5880 5510 50  0001 C CNN
	1    5880 5510
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E0B8E79
P 5880 5660
AR Path="/5A0BC776/5E0B8E79" Ref="R?"  Part="1" 
AR Path="/5CAD2DA3/5E0B8E79" Ref="R?"  Part="1" 
F 0 "R?" H 5820 5660 50  0000 R CNN
F 1 "1k" V 5880 5660 50  0000 C CNN
F 2 "" H 5880 5660 50  0001 C CNN
F 3 "" H 5880 5660 50  0001 C CNN
F 4 "0603" H 5950 5710 50  0000 L CNN "display_footprint"
F 5 "1%" H 5950 5620 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 5950 5530 50  0000 L CNN "Wattage"
F 7 "PN" H 6180 6060 60  0001 C CNN "Digi-Key PN"
	1    5880 5660
	1    0    0    -1  
$EndComp
Wire Wire Line
	5880 6000 5800 6000
Wire Wire Line
	5880 5810 5880 6000
Wire Wire Line
	6390 6200 5800 6200
$Comp
L Custom_Library:+5V_USB #PWR?
U 1 1 5E1C71F0
P 6640 6100
AR Path="/5BAAE1F3/5E1C71F0" Ref="#PWR?"  Part="1" 
AR Path="/5BAAE1DC/5E1C71F0" Ref="#PWR?"  Part="1" 
AR Path="/5CAD2DA3/5E1C71F0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6640 5950 50  0001 C CNN
F 1 "+5V_USB" H 6640 6240 50  0000 C CNN
F 2 "" H 6640 6100 50  0001 C CNN
F 3 "" H 6640 6100 50  0001 C CNN
	1    6640 6100
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:GND_USB #PWR?
U 1 1 5E1C7C26
P 6640 6300
F 0 "#PWR?" H 6640 6050 50  0001 C CNN
F 1 "GND_USB" H 6640 6150 50  0000 C CNN
F 2 "" H 6640 6300 50  0001 C CNN
F 3 "" H 6640 6300 50  0001 C CNN
	1    6640 6300
	1    0    0    -1  
$EndComp
Text GLabel 6940 6200 2    50   Input ~ 0
POS5_USB_PGOOD
$Comp
L Custom_Library:74LVC1G97_Power U?
U 7 1 5E2FCF1C
P 6640 6200
AR Path="/5CB7A8BC/5E2FCF1C" Ref="U?"  Part="7" 
AR Path="/5CAD2DA3/5E2FCF1C" Ref="U?"  Part="7" 
F 0 "U?" H 6700 6350 50  0000 L CNN
F 1 "74LVC1G97" H 6700 6050 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 6690 6200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74lvc1g97.pdf" H 6690 6200 50  0001 C CNN
	7    6640 6200
	-1   0    0    -1  
$EndComp
Text GLabel 2830 1800 0    50   Input ~ 0
USB_UART_TX
Text GLabel 2830 1700 0    50   Output ~ 0
USB_UART_RX
$EndSCHEMATC

EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 28 30
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
L Interface:TCA9803 U?
U 1 1 5E0D0101
P 5340 2250
AR Path="/5E0CF7BC/5E0D0101" Ref="U?"  Part="1" 
AR Path="/5CC31B3E/5E0D0101" Ref="U?"  Part="1" 
F 0 "U?" H 5040 2700 50  0000 L CNN
F 1 "TCA9803" H 5540 2700 50  0000 L CNN
F 2 "Package_SO:VSSOP-8_3.0x3.0mm_P0.65mm" H 6240 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tca9803.pdf" H 5040 2700 50  0001 C CNN
	1    5340 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0D0107
P 5340 2750
AR Path="/5E0CF7BC/5E0D0107" Ref="#PWR?"  Part="1" 
AR Path="/5CC31B3E/5E0D0107" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5340 2500 50  0001 C CNN
F 1 "GND" H 5340 2600 50  0000 C CNN
F 2 "" H 5340 2750 50  0001 C CNN
F 3 "" H 5340 2750 50  0001 C CNN
	1    5340 2750
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E0D0113
P 5240 1750
AR Path="/5E0CF7BC/5E0D0113" Ref="#PWR?"  Part="1" 
AR Path="/5CC31B3E/5E0D0113" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5240 1600 50  0001 C CNN
F 1 "+3.3V" H 5310 1890 50  0000 C CNN
F 2 "" H 5240 1750 50  0001 C CNN
F 3 "" H 5240 1750 50  0001 C CNN
	1    5240 1750
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E0D013D
P 4520 2580
AR Path="/5BAAE1F3/5E0D013D" Ref="R?"  Part="1" 
AR Path="/5BAAE1DC/5E0D013D" Ref="R?"  Part="1" 
AR Path="/5BAAE16C/5E0D013D" Ref="R?"  Part="1" 
AR Path="/5BB844FD/5E0D013D" Ref="R?"  Part="1" 
AR Path="/5C1D5CB6/5E0D013D" Ref="R?"  Part="1" 
AR Path="/5CB0BC26/5E0D013D" Ref="R?"  Part="1" 
AR Path="/5E0CF7BC/5E0D013D" Ref="R?"  Part="1" 
AR Path="/5CC31B3E/5E0D013D" Ref="R?"  Part="1" 
F 0 "R?" H 4460 2580 50  0000 R CNN
F 1 "10k" V 4520 2580 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 4520 2580 50  0001 C CNN
F 3 "" H 4520 2580 50  0001 C CNN
F 4 "0603" H 4710 2660 50  0000 C CNN "display_footprint"
F 5 "1%" H 4700 2580 50  0000 C CNN "Tolerance"
F 6 "1/10W" H 4730 2510 50  0000 C CNN "Wattage"
F 7 "RMCF0603FT10K0CT-ND" H 4820 2980 60  0001 C CNN "Digi-Key PN"
	1    4520 2580
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0D0143
P 4520 2730
AR Path="/5E0CF7BC/5E0D0143" Ref="#PWR?"  Part="1" 
AR Path="/5CC31B3E/5E0D0143" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4520 2480 50  0001 C CNN
F 1 "GND" H 4520 2580 50  0000 C CNN
F 2 "" H 4520 2730 50  0001 C CNN
F 3 "" H 4520 2730 50  0001 C CNN
	1    4520 2730
	1    0    0    -1  
$EndComp
Wire Wire Line
	4940 2350 4520 2350
Wire Wire Line
	4520 2350 4520 2430
Text GLabel 3600 2350 0    50   Input ~ 0
I2C_DSP_EN
Wire Wire Line
	3600 2350 4520 2350
Connection ~ 4520 2350
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E0D015C
P 5000 1030
AR Path="/5A0BC776/5E0D015C" Ref="C?"  Part="1" 
AR Path="/5E0CF7BC/5E0D015C" Ref="C?"  Part="1" 
AR Path="/5CC31B3E/5E0D015C" Ref="C?"  Part="1" 
F 0 "C?" H 5025 1130 50  0000 L CNN
F 1 "4.7uF" H 5025 930 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 5038 880 50  0001 C CNN
F 3 "" H 5025 1130 50  0001 C CNN
F 4 "0805" H 4850 1130 50  0000 R CNN "display_footprint"
F 5 "16V" H 4850 1030 50  0000 R CNN "Voltage"
F 6 "X7R" H 4850 930 50  0000 R CNN "Dielectric"
F 7 "1276-2970-1-ND" H -900 -3530 50  0001 C CNN "Digi-Key PN"
	1    5000 1030
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E0D0166
P 4300 1030
AR Path="/5CAD2D97/5E0D0166" Ref="C?"  Part="1" 
AR Path="/5E0CF7BC/5E0D0166" Ref="C?"  Part="1" 
AR Path="/5CC31B3E/5E0D0166" Ref="C?"  Part="1" 
F 0 "C?" H 4325 1130 50  0000 L CNN
F 1 "0.1uF" H 4325 930 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4338 880 50  0001 C CNN
F 3 "" H 4325 1130 50  0001 C CNN
F 4 "0603" H 4150 1130 50  0000 R CNN "display_footprint"
F 5 "50V" H 4150 1030 50  0000 R CNN "Voltage"
F 6 "X7R" H 4150 930 50  0000 R CNN "Dielectric"
F 7 "311-1344-1-ND" H 4725 1530 60  0001 C CNN "Digi-Key PN"
	1    4300 1030
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E0D0170
P 6400 1030
AR Path="/5A0BC776/5E0D0170" Ref="C?"  Part="1" 
AR Path="/5E0CF7BC/5E0D0170" Ref="C?"  Part="1" 
AR Path="/5CC31B3E/5E0D0170" Ref="C?"  Part="1" 
F 0 "C?" H 6425 1130 50  0000 L CNN
F 1 "4.7uF" H 6425 930 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 6438 880 50  0001 C CNN
F 3 "" H 6425 1130 50  0001 C CNN
F 4 "0805" H 6250 1130 50  0000 R CNN "display_footprint"
F 5 "16V" H 6250 1030 50  0000 R CNN "Voltage"
F 6 "X7R" H 6250 930 50  0000 R CNN "Dielectric"
F 7 "1276-2970-1-ND" H 500 -3530 50  0001 C CNN "Digi-Key PN"
	1    6400 1030
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E0D017A
P 5700 1030
AR Path="/5CAD2D97/5E0D017A" Ref="C?"  Part="1" 
AR Path="/5E0CF7BC/5E0D017A" Ref="C?"  Part="1" 
AR Path="/5CC31B3E/5E0D017A" Ref="C?"  Part="1" 
F 0 "C?" H 5725 1130 50  0000 L CNN
F 1 "0.1uF" H 5725 930 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5738 880 50  0001 C CNN
F 3 "" H 5725 1130 50  0001 C CNN
F 4 "0603" H 5550 1130 50  0000 R CNN "display_footprint"
F 5 "50V" H 5550 1030 50  0000 R CNN "Voltage"
F 6 "X7R" H 5550 930 50  0000 R CNN "Dielectric"
F 7 "311-1344-1-ND" H 6125 1530 60  0001 C CNN "Digi-Key PN"
	1    5700 1030
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E0D018C
P 4300 880
AR Path="/5E0CF7BC/5E0D018C" Ref="#PWR?"  Part="1" 
AR Path="/5CC31B3E/5E0D018C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4300 730 50  0001 C CNN
F 1 "+3.3V" H 4300 1020 50  0000 C CNN
F 2 "" H 4300 880 50  0001 C CNN
F 3 "" H 4300 880 50  0001 C CNN
	1    4300 880 
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E0D0192
P 5000 880
AR Path="/5E0CF7BC/5E0D0192" Ref="#PWR?"  Part="1" 
AR Path="/5CC31B3E/5E0D0192" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5000 730 50  0001 C CNN
F 1 "+3.3V" H 5000 1020 50  0000 C CNN
F 2 "" H 5000 880 50  0001 C CNN
F 3 "" H 5000 880 50  0001 C CNN
	1    5000 880 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0D0198
P 4300 1180
AR Path="/5E0CF7BC/5E0D0198" Ref="#PWR?"  Part="1" 
AR Path="/5CC31B3E/5E0D0198" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4300 930 50  0001 C CNN
F 1 "GND" H 4300 1030 50  0000 C CNN
F 2 "" H 4300 1180 50  0001 C CNN
F 3 "" H 4300 1180 50  0001 C CNN
	1    4300 1180
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0D019E
P 5000 1180
AR Path="/5E0CF7BC/5E0D019E" Ref="#PWR?"  Part="1" 
AR Path="/5CC31B3E/5E0D019E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5000 930 50  0001 C CNN
F 1 "GND" H 5000 1030 50  0000 C CNN
F 2 "" H 5000 1180 50  0001 C CNN
F 3 "" H 5000 1180 50  0001 C CNN
	1    5000 1180
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0D01A4
P 5700 1180
AR Path="/5E0CF7BC/5E0D01A4" Ref="#PWR?"  Part="1" 
AR Path="/5CC31B3E/5E0D01A4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5700 930 50  0001 C CNN
F 1 "GND" H 5700 1030 50  0000 C CNN
F 2 "" H 5700 1180 50  0001 C CNN
F 3 "" H 5700 1180 50  0001 C CNN
	1    5700 1180
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0D01AA
P 6400 1180
AR Path="/5E0CF7BC/5E0D01AA" Ref="#PWR?"  Part="1" 
AR Path="/5CC31B3E/5E0D01AA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6400 930 50  0001 C CNN
F 1 "GND" H 6400 1030 50  0000 C CNN
F 2 "" H 6400 1180 50  0001 C CNN
F 3 "" H 6400 1180 50  0001 C CNN
	1    6400 1180
	1    0    0    -1  
$EndComp
Text GLabel 3600 2250 0    50   BiDi ~ 0
I2C_SDA
Text GLabel 3600 2150 0    50   Input ~ 0
I2C_SCL
Wire Wire Line
	3600 2150 3940 2150
Wire Wire Line
	3600 2250 4520 2250
Wire Wire Line
	3940 2070 3940 2150
Connection ~ 3940 2150
Wire Wire Line
	3940 2150 4940 2150
Wire Wire Line
	4520 2070 4520 2250
Connection ~ 4520 2250
Wire Wire Line
	4520 2250 4940 2250
$Comp
L power:+3.3V #PWR?
U 1 1 5E0D01CC
P 4520 1770
AR Path="/5E0CF7BC/5E0D01CC" Ref="#PWR?"  Part="1" 
AR Path="/5CC31B3E/5E0D01CC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4520 1620 50  0001 C CNN
F 1 "+3.3V" H 4520 1910 50  0000 C CNN
F 2 "" H 4520 1770 50  0001 C CNN
F 3 "" H 4520 1770 50  0001 C CNN
	1    4520 1770
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E0D01D2
P 3940 1770
AR Path="/5E0CF7BC/5E0D01D2" Ref="#PWR?"  Part="1" 
AR Path="/5CC31B3E/5E0D01D2" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3940 1620 50  0001 C CNN
F 1 "+3.3V" H 3940 1910 50  0000 C CNN
F 2 "" H 3940 1770 50  0001 C CNN
F 3 "" H 3940 1770 50  0001 C CNN
	1    3940 1770
	-1   0    0    -1  
$EndComp
Text GLabel 7080 2250 2    50   Output ~ 0
I2C_DSP_SDA
Text GLabel 7080 2150 2    50   Output ~ 0
I2C_DSP_SCL
Wire Wire Line
	7080 2150 6740 2150
Wire Wire Line
	7080 2250 6160 2250
Wire Wire Line
	6740 2070 6740 2150
Connection ~ 6740 2150
Wire Wire Line
	6740 2150 5740 2150
Wire Wire Line
	6160 2070 6160 2250
Connection ~ 6160 2250
Wire Wire Line
	6160 2250 5740 2250
$Comp
L power:+5V #PWR?
U 1 1 5E0E5BB2
P 5440 1750
F 0 "#PWR?" H 5440 1600 50  0001 C CNN
F 1 "+5V" H 5440 1890 50  0000 C CNN
F 2 "" H 5440 1750 50  0001 C CNN
F 3 "" H 5440 1750 50  0001 C CNN
	1    5440 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E0E5F7B
P 6160 1770
F 0 "#PWR?" H 6160 1620 50  0001 C CNN
F 1 "+5V" H 6160 1910 50  0000 C CNN
F 2 "" H 6160 1770 50  0001 C CNN
F 3 "" H 6160 1770 50  0001 C CNN
	1    6160 1770
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E0E632C
P 6740 1770
F 0 "#PWR?" H 6740 1620 50  0001 C CNN
F 1 "+5V" H 6740 1910 50  0000 C CNN
F 2 "" H 6740 1770 50  0001 C CNN
F 3 "" H 6740 1770 50  0001 C CNN
	1    6740 1770
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E0E66C7
P 5700 880
F 0 "#PWR?" H 5700 730 50  0001 C CNN
F 1 "+5V" H 5700 1020 50  0000 C CNN
F 2 "" H 5700 880 50  0001 C CNN
F 3 "" H 5700 880 50  0001 C CNN
	1    5700 880 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E0E6A6D
P 6400 880
F 0 "#PWR?" H 6400 730 50  0001 C CNN
F 1 "+5V" H 6400 1020 50  0000 C CNN
F 2 "" H 6400 880 50  0001 C CNN
F 3 "" H 6400 880 50  0001 C CNN
	1    6400 880 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E123BF1
P 5360 5140
AR Path="/5BAAE2B6/5E123BF1" Ref="#PWR?"  Part="1" 
AR Path="/5BB6CF6D/5E123BF1" Ref="#PWR?"  Part="1" 
AR Path="/5BBE424C/5E123BF1" Ref="#PWR?"  Part="1" 
AR Path="/5CB8A16A/5E123BF1" Ref="#PWR?"  Part="1" 
AR Path="/5CC31B3E/5E123BF1" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5360 4890 50  0001 C CNN
F 1 "GND" H 5360 4990 50  0000 C CNN
F 2 "" H 5360 5140 50  0001 C CNN
F 3 "" H 5360 5140 50  0001 C CNN
	1    5360 5140
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E123BFE
P 2380 5210
AR Path="/5BAAE16C/5E123BFE" Ref="C?"  Part="1" 
AR Path="/5BB6CF6D/5E123BFE" Ref="C?"  Part="1" 
AR Path="/5BBE424C/5E123BFE" Ref="C?"  Part="1" 
AR Path="/5CB8A16A/5E123BFE" Ref="C?"  Part="1" 
AR Path="/5CC31B3E/5E123BFE" Ref="C?"  Part="1" 
F 0 "C?" H 2405 5310 50  0000 L CNN
F 1 "0.1uF" H 2405 5110 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2418 5060 50  0001 C CNN
F 3 "" H 2405 5310 50  0001 C CNN
F 4 "0603" H 2230 5310 50  0000 R CNN "display_footprint"
F 5 "50V" H 2230 5210 50  0000 R CNN "Voltage"
F 6 "X7R" H 2230 5110 50  0000 R CNN "Dielectric"
F 7 "311-1344-1-ND" H 2805 5710 60  0001 C CNN "Digi-Key PN"
	1    2380 5210
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E123C08
P 2680 5210
AR Path="/5BAAE16C/5E123C08" Ref="C?"  Part="1" 
AR Path="/5BB6CF6D/5E123C08" Ref="C?"  Part="1" 
AR Path="/5BBE424C/5E123C08" Ref="C?"  Part="1" 
AR Path="/5CB8A16A/5E123C08" Ref="C?"  Part="1" 
AR Path="/5CC31B3E/5E123C08" Ref="C?"  Part="1" 
F 0 "C?" H 2705 5310 50  0000 L CNN
F 1 "10nF" H 2705 5110 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2718 5060 50  0001 C CNN
F 3 "" H 2705 5310 50  0001 C CNN
F 4 "0603" H 2530 5310 50  0001 R CNN "display_footprint"
F 5 "50V" H 2530 5210 50  0001 R CNN "Voltage"
F 6 "X7R" H 2530 5110 50  0001 R CNN "Dielectric"
F 7 "1276-1921-1-ND" H 3105 5710 60  0001 C CNN "Digi-Key PN"
	1    2680 5210
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E123C12
P 2980 5210
AR Path="/5BAAE16C/5E123C12" Ref="C?"  Part="1" 
AR Path="/5BB6CF6D/5E123C12" Ref="C?"  Part="1" 
AR Path="/5BBE424C/5E123C12" Ref="C?"  Part="1" 
AR Path="/5CB8A16A/5E123C12" Ref="C?"  Part="1" 
AR Path="/5CC31B3E/5E123C12" Ref="C?"  Part="1" 
F 0 "C?" H 3005 5310 50  0000 L CNN
F 1 "1nF" H 3005 5110 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3018 5060 50  0001 C CNN
F 3 "" H 3005 5310 50  0001 C CNN
F 4 "0603" H 2830 5310 50  0001 R CNN "display_footprint"
F 5 "50V" H 2830 5210 50  0001 R CNN "Voltage"
F 6 "X7R" H 2830 5110 50  0001 R CNN "Dielectric"
F 7 "1276-1018-1-ND" H 3405 5710 60  0001 C CNN "Digi-Key PN"
	1    2980 5210
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E123C18
P 2680 5440
AR Path="/5BAAE16C/5E123C18" Ref="#PWR?"  Part="1" 
AR Path="/5BB6CF6D/5E123C18" Ref="#PWR?"  Part="1" 
AR Path="/5BBE424C/5E123C18" Ref="#PWR?"  Part="1" 
AR Path="/5CB8A16A/5E123C18" Ref="#PWR?"  Part="1" 
AR Path="/5CC31B3E/5E123C18" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2680 5190 50  0001 C CNN
F 1 "GND" H 2680 5290 50  0000 C CNN
F 2 "" H 2680 5440 50  0001 C CNN
F 3 "" H 2680 5440 50  0001 C CNN
	1    2680 5440
	1    0    0    -1  
$EndComp
Wire Wire Line
	2680 5440 2680 5400
Wire Wire Line
	2680 5400 2380 5400
Wire Wire Line
	2380 5400 2380 5360
Connection ~ 2680 5400
Wire Wire Line
	2680 5400 2680 5360
Wire Wire Line
	2680 5400 2980 5400
Wire Wire Line
	2980 5400 2980 5360
Wire Wire Line
	2680 4980 2680 5020
Wire Wire Line
	2380 5060 2380 5020
Wire Wire Line
	2380 5020 2680 5020
Wire Wire Line
	2980 5020 2980 5060
Connection ~ 2680 5020
Wire Wire Line
	2680 5020 2680 5060
Wire Wire Line
	2680 5020 2980 5020
$Comp
L power:+3.3V #PWR?
U 1 1 5E123C38
P 5940 3310
AR Path="/5BAAE2B6/5E123C38" Ref="#PWR?"  Part="1" 
AR Path="/5BB6CF6D/5E123C38" Ref="#PWR?"  Part="1" 
AR Path="/5BBE424C/5E123C38" Ref="#PWR?"  Part="1" 
AR Path="/5CB8A16A/5E123C38" Ref="#PWR?"  Part="1" 
AR Path="/5CC31B3E/5E123C38" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5940 3160 50  0001 C CNN
F 1 "+3.3V" H 5940 3450 50  0000 C CNN
F 2 "" H 5940 3310 50  0001 C CNN
F 3 "" H 5940 3310 50  0001 C CNN
	1    5940 3310
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E123C42
P 5940 3460
AR Path="/5BAAE2B6/5E123C42" Ref="R?"  Part="1" 
AR Path="/5BB6CF6D/5E123C42" Ref="R?"  Part="1" 
AR Path="/5BBE424C/5E123C42" Ref="R?"  Part="1" 
AR Path="/5CB8A16A/5E123C42" Ref="R?"  Part="1" 
AR Path="/5CC31B3E/5E123C42" Ref="R?"  Part="1" 
F 0 "R?" H 5880 3460 50  0000 R CNN
F 1 "10K" V 5940 3460 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 5940 3460 50  0001 C CNN
F 3 "" H 5940 3460 50  0001 C CNN
F 4 "0603" H 6010 3550 50  0001 L CNN "display_footprint"
F 5 "1%" H 6010 3460 50  0001 L CNN "Tolerance"
F 6 "1/10W" H 6010 3380 50  0001 L CNN "Wattage"
F 7 "RMCF0603FT10K0CT-ND" H 6240 3860 60  0001 C CNN "Digi-Key PN"
	1    5940 3460
	1    0    0    -1  
$EndComp
Text GLabel 7910 4740 2    40   Input ~ 0
~IO_Level_Shift_Enable
Wire Wire Line
	2810 4240 4000 4240
Wire Wire Line
	2810 4140 3900 4140
Wire Wire Line
	2810 4040 3800 4040
Wire Wire Line
	2810 3940 3700 3940
Wire Wire Line
	2810 3840 3600 3840
$Comp
L Device:R_Pack08 RN?
U 1 1 5E123C6E
P 4000 5140
AR Path="/5CB8A16A/5E123C6E" Ref="RN?"  Part="1" 
AR Path="/5CC31B3E/5E123C6E" Ref="RN?"  Part="1" 
F 0 "RN?" H 4390 5050 50  0000 L CNN
F 1 "10k" H 4390 5150 50  0000 L CNN
F 2 "Resistors_SMD:R_Array_Convex_8x0602" V 4475 5140 50  0001 C CNN
F 3 "~" H 4000 5140 50  0001 C CNN
F 4 "Y1103CT-ND" H 4000 5140 50  0001 C CNN "Digi-Key PN"
	1    4000 5140
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 4940 3600 3840
Connection ~ 3600 3840
Wire Wire Line
	3600 3840 4860 3840
Wire Wire Line
	3700 4940 3700 3940
Connection ~ 3700 3940
Wire Wire Line
	3700 3940 4860 3940
Wire Wire Line
	3800 4940 3800 4040
Connection ~ 3800 4040
Wire Wire Line
	3800 4040 4860 4040
Wire Wire Line
	3900 4940 3900 4140
Connection ~ 3900 4140
Wire Wire Line
	3900 4140 4860 4140
Wire Wire Line
	4000 4940 4000 4240
Connection ~ 4000 4240
Wire Wire Line
	4000 4240 4860 4240
$Comp
L power:GND #PWR?
U 1 1 5E123C8C
P 3950 5420
AR Path="/5BAAE2B6/5E123C8C" Ref="#PWR?"  Part="1" 
AR Path="/5BB6CF6D/5E123C8C" Ref="#PWR?"  Part="1" 
AR Path="/5BBE424C/5E123C8C" Ref="#PWR?"  Part="1" 
AR Path="/5CB8A16A/5E123C8C" Ref="#PWR?"  Part="1" 
AR Path="/5CC31B3E/5E123C8C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3950 5170 50  0001 C CNN
F 1 "GND" H 3950 5270 50  0000 C CNN
F 2 "" H 3950 5420 50  0001 C CNN
F 3 "" H 3950 5420 50  0001 C CNN
	1    3950 5420
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 5420 3950 5380
Wire Wire Line
	3950 5380 3900 5380
Wire Wire Line
	3600 5380 3600 5340
Wire Wire Line
	3950 5380 4000 5380
Wire Wire Line
	4300 5380 4300 5340
Connection ~ 3950 5380
Wire Wire Line
	4200 5340 4200 5380
Connection ~ 4200 5380
Wire Wire Line
	4200 5380 4300 5380
Wire Wire Line
	4100 5340 4100 5380
Connection ~ 4100 5380
Wire Wire Line
	4100 5380 4200 5380
Wire Wire Line
	4000 5340 4000 5380
Connection ~ 4000 5380
Wire Wire Line
	4000 5380 4100 5380
Wire Wire Line
	3900 5340 3900 5380
Connection ~ 3900 5380
Wire Wire Line
	3900 5380 3800 5380
Wire Wire Line
	3800 5340 3800 5380
Connection ~ 3800 5380
Wire Wire Line
	3800 5380 3700 5380
Wire Wire Line
	3700 5340 3700 5380
Connection ~ 3700 5380
Wire Wire Line
	3700 5380 3600 5380
$Comp
L Custom_Library:74VHC541 U?
U 1 1 5E123C5F
P 5360 4340
AR Path="/5CB8A16A/5E123C5F" Ref="U?"  Part="1" 
AR Path="/5CC31B3E/5E123C5F" Ref="U?"  Part="1" 
F 0 "U?" H 5060 4990 50  0000 C CNN
F 1 "74VHC541" H 5060 3690 50  0000 C CNN
F 2 "Package_DFN_QFN:Texas_S-PWQFN-N20" H 5360 4340 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74VHC_VHCT541.pdf" H 5360 4340 50  0001 C CNN
F 4 "1727-7068-1-ND" H 5360 4340 50  0001 C CNN "Digi-Key PN"
	1    5360 4340
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E131A8A
P 5360 3540
F 0 "#PWR?" H 5360 3390 50  0001 C CNN
F 1 "+3.3V" H 5360 3680 50  0000 C CNN
F 2 "" H 5360 3540 50  0001 C CNN
F 3 "" H 5360 3540 50  0001 C CNN
	1    5360 3540
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 4540 4860 4540
Wire Wire Line
	4300 4940 4300 4540
Wire Wire Line
	4200 4440 4860 4440
Wire Wire Line
	4200 4940 4200 4440
Wire Wire Line
	4100 4340 4860 4340
Wire Wire Line
	4100 4940 4100 4340
Text GLabel 2810 3840 0    50   Output ~ 0
Cap_Touch_Left
Wire Wire Line
	7910 4240 6720 4240
Wire Wire Line
	7910 4140 6820 4140
Wire Wire Line
	7910 4040 6920 4040
Wire Wire Line
	7910 3940 7020 3940
Wire Wire Line
	7910 3840 7120 3840
$Comp
L Device:R_Pack08 RN?
U 1 1 5E16668F
P 6720 5140
AR Path="/5CB8A16A/5E16668F" Ref="RN?"  Part="1" 
AR Path="/5CC31B3E/5E16668F" Ref="RN?"  Part="1" 
F 0 "RN?" H 7110 5050 50  0000 L CNN
F 1 "10k" H 7110 5150 50  0000 L CNN
F 2 "Resistors_SMD:R_Array_Convex_8x0602" V 7195 5140 50  0001 C CNN
F 3 "~" H 6720 5140 50  0001 C CNN
F 4 "Y1103CT-ND" H 6720 5140 50  0001 C CNN "Digi-Key PN"
	1    6720 5140
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7120 4940 7120 3840
Connection ~ 7120 3840
Wire Wire Line
	7120 3840 5860 3840
Wire Wire Line
	7020 4940 7020 3940
Connection ~ 7020 3940
Wire Wire Line
	7020 3940 5860 3940
Wire Wire Line
	6920 4940 6920 4040
Connection ~ 6920 4040
Wire Wire Line
	6920 4040 5860 4040
Wire Wire Line
	6820 4940 6820 4140
Connection ~ 6820 4140
Wire Wire Line
	6820 4140 5860 4140
Wire Wire Line
	6720 4940 6720 4240
Connection ~ 6720 4240
Wire Wire Line
	6720 4240 5860 4240
$Comp
L power:GND #PWR?
U 1 1 5E1666A8
P 6770 5420
AR Path="/5BAAE2B6/5E1666A8" Ref="#PWR?"  Part="1" 
AR Path="/5BB6CF6D/5E1666A8" Ref="#PWR?"  Part="1" 
AR Path="/5BBE424C/5E1666A8" Ref="#PWR?"  Part="1" 
AR Path="/5CB8A16A/5E1666A8" Ref="#PWR?"  Part="1" 
AR Path="/5CC31B3E/5E1666A8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6770 5170 50  0001 C CNN
F 1 "GND" H 6770 5270 50  0000 C CNN
F 2 "" H 6770 5420 50  0001 C CNN
F 3 "" H 6770 5420 50  0001 C CNN
	1    6770 5420
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6770 5420 6770 5380
Wire Wire Line
	6770 5380 6820 5380
Wire Wire Line
	7120 5380 7120 5340
Wire Wire Line
	6770 5380 6720 5380
Wire Wire Line
	6420 5380 6420 5340
Connection ~ 6770 5380
Wire Wire Line
	6520 5340 6520 5380
Connection ~ 6520 5380
Wire Wire Line
	6520 5380 6420 5380
Wire Wire Line
	6620 5340 6620 5380
Connection ~ 6620 5380
Wire Wire Line
	6620 5380 6520 5380
Wire Wire Line
	6720 5340 6720 5380
Connection ~ 6720 5380
Wire Wire Line
	6720 5380 6620 5380
Wire Wire Line
	6820 5340 6820 5380
Connection ~ 6820 5380
Wire Wire Line
	6820 5380 6920 5380
Wire Wire Line
	6920 5340 6920 5380
Connection ~ 6920 5380
Wire Wire Line
	6920 5380 7020 5380
Wire Wire Line
	7020 5340 7020 5380
Connection ~ 7020 5380
Wire Wire Line
	7020 5380 7120 5380
Wire Wire Line
	6420 4540 5860 4540
Wire Wire Line
	6420 4940 6420 4540
Wire Wire Line
	6520 4440 5860 4440
Wire Wire Line
	6520 4940 6520 4440
Wire Wire Line
	6620 4340 5860 4340
Wire Wire Line
	6620 4940 6620 4340
Wire Wire Line
	5860 4740 5940 4740
Wire Wire Line
	5940 4740 5940 3610
Wire Wire Line
	7910 4740 5940 4740
Connection ~ 5940 4740
Wire Wire Line
	5860 4840 5940 4840
Wire Wire Line
	5940 4840 5940 4740
Text GLabel 2810 3940 0    50   Output ~ 0
Cap_Touch_Right
Text GLabel 2810 4040 0    50   Output ~ 0
Cap_Touch_Up
Text GLabel 2810 4140 0    50   Output ~ 0
Cap_Touch_Down
Text GLabel 2810 4240 0    50   Output ~ 0
Cap_Touch_Power
Text GLabel 8210 3840 2    50   Input ~ 0
Cap_Touch_Left_DSP
Text GLabel 8210 3940 2    50   Input ~ 0
Cap_Touch_Right_DSP
Text GLabel 8210 4040 2    50   Input ~ 0
Cap_Touch_Up_DSP
Text GLabel 8210 4140 2    50   Input ~ 0
Cap_Touch_Down_DSP
Text GLabel 8210 4240 2    50   Input ~ 0
Cap_Touch_Power_DSP
$Comp
L power:+3.3V #PWR?
U 1 1 5E19EECA
P 2680 4980
AR Path="/5BAAE2B6/5E19EECA" Ref="#PWR?"  Part="1" 
AR Path="/5BB6CF6D/5E19EECA" Ref="#PWR?"  Part="1" 
AR Path="/5BBE424C/5E19EECA" Ref="#PWR?"  Part="1" 
AR Path="/5CB8A16A/5E19EECA" Ref="#PWR?"  Part="1" 
AR Path="/5CC31B3E/5E19EECA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2680 4830 50  0001 C CNN
F 1 "+3.3V" H 2680 5120 50  0000 C CNN
F 2 "" H 2680 4980 50  0001 C CNN
F 3 "" H 2680 4980 50  0001 C CNN
	1    2680 4980
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E292B90
P 8060 4240
AR Path="/5CB0BC26/5E292B90" Ref="R?"  Part="1" 
AR Path="/5CC31B3E/5E292B90" Ref="R?"  Part="1" 
F 0 "R?" V 8010 4120 50  0000 R CNN
F 1 "1k" V 8060 4240 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 8060 4240 50  0001 C CNN
F 3 "" H 8060 4240 50  0001 C CNN
F 4 "0603" V 8160 4240 50  0001 C CNN "display_footprint"
F 5 "1%" V 8260 4240 50  0001 C CNN "Tolerance"
F 6 "1/10W" V 8360 4240 50  0001 C CNN "Wattage"
F 7 "RMCF0603FT1K00CT-ND" H 8360 4640 60  0001 C CNN "Digi-Key PN"
	1    8060 4240
	0    1    1    0   
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E29587B
P 8060 4140
AR Path="/5CB0BC26/5E29587B" Ref="R?"  Part="1" 
AR Path="/5CC31B3E/5E29587B" Ref="R?"  Part="1" 
F 0 "R?" V 8010 4020 50  0000 R CNN
F 1 "1k" V 8060 4140 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 8060 4140 50  0001 C CNN
F 3 "" H 8060 4140 50  0001 C CNN
F 4 "0603" V 8160 4140 50  0001 C CNN "display_footprint"
F 5 "1%" V 8260 4140 50  0001 C CNN "Tolerance"
F 6 "1/10W" V 8360 4140 50  0001 C CNN "Wattage"
F 7 "RMCF0603FT1K00CT-ND" H 8360 4540 60  0001 C CNN "Digi-Key PN"
	1    8060 4140
	0    1    1    0   
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E295A4D
P 8060 4040
AR Path="/5CB0BC26/5E295A4D" Ref="R?"  Part="1" 
AR Path="/5CC31B3E/5E295A4D" Ref="R?"  Part="1" 
F 0 "R?" V 8010 3920 50  0000 R CNN
F 1 "1k" V 8060 4040 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 8060 4040 50  0001 C CNN
F 3 "" H 8060 4040 50  0001 C CNN
F 4 "0603" V 8160 4040 50  0001 C CNN "display_footprint"
F 5 "1%" V 8260 4040 50  0001 C CNN "Tolerance"
F 6 "1/10W" V 8360 4040 50  0001 C CNN "Wattage"
F 7 "RMCF0603FT1K00CT-ND" H 8360 4440 60  0001 C CNN "Digi-Key PN"
	1    8060 4040
	0    1    1    0   
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E295C06
P 8060 3940
AR Path="/5CB0BC26/5E295C06" Ref="R?"  Part="1" 
AR Path="/5CC31B3E/5E295C06" Ref="R?"  Part="1" 
F 0 "R?" V 8010 3820 50  0000 R CNN
F 1 "1k" V 8060 3940 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 8060 3940 50  0001 C CNN
F 3 "" H 8060 3940 50  0001 C CNN
F 4 "0603" V 8160 3940 50  0001 C CNN "display_footprint"
F 5 "1%" V 8260 3940 50  0001 C CNN "Tolerance"
F 6 "1/10W" V 8360 3940 50  0001 C CNN "Wattage"
F 7 "RMCF0603FT1K00CT-ND" H 8360 4340 60  0001 C CNN "Digi-Key PN"
	1    8060 3940
	0    1    1    0   
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E295E67
P 8060 3840
AR Path="/5CB0BC26/5E295E67" Ref="R?"  Part="1" 
AR Path="/5CC31B3E/5E295E67" Ref="R?"  Part="1" 
F 0 "R?" V 8010 3720 50  0000 R CNN
F 1 "1k" V 8060 3840 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 8060 3840 50  0001 C CNN
F 3 "" H 8060 3840 50  0001 C CNN
F 4 "0603" V 8160 3840 50  0001 C CNN "display_footprint"
F 5 "1%" V 8260 3840 50  0001 C CNN "Tolerance"
F 6 "1/10W" V 8360 3840 50  0001 C CNN "Wattage"
F 7 "RMCF0603FT1K00CT-ND" H 8360 4240 60  0001 C CNN "Digi-Key PN"
	1    8060 3840
	0    1    1    0   
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E3503EA
P 6160 1920
AR Path="/5BAAE1F3/5E3503EA" Ref="R?"  Part="1" 
AR Path="/5BAAE1DC/5E3503EA" Ref="R?"  Part="1" 
AR Path="/5BAAE16C/5E3503EA" Ref="R?"  Part="1" 
AR Path="/5BB844FD/5E3503EA" Ref="R?"  Part="1" 
AR Path="/5C1D5CB6/5E3503EA" Ref="R?"  Part="1" 
AR Path="/5CB0BC26/5E3503EA" Ref="R?"  Part="1" 
AR Path="/5E0CF7BC/5E3503EA" Ref="R?"  Part="1" 
AR Path="/5CC31B3E/5E3503EA" Ref="R?"  Part="1" 
F 0 "R?" H 6100 1920 50  0000 R CNN
F 1 "10k" V 6160 1920 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6160 1920 50  0001 C CNN
F 3 "" H 6160 1920 50  0001 C CNN
F 4 "0603" H 6350 2000 50  0000 C CNN "display_footprint"
F 5 "1%" H 6340 1920 50  0000 C CNN "Tolerance"
F 6 "1/10W" H 6370 1850 50  0000 C CNN "Wattage"
F 7 "DNP" H 6330 1770 50  0000 C CNN "Digi-Key PN"
	1    6160 1920
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E3503F4
P 6740 1920
AR Path="/5BAAE1F3/5E3503F4" Ref="R?"  Part="1" 
AR Path="/5BAAE1DC/5E3503F4" Ref="R?"  Part="1" 
AR Path="/5BAAE16C/5E3503F4" Ref="R?"  Part="1" 
AR Path="/5BB844FD/5E3503F4" Ref="R?"  Part="1" 
AR Path="/5C1D5CB6/5E3503F4" Ref="R?"  Part="1" 
AR Path="/5CB0BC26/5E3503F4" Ref="R?"  Part="1" 
AR Path="/5E0CF7BC/5E3503F4" Ref="R?"  Part="1" 
AR Path="/5CC31B3E/5E3503F4" Ref="R?"  Part="1" 
F 0 "R?" H 6680 1920 50  0000 R CNN
F 1 "10k" V 6740 1920 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6740 1920 50  0001 C CNN
F 3 "" H 6740 1920 50  0001 C CNN
F 4 "0603" H 6930 2000 50  0000 C CNN "display_footprint"
F 5 "1%" H 6920 1920 50  0000 C CNN "Tolerance"
F 6 "1/10W" H 6950 1850 50  0000 C CNN "Wattage"
F 7 "DNP" H 6910 1770 50  0000 C CNN "Digi-Key PN"
	1    6740 1920
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E356684
P 3940 1920
AR Path="/5BAAE1F3/5E356684" Ref="R?"  Part="1" 
AR Path="/5BAAE1DC/5E356684" Ref="R?"  Part="1" 
AR Path="/5BAAE16C/5E356684" Ref="R?"  Part="1" 
AR Path="/5BB844FD/5E356684" Ref="R?"  Part="1" 
AR Path="/5C1D5CB6/5E356684" Ref="R?"  Part="1" 
AR Path="/5CB0BC26/5E356684" Ref="R?"  Part="1" 
AR Path="/5E0CF7BC/5E356684" Ref="R?"  Part="1" 
AR Path="/5CC31B3E/5E356684" Ref="R?"  Part="1" 
F 0 "R?" H 3880 1920 50  0000 R CNN
F 1 "10k" V 3940 1920 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 3940 1920 50  0001 C CNN
F 3 "" H 3940 1920 50  0001 C CNN
F 4 "0603" H 4130 2000 50  0000 C CNN "display_footprint"
F 5 "1%" H 4120 1920 50  0000 C CNN "Tolerance"
F 6 "1/10W" H 4150 1850 50  0000 C CNN "Wattage"
F 7 "DNP" H 4110 1770 50  0000 C CNN "Digi-Key PN"
	1    3940 1920
	-1   0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E35668E
P 4520 1920
AR Path="/5BAAE1F3/5E35668E" Ref="R?"  Part="1" 
AR Path="/5BAAE1DC/5E35668E" Ref="R?"  Part="1" 
AR Path="/5BAAE16C/5E35668E" Ref="R?"  Part="1" 
AR Path="/5BB844FD/5E35668E" Ref="R?"  Part="1" 
AR Path="/5C1D5CB6/5E35668E" Ref="R?"  Part="1" 
AR Path="/5CB0BC26/5E35668E" Ref="R?"  Part="1" 
AR Path="/5E0CF7BC/5E35668E" Ref="R?"  Part="1" 
AR Path="/5CC31B3E/5E35668E" Ref="R?"  Part="1" 
F 0 "R?" H 4460 1920 50  0000 R CNN
F 1 "10k" V 4520 1920 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 4520 1920 50  0001 C CNN
F 3 "" H 4520 1920 50  0001 C CNN
F 4 "0603" H 4710 2000 50  0000 C CNN "display_footprint"
F 5 "1%" H 4700 1920 50  0000 C CNN "Tolerance"
F 6 "1/10W" H 4730 1850 50  0000 C CNN "Wattage"
F 7 "DNP" H 4690 1770 50  0000 C CNN "Digi-Key PN"
	1    4520 1920
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7910 4340 6620 4340
Text GLabel 8210 4340 2    50   Input ~ 0
Display_Detect_DSP
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E442D14
P 8060 4340
AR Path="/5CB0BC26/5E442D14" Ref="R?"  Part="1" 
AR Path="/5CC31B3E/5E442D14" Ref="R?"  Part="1" 
F 0 "R?" V 8010 4220 50  0000 R CNN
F 1 "1k" V 8060 4340 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 8060 4340 50  0001 C CNN
F 3 "" H 8060 4340 50  0001 C CNN
F 4 "0603" V 8160 4340 50  0001 C CNN "display_footprint"
F 5 "1%" V 8260 4340 50  0001 C CNN "Tolerance"
F 6 "1/10W" V 8360 4340 50  0001 C CNN "Wattage"
F 7 "RMCF0603FT1K00CT-ND" H 8360 4740 60  0001 C CNN "Digi-Key PN"
	1    8060 4340
	0    1    1    0   
$EndComp
Connection ~ 6620 4340
Text GLabel 2810 4340 0    50   Output ~ 0
Display_Detect
Wire Wire Line
	2810 4340 4100 4340
Connection ~ 4100 4340
$EndSCHEMATC

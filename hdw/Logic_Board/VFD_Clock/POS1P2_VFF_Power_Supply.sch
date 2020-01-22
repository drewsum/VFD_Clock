EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 8 30
Title "QI Charger"
Date "2019-01-03"
Rev "A"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E2AA969
P 4070 3250
AR Path="/5BB27BA3/5E2AA969" Ref="C?"  Part="1" 
AR Path="/5BB27B84/5E2AA969" Ref="C?"  Part="1" 
AR Path="/5BB27B24/5E2AA969" Ref="C?"  Part="1" 
AR Path="/5BB27BB5/5E2AA969" Ref="C?"  Part="1" 
AR Path="/5BB27BF7/5E2AA969" Ref="C?"  Part="1" 
AR Path="/5C1DE17A/5E2AA969" Ref="C?"  Part="1" 
AR Path="/5C1E3A0B/5E2AA969" Ref="C?"  Part="1" 
AR Path="/5C1E3A08/5E2AA969" Ref="C?"  Part="1" 
AR Path="/5D779AE1/5E2AA969" Ref="C?"  Part="1" 
AR Path="/5CB7718D/5E2AA969" Ref="C?"  Part="1" 
AR Path="/5E0DC082/5E2AA969" Ref="C?"  Part="1" 
AR Path="/5E0F9110/5E2AA969" Ref="C?"  Part="1" 
F 0 "C?" H 4095 3350 50  0000 L CNN
F 1 "0.1uF" H 4095 3150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4108 3100 50  0001 C CNN
F 3 "" H 4095 3350 50  0001 C CNN
F 4 "0603" H 3920 3350 50  0000 R CNN "display_footprint"
F 5 "50V" H 3920 3250 50  0000 R CNN "Voltage"
F 6 "X7R" H 3920 3150 50  0000 R CNN "Dielectric"
F 7 "490-8020-1-ND" H 4495 3750 60  0001 C CNN "Digi-Key PN"
	1    4070 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C26F8EC
P 4070 3400
AR Path="/5CB7718D/5C26F8EC" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC082/5C26F8EC" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9110/5C26F8EC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4070 3150 50  0001 C CNN
F 1 "GND" H 4070 3250 50  0000 C CNN
F 2 "" H 4070 3400 50  0001 C CNN
F 3 "" H 4070 3400 50  0001 C CNN
	1    4070 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4410 3020 4070 3020
Wire Wire Line
	4070 3020 4070 3100
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E2AA96D
P 2290 3250
AR Path="/5CB7718D/5E2AA96D" Ref="C?"  Part="1" 
AR Path="/5E0DC082/5E2AA96D" Ref="C?"  Part="1" 
AR Path="/5E0F9110/5E2AA96D" Ref="C?"  Part="1" 
F 0 "C?" H 2315 3350 50  0000 L CNN
F 1 "10uF" H 2315 3150 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 2328 3100 50  0001 C CNN
F 3 "" H 2315 3350 50  0001 C CNN
F 4 "1206" H 2140 3350 50  0000 R CNN "display_footprint"
F 5 "25V" H 2140 3250 50  0000 R CNN "Voltage"
F 6 "X7R" H 2140 3150 50  0000 R CNN "Dielectric"
F 7 "1276-7031-1-ND" H 2715 3750 60  0001 C CNN "Digi-Key PN"
	1    2290 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2AA96F
P 2290 3400
AR Path="/5CB7718D/5E2AA96F" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC082/5E2AA96F" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9110/5E2AA96F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2290 3150 50  0001 C CNN
F 1 "GND" H 2290 3250 50  0000 C CNN
F 2 "" H 2290 3400 50  0001 C CNN
F 3 "" H 2290 3400 50  0001 C CNN
	1    2290 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4410 2920 4070 2920
Wire Wire Line
	2290 2920 2290 3100
Wire Wire Line
	4070 3020 4070 2920
Connection ~ 4070 3020
$Comp
L power:+12V #PWR?
U 1 1 5E2AA971
P 1360 2840
AR Path="/5CB7718D/5E2AA971" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC082/5E2AA971" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9110/5E2AA971" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1360 2690 50  0001 C CNN
F 1 "+12V" H 1360 2980 50  0000 C CNN
F 2 "" H 1360 2840 50  0001 C CNN
F 3 "" H 1360 2840 50  0001 C CNN
	1    1360 2840
	1    0    0    -1  
$EndComp
Wire Wire Line
	1360 2840 1360 2920
Connection ~ 4070 2920
$Comp
L power:GND #PWR?
U 1 1 5E2AA975
P 4910 5400
AR Path="/5CB7718D/5E2AA975" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC082/5E2AA975" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9110/5E2AA975" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4910 5150 50  0001 C CNN
F 1 "GND" H 4910 5250 50  0000 C CNN
F 2 "" H 4910 5400 50  0001 C CNN
F 3 "" H 4910 5400 50  0001 C CNN
	1    4910 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4910 5400 4910 5360
Wire Wire Line
	4910 5360 5010 5360
Wire Wire Line
	5010 5360 5010 5320
Connection ~ 4910 5360
Wire Wire Line
	4910 5360 4910 5320
Wire Wire Line
	4910 5360 4810 5360
Wire Wire Line
	4810 5360 4810 5320
$Comp
L power:GND #PWR?
U 1 1 5E2AA978
P 4330 5200
AR Path="/5CB7718D/5E2AA978" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC082/5E2AA978" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9110/5E2AA978" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4330 4950 50  0001 C CNN
F 1 "GND" H 4330 5050 50  0000 C CNN
F 2 "" H 4330 5200 50  0001 C CNN
F 3 "" H 4330 5200 50  0001 C CNN
	1    4330 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4330 4920 4410 4920
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E2AA97A
P 6840 3560
AR Path="/5C1E3A0B/5E2AA97A" Ref="C?"  Part="1" 
AR Path="/5C1E3A08/5E2AA97A" Ref="C?"  Part="1" 
AR Path="/5D779AE1/5E2AA97A" Ref="C?"  Part="1" 
AR Path="/5CB7718D/5E2AA97A" Ref="C?"  Part="1" 
AR Path="/5E0DC082/5E2AA97A" Ref="C?"  Part="1" 
AR Path="/5E0F9110/5E2AA97A" Ref="C?"  Part="1" 
F 0 "C?" H 6865 3660 50  0000 L CNN
F 1 "22uF" H 6865 3460 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 6878 3410 50  0001 C CNN
F 3 "" H 6865 3660 50  0001 C CNN
F 4 "1206" H 6690 3660 50  0000 R CNN "display_footprint"
F 5 "10V" H 6690 3560 50  0000 R CNN "Voltage"
F 6 "X7R" H 6690 3460 50  0000 R CNN "Dielectric"
F 7 "1276-3148-1-ND" H 7265 4060 60  0001 C CNN "Digi-Key PN"
	1    6840 3560
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5C2908D2
P 2290 4090
AR Path="/5BB27BA3/5C2908D2" Ref="R?"  Part="1" 
AR Path="/5BB27BF7/5C2908D2" Ref="R?"  Part="1" 
AR Path="/5C1DE17A/5C2908D2" Ref="R?"  Part="1" 
AR Path="/5C1E3A08/5C2908D2" Ref="R?"  Part="1" 
AR Path="/5D779AE1/5C2908D2" Ref="R?"  Part="1" 
AR Path="/5CB7718D/5C2908D2" Ref="R?"  Part="1" 
AR Path="/5E0DC082/5C2908D2" Ref="R?"  Part="1" 
AR Path="/5E0F9110/5C2908D2" Ref="R?"  Part="1" 
F 0 "R?" H 2210 4090 50  0000 R CNN
F 1 "10k" V 2290 4090 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 2290 4090 50  0001 C CNN
F 3 "" H 2290 4090 50  0001 C CNN
F 4 "0603" H 2390 4170 50  0000 L CNN "display_footprint"
F 5 "1%" H 2390 4090 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 2400 4010 50  0000 L CNN "Wattage"
F 7 "RHM10KADCT-ND" H 2590 4490 60  0001 C CNN "Digi-Key PN"
	1    2290 4090
	1    0    0    -1  
$EndComp
Wire Wire Line
	4410 4520 2290 4520
Wire Wire Line
	2290 4520 2290 4240
Text GLabel 2210 4520 0    50   Output ~ 0
POS1P2_VFF_PGOOD
Wire Wire Line
	2210 4520 2290 4520
Connection ~ 2290 4520
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E2AA97E
P 3710 5050
AR Path="/5C1D5CD8/5E2AA97E" Ref="C?"  Part="1" 
AR Path="/5C1D5CCA/5E2AA97E" Ref="C?"  Part="1" 
AR Path="/5C1E3A0B/5E2AA97E" Ref="C?"  Part="1" 
AR Path="/5C1E3A08/5E2AA97E" Ref="C?"  Part="1" 
AR Path="/5D779AE1/5E2AA97E" Ref="C?"  Part="1" 
AR Path="/5CB7718D/5E2AA97E" Ref="C?"  Part="1" 
AR Path="/5E0DC082/5E2AA97E" Ref="C?"  Part="1" 
AR Path="/5E0F9110/5E2AA97E" Ref="C?"  Part="1" 
F 0 "C?" H 3735 5150 50  0000 L CNN
F 1 "10nF" H 3735 4950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3748 4900 50  0001 C CNN
F 3 "" H 3735 5150 50  0001 C CNN
F 4 "0603" H 3560 5150 50  0000 R CNN "display_footprint"
F 5 "50V" H 3560 5050 50  0000 R CNN "Voltage"
F 6 "X7R" H 3560 4950 50  0000 R CNN "Dielectric"
F 7 "1276-1921-1-ND" H -210 830 50  0001 C CNN "Digi-Key PN"
	1    3710 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2AA980
P 3710 5200
AR Path="/5CB7718D/5E2AA980" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC082/5E2AA980" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9110/5E2AA980" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3710 4950 50  0001 C CNN
F 1 "GND" H 3710 5050 50  0000 C CNN
F 2 "" H 3710 5200 50  0001 C CNN
F 3 "" H 3710 5200 50  0001 C CNN
	1    3710 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3710 4900 3710 4720
Wire Wire Line
	3710 4720 4410 4720
$Comp
L power:GND #PWR?
U 1 1 5C295AD9
P 9230 5150
AR Path="/5CB7718D/5C295AD9" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC082/5C295AD9" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9110/5C295AD9" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9230 4900 50  0001 C CNN
F 1 "GND" H 9230 5000 50  0000 C CNN
F 2 "" H 9230 5150 50  0001 C CNN
F 3 "" H 9230 5150 50  0001 C CNN
	1    9230 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9230 4520 9230 4240
Connection ~ 9230 4520
Wire Wire Line
	9230 4520 9230 4850
$Comp
L power:GND #PWR?
U 1 1 5E2AA985
P 6840 3710
AR Path="/5CB7718D/5E2AA985" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC082/5E2AA985" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9110/5E2AA985" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6840 3460 50  0001 C CNN
F 1 "GND" H 6840 3560 50  0000 C CNN
F 2 "" H 6840 3710 50  0001 C CNN
F 3 "" H 6840 3710 50  0001 C CNN
	1    6840 3710
	1    0    0    -1  
$EndComp
Wire Wire Line
	6840 3410 6840 3320
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E2AA986
P 7590 3560
AR Path="/5C1E3A0B/5E2AA986" Ref="C?"  Part="1" 
AR Path="/5C1E3A08/5E2AA986" Ref="C?"  Part="1" 
AR Path="/5D779AE1/5E2AA986" Ref="C?"  Part="1" 
AR Path="/5CB7718D/5E2AA986" Ref="C?"  Part="1" 
AR Path="/5E0DC082/5E2AA986" Ref="C?"  Part="1" 
AR Path="/5E0F9110/5E2AA986" Ref="C?"  Part="1" 
F 0 "C?" H 7615 3660 50  0000 L CNN
F 1 "22uF" H 7615 3460 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 7628 3410 50  0001 C CNN
F 3 "" H 7615 3660 50  0001 C CNN
F 4 "1206" H 7440 3660 50  0000 R CNN "display_footprint"
F 5 "10V" H 7440 3560 50  0000 R CNN "Voltage"
F 6 "X7R" H 7440 3460 50  0000 R CNN "Dielectric"
F 7 "1276-3148-1-ND" H 8015 4060 60  0001 C CNN "Digi-Key PN"
	1    7590 3560
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E2AA989
P 7590 3710
AR Path="/5CB7718D/5E2AA989" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC082/5E2AA989" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9110/5E2AA989" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7590 3460 50  0001 C CNN
F 1 "GND" H 7590 3560 50  0000 C CNN
F 2 "" H 7590 3710 50  0001 C CNN
F 3 "" H 7590 3710 50  0001 C CNN
	1    7590 3710
	1    0    0    -1  
$EndComp
Wire Wire Line
	6840 3320 7590 3320
Wire Wire Line
	7590 3320 7590 3410
Connection ~ 6840 3320
$Comp
L Custom_Library:TPS62130 U?
U 1 1 5E2AA973
P 4910 4020
AR Path="/5CB7718D/5E2AA973" Ref="U?"  Part="1" 
AR Path="/5E0DC082/5E2AA973" Ref="U?"  Part="1" 
AR Path="/5E0F9110/5E2AA973" Ref="U?"  Part="1" 
F 0 "U?" H 4910 5270 50  0000 C CNN
F 1 "TPS62130" H 4910 4020 50  0000 C CNN
F 2 "Housings_DFN_QFN:QFN-16-1EP_3x3mm_Pitch0.5mm" H 4910 4020 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps62130.pdf" H 4910 4020 50  0001 C CNN
F 4 "296-37878-1-ND" H 4810 4020 50  0001 C CNN "Digi-Key PN"
	1    4910 4020
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5C316D54
P 10150 3240
AR Path="/5CB7718D/5C316D54" Ref="#FLG?"  Part="1" 
AR Path="/5E0DC082/5C316D54" Ref="#FLG?"  Part="1" 
AR Path="/5E0F9110/5C316D54" Ref="#FLG?"  Part="1" 
F 0 "#FLG?" H 10150 3315 50  0001 C CNN
F 1 "PWR_FLAG" H 10150 3390 50  0000 C CNN
F 2 "" H 10150 3240 50  0001 C CNN
F 3 "~" H 10150 3240 50  0001 C CNN
	1    10150 3240
	-1   0    0    1   
$EndComp
$Comp
L Custom_Library:TP TP?
U 1 1 5E2AA98D
P 9230 3240
AR Path="/5C1D5CD8/5E2AA98D" Ref="TP?"  Part="1" 
AR Path="/5C1D5C9E/5E2AA98D" Ref="TP?"  Part="1" 
AR Path="/5C1E3A08/5E2AA98D" Ref="TP?"  Part="1" 
AR Path="/5D779AE1/5E2AA98D" Ref="TP?"  Part="1" 
AR Path="/5CB7718D/5E2AA98D" Ref="TP?"  Part="1" 
AR Path="/5E0DC082/5E2AA98D" Ref="TP?"  Part="1" 
AR Path="/5E0F9110/5E2AA98D" Ref="TP?"  Part="1" 
F 0 "TP?" H 9230 3390 50  0000 C CNN
F 1 "TP" H 9230 3390 50  0001 C CNN
F 2 "Custom Footprints Library:Test_Point" H 9230 3240 60  0001 C CNN
F 3 "" H 9230 3240 60  0000 C CNN
	1    9230 3240
	1    0    0    -1  
$EndComp
Wire Wire Line
	5410 3320 5700 3320
$Comp
L power:+3.3V #PWR?
U 1 1 5E2AA98E
P 2290 3940
AR Path="/5CB7718D/5E2AA98E" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC082/5E2AA98E" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9110/5E2AA98E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2290 3790 50  0001 C CNN
F 1 "+3.3V" H 2290 4080 50  0000 C CNN
F 2 "" H 2290 3940 50  0001 C CNN
F 3 "" H 2290 3940 50  0001 C CNN
	1    2290 3940
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2AA991
P 8530 3320
AR Path="/5CB6F1ED/5E2AA991" Ref="R?"  Part="1" 
AR Path="/5CB7718D/5E2AA991" Ref="R?"  Part="1" 
AR Path="/5E0DC082/5E2AA991" Ref="R?"  Part="1" 
AR Path="/5E0F9110/5E2AA991" Ref="R?"  Part="1" 
F 0 "R?" V 8430 3320 50  0000 C CNN
F 1 "0.02" V 8530 3320 40  0000 C CNN
F 2 "Resistors_SMD:R_0612" H 8530 3320 50  0001 C CNN
F 3 "" H 8530 3320 50  0001 C CNN
F 4 "P16010CT-ND" H 8830 3720 60  0001 C CNN "Digi-Key PN"
F 5 "0612" V 8630 3320 50  0000 C CNN "display_footprint"
F 6 "1%" V 8730 3320 50  0000 C CNN "Tolerance"
F 7 "1W" V 8830 3320 50  0000 C CNN "Wattage"
	1    8530 3320
	0    -1   -1   0   
$EndComp
Text GLabel 8300 3480 3    50   UnSpc ~ 0
POS1P2_VFF_SNS_OUT+
Text GLabel 8760 3480 3    50   UnSpc ~ 0
POS1P2_VFF_SNS_OUT-
Wire Wire Line
	8680 3320 8760 3320
Wire Wire Line
	8760 3480 8760 3320
Connection ~ 8760 3320
Wire Wire Line
	8760 3320 9230 3320
Wire Wire Line
	8300 3480 8300 3320
Wire Wire Line
	8300 3320 8380 3320
Text Notes 8160 2760 0    50   ~ 0
Evaluate shunt value
Wire Wire Line
	8300 3320 7590 3320
Connection ~ 8300 3320
Connection ~ 7590 3320
Wire Wire Line
	6000 3320 6840 3320
Wire Wire Line
	5410 4520 9230 4520
Wire Wire Line
	9230 3320 9230 3940
Wire Wire Line
	9230 3240 9230 3320
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E092883
P 1590 2920
AR Path="/5CB6F1ED/5E092883" Ref="R?"  Part="1" 
AR Path="/5CB7718D/5E092883" Ref="R?"  Part="1" 
AR Path="/5E0DC082/5E092883" Ref="R?"  Part="1" 
AR Path="/5E0F9110/5E092883" Ref="R?"  Part="1" 
F 0 "R?" V 1490 2920 50  0000 C CNN
F 1 "0.02" V 1590 2920 40  0000 C CNN
F 2 "Resistors_SMD:R_0612" H 1590 2920 50  0001 C CNN
F 3 "" H 1590 2920 50  0001 C CNN
F 4 "P16010CT-ND" H 1890 3320 60  0001 C CNN "Digi-Key PN"
F 5 "0612" V 1690 2920 50  0000 C CNN "display_footprint"
F 6 "1%" V 1790 2920 50  0000 C CNN "Tolerance"
F 7 "1W" V 1890 2920 50  0000 C CNN "Wattage"
	1    1590 2920
	0    -1   -1   0   
$EndComp
Text GLabel 1360 3080 3    50   UnSpc ~ 0
POS1P2_VFF_SNS_IN+
Text GLabel 1820 3080 3    50   UnSpc ~ 0
POS1P2_VFF_SNS_IN-
Wire Wire Line
	1740 2920 1820 2920
Wire Wire Line
	1820 3080 1820 2920
Connection ~ 1820 2920
Wire Wire Line
	1820 2920 2290 2920
Wire Wire Line
	1360 3080 1360 2920
Wire Wire Line
	1360 2920 1440 2920
Connection ~ 1360 2920
Connection ~ 2290 2920
Connection ~ 9230 3320
$Comp
L Custom_Library:C_Custom C?
U 1 1 5E0D49BD
P 9680 3550
AR Path="/5BB27BA3/5E0D49BD" Ref="C?"  Part="1" 
AR Path="/5BB27B84/5E0D49BD" Ref="C?"  Part="1" 
AR Path="/5BB27B24/5E0D49BD" Ref="C?"  Part="1" 
AR Path="/5BB27BB5/5E0D49BD" Ref="C?"  Part="1" 
AR Path="/5BB27BF7/5E0D49BD" Ref="C?"  Part="1" 
AR Path="/5C1DE17A/5E0D49BD" Ref="C?"  Part="1" 
AR Path="/5C1E3A0B/5E0D49BD" Ref="C?"  Part="1" 
AR Path="/5C1E3A08/5E0D49BD" Ref="C?"  Part="1" 
AR Path="/5D779AE1/5E0D49BD" Ref="C?"  Part="1" 
AR Path="/5CB7718D/5E0D49BD" Ref="C?"  Part="1" 
AR Path="/5E0DC082/5E0D49BD" Ref="C?"  Part="1" 
AR Path="/5E0F9110/5E0D49BD" Ref="C?"  Part="1" 
F 0 "C?" H 9705 3650 50  0000 L CNN
F 1 "0.1uF" H 9705 3450 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 9718 3400 50  0001 C CNN
F 3 "" H 9705 3650 50  0001 C CNN
F 4 "0603" H 9530 3650 50  0000 R CNN "display_footprint"
F 5 "50V" H 9530 3550 50  0000 R CNN "Voltage"
F 6 "X7R" H 9530 3450 50  0000 R CNN "Dielectric"
F 7 "490-8020-1-ND" H 10105 4050 60  0001 C CNN "Digi-Key PN"
	1    9680 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0D49C3
P 9680 3700
AR Path="/5CB7718D/5E0D49C3" Ref="#PWR?"  Part="1" 
AR Path="/5E0DC082/5E0D49C3" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9110/5E0D49C3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9680 3450 50  0001 C CNN
F 1 "GND" H 9680 3550 50  0000 C CNN
F 2 "" H 9680 3700 50  0001 C CNN
F 3 "" H 9680 3700 50  0001 C CNN
	1    9680 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9680 3400 9680 3320
Wire Wire Line
	9680 3320 9230 3320
Wire Wire Line
	9680 3240 9680 3320
Connection ~ 9680 3320
Wire Wire Line
	2290 2920 4070 2920
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E0E4087
P 4080 4090
AR Path="/5BB27BA3/5E0E4087" Ref="R?"  Part="1" 
AR Path="/5BB27BF7/5E0E4087" Ref="R?"  Part="1" 
AR Path="/5C1DE17A/5E0E4087" Ref="R?"  Part="1" 
AR Path="/5C1E3A08/5E0E4087" Ref="R?"  Part="1" 
AR Path="/5D779AE1/5E0E4087" Ref="R?"  Part="1" 
AR Path="/5CB7718D/5E0E4087" Ref="R?"  Part="1" 
AR Path="/5E0DC082/5E0E4087" Ref="R?"  Part="1" 
AR Path="/5E0F9110/5E0E4087" Ref="R?"  Part="1" 
F 0 "R?" H 4000 4090 50  0000 R CNN
F 1 "10k" V 4080 4090 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 4080 4090 50  0001 C CNN
F 3 "" H 4080 4090 50  0001 C CNN
F 4 "0603" H 4180 4170 50  0000 L CNN "display_footprint"
F 5 "1%" H 4180 4090 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 4190 4010 50  0000 L CNN "Wattage"
F 7 "RHM10KADCT-ND" H 4380 4490 60  0001 C CNN "Digi-Key PN"
	1    4080 4090
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E0E4D30
P 4080 4240
AR Path="/5E0DC082/5E0E4D30" Ref="#PWR?"  Part="1" 
AR Path="/5E0F9110/5E0E4D30" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4080 3990 50  0001 C CNN
F 1 "GND" H 4080 4090 50  0000 C CNN
F 2 "" H 4080 4240 50  0001 C CNN
F 3 "" H 4080 4240 50  0001 C CNN
	1    4080 4240
	1    0    0    -1  
$EndComp
Wire Wire Line
	4410 3720 4080 3720
Wire Wire Line
	4080 3720 4080 3940
Text GLabel 3960 3720 0    50   Input ~ 0
POS1P2_VFF_RUN
Wire Wire Line
	3960 3720 4080 3720
Connection ~ 4080 3720
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E2AA9B9
P 9230 4090
AR Path="/5BB27BA3/5E2AA9B9" Ref="R?"  Part="1" 
AR Path="/5BB27BF7/5E2AA9B9" Ref="R?"  Part="1" 
AR Path="/5C1DE17A/5E2AA9B9" Ref="R?"  Part="1" 
AR Path="/5C1E3A08/5E2AA9B9" Ref="R?"  Part="1" 
AR Path="/5D779AE1/5E2AA9B9" Ref="R?"  Part="1" 
AR Path="/5CB7718D/5E2AA9B9" Ref="R?"  Part="1" 
AR Path="/5E0DC082/5E2AA9B9" Ref="R?"  Part="1" 
AR Path="/5E0F9110/5E2AA9B9" Ref="R?"  Part="1" 
F 0 "R?" H 9150 4090 50  0000 R CNN
F 1 "R" V 9230 4090 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 9230 4090 50  0001 C CNN
F 3 "" H 9230 4090 50  0001 C CNN
F 4 "0603" H 9330 4170 50  0000 L CNN "display_footprint"
F 5 "1%" H 9330 4090 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 9340 4010 50  0000 L CNN "Wattage"
	1    9230 4090
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:L_Custom L?
U 1 1 5E0FE591
P 5850 3320
F 0 "L?" V 5800 3320 50  0000 C CNN
F 1 "L_Custom" V 5925 3320 50  0000 C CNN
F 2 "" H 5850 3320 50  0001 C CNN
F 3 "" H 5850 3320 50  0001 C CNN
F 4 "Foot" V 6000 3320 50  0000 C CNN "display_footprint"
F 5 "A" V 6100 3320 50  0000 C CNN "Ampacity"
F 6 "Tol" V 6200 3320 50  0000 C CNN "Tolerance"
	1    5850 3320
	0    -1   -1   0   
$EndComp
$Comp
L Custom_Library:R_Custom R?
U 1 1 5E0FFED9
P 9230 5000
AR Path="/5BB27BA3/5E0FFED9" Ref="R?"  Part="1" 
AR Path="/5BB27BF7/5E0FFED9" Ref="R?"  Part="1" 
AR Path="/5C1DE17A/5E0FFED9" Ref="R?"  Part="1" 
AR Path="/5C1E3A08/5E0FFED9" Ref="R?"  Part="1" 
AR Path="/5D779AE1/5E0FFED9" Ref="R?"  Part="1" 
AR Path="/5CB7718D/5E0FFED9" Ref="R?"  Part="1" 
AR Path="/5E0DC082/5E0FFED9" Ref="R?"  Part="1" 
AR Path="/5E0F9110/5E0FFED9" Ref="R?"  Part="1" 
F 0 "R?" H 9150 5000 50  0000 R CNN
F 1 "R" V 9230 5000 40  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 9230 5000 50  0001 C CNN
F 3 "" H 9230 5000 50  0001 C CNN
F 4 "0603" H 9330 5080 50  0000 L CNN "display_footprint"
F 5 "1%" H 9330 5000 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 9340 4920 50  0000 L CNN "Wattage"
	1    9230 5000
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+1.2VFF #PWR?
U 1 1 5E10ADFD
P 9680 3240
F 0 "#PWR?" H 9680 3090 50  0001 C CNN
F 1 "+1.2VFF" H 9680 3380 50  0000 C CNN
F 2 "" H 9680 3240 50  0000 C CNN
F 3 "" H 9680 3240 50  0000 C CNN
	1    9680 3240
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+1.2VFF #PWR?
U 1 1 5E10B200
P 10150 3240
F 0 "#PWR?" H 10150 3090 50  0001 C CNN
F 1 "+1.2VFF" H 10150 3380 50  0000 C CNN
F 2 "" H 10150 3240 50  0000 C CNN
F 3 "" H 10150 3240 50  0000 C CNN
	1    10150 3240
	1    0    0    -1  
$EndComp
$Comp
L Custom_Library:+1.2VFF #PWR?
U 1 1 5E10D20A
P 5410 3720
F 0 "#PWR?" H 5410 3570 50  0001 C CNN
F 1 "+1.2VFF" V 5410 3840 50  0000 L CNN
F 2 "" H 5410 3720 50  0000 C CNN
F 3 "" H 5410 3720 50  0000 C CNN
	1    5410 3720
	0    1    1    0   
$EndComp
Wire Wire Line
	4330 4920 4330 5200
$EndSCHEMATC

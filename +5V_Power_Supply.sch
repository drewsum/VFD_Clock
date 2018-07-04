EESchema Schematic File Version 2
LIBS:74xx
LIBS:ac-dc
LIBS:actel
LIBS:adc-dac
LIBS:allegro
LIBS:Altera
LIBS:analog_devices
LIBS:analog_switches
LIBS:atmel
LIBS:audio
LIBS:battery_management
LIBS:bbd
LIBS:bosch
LIBS:brooktre
LIBS:cmos_ieee
LIBS:cmos4000
LIBS:conn
LIBS:contrib
LIBS:Custom Library
LIBS:cypress
LIBS:dc-dc
LIBS:device
LIBS:digital-audio
LIBS:diode
LIBS:display
LIBS:dsp
LIBS:elec-unifil
LIBS:ESD_Protection
LIBS:ftdi
LIBS:gennum
LIBS:graphic_symbols
LIBS:hc11
LIBS:infineon
LIBS:intel
LIBS:interface
LIBS:intersil
LIBS:ir
LIBS:Lattice
LIBS:leds
LIBS:LEM
LIBS:linear
LIBS:logic_programmable
LIBS:maxim
LIBS:mechanical
LIBS:memory
LIBS:microchip_dspic33dsc
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic24mcu
LIBS:microchip_pic32mcu
LIBS:microchip
LIBS:microcontrollers
LIBS:modules
LIBS:motor_drivers
LIBS:motorola
LIBS:motors
LIBS:msp430
LIBS:nordicsemi
LIBS:nxp_armmcu
LIBS:nxp
LIBS:onsemi
LIBS:opto
LIBS:Oscillators
LIBS:philips
LIBS:Power_Management
LIBS:power
LIBS:powerint
LIBS:pspice
LIBS:references
LIBS:regul
LIBS:relays
LIBS:rfcom
LIBS:RFSolutions
LIBS:sensors
LIBS:silabs
LIBS:siliconi
LIBS:stm8
LIBS:stm32
LIBS:supertex
LIBS:switches
LIBS:texas
LIBS:transf
LIBS:transistors
LIBS:triac_thyristor
LIBS:ttl_ieee
LIBS:valves
LIBS:video
LIBS:wiznet
LIBS:Worldsemi
LIBS:Xicor
LIBS:xilinx
LIBS:zetex
LIBS:Zilog
LIBS:74xgxx
LIBS:VFD_Clock-cache
EELAYER 25 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 13 17
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
L LT8620-MSE U?
U 1 1 5A2A5BCA
P 5650 4200
F 0 "U?" H 6100 3100 60  0000 C CNN
F 1 "LT8620-MSE" H 5650 5300 60  0000 C CNN
F 2 "" H 5650 5700 60  0001 C CNN
F 3 "" H 5650 5700 60  0001 C CNN
	1    5650 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2A5BD1
P 5550 5400
F 0 "#PWR?" H 5550 5150 50  0001 C CNN
F 1 "GND" H 5550 5250 50  0000 C CNN
F 2 "" H 5550 5400 50  0001 C CNN
F 3 "" H 5550 5400 50  0001 C CNN
	1    5550 5400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2A5BD7
P 5750 5400
F 0 "#PWR?" H 5750 5150 50  0001 C CNN
F 1 "GND" H 5750 5250 50  0000 C CNN
F 2 "" H 5750 5400 50  0001 C CNN
F 3 "" H 5750 5400 50  0001 C CNN
	1    5750 5400
	1    0    0    -1  
$EndComp
$Comp
L R_Custom R?
U 1 1 5A2A5BE0
P 4780 5370
F 0 "R?" H 4720 5370 50  0000 R CNN
F 1 "18.2k" V 4780 5370 40  0000 C CNN
F 2 "" H 4780 5370 50  0001 C CNN
F 3 "" H 4780 5370 50  0001 C CNN
F 4 "0402" H 4850 5450 50  0000 L CNN "display_footprint"
F 5 "1%" H 4850 5370 50  0000 L CNN "Tolerance"
F 6 "1/16W" H 4850 5300 50  0000 L CNN "Wattage"
	1    4780 5370
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2A5BE7
P 4780 5520
F 0 "#PWR?" H 4780 5270 50  0001 C CNN
F 1 "GND" H 4780 5370 50  0000 C CNN
F 2 "" H 4780 5520 50  0001 C CNN
F 3 "" H 4780 5520 50  0001 C CNN
	1    4780 5520
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C?
U 1 1 5A2A5BF0
P 4180 5380
F 0 "C?" H 4205 5480 50  0000 L CNN
F 1 "10nF" H 4205 5280 50  0000 L CNN
F 2 "" H 4218 5230 50  0001 C CNN
F 3 "" H 4205 5480 50  0001 C CNN
F 4 "0402" H 4030 5480 50  0000 R CNN "display_footprint"
F 5 "50V" H 4030 5380 50  0000 R CNN "Voltage"
F 6 "X7R" H 4030 5280 50  0000 R CNN "Dielectric"
	1    4180 5380
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2A5BF7
P 4180 5530
F 0 "#PWR?" H 4180 5280 50  0001 C CNN
F 1 "GND" H 4180 5380 50  0000 C CNN
F 2 "" H 4180 5530 50  0001 C CNN
F 3 "" H 4180 5530 50  0001 C CNN
	1    4180 5530
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2A5BFD
P 3580 5530
F 0 "#PWR?" H 3580 5280 50  0001 C CNN
F 1 "GND" H 3580 5380 50  0000 C CNN
F 2 "" H 3580 5530 50  0001 C CNN
F 3 "" H 3580 5530 50  0001 C CNN
	1    3580 5530
	1    0    0    -1  
$EndComp
$Comp
L L_Custom L?
U 1 1 5A2A5C06
P 7320 3900
F 0 "L?" V 7270 3900 50  0000 C CNN
F 1 "2.2uH" V 7395 3900 50  0000 C CNN
F 2 "" H 7320 3900 50  0001 C CNN
F 3 "" H 7320 3900 50  0001 C CNN
F 4 "IHLP2525" V 7470 3900 50  0000 C CNN "display_footprint"
F 5 "8A" V 7570 3900 50  0000 C CNN "Ampacity"
F 6 "20%" V 7670 3900 50  0000 C CNN "Tolerance"
	1    7320 3900
	0    -1   -1   0   
$EndComp
$Comp
L C_Custom C?
U 1 1 5A2A5C10
P 6780 3550
F 0 "C?" H 6805 3650 50  0000 L CNN
F 1 "0.1uF" H 6805 3450 50  0000 L CNN
F 2 "" H 6818 3400 50  0001 C CNN
F 3 "" H 6805 3650 50  0001 C CNN
F 4 "0402" H 6630 3650 50  0000 R CNN "display_footprint"
F 5 "50V" H 6630 3550 50  0000 R CNN "Voltage"
F 6 "X7R" H 6630 3450 50  0000 R CNN "Dielectric"
	1    6780 3550
	1    0    0    -1  
$EndComp
$Comp
L R_Custom R?
U 1 1 5A2A5C1A
P 8350 4330
F 0 "R?" H 8290 4330 50  0000 R CNN
F 1 "1M" V 8350 4330 50  0000 C CNN
F 2 "" H 8350 4330 50  0001 C CNN
F 3 "" H 8350 4330 50  0001 C CNN
F 4 "0402" H 8420 4410 50  0000 L CNN "display_footprint"
F 5 "1%" H 8420 4330 50  0000 L CNN "Tolerance"
F 6 "1/16W" H 8420 4260 50  0000 L CNN "Wattage"
	1    8350 4330
	-1   0    0    1   
$EndComp
$Comp
L R_Custom R?
U 1 1 5A2A5C24
P 8350 5290
F 0 "R?" H 8290 5290 50  0000 R CNN
F 1 "243k" V 8350 5290 50  0000 C CNN
F 2 "" H 8350 5290 50  0001 C CNN
F 3 "" H 8350 5290 50  0001 C CNN
F 4 "0402" H 8420 5370 50  0000 L CNN "display_footprint"
F 5 "1%" H 8420 5290 50  0000 L CNN "Tolerance"
F 6 "1/16W" H 8420 5220 50  0000 L CNN "Wattage"
	1    8350 5290
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2A5C2B
P 8350 5440
F 0 "#PWR?" H 8350 5190 50  0001 C CNN
F 1 "GND" H 8350 5290 50  0000 C CNN
F 2 "" H 8350 5440 50  0001 C CNN
F 3 "" H 8350 5440 50  0001 C CNN
	1    8350 5440
	1    0    0    -1  
$EndComp
$Comp
L R_Custom R?
U 1 1 5A2A5C34
P 2980 5390
F 0 "R?" H 2920 5390 50  0000 R CNN
F 1 "0" V 2980 5390 50  0000 C CNN
F 2 "" H 2980 5390 50  0001 C CNN
F 3 "" H 2980 5390 50  0001 C CNN
F 4 "0402" H 3050 5470 50  0000 L CNN "display_footprint"
F 5 "1%" H 3050 5390 50  0000 L CNN "Tolerance"
F 6 "1/16W" H 3050 5320 50  0000 L CNN "Wattage"
	1    2980 5390
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2A5C3B
P 2980 5540
F 0 "#PWR?" H 2980 5290 50  0001 C CNN
F 1 "GND" H 2980 5390 50  0000 C CNN
F 2 "" H 2980 5540 50  0001 C CNN
F 3 "" H 2980 5540 50  0001 C CNN
	1    2980 5540
	1    0    0    -1  
$EndComp
$Comp
L R_Custom R?
U 1 1 5A2A5C44
P 2380 5390
F 0 "R?" H 2320 5390 50  0000 R CNN
F 1 "10k" V 2380 5390 50  0000 C CNN
F 2 "" H 2380 5390 50  0001 C CNN
F 3 "" H 2380 5390 50  0001 C CNN
F 4 "0402" H 2450 5470 50  0000 L CNN "display_footprint"
F 5 "1%" H 2450 5390 50  0000 L CNN "Tolerance"
F 6 "1/16W" H 2450 5320 50  0000 L CNN "Wattage"
	1    2380 5390
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2A5C4B
P 2380 5540
F 0 "#PWR?" H 2380 5290 50  0001 C CNN
F 1 "GND" H 2380 5390 50  0000 C CNN
F 2 "" H 2380 5540 50  0001 C CNN
F 3 "" H 2380 5540 50  0001 C CNN
	1    2380 5540
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C?
U 1 1 5A2A5C5A
P 8950 4330
F 0 "C?" H 8975 4430 50  0000 L CNN
F 1 "47uF" H 8975 4230 50  0000 L CNN
F 2 "" H 8988 4180 50  0001 C CNN
F 3 "" H 8975 4430 50  0001 C CNN
F 4 "1210" H 8800 4430 50  0000 R CNN "display_footprint"
F 5 "10V" H 8800 4330 50  0000 R CNN "Voltage"
F 6 "X7R" H 8800 4230 50  0000 R CNN "Dielectric"
	1    8950 4330
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2A5C61
P 8950 4480
F 0 "#PWR?" H 8950 4230 50  0001 C CNN
F 1 "GND" H 8950 4330 50  0000 C CNN
F 2 "" H 8950 4480 50  0001 C CNN
F 3 "" H 8950 4480 50  0001 C CNN
	1    8950 4480
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2A5C67
P 9550 4480
F 0 "#PWR?" H 9550 4230 50  0001 C CNN
F 1 "GND" H 9550 4330 50  0000 C CNN
F 2 "" H 9550 4480 50  0001 C CNN
F 3 "" H 9550 4480 50  0001 C CNN
	1    9550 4480
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2A5C73
P 4550 3680
F 0 "#PWR?" H 4550 3430 50  0001 C CNN
F 1 "GND" H 4550 3530 50  0000 C CNN
F 2 "" H 4550 3680 50  0001 C CNN
F 3 "" H 4550 3680 50  0001 C CNN
	1    4550 3680
	1    0    0    -1  
$EndComp
$Comp
L L_Custom L?
U 1 1 5A2A5C7C
P 4100 3300
F 0 "L?" V 4050 3300 50  0000 C CNN
F 1 "4.7uH" V 4175 3300 50  0000 C CNN
F 2 "" H 4100 3300 50  0001 C CNN
F 3 "" H 4100 3300 50  0001 C CNN
F 4 "IHLP2525" V 4250 3300 50  0000 C CNN "display_footprint"
F 5 "5.5A" V 4350 3300 50  0000 C CNN "Ampacity"
F 6 "20%" V 4450 3300 50  0000 C CNN "Tolerance"
	1    4100 3300
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2A5C83
P 3800 3680
F 0 "#PWR?" H 3800 3430 50  0001 C CNN
F 1 "GND" H 3800 3530 50  0000 C CNN
F 2 "" H 3800 3680 50  0001 C CNN
F 3 "" H 3800 3680 50  0001 C CNN
	1    3800 3680
	1    0    0    -1  
$EndComp
$Comp
L L_Custom FB?
U 1 1 5A2A5C8B
P 3370 3300
F 0 "FB?" V 3320 3300 50  0000 C CNN
F 1 "220R" V 3445 3300 50  0000 C CNN
F 2 "" H 3370 3300 50  0001 C CNN
F 3 "" H 3370 3300 50  0001 C CNN
F 4 "0805" V 3520 3300 50  0000 C CNN "display_footprint"
F 5 "3A" V 3620 3300 50  0000 C CNN "Ampacity"
	1    3370 3300
	0    -1   -1   0   
$EndComp
$Comp
L C_Custom C?
U 1 1 5A2A5C95
P 2980 3530
F 0 "C?" H 3005 3630 50  0000 L CNN
F 1 "4.7uF" H 3005 3430 50  0000 L CNN
F 2 "" H 3018 3380 50  0001 C CNN
F 3 "" H 3005 3630 50  0001 C CNN
F 4 "1206" H 2830 3630 50  0000 R CNN "display_footprint"
F 5 "50V" H 2830 3530 50  0000 R CNN "Voltage"
F 6 "X7R" H 2830 3430 50  0000 R CNN "Dielectric"
	1    2980 3530
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2A5C9C
P 2980 3680
F 0 "#PWR?" H 2980 3430 50  0001 C CNN
F 1 "GND" H 2980 3530 50  0000 C CNN
F 2 "" H 2980 3680 50  0001 C CNN
F 3 "" H 2980 3680 50  0001 C CNN
	1    2980 3680
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR?
U 1 1 5A2A5CA2
P 2980 3220
F 0 "#PWR?" H 2980 3070 50  0001 C CNN
F 1 "+24V" H 2980 3360 50  0000 C CNN
F 2 "" H 2980 3220 50  0001 C CNN
F 3 "" H 2980 3220 50  0001 C CNN
	1    2980 3220
	1    0    0    -1  
$EndComp
$Comp
L R_Custom R?
U 1 1 5A2A5CAB
P 2380 3530
F 0 "R?" H 2320 3530 50  0000 R CNN
F 1 "10k" V 2380 3530 50  0000 C CNN
F 2 "" H 2380 3530 50  0001 C CNN
F 3 "" H 2380 3530 50  0001 C CNN
F 4 "0402" H 2450 3610 50  0000 L CNN "display_footprint"
F 5 "1%" H 2450 3530 50  0000 L CNN "Tolerance"
F 6 "1/16W" H 2450 3460 50  0000 L CNN "Wattage"
	1    2380 3530
	-1   0    0    1   
$EndComp
$Comp
L R_Custom R?
U 1 1 5A2A5CB5
P 1820 4000
F 0 "R?" V 1720 4000 50  0000 C CNN
F 1 "100" V 1820 4000 50  0000 C CNN
F 2 "" H 1820 4000 50  0001 C CNN
F 3 "" H 1820 4000 50  0001 C CNN
F 4 "0402" V 1920 4000 50  0000 C CNN "display_footprint"
F 5 "1%" V 2020 4000 50  0000 C CNN "Tolerance"
F 6 "1/16W" V 2120 4000 50  0000 C CNN "Wattage"
	1    1820 4000
	0    -1   -1   0   
$EndComp
$Comp
L R_Custom R?
U 1 1 5A2A5CBF
P 1820 4300
F 0 "R?" V 1720 4300 50  0000 C CNN
F 1 "100" V 1820 4300 50  0000 C CNN
F 2 "" H 1820 4300 50  0001 C CNN
F 3 "" H 1820 4300 50  0001 C CNN
F 4 "0402" V 1920 4300 50  0000 C CNN "display_footprint"
F 5 "1%" V 2020 4300 50  0000 C CNN "Tolerance"
F 6 "1/16W" V 2120 4300 50  0000 C CNN "Wattage"
	1    1820 4300
	0    1    1    0   
$EndComp
Text Label 4880 5100 2    60   ~ 0
RT
Text Label 4880 4900 2    60   ~ 0
TR/SS
Text Label 4880 4700 2    60   ~ 0
INTVCC
Text Label 4880 4500 2    60   ~ 0
SYNC
Text Label 4880 4300 2    60   ~ 0
EN/UV
Text Label 4880 4000 2    60   ~ 0
PG
Text Label 4820 3300 2    60   ~ 0
VIN
Text Label 3760 3300 2    60   ~ 0
FLT
Text Label 6420 3300 0    60   ~ 0
BST
Text Label 6480 3900 0    60   ~ 0
SW
Text Label 6420 4800 0    60   ~ 0
FB
$Comp
L C_Custom C?
U 1 1 5A2A5D19
P 3800 3530
F 0 "C?" H 3825 3630 50  0000 L CNN
F 1 "4.7uF" H 3825 3430 50  0000 L CNN
F 2 "" H 3838 3380 50  0001 C CNN
F 3 "" H 3825 3630 50  0001 C CNN
F 4 "1206" H 3650 3630 50  0000 R CNN "display_footprint"
F 5 "50V" H 3650 3530 50  0000 R CNN "Voltage"
F 6 "X7R" H 3650 3430 50  0000 R CNN "Dielectric"
	1    3800 3530
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C?
U 1 1 5A2A5D23
P 4550 3530
F 0 "C?" H 4575 3630 50  0000 L CNN
F 1 "4.7uF" H 4575 3430 50  0000 L CNN
F 2 "" H 4588 3380 50  0001 C CNN
F 3 "" H 4575 3630 50  0001 C CNN
F 4 "1206" H 4400 3630 50  0000 R CNN "display_footprint"
F 5 "50V" H 4400 3530 50  0000 R CNN "Voltage"
F 6 "X7R" H 4400 3430 50  0000 R CNN "Dielectric"
	1    4550 3530
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C?
U 1 1 5A2A5D2D
P 3580 5380
F 0 "C?" H 3605 5480 50  0000 L CNN
F 1 "1uF" H 3605 5280 50  0000 L CNN
F 2 "" H 3618 5230 50  0001 C CNN
F 3 "" H 3605 5480 50  0001 C CNN
F 4 "0805" H 3430 5480 50  0000 R CNN "display_footprint"
F 5 "50V" H 3430 5380 50  0000 R CNN "Voltage"
F 6 "X7R" H 3430 5280 50  0000 R CNN "Dielectric"
	1    3580 5380
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C?
U 1 1 5A2A5D37
P 9550 4330
F 0 "C?" H 9575 4430 50  0000 L CNN
F 1 "0.1uF" H 9575 4230 50  0000 L CNN
F 2 "" H 9588 4180 50  0001 C CNN
F 3 "" H 9575 4430 50  0001 C CNN
F 4 "0402" H 9400 4430 50  0000 R CNN "display_footprint"
F 5 "50V" H 9400 4330 50  0000 R CNN "Voltage"
F 6 "X7R" H 9400 4230 50  0000 R CNN "Dielectric"
	1    9550 4330
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C?
U 1 1 5A2A5D41
P 7750 4330
F 0 "C?" H 7775 4430 50  0000 L CNN
F 1 "10pF" H 7775 4230 50  0000 L CNN
F 2 "" H 7788 4180 50  0001 C CNN
F 3 "" H 7775 4430 50  0001 C CNN
F 4 "0402" H 7600 4430 50  0000 R CNN "display_footprint"
F 5 "50V" H 7600 4330 50  0000 R CNN "Voltage"
F 6 "NP0" H 7600 4230 50  0000 R CNN "Dielectric"
	1    7750 4330
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5A2A5D48
P 2380 3380
F 0 "#PWR?" H 2380 3230 50  0001 C CNN
F 1 "+5V" H 2380 3520 50  0000 C CNN
F 2 "" H 2380 3380 50  0001 C CNN
F 3 "" H 2380 3380 50  0001 C CNN
	1    2380 3380
	1    0    0    -1  
$EndComp
Text GLabel 1670 4000 0    60   Output ~ 0
POS5_PGOOD
$Comp
L +5V #PWR?
U 1 1 5A2A6566
P 9550 3820
F 0 "#PWR?" H 9550 3670 50  0001 C CNN
F 1 "+5V" H 9550 3960 50  0000 C CNN
F 2 "" H 9550 3820 50  0001 C CNN
F 3 "" H 9550 3820 50  0001 C CNN
	1    9550 3820
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5A2A65B7
P 6480 4160
F 0 "#PWR?" H 6480 4010 50  0001 C CNN
F 1 "+5V" H 6480 4300 50  0000 C CNN
F 2 "" H 6480 4160 50  0001 C CNN
F 3 "" H 6480 4160 50  0001 C CNN
	1    6480 4160
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR?
U 1 1 5A2A6A67
P 1670 4300
F 0 "#PWR?" H 1670 4150 50  0001 C CNN
F 1 "+24V" V 1670 4530 50  0000 C CNN
F 2 "" H 1670 4300 50  0001 C CNN
F 3 "" H 1670 4300 50  0001 C CNN
	1    1670 4300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4780 5220 4780 5100
Wire Wire Line
	4780 5100 4900 5100
Wire Wire Line
	4180 5230 4180 4900
Wire Wire Line
	4180 4900 4900 4900
Wire Wire Line
	3580 5230 3580 4700
Wire Wire Line
	3580 4700 4900 4700
Wire Wire Line
	6780 3300 6780 3400
Wire Wire Line
	6400 3900 7170 3900
Wire Wire Line
	6440 3700 6440 3900
Wire Wire Line
	6440 3800 6400 3800
Connection ~ 6440 3800
Connection ~ 6440 3900
Wire Wire Line
	6780 3700 6780 3900
Wire Wire Line
	8350 3900 8350 4180
Wire Wire Line
	7750 3900 7750 4180
Connection ~ 7750 3900
Connection ~ 7750 4800
Wire Wire Line
	4900 3400 4860 3400
Wire Wire Line
	4860 3400 4860 3300
Wire Wire Line
	4250 3300 4900 3300
Wire Wire Line
	2980 5240 2980 4500
Wire Wire Line
	2980 4500 4900 4500
Wire Wire Line
	2380 5240 2380 4300
Wire Wire Line
	1970 4300 4900 4300
Wire Wire Line
	6480 4160 6480 4200
Wire Wire Line
	6480 4200 6400 4200
Wire Wire Line
	8950 3900 8950 4180
Connection ~ 8350 3900
Wire Wire Line
	9550 3820 9550 4180
Connection ~ 8950 3900
Connection ~ 9550 3900
Wire Wire Line
	6400 4800 8350 4800
Wire Wire Line
	7470 3900 9550 3900
Connection ~ 4860 3300
Wire Wire Line
	4550 3380 4550 3300
Connection ~ 4550 3300
Wire Wire Line
	3520 3300 3950 3300
Wire Wire Line
	3800 3380 3800 3300
Connection ~ 3800 3300
Wire Wire Line
	2980 3300 3220 3300
Wire Wire Line
	2980 3220 2980 3380
Connection ~ 2980 3300
Wire Wire Line
	6440 3700 6400 3700
Wire Wire Line
	6780 3300 6400 3300
Connection ~ 6780 3900
Wire Wire Line
	8350 4480 8350 5140
Connection ~ 8350 4800
Wire Wire Line
	7750 4800 7750 4480
Wire Wire Line
	1970 4000 4900 4000
Wire Wire Line
	2380 4000 2380 3680
Connection ~ 2380 4300
Connection ~ 2380 4000
$EndSCHEMATC
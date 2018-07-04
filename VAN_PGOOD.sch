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
Sheet 11 13
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
L LT6700-1-S6 U?
U 1 1 5A18719E
P 5690 3830
F 0 "U?" H 5990 3330 60  0000 C CNN
F 1 "LT6700-1-S6" H 5690 3830 60  0000 C CNN
F 2 "" H 5690 4430 60  0001 C CNN
F 3 "" H 5690 4430 60  0001 C CNN
	1    5690 3830
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 5A1873EF
P 5690 3180
F 0 "#PWR?" H 5690 3030 50  0001 C CNN
F 1 "+3.3V" H 5690 3320 50  0000 C CNN
F 2 "" H 5690 3180 50  0000 C CNN
F 3 "" H 5690 3180 50  0000 C CNN
	1    5690 3180
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A18761F
P 5690 4480
F 0 "#PWR?" H 5690 4230 50  0001 C CNN
F 1 "GND" H 5690 4330 50  0000 C CNN
F 2 "" H 5690 4480 50  0001 C CNN
F 3 "" H 5690 4480 50  0001 C CNN
	1    5690 4480
	1    0    0    -1  
$EndComp
Wire Wire Line
	6290 4080 6330 4080
Wire Wire Line
	6330 4080 6330 3580
Wire Wire Line
	6290 3580 6410 3580
Wire Wire Line
	6850 3440 6850 3580
Wire Wire Line
	6710 3580 6950 3580
Text GLabel 6950 3580 2    60   Output ~ 0
VAN_PGOOD
Connection ~ 6850 3580
$Comp
L +3.3V #PWR?
U 1 1 5A187E02
P 6850 3140
F 0 "#PWR?" H 6850 2990 50  0001 C CNN
F 1 "+3.3V" H 6850 3280 50  0000 C CNN
F 2 "" H 6850 3140 50  0001 C CNN
F 3 "" H 6850 3140 50  0001 C CNN
	1    6850 3140
	1    0    0    -1  
$EndComp
$Comp
L R_Custom R?
U 1 1 5A187E0B
P 6850 3290
F 0 "R?" H 6790 3290 50  0000 R CNN
F 1 "10k" V 6850 3290 50  0000 C CNN
F 2 "" H 6850 3290 50  0001 C CNN
F 3 "" H 6850 3290 50  0001 C CNN
F 4 "0402" H 6920 3370 50  0000 L CNN "display_footprint"
F 5 "1%" H 6920 3290 50  0000 L CNN "Tolerance"
F 6 "1/16W" H 6920 3220 50  0000 L CNN "Wattage"
	1    6850 3290
	-1   0    0    1   
$EndComp
$Comp
L R_Custom R?
U 1 1 5A187E15
P 6560 3580
F 0 "R?" V 6460 3580 50  0000 C CNN
F 1 "100" V 6560 3580 50  0000 C CNN
F 2 "" H 6560 3580 50  0001 C CNN
F 3 "" H 6560 3580 50  0001 C CNN
F 4 "0402" V 6660 3580 50  0000 C CNN "display_footprint"
F 5 "1%" V 6760 3580 50  0000 C CNN "Tolerance"
F 6 "1/16W" V 6860 3580 50  0000 C CNN "Wattage"
	1    6560 3580
	0    1    1    0   
$EndComp
Connection ~ 6330 3580
$Comp
L GND #PWR?
U 1 1 5A18837C
P 4700 4480
F 0 "#PWR?" H 4700 4230 50  0001 C CNN
F 1 "GND" H 4700 4330 50  0000 C CNN
F 2 "" H 4700 4480 50  0000 C CNN
F 3 "" H 4700 4480 50  0000 C CNN
	1    4700 4480
	1    0    0    -1  
$EndComp
$Comp
L R_Custom R?
U 1 1 5A18838D
P 4700 3330
F 0 "R?" H 4640 3330 50  0000 R CNN
F 1 "R" V 4700 3330 40  0000 C CNN
F 2 "" H 4700 3330 50  0001 C CNN
F 3 "" H 4700 3330 50  0001 C CNN
F 4 "0402" H 4770 3410 50  0000 L CNN "display_footprint"
F 5 "1%" H 4770 3330 50  0000 L CNN "Tolerance"
F 6 "1/16W" H 4770 3260 50  0000 L CNN "Wattage"
	1    4700 3330
	-1   0    0    1   
$EndComp
$Comp
L R_Custom R?
U 1 1 5A188397
P 4700 3830
F 0 "R?" H 4640 3830 50  0000 R CNN
F 1 "R" V 4700 3830 40  0000 C CNN
F 2 "" H 4700 3830 50  0001 C CNN
F 3 "" H 4700 3830 50  0001 C CNN
F 4 "0402" H 4770 3910 50  0000 L CNN "display_footprint"
F 5 "1%" H 4770 3830 50  0000 L CNN "Tolerance"
F 6 "1/16W" H 4770 3760 50  0000 L CNN "Wattage"
	1    4700 3830
	-1   0    0    1   
$EndComp
$Comp
L R_Custom R?
U 1 1 5A1883A1
P 4700 4330
F 0 "R?" H 4640 4330 50  0000 R CNN
F 1 "R" V 4700 4330 40  0000 C CNN
F 2 "" H 4700 4330 50  0001 C CNN
F 3 "" H 4700 4330 50  0001 C CNN
F 4 "0402" H 4770 4410 50  0000 L CNN "display_footprint"
F 5 "1%" H 4770 4330 50  0000 L CNN "Tolerance"
F 6 "1/16W" H 4770 4260 50  0000 L CNN "Wattage"
	1    4700 4330
	-1   0    0    1   
$EndComp
Wire Wire Line
	4700 4180 4700 3980
Wire Wire Line
	5090 4080 4700 4080
Connection ~ 4700 4080
Wire Wire Line
	4700 3680 4700 3480
Wire Wire Line
	5090 3580 4700 3580
Connection ~ 4700 3580
$Comp
L GND #PWR?
U 1 1 5A1893DA
P 7130 4710
F 0 "#PWR?" H 7130 4460 50  0001 C CNN
F 1 "GND" H 7130 4560 50  0000 C CNN
F 2 "" H 7130 4710 50  0000 C CNN
F 3 "" H 7130 4710 50  0000 C CNN
	1    7130 4710
	1    0    0    -1  
$EndComp
Wire Wire Line
	6810 4290 6810 4330
Connection ~ 7130 4290
Wire Wire Line
	7450 4290 7450 4330
Wire Wire Line
	6810 4290 7450 4290
Wire Wire Line
	7130 4250 7130 4330
Wire Wire Line
	6810 4670 6810 4630
Connection ~ 7130 4670
Wire Wire Line
	7450 4670 7450 4630
Wire Wire Line
	6810 4670 7450 4670
Wire Wire Line
	7130 4630 7130 4710
$Comp
L C_Custom C?
U 1 1 5A1893F1
P 6810 4480
F 0 "C?" H 6835 4580 50  0000 L CNN
F 1 "0.1uF" H 6835 4380 50  0000 L CNN
F 2 "" H 6848 4330 50  0001 C CNN
F 3 "" H 6835 4580 50  0001 C CNN
F 4 "0402" H 6660 4580 50  0000 R CNN "display_footprint"
F 5 "50V" H 6660 4480 50  0000 R CNN "Voltage"
F 6 "X7R" H 6660 4380 50  0000 R CNN "Dielectric"
	1    6810 4480
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C?
U 1 1 5A1893FB
P 7450 4480
F 0 "C?" H 7475 4580 50  0000 L CNN
F 1 "1nF" H 7475 4380 50  0000 L CNN
F 2 "" H 7488 4330 50  0001 C CNN
F 3 "" H 7475 4580 50  0001 C CNN
F 4 "0402" H 7300 4580 50  0001 R CNN "display_footprint"
F 5 "50V" H 7300 4480 50  0001 R CNN "Voltage"
F 6 "X7R" H 7300 4380 50  0001 R CNN "Dielectric"
	1    7450 4480
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C?
U 1 1 5A189405
P 7130 4480
F 0 "C?" H 7155 4580 50  0000 L CNN
F 1 "10nF" H 7155 4380 50  0000 L CNN
F 2 "" H 7168 4330 50  0001 C CNN
F 3 "" H 7155 4580 50  0001 C CNN
F 4 "0402" H 6980 4580 50  0001 R CNN "display_footprint"
F 5 "50V" H 6980 4480 50  0001 R CNN "Voltage"
F 6 "X7R" H 6980 4380 50  0001 R CNN "Dielectric"
	1    7130 4480
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 5A18940C
P 7130 4250
F 0 "#PWR?" H 7130 4100 50  0001 C CNN
F 1 "+3.3V" H 7130 4390 50  0000 C CNN
F 2 "" H 7130 4250 50  0000 C CNN
F 3 "" H 7130 4250 50  0000 C CNN
	1    7130 4250
	1    0    0    -1  
$EndComp
Text GLabel 4700 3180 1    60   UnSpc ~ 0
VAN_Internal
$EndSCHEMATC

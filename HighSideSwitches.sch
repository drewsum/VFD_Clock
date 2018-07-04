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
Sheet 14 15
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
L BC856W Q?
U 1 1 5A2CFDFA
P 2810 1380
F 0 "Q?" H 3010 1455 50  0000 L CNN
F 1 "BC856W" H 3010 1380 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-323" H 3010 1305 50  0001 L CIN
F 3 "" H 2810 1380 50  0001 L CNN
	1    2810 1380
	1    0    0    1   
$EndComp
$Comp
L R R?
U 1 1 5A2D0206
P 2530 1150
F 0 "R?" V 2610 1150 50  0000 C CNN
F 1 "220k" V 2530 1150 40  0000 C CNN
F 2 "" V 2460 1150 50  0001 C CNN
F 3 "" V 2610 1150 50  0001 C CNN
F 4 "Foot" H 2430 1250 50  0000 R CNN "footprint_display"
F 5 "Tol" H 2430 1150 50  0000 R CNN "Tolerance"
F 6 "W" H 2430 1050 50  0000 R CNN "Wattage"
	1    2530 1150
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5A2D098E
P 2530 1610
F 0 "R?" V 2610 1610 50  0000 C CNN
F 1 "68k" V 2530 1610 50  0000 C CNN
F 2 "" V 2460 1610 50  0001 C CNN
F 3 "" V 2610 1610 50  0001 C CNN
F 4 "Foot" H 2430 1710 50  0000 R CNN "footprint_display"
F 5 "Tol" H 2430 1610 50  0000 R CNN "Tolerance"
F 6 "W" H 2430 1510 50  0000 R CNN "Wattage"
	1    2530 1610
	1    0    0    -1  
$EndComp
Wire Wire Line
	2530 1300 2530 1460
Wire Wire Line
	2530 1380 2610 1380
Connection ~ 2530 1380
$Comp
L VAN #PWR?
U 1 1 5A2D177A
P 2910 1000
F 0 "#PWR?" H 2910 850 50  0001 C CNN
F 1 "VAN" H 2910 1150 50  0000 C CNN
F 2 "" H 2910 1000 50  0001 C CNN
F 3 "" H 2910 1000 50  0001 C CNN
	1    2910 1000
	1    0    0    -1  
$EndComp
$Comp
L VAN #PWR?
U 1 1 5A2D1795
P 2530 1000
F 0 "#PWR?" H 2530 850 50  0001 C CNN
F 1 "VAN" H 2530 1150 50  0000 C CNN
F 2 "" H 2530 1000 50  0001 C CNN
F 3 "" H 2530 1000 50  0001 C CNN
	1    2530 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2910 1000 2910 1180
$Comp
L BC847W Q?
U 1 1 5A2D1B69
P 2430 1960
F 0 "Q?" H 2630 2035 50  0000 L CNN
F 1 "BC847W" H 2070 2070 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-323" H 2630 1885 50  0001 L CIN
F 3 "" H 2430 1960 50  0001 L CNN
	1    2430 1960
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5A2D2319
P 2910 2010
F 0 "R?" V 2990 2010 50  0000 C CNN
F 1 "100k" V 2910 2010 40  0000 C CNN
F 2 "" V 2840 2010 50  0001 C CNN
F 3 "" V 2990 2010 50  0001 C CNN
F 4 "Foot" H 2810 2110 50  0000 R CNN "footprint_display"
F 5 "Tol" H 2810 2010 50  0000 R CNN "Tolerance"
F 6 "W" H 2810 1910 50  0000 R CNN "Wattage"
	1    2910 2010
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2910 1860 2910 1580
$Comp
L GND #PWR?
U 1 1 5A2D2764
P 2530 2160
F 0 "#PWR?" H 2530 1910 50  0001 C CNN
F 1 "GND" H 2530 2010 50  0000 C CNN
F 2 "" H 2530 2160 50  0001 C CNN
F 3 "" H 2530 2160 50  0001 C CNN
	1    2530 2160
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2D2794
P 2910 2160
F 0 "#PWR?" H 2910 1910 50  0001 C CNN
F 1 "GND" H 2910 2010 50  0000 C CNN
F 2 "" H 2910 2160 50  0001 C CNN
F 3 "" H 2910 2160 50  0001 C CNN
	1    2910 2160
	1    0    0    -1  
$EndComp
$EndSCHEMATC

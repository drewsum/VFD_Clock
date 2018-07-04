EESchema Schematic File Version 2
LIBS:VFD_Clock-rescue
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
Sheet 5 19
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
L DS3232M U?
U 1 1 5A2CA382
P 5000 3210
F 0 "U?" H 4900 3685 50  0000 R CNN
F 1 "DS3232M" H 4900 3610 50  0000 R CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 5050 2810 50  0001 L CNN
F 3 "" H 5270 3460 50  0001 C CNN
	1    5000 3210
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2CA740
P 5000 3710
F 0 "#PWR?" H 5000 3460 50  0001 C CNN
F 1 "GND" H 5000 3560 50  0000 C CNN
F 2 "" H 5000 3710 50  0001 C CNN
F 3 "" H 5000 3710 50  0001 C CNN
	1    5000 3710
	1    0    0    -1  
$EndComp
$Comp
L +3.3V-RESCUE-VFD_Clock #PWR?
U 1 1 5A2CA762
P 5000 2710
F 0 "#PWR?" H 5000 2560 50  0001 C CNN
F 1 "+3.3V" H 5000 2850 50  0000 C CNN
F 2 "" H 5000 2710 50  0000 C CNN
F 3 "" H 5000 2710 50  0000 C CNN
	1    5000 2710
	1    0    0    -1  
$EndComp
NoConn ~ 4500 3410
$Comp
L +3.3V-RESCUE-VFD_Clock #PWR?
U 1 1 5A2CAF4A
P 3220 2730
F 0 "#PWR?" H 3220 2580 50  0001 C CNN
F 1 "+3.3V" H 3220 2870 50  0000 C CNN
F 2 "" H 3220 2730 50  0001 C CNN
F 3 "" H 3220 2730 50  0001 C CNN
	1    3220 2730
	-1   0    0    -1  
$EndComp
$Comp
L +3.3V-RESCUE-VFD_Clock #PWR?
U 1 1 5A2CAF50
P 2670 2730
F 0 "#PWR?" H 2670 2580 50  0001 C CNN
F 1 "+3.3V" H 2670 2870 50  0000 C CNN
F 2 "" H 2670 2730 50  0001 C CNN
F 3 "" H 2670 2730 50  0001 C CNN
	1    2670 2730
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4500 3110 2410 3110
Wire Wire Line
	3220 3030 3220 3110
Wire Wire Line
	4500 3210 2410 3210
Wire Wire Line
	2670 3210 2670 3030
Connection ~ 3220 3110
Connection ~ 2670 3210
Text GLabel 2110 3110 0    60   Input ~ 0
IIC_SCL
Text GLabel 2110 3210 0    60   BiDi ~ 0
IIC_SDA
Text Label 3920 3110 2    60   ~ 0
IIC_SCL_RTC
Text Label 3920 3210 2    60   ~ 0
IIC_SDA_RTC
$Comp
L Res_Custom R?
U 1 1 5A2CAF63
P 2260 3110
F 0 "R?" V 2160 3110 50  0000 C CNN
F 1 "0" V 2260 3110 50  0000 C CNN
F 2 "" H 2260 3110 50  0001 C CNN
F 3 "" H 2260 3110 50  0001 C CNN
F 4 "0402" V 2360 3110 50  0001 C CNN "display_footprint"
F 5 "1%" V 2460 3110 50  0001 C CNN "Tolerance"
F 6 "1/16W" V 2560 3110 50  0001 C CNN "Wattage"
	1    2260 3110
	0    -1   1    0   
$EndComp
$Comp
L Res_Custom R?
U 1 1 5A2CAF6D
P 2260 3210
F 0 "R?" V 2160 3210 50  0000 C CNN
F 1 "0" V 2250 3210 50  0000 C CNN
F 2 "" H 2260 3210 50  0001 C CNN
F 3 "" H 2260 3210 50  0001 C CNN
F 4 "0402" V 2360 3210 50  0001 C CNN "display_footprint"
F 5 "1%" V 2460 3210 50  0001 C CNN "Tolerance"
F 6 "1/16W" V 2560 3210 50  0001 C CNN "Wattage"
	1    2260 3210
	0    -1   -1   0   
$EndComp
$Comp
L R_Custom R?
U 1 1 5A2CAF81
P 2670 2880
F 0 "R?" H 2610 2880 50  0000 R CNN
F 1 "10k" V 2670 2880 50  0000 C CNN
F 2 "" H 2670 2880 50  0001 C CNN
F 3 "" H 2670 2880 50  0001 C CNN
F 4 "0603" H 2740 2960 50  0000 L CNN "display_footprint"
F 5 "1%" H 2740 2880 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 2740 2810 50  0000 L CNN "Wattage"
	1    2670 2880
	1    0    0    1   
$EndComp
$Comp
L Battery_Cell BT?
U 1 1 5A2CB402
P 5580 3690
F 0 "BT?" H 5680 3790 50  0000 L CNN
F 1 "Battery_Cell" H 5680 3690 50  0000 L CNN
F 2 "" V 5580 3750 50  0001 C CNN
F 3 "" V 5580 3750 50  0001 C CNN
	1    5580 3690
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2CB450
P 5580 3790
F 0 "#PWR?" H 5580 3540 50  0001 C CNN
F 1 "GND" H 5580 3640 50  0000 C CNN
F 2 "" H 5580 3790 50  0001 C CNN
F 3 "" H 5580 3790 50  0001 C CNN
	1    5580 3790
	1    0    0    -1  
$EndComp
Wire Wire Line
	5580 3490 5580 3410
Wire Wire Line
	5500 3410 5630 3410
$Comp
L Res_Custom R?
U 1 1 5A2CC110
P 5930 3110
F 0 "R?" V 5830 3110 50  0000 C CNN
F 1 "100" V 5920 3110 50  0000 C CNN
F 2 "" H 5930 3110 50  0001 C CNN
F 3 "" H 5930 3110 50  0001 C CNN
F 4 "0603" V 6030 3110 50  0001 C CNN "display_footprint"
F 5 "1%" V 6130 3110 50  0001 C CNN "Tolerance"
F 6 "1/10W" V 6230 3110 50  0001 C CNN "Wattage"
	1    5930 3110
	0    1    1    0   
$EndComp
Wire Wire Line
	5780 3110 5500 3110
Wire Wire Line
	6250 3030 6250 3110
Wire Wire Line
	6080 3110 6340 3110
$Comp
L +3.3V-RESCUE-VFD_Clock #PWR?
U 1 1 5A2CCA48
P 6250 2730
F 0 "#PWR?" H 6250 2580 50  0001 C CNN
F 1 "+3.3V" H 6250 2870 50  0000 C CNN
F 2 "" H 6250 2730 50  0000 C CNN
F 3 "" H 6250 2730 50  0000 C CNN
	1    6250 2730
	1    0    0    -1  
$EndComp
Text GLabel 6340 3110 2    60   Output ~ 0
~Timekeeping_Refresh
Connection ~ 6250 3110
$Comp
L TEST TP?
U 1 1 5A2CD956
P 5500 3210
F 0 "TP?" V 5500 3710 50  0000 L CNN
F 1 "32kHz" V 5500 3550 50  0000 C CNN
F 2 "" H 5500 3210 50  0001 C CNN
F 3 "" H 5500 3210 50  0001 C CNN
	1    5500 3210
	0    1    1    0   
$EndComp
$Comp
L R_Custom R?
U 1 1 5A36E32E
P 3220 2880
F 0 "R?" H 3160 2880 50  0000 R CNN
F 1 "10k" V 3220 2880 50  0000 C CNN
F 2 "" H 3220 2880 50  0001 C CNN
F 3 "" H 3220 2880 50  0001 C CNN
F 4 "0603" H 3290 2960 50  0000 L CNN "display_footprint"
F 5 "1%" H 3290 2880 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 3290 2810 50  0000 L CNN "Wattage"
	1    3220 2880
	1    0    0    1   
$EndComp
$Comp
L R_Custom R?
U 1 1 5A36E370
P 6250 2880
F 0 "R?" H 6190 2880 50  0000 R CNN
F 1 "10k" V 6250 2880 50  0000 C CNN
F 2 "" H 6250 2880 50  0001 C CNN
F 3 "" H 6250 2880 50  0001 C CNN
F 4 "0603" H 6320 2960 50  0000 L CNN "display_footprint"
F 5 "1%" H 6320 2880 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 6320 2810 50  0000 L CNN "Wattage"
	1    6250 2880
	1    0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 5A36E993
P 4410 4570
F 0 "#PWR?" H 4410 4320 50  0001 C CNN
F 1 "GND" H 4410 4420 50  0000 C CNN
F 2 "" H 4410 4570 50  0000 C CNN
F 3 "" H 4410 4570 50  0000 C CNN
	1    4410 4570
	1    0    0    -1  
$EndComp
Wire Wire Line
	4090 4150 4090 4190
Connection ~ 4410 4150
Wire Wire Line
	4730 4150 4730 4190
Wire Wire Line
	4090 4150 4730 4150
Wire Wire Line
	4410 4110 4410 4190
Wire Wire Line
	4090 4530 4090 4490
Connection ~ 4410 4530
Wire Wire Line
	4730 4530 4730 4490
Wire Wire Line
	4090 4530 4730 4530
Wire Wire Line
	4410 4490 4410 4570
$Comp
L C_Custom C?
U 1 1 5A36E9A6
P 4090 4340
F 0 "C?" H 4115 4440 50  0000 L CNN
F 1 "0.1uF" H 4115 4240 50  0000 L CNN
F 2 "" H 4128 4190 50  0001 C CNN
F 3 "" H 4115 4440 50  0001 C CNN
F 4 "0603" H 3940 4440 50  0000 R CNN "display_footprint"
F 5 "50V" H 3940 4340 50  0000 R CNN "Voltage"
F 6 "X7R" H 3940 4240 50  0000 R CNN "Dielectric"
	1    4090 4340
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C?
U 1 1 5A36E9B0
P 4730 4340
F 0 "C?" H 4755 4440 50  0000 L CNN
F 1 "1nF" H 4755 4240 50  0000 L CNN
F 2 "" H 4768 4190 50  0001 C CNN
F 3 "" H 4755 4440 50  0001 C CNN
F 4 "0603" H 4580 4440 50  0001 R CNN "display_footprint"
F 5 "50V" H 4580 4340 50  0001 R CNN "Voltage"
F 6 "X7R" H 4580 4240 50  0001 R CNN "Dielectric"
	1    4730 4340
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C?
U 1 1 5A36E9BA
P 4410 4340
F 0 "C?" H 4435 4440 50  0000 L CNN
F 1 "10nF" H 4435 4240 50  0000 L CNN
F 2 "" H 4448 4190 50  0001 C CNN
F 3 "" H 4435 4440 50  0001 C CNN
F 4 "0603" H 4260 4440 50  0001 R CNN "display_footprint"
F 5 "50V" H 4260 4340 50  0001 R CNN "Voltage"
F 6 "X7R" H 4260 4240 50  0001 R CNN "Dielectric"
	1    4410 4340
	1    0    0    -1  
$EndComp
$Comp
L +3.3V-RESCUE-VFD_Clock #PWR?
U 1 1 5A36E9C1
P 4410 4110
F 0 "#PWR?" H 4410 3960 50  0001 C CNN
F 1 "+3.3V" H 4410 4250 50  0000 C CNN
F 2 "" H 4410 4110 50  0000 C CNN
F 3 "" H 4410 4110 50  0000 C CNN
	1    4410 4110
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR?
U 1 1 5A4E1179
P 5630 3410
F 0 "#PWR?" H 5630 3260 50  0001 C CNN
F 1 "+BATT" V 5630 3640 50  0000 C CNN
F 2 "" H 5630 3410 50  0001 C CNN
F 3 "" H 5630 3410 50  0001 C CNN
	1    5630 3410
	0    1    1    0   
$EndComp
Connection ~ 5580 3410
$EndSCHEMATC

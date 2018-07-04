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
Sheet 16 17
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
L MAX6816 U?
U 1 1 5A2DB507
P 3110 1530
F 0 "U?" H 3310 1230 60  0000 C CNN
F 1 "MAX6816" H 3460 1880 60  0000 C CNN
F 2 "" H 3110 1930 60  0001 C CNN
F 3 "" H 3110 1930 60  0001 C CNN
	1    3110 1530
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2DB90F
P 3110 1880
F 0 "#PWR?" H 3110 1630 50  0001 C CNN
F 1 "GND" H 3110 1730 50  0000 C CNN
F 2 "" H 3110 1880 50  0001 C CNN
F 3 "" H 3110 1880 50  0001 C CNN
	1    3110 1880
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 5A2DBCEE
P 3110 1180
F 0 "#PWR?" H 3110 1030 50  0001 C CNN
F 1 "+3.3V" H 3110 1320 50  0000 C CNN
F 2 "" H 3110 1180 50  0000 C CNN
F 3 "" H 3110 1180 50  0000 C CNN
	1    3110 1180
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x01 J?
U 1 1 5A2DC0D9
P 2580 1810
F 0 "J?" H 2630 1910 50  0000 C CNN
F 1 "Select" H 2630 1710 50  0000 C CNN
F 2 "" H 2580 1810 50  0001 C CNN
F 3 "" H 2580 1810 50  0001 C CNN
	1    2580 1810
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2DC131
P 2580 2110
F 0 "#PWR?" H 2580 1860 50  0001 C CNN
F 1 "GND" H 2580 1960 50  0000 C CNN
F 2 "" H 2580 2110 50  0001 C CNN
F 3 "" H 2580 2110 50  0001 C CNN
	1    2580 2110
	1    0    0    -1  
$EndComp
Wire Wire Line
	2660 1530 2580 1530
Wire Wire Line
	2580 1530 2580 1610
Wire Wire Line
	4220 1390 4220 1530
Wire Wire Line
	4080 1530 4320 1530
Text GLabel 4320 1530 2    60   Output ~ 0
~Select
Connection ~ 4220 1530
$Comp
L R_Custom R?
U 1 1 5A2DCAB9
P 4220 1240
F 0 "R?" H 4160 1240 50  0000 R CNN
F 1 "10k" V 4220 1240 50  0000 C CNN
F 2 "" H 4220 1240 50  0001 C CNN
F 3 "" H 4220 1240 50  0001 C CNN
F 4 "0402" H 4290 1320 50  0000 L CNN "display_footprint"
F 5 "1%" H 4290 1240 50  0000 L CNN "Tolerance"
F 6 "1/16W" H 4290 1170 50  0000 L CNN "Wattage"
	1    4220 1240
	-1   0    0    1   
$EndComp
$Comp
L R_Custom R?
U 1 1 5A2DCAC3
P 3930 1530
F 0 "R?" V 3830 1530 50  0000 C CNN
F 1 "100" V 3930 1530 50  0000 C CNN
F 2 "" H 3930 1530 50  0001 C CNN
F 3 "" H 3930 1530 50  0001 C CNN
F 4 "0402" V 4030 1530 50  0000 C CNN "display_footprint"
F 5 "1%" V 4130 1530 50  0000 C CNN "Tolerance"
F 6 "1/16W" V 4230 1530 50  0000 C CNN "Wattage"
	1    3930 1530
	0    1    1    0   
$EndComp
Wire Wire Line
	3780 1530 3560 1530
$Comp
L +3.3V #PWR?
U 1 1 5A2DD2BD
P 4220 1090
F 0 "#PWR?" H 4220 940 50  0001 C CNN
F 1 "+3.3V" H 4220 1230 50  0000 C CNN
F 2 "" H 4220 1090 50  0000 C CNN
F 3 "" H 4220 1090 50  0000 C CNN
	1    4220 1090
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2DD82C
P 1550 1920
F 0 "#PWR?" H 1550 1670 50  0001 C CNN
F 1 "GND" H 1550 1770 50  0000 C CNN
F 2 "" H 1550 1920 50  0000 C CNN
F 3 "" H 1550 1920 50  0000 C CNN
	1    1550 1920
	1    0    0    -1  
$EndComp
Wire Wire Line
	1230 1500 1230 1540
Connection ~ 1550 1500
Wire Wire Line
	1870 1500 1870 1540
Wire Wire Line
	1230 1500 1870 1500
Wire Wire Line
	1550 1460 1550 1540
Wire Wire Line
	1230 1880 1230 1840
Connection ~ 1550 1880
Wire Wire Line
	1870 1880 1870 1840
Wire Wire Line
	1230 1880 1870 1880
Wire Wire Line
	1550 1840 1550 1920
$Comp
L C_Custom C?
U 1 1 5A2DD83F
P 1230 1690
F 0 "C?" H 1255 1790 50  0000 L CNN
F 1 "0.1uF" H 1255 1590 50  0000 L CNN
F 2 "" H 1268 1540 50  0001 C CNN
F 3 "" H 1255 1790 50  0001 C CNN
F 4 "0402" H 1080 1790 50  0000 R CNN "display_footprint"
F 5 "50V" H 1080 1690 50  0000 R CNN "Voltage"
F 6 "X7R" H 1080 1590 50  0000 R CNN "Dielectric"
	1    1230 1690
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C?
U 1 1 5A2DD849
P 1870 1690
F 0 "C?" H 1895 1790 50  0000 L CNN
F 1 "1nF" H 1895 1590 50  0000 L CNN
F 2 "" H 1908 1540 50  0001 C CNN
F 3 "" H 1895 1790 50  0001 C CNN
F 4 "0402" H 1720 1790 50  0001 R CNN "display_footprint"
F 5 "50V" H 1720 1690 50  0001 R CNN "Voltage"
F 6 "X7R" H 1720 1590 50  0001 R CNN "Dielectric"
	1    1870 1690
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C?
U 1 1 5A2DD853
P 1550 1690
F 0 "C?" H 1575 1790 50  0000 L CNN
F 1 "10nF" H 1575 1590 50  0000 L CNN
F 2 "" H 1588 1540 50  0001 C CNN
F 3 "" H 1575 1790 50  0001 C CNN
F 4 "0402" H 1400 1790 50  0001 R CNN "display_footprint"
F 5 "50V" H 1400 1690 50  0001 R CNN "Voltage"
F 6 "X7R" H 1400 1590 50  0001 R CNN "Dielectric"
	1    1550 1690
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 5A2DD85A
P 1550 1460
F 0 "#PWR?" H 1550 1310 50  0001 C CNN
F 1 "+3.3V" H 1550 1600 50  0000 C CNN
F 2 "" H 1550 1460 50  0000 C CNN
F 3 "" H 1550 1460 50  0000 C CNN
	1    1550 1460
	1    0    0    -1  
$EndComp
$Comp
L MAX6816 U?
U 1 1 5A2DE5FB
P 3110 3130
F 0 "U?" H 3310 2830 60  0000 C CNN
F 1 "MAX6816" H 3460 3480 60  0000 C CNN
F 2 "" H 3110 3530 60  0001 C CNN
F 3 "" H 3110 3530 60  0001 C CNN
	1    3110 3130
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2DE601
P 3110 3480
F 0 "#PWR?" H 3110 3230 50  0001 C CNN
F 1 "GND" H 3110 3330 50  0000 C CNN
F 2 "" H 3110 3480 50  0001 C CNN
F 3 "" H 3110 3480 50  0001 C CNN
	1    3110 3480
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 5A2DE607
P 3110 2780
F 0 "#PWR?" H 3110 2630 50  0001 C CNN
F 1 "+3.3V" H 3110 2920 50  0000 C CNN
F 2 "" H 3110 2780 50  0000 C CNN
F 3 "" H 3110 2780 50  0000 C CNN
	1    3110 2780
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x01 J?
U 1 1 5A2DE60D
P 2580 3410
F 0 "J?" H 2630 3510 50  0000 C CNN
F 1 "Up" H 2630 3310 50  0000 C CNN
F 2 "" H 2580 3410 50  0001 C CNN
F 3 "" H 2580 3410 50  0001 C CNN
	1    2580 3410
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2DE613
P 2580 3710
F 0 "#PWR?" H 2580 3460 50  0001 C CNN
F 1 "GND" H 2580 3560 50  0000 C CNN
F 2 "" H 2580 3710 50  0001 C CNN
F 3 "" H 2580 3710 50  0001 C CNN
	1    2580 3710
	1    0    0    -1  
$EndComp
Wire Wire Line
	2660 3130 2580 3130
Wire Wire Line
	2580 3130 2580 3210
Wire Wire Line
	4220 2990 4220 3130
Wire Wire Line
	4080 3130 4320 3130
Text GLabel 4320 3130 2    60   Output ~ 0
~Up
Connection ~ 4220 3130
$Comp
L R_Custom R?
U 1 1 5A2DE622
P 4220 2840
F 0 "R?" H 4160 2840 50  0000 R CNN
F 1 "10k" V 4220 2840 50  0000 C CNN
F 2 "" H 4220 2840 50  0001 C CNN
F 3 "" H 4220 2840 50  0001 C CNN
F 4 "0402" H 4290 2920 50  0000 L CNN "display_footprint"
F 5 "1%" H 4290 2840 50  0000 L CNN "Tolerance"
F 6 "1/16W" H 4290 2770 50  0000 L CNN "Wattage"
	1    4220 2840
	-1   0    0    1   
$EndComp
$Comp
L R_Custom R?
U 1 1 5A2DE62B
P 3930 3130
F 0 "R?" V 3830 3130 50  0000 C CNN
F 1 "100" V 3930 3130 50  0000 C CNN
F 2 "" H 3930 3130 50  0001 C CNN
F 3 "" H 3930 3130 50  0001 C CNN
F 4 "0402" V 4030 3130 50  0000 C CNN "display_footprint"
F 5 "1%" V 4130 3130 50  0000 C CNN "Tolerance"
F 6 "1/16W" V 4230 3130 50  0000 C CNN "Wattage"
	1    3930 3130
	0    1    1    0   
$EndComp
Wire Wire Line
	3780 3130 3560 3130
$Comp
L +3.3V #PWR?
U 1 1 5A2DE632
P 4220 2690
F 0 "#PWR?" H 4220 2540 50  0001 C CNN
F 1 "+3.3V" H 4220 2830 50  0000 C CNN
F 2 "" H 4220 2690 50  0000 C CNN
F 3 "" H 4220 2690 50  0000 C CNN
	1    4220 2690
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2DE638
P 1550 3520
F 0 "#PWR?" H 1550 3270 50  0001 C CNN
F 1 "GND" H 1550 3370 50  0000 C CNN
F 2 "" H 1550 3520 50  0000 C CNN
F 3 "" H 1550 3520 50  0000 C CNN
	1    1550 3520
	1    0    0    -1  
$EndComp
Wire Wire Line
	1230 3100 1230 3140
Connection ~ 1550 3100
Wire Wire Line
	1870 3100 1870 3140
Wire Wire Line
	1230 3100 1870 3100
Wire Wire Line
	1550 3060 1550 3140
Wire Wire Line
	1230 3480 1230 3440
Connection ~ 1550 3480
Wire Wire Line
	1870 3480 1870 3440
Wire Wire Line
	1230 3480 1870 3480
Wire Wire Line
	1550 3440 1550 3520
$Comp
L C_Custom C?
U 1 1 5A2DE64B
P 1230 3290
F 0 "C?" H 1255 3390 50  0000 L CNN
F 1 "0.1uF" H 1255 3190 50  0000 L CNN
F 2 "" H 1268 3140 50  0001 C CNN
F 3 "" H 1255 3390 50  0001 C CNN
F 4 "0402" H 1080 3390 50  0000 R CNN "display_footprint"
F 5 "50V" H 1080 3290 50  0000 R CNN "Voltage"
F 6 "X7R" H 1080 3190 50  0000 R CNN "Dielectric"
	1    1230 3290
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C?
U 1 1 5A2DE654
P 1870 3290
F 0 "C?" H 1895 3390 50  0000 L CNN
F 1 "1nF" H 1895 3190 50  0000 L CNN
F 2 "" H 1908 3140 50  0001 C CNN
F 3 "" H 1895 3390 50  0001 C CNN
F 4 "0402" H 1720 3390 50  0001 R CNN "display_footprint"
F 5 "50V" H 1720 3290 50  0001 R CNN "Voltage"
F 6 "X7R" H 1720 3190 50  0001 R CNN "Dielectric"
	1    1870 3290
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C?
U 1 1 5A2DE65D
P 1550 3290
F 0 "C?" H 1575 3390 50  0000 L CNN
F 1 "10nF" H 1575 3190 50  0000 L CNN
F 2 "" H 1588 3140 50  0001 C CNN
F 3 "" H 1575 3390 50  0001 C CNN
F 4 "0402" H 1400 3390 50  0001 R CNN "display_footprint"
F 5 "50V" H 1400 3290 50  0001 R CNN "Voltage"
F 6 "X7R" H 1400 3190 50  0001 R CNN "Dielectric"
	1    1550 3290
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 5A2DE663
P 1550 3060
F 0 "#PWR?" H 1550 2910 50  0001 C CNN
F 1 "+3.3V" H 1550 3200 50  0000 C CNN
F 2 "" H 1550 3060 50  0000 C CNN
F 3 "" H 1550 3060 50  0000 C CNN
	1    1550 3060
	1    0    0    -1  
$EndComp
$Comp
L MAX6816 U?
U 1 1 5A2DE7E3
P 3110 4730
F 0 "U?" H 3310 4430 60  0000 C CNN
F 1 "MAX6816" H 3460 5080 60  0000 C CNN
F 2 "" H 3110 5130 60  0001 C CNN
F 3 "" H 3110 5130 60  0001 C CNN
	1    3110 4730
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2DE7E9
P 3110 5080
F 0 "#PWR?" H 3110 4830 50  0001 C CNN
F 1 "GND" H 3110 4930 50  0000 C CNN
F 2 "" H 3110 5080 50  0001 C CNN
F 3 "" H 3110 5080 50  0001 C CNN
	1    3110 5080
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 5A2DE7EF
P 3110 4380
F 0 "#PWR?" H 3110 4230 50  0001 C CNN
F 1 "+3.3V" H 3110 4520 50  0000 C CNN
F 2 "" H 3110 4380 50  0000 C CNN
F 3 "" H 3110 4380 50  0000 C CNN
	1    3110 4380
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x01 J?
U 1 1 5A2DE7F5
P 2580 5010
F 0 "J?" H 2630 5110 50  0000 C CNN
F 1 "Down" H 2630 4910 50  0000 C CNN
F 2 "" H 2580 5010 50  0001 C CNN
F 3 "" H 2580 5010 50  0001 C CNN
	1    2580 5010
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2DE7FB
P 2580 5310
F 0 "#PWR?" H 2580 5060 50  0001 C CNN
F 1 "GND" H 2580 5160 50  0000 C CNN
F 2 "" H 2580 5310 50  0001 C CNN
F 3 "" H 2580 5310 50  0001 C CNN
	1    2580 5310
	1    0    0    -1  
$EndComp
Wire Wire Line
	2660 4730 2580 4730
Wire Wire Line
	2580 4730 2580 4810
Wire Wire Line
	4220 4590 4220 4730
Wire Wire Line
	4080 4730 4320 4730
Text GLabel 4320 4730 2    60   Output ~ 0
~Down
Connection ~ 4220 4730
$Comp
L R_Custom R?
U 1 1 5A2DE80A
P 4220 4440
F 0 "R?" H 4160 4440 50  0000 R CNN
F 1 "10k" V 4220 4440 50  0000 C CNN
F 2 "" H 4220 4440 50  0001 C CNN
F 3 "" H 4220 4440 50  0001 C CNN
F 4 "0402" H 4290 4520 50  0000 L CNN "display_footprint"
F 5 "1%" H 4290 4440 50  0000 L CNN "Tolerance"
F 6 "1/16W" H 4290 4370 50  0000 L CNN "Wattage"
	1    4220 4440
	-1   0    0    1   
$EndComp
$Comp
L R_Custom R?
U 1 1 5A2DE813
P 3930 4730
F 0 "R?" V 3830 4730 50  0000 C CNN
F 1 "100" V 3930 4730 50  0000 C CNN
F 2 "" H 3930 4730 50  0001 C CNN
F 3 "" H 3930 4730 50  0001 C CNN
F 4 "0402" V 4030 4730 50  0000 C CNN "display_footprint"
F 5 "1%" V 4130 4730 50  0000 C CNN "Tolerance"
F 6 "1/16W" V 4230 4730 50  0000 C CNN "Wattage"
	1    3930 4730
	0    1    1    0   
$EndComp
Wire Wire Line
	3780 4730 3560 4730
$Comp
L +3.3V #PWR?
U 1 1 5A2DE81A
P 4220 4290
F 0 "#PWR?" H 4220 4140 50  0001 C CNN
F 1 "+3.3V" H 4220 4430 50  0000 C CNN
F 2 "" H 4220 4290 50  0000 C CNN
F 3 "" H 4220 4290 50  0000 C CNN
	1    4220 4290
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A2DE820
P 1550 5120
F 0 "#PWR?" H 1550 4870 50  0001 C CNN
F 1 "GND" H 1550 4970 50  0000 C CNN
F 2 "" H 1550 5120 50  0000 C CNN
F 3 "" H 1550 5120 50  0000 C CNN
	1    1550 5120
	1    0    0    -1  
$EndComp
Wire Wire Line
	1230 4700 1230 4740
Connection ~ 1550 4700
Wire Wire Line
	1870 4700 1870 4740
Wire Wire Line
	1230 4700 1870 4700
Wire Wire Line
	1550 4660 1550 4740
Wire Wire Line
	1230 5080 1230 5040
Connection ~ 1550 5080
Wire Wire Line
	1870 5080 1870 5040
Wire Wire Line
	1230 5080 1870 5080
Wire Wire Line
	1550 5040 1550 5120
$Comp
L C_Custom C?
U 1 1 5A2DE833
P 1230 4890
F 0 "C?" H 1255 4990 50  0000 L CNN
F 1 "0.1uF" H 1255 4790 50  0000 L CNN
F 2 "" H 1268 4740 50  0001 C CNN
F 3 "" H 1255 4990 50  0001 C CNN
F 4 "0402" H 1080 4990 50  0000 R CNN "display_footprint"
F 5 "50V" H 1080 4890 50  0000 R CNN "Voltage"
F 6 "X7R" H 1080 4790 50  0000 R CNN "Dielectric"
	1    1230 4890
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C?
U 1 1 5A2DE83C
P 1870 4890
F 0 "C?" H 1895 4990 50  0000 L CNN
F 1 "1nF" H 1895 4790 50  0000 L CNN
F 2 "" H 1908 4740 50  0001 C CNN
F 3 "" H 1895 4990 50  0001 C CNN
F 4 "0402" H 1720 4990 50  0001 R CNN "display_footprint"
F 5 "50V" H 1720 4890 50  0001 R CNN "Voltage"
F 6 "X7R" H 1720 4790 50  0001 R CNN "Dielectric"
	1    1870 4890
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C?
U 1 1 5A2DE845
P 1550 4890
F 0 "C?" H 1575 4990 50  0000 L CNN
F 1 "10nF" H 1575 4790 50  0000 L CNN
F 2 "" H 1588 4740 50  0001 C CNN
F 3 "" H 1575 4990 50  0001 C CNN
F 4 "0402" H 1400 4990 50  0001 R CNN "display_footprint"
F 5 "50V" H 1400 4890 50  0001 R CNN "Voltage"
F 6 "X7R" H 1400 4790 50  0001 R CNN "Dielectric"
	1    1550 4890
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 5A2DE84B
P 1550 4660
F 0 "#PWR?" H 1550 4510 50  0001 C CNN
F 1 "+3.3V" H 1550 4800 50  0000 C CNN
F 2 "" H 1550 4660 50  0000 C CNN
F 3 "" H 1550 4660 50  0000 C CNN
	1    1550 4660
	1    0    0    -1  
$EndComp
$EndSCHEMATC

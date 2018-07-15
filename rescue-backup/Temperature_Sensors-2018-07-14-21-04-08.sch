EESchema Schematic File Version 2
LIBS:Custom Library
LIBS:4xxx
LIBS:4xxx_IEEE
LIBS:74xGxx
LIBS:74xx
LIBS:74xx_IEEE
LIBS:Amplifier_Audio
LIBS:Amplifier_Buffer
LIBS:Amplifier_Current
LIBS:Amplifier_Difference
LIBS:Amplifier_Instrumentation
LIBS:Amplifier_Operational
LIBS:Amplifier_Video
LIBS:Analog
LIBS:Analog_ADC
LIBS:Analog_DAC
LIBS:Analog_Switch
LIBS:Audio
LIBS:Battery_Management
LIBS:Comparator
LIBS:Connector
LIBS:Connector_Generic
LIBS:Connector_Generic_MountingPin
LIBS:Connector_Generic_Shielded
LIBS:Connector_Specialized
LIBS:Converter_ACDC
LIBS:Converter_DCDC
LIBS:CPLD_Altera
LIBS:CPLD_Xilinx
LIBS:CPU
LIBS:CPU_NXP_6800
LIBS:CPU_NXP_68000
LIBS:CPU_PowerPC
LIBS:Device
LIBS:Diode
LIBS:Diode_Bridge
LIBS:Diode_Laser
LIBS:Display_Character
LIBS:Display_Graphic
LIBS:Driver_Display
LIBS:Driver_FET
LIBS:Driver_LED
LIBS:Driver_Motor
LIBS:Driver_Relay
LIBS:DSP_Freescale
LIBS:DSP_Microchip_DSPIC33
LIBS:DSP_Motorola
LIBS:DSP_Texas
LIBS:Filter
LIBS:FPGA_Actel
LIBS:FPGA_Microsemi
LIBS:FPGA_Xilinx
LIBS:FPGA_Xilinx_Artix7
LIBS:FPGA_Xilinx_Kintex7
LIBS:FPGA_Xilinx_Spartan6
LIBS:FPGA_Xilinx_Virtex5
LIBS:FPGA_Xilinx_Virtex6
LIBS:FPGA_Xilinx_Virtex7
LIBS:GPU
LIBS:Graphic
LIBS:Interface
LIBS:Interface_CAN_LIN
LIBS:Interface_CurrentLoop
LIBS:Interface_Ethernet
LIBS:Interface_Expansion
LIBS:Interface_HID
LIBS:Interface_LineDriver
LIBS:Interface_Optical
LIBS:Interface_Telecom
LIBS:Interface_UART
LIBS:Interface_USB
LIBS:Isolator
LIBS:Isolator_Analog
LIBS:Jumper
LIBS:LED
LIBS:Logic_LevelTranslator
LIBS:Logic_Programmable
LIBS:MCU_AnalogDevices
LIBS:MCU_Cypress
LIBS:MCU_Espressif
LIBS:MCU_Infineon
LIBS:MCU_Intel
LIBS:MCU_Microchip_8051
LIBS:MCU_Microchip_ATmega
LIBS:MCU_Microchip_ATtiny
LIBS:MCU_Microchip_AVR
LIBS:MCU_Microchip_PIC10
LIBS:MCU_Microchip_PIC12
LIBS:MCU_Microchip_PIC16
LIBS:MCU_Microchip_PIC18
LIBS:MCU_Microchip_PIC24
LIBS:MCU_Microchip_PIC32
LIBS:MCU_Microchip_SAME
LIBS:MCU_Microchip_SAML
LIBS:MCU_Module
LIBS:MCU_Nordic
LIBS:MCU_NXP_ColdFire
LIBS:MCU_NXP_HC11
LIBS:MCU_NXP_HC12
LIBS:MCU_NXP_HCS12
LIBS:MCU_NXP_Kinetis
LIBS:MCU_NXP_LPC
LIBS:MCU_NXP_MAC7100
LIBS:MCU_NXP_MCore
LIBS:MCU_NXP_S08
LIBS:MCU_Parallax
LIBS:MCU_SiFive
LIBS:MCU_SiliconLabs
LIBS:MCU_ST_STM8
LIBS:MCU_ST_STM32
LIBS:MCU_ST_STM32F0
LIBS:MCU_ST_STM32F1
LIBS:MCU_ST_STM32F2
LIBS:MCU_ST_STM32F3
LIBS:MCU_ST_STM32F4
LIBS:MCU_ST_STM32F7
LIBS:MCU_ST_STM32H7
LIBS:MCU_ST_STM32L0
LIBS:MCU_ST_STM32L1
LIBS:MCU_ST_STM32L4
LIBS:MCU_ST_STM32L4+
LIBS:MCU_Texas
LIBS:MCU_Texas_MSP430
LIBS:Mechanical
LIBS:Memory_Controller
LIBS:Memory_EEPROM
LIBS:Memory_EPROM
LIBS:Memory_Flash
LIBS:Memory_NVRAM
LIBS:Memory_RAM
LIBS:Memory_ROM
LIBS:Memory_UniqueID
LIBS:Motor
LIBS:Oscillator
LIBS:Potentiometer_Digital
LIBS:power
LIBS:Power_Management
LIBS:Power_Protection
LIBS:Power_Supervisor
LIBS:pspice
LIBS:Reference_Current
LIBS:Reference_Voltage
LIBS:Regulator_Controller
LIBS:Regulator_Current
LIBS:Regulator_Linear
LIBS:Regulator_SwitchedCapacitor
LIBS:Regulator_Switching
LIBS:Relay
LIBS:Relay_SolidState
LIBS:RF
LIBS:RF_AM_FM
LIBS:RF_Amplifier
LIBS:RF_Bluetooth
LIBS:RF_GPS
LIBS:RF_Mixer
LIBS:RF_Module
LIBS:RF_RFID
LIBS:RF_Switch
LIBS:RF_WiFi
LIBS:RF_ZigBee
LIBS:Sensor
LIBS:Sensor_Audio
LIBS:Sensor_Current
LIBS:Sensor_Gas
LIBS:Sensor_Humidity
LIBS:Sensor_Magnetic
LIBS:Sensor_Motion
LIBS:Sensor_Optical
LIBS:Sensor_Pressure
LIBS:Sensor_Proximity
LIBS:Sensor_Temperature
LIBS:Sensor_Touch
LIBS:Sensor_Voltage
LIBS:Switch
LIBS:Timer
LIBS:Timer_PLL
LIBS:Timer_RTC
LIBS:Transformer
LIBS:Transistor_Array
LIBS:Transistor_BJT
LIBS:Transistor_FET
LIBS:Transistor_IGBT
LIBS:Triac_Thyristor
LIBS:Valve
LIBS:Video
LIBS:nixie
LIBS:vfd
LIBS:VFD_Clock-cache
EELAYER 25 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 21 21
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
L MCP9700AT-HLT U2101
U 1 1 5AB764D2
P 2990 1900
F 0 "U2101" H 2740 2150 50  0000 C CNN
F 1 "MCP9700AT-HLT" H 3040 2150 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-353_SC-70-5" H 2990 1500 50  0001 C CNN
F 3 "" H 2990 1900 50  0001 C CNN
F 4 "MCP9700AT-E/TTCT-ND" H 2990 1900 60  0001 C CNN "Digi-Key PN"
	1    2990 1900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR2106
U 1 1 5AB76E55
P 2990 2200
F 0 "#PWR2106" H 2990 1950 50  0001 C CNN
F 1 "GND" H 2990 2050 50  0000 C CNN
F 2 "" H 2990 2200 50  0001 C CNN
F 3 "" H 2990 2200 50  0001 C CNN
	1    2990 2200
	1    0    0    -1  
$EndComp
Text GLabel 4340 1900 2    60   Output ~ 0
Ambient_Temp
$Comp
L GND #PWR2108
U 1 1 5AB777BB
P 2990 3770
F 0 "#PWR2108" H 2990 3520 50  0001 C CNN
F 1 "GND" H 2990 3620 50  0000 C CNN
F 2 "" H 2990 3770 50  0001 C CNN
F 3 "" H 2990 3770 50  0001 C CNN
	1    2990 3770
	1    0    0    -1  
$EndComp
Text GLabel 4340 3470 2    60   Output ~ 0
VFF_Temp
$Comp
L GND #PWR2116
U 1 1 5AB77941
P 7200 2220
F 0 "#PWR2116" H 7200 1970 50  0001 C CNN
F 1 "GND" H 7200 2070 50  0000 C CNN
F 2 "" H 7200 2220 50  0001 C CNN
F 3 "" H 7200 2220 50  0001 C CNN
	1    7200 2220
	1    0    0    -1  
$EndComp
Text GLabel 8550 1920 2    60   Output ~ 0
POS3P3_TEMP
$Comp
L MCP9700AT-HLT U2102
U 1 1 5AB79765
P 2990 3470
F 0 "U2102" H 2740 3720 50  0000 C CNN
F 1 "MCP9700AT-HLT" H 3040 3720 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-353_SC-70-5" H 2990 3070 50  0001 C CNN
F 3 "" H 2990 3470 50  0001 C CNN
F 4 "MCP9700AT-E/TTCT-ND" H 2990 3470 60  0001 C CNN "Digi-Key PN"
	1    2990 3470
	1    0    0    -1  
$EndComp
$Comp
L MCP9700AT-HLT U2103
U 1 1 5AB798F7
P 7200 1920
F 0 "U2103" H 6950 2170 50  0000 C CNN
F 1 "MCP9700AT-HLT" H 7250 2170 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-353_SC-70-5" H 7200 1520 50  0001 C CNN
F 3 "" H 7200 1920 50  0001 C CNN
F 4 "MCP9700AT-E/TTCT-ND" H 7200 1920 60  0001 C CNN "Digi-Key PN"
	1    7200 1920
	1    0    0    -1  
$EndComp
Wire Wire Line
	3690 1900 4340 1900
$Comp
L R_Custom R2101
U 1 1 5AB842BB
P 3540 1900
F 0 "R2101" V 3440 1900 50  0000 C CNN
F 1 "1k" V 3540 1900 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 3540 1900 50  0001 C CNN
F 3 "" H 3540 1900 50  0001 C CNN
F 4 "0603" V 3640 1900 50  0000 C CNN "display_footprint"
F 5 "1%" V 3740 1900 50  0000 C CNN "Tolerance"
F 6 "1/10W" V 3840 1900 50  0000 C CNN "Wattage"
F 7 "A102226CT-ND" H 3840 2300 60  0001 C CNN "Digi-Key PN"
	1    3540 1900
	0    1    1    0   
$EndComp
$Comp
L GND #PWR2109
U 1 1 5AB842C2
P 4110 2450
F 0 "#PWR2109" H 4110 2200 50  0001 C CNN
F 1 "GND" H 4110 2300 50  0000 C CNN
F 2 "" H 4110 2450 50  0001 C CNN
F 3 "" H 4110 2450 50  0001 C CNN
	1    4110 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4110 1900 4110 2150
Connection ~ 4110 1900
Wire Wire Line
	3690 3470 4340 3470
$Comp
L R_Custom R2102
U 1 1 5AB843B5
P 3540 3470
F 0 "R2102" V 3440 3470 50  0000 C CNN
F 1 "1k" V 3540 3470 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 3540 3470 50  0001 C CNN
F 3 "" H 3540 3470 50  0001 C CNN
F 4 "0603" V 3640 3470 50  0000 C CNN "display_footprint"
F 5 "1%" V 3740 3470 50  0000 C CNN "Tolerance"
F 6 "1/10W" V 3840 3470 50  0000 C CNN "Wattage"
F 7 "A102226CT-ND" H 3840 3870 60  0001 C CNN "Digi-Key PN"
	1    3540 3470
	0    1    1    0   
$EndComp
$Comp
L GND #PWR2110
U 1 1 5AB843BC
P 4110 4020
F 0 "#PWR2110" H 4110 3770 50  0001 C CNN
F 1 "GND" H 4110 3870 50  0000 C CNN
F 2 "" H 4110 4020 50  0001 C CNN
F 3 "" H 4110 4020 50  0001 C CNN
	1    4110 4020
	1    0    0    -1  
$EndComp
Wire Wire Line
	4110 3470 4110 3720
Connection ~ 4110 3470
Wire Wire Line
	7900 1920 8550 1920
$Comp
L R_Custom R2103
U 1 1 5AB84555
P 7750 1920
F 0 "R2103" V 7650 1920 50  0000 C CNN
F 1 "1k" V 7750 1920 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7750 1920 50  0001 C CNN
F 3 "" H 7750 1920 50  0001 C CNN
F 4 "0603" V 7850 1920 50  0000 C CNN "display_footprint"
F 5 "1%" V 7950 1920 50  0000 C CNN "Tolerance"
F 6 "1/10W" V 8050 1920 50  0000 C CNN "Wattage"
F 7 "A102226CT-ND" H 8050 2320 60  0001 C CNN "Digi-Key PN"
	1    7750 1920
	0    1    1    0   
$EndComp
$Comp
L GND #PWR2119
U 1 1 5AB8455C
P 8320 2470
F 0 "#PWR2119" H 8320 2220 50  0001 C CNN
F 1 "GND" H 8320 2320 50  0000 C CNN
F 2 "" H 8320 2470 50  0001 C CNN
F 3 "" H 8320 2470 50  0001 C CNN
	1    8320 2470
	1    0    0    -1  
$EndComp
Wire Wire Line
	8320 1920 8320 2170
Connection ~ 8320 1920
$Comp
L GND #PWR2104
U 1 1 5AEB509F
P 2100 2030
F 0 "#PWR2104" H 2100 1780 50  0001 C CNN
F 1 "GND" H 2100 1880 50  0000 C CNN
F 2 "" H 2100 2030 50  0001 C CNN
F 3 "" H 2100 2030 50  0001 C CNN
	1    2100 2030
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR2102
U 1 1 5AEB50EB
P 2010 3800
F 0 "#PWR2102" H 2010 3550 50  0001 C CNN
F 1 "GND" H 2010 3650 50  0000 C CNN
F 2 "" H 2010 3800 50  0001 C CNN
F 3 "" H 2010 3800 50  0001 C CNN
	1    2010 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR2112
U 1 1 5AEB514A
P 6140 2110
F 0 "#PWR2112" H 6140 1860 50  0001 C CNN
F 1 "GND" H 6140 1960 50  0000 C CNN
F 2 "" H 6140 2110 50  0001 C CNN
F 3 "" H 6140 2110 50  0001 C CNN
	1    6140 2110
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C2102
U 1 1 5AEC8CC5
P 2100 1880
F 0 "C2102" H 2125 1980 50  0000 L CNN
F 1 "0.1uF" H 2125 1780 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2138 1730 50  0001 C CNN
F 3 "" H 2125 1980 50  0001 C CNN
F 4 "0603" H 1950 1980 50  0000 R CNN "display_footprint"
F 5 "50V" H 1950 1880 50  0000 R CNN "Voltage"
F 6 "X7R" H 1950 1780 50  0000 R CNN "Dielectric"
F 7 "478-9903-1-ND" H 2100 1880 60  0001 C CNN "Digi-Key PN"
	1    2100 1880
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C2101
U 1 1 5AEC8D82
P 2010 3650
F 0 "C2101" H 2035 3750 50  0000 L CNN
F 1 "0.1uF" H 2035 3550 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2048 3500 50  0001 C CNN
F 3 "" H 2035 3750 50  0001 C CNN
F 4 "0603" H 1860 3750 50  0000 R CNN "display_footprint"
F 5 "50V" H 1860 3650 50  0000 R CNN "Voltage"
F 6 "X7R" H 1860 3550 50  0000 R CNN "Dielectric"
F 7 "478-9903-1-ND" H 2010 3650 60  0001 C CNN "Digi-Key PN"
	1    2010 3650
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C2105
U 1 1 5AEC8E6F
P 6140 1960
F 0 "C2105" H 6165 2060 50  0000 L CNN
F 1 "0.1uF" H 6165 1860 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6178 1810 50  0001 C CNN
F 3 "" H 6165 2060 50  0001 C CNN
F 4 "0603" H 5990 2060 50  0000 R CNN "display_footprint"
F 5 "50V" H 5990 1960 50  0000 R CNN "Voltage"
F 6 "X7R" H 5990 1860 50  0000 R CNN "Dielectric"
F 7 "478-9903-1-ND" H 6140 1960 60  0001 C CNN "Digi-Key PN"
	1    6140 1960
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C2103
U 1 1 5AEDC465
P 4110 2300
F 0 "C2103" H 4135 2400 50  0000 L CNN
F 1 "330pF" H 4135 2200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4148 2150 50  0001 C CNN
F 3 "" H 4135 2400 50  0001 C CNN
F 4 "0603" H 3960 2400 50  0000 R CNN "display_footprint"
F 5 "50V" H 3960 2300 50  0000 R CNN "Voltage"
F 6 "C0G" H 3960 2200 50  0000 R CNN "Dielectric"
F 7 "490-4964-1-ND" H 4110 2300 60  0001 C CNN "Digi-Key PN"
	1    4110 2300
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C2104
U 1 1 5AEDC4E9
P 4110 3870
F 0 "C2104" H 4135 3970 50  0000 L CNN
F 1 "330pF" H 4135 3770 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4148 3720 50  0001 C CNN
F 3 "" H 4135 3970 50  0001 C CNN
F 4 "0603" H 3960 3970 50  0000 R CNN "display_footprint"
F 5 "50V" H 3960 3870 50  0000 R CNN "Voltage"
F 6 "C0G" H 3960 3770 50  0000 R CNN "Dielectric"
F 7 "490-4964-1-ND" H 4110 3870 60  0001 C CNN "Digi-Key PN"
	1    4110 3870
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C2107
U 1 1 5AEDC54C
P 8320 2320
F 0 "C2107" H 8345 2420 50  0000 L CNN
F 1 "330pF" H 8345 2220 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 8358 2170 50  0001 C CNN
F 3 "" H 8345 2420 50  0001 C CNN
F 4 "0603" H 8170 2420 50  0000 R CNN "display_footprint"
F 5 "50V" H 8170 2320 50  0000 R CNN "Voltage"
F 6 "C0G" H 8170 2220 50  0000 R CNN "Dielectric"
F 7 "490-4964-1-ND" H 8320 2320 60  0001 C CNN "Digi-Key PN"
	1    8320 2320
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C2108
U 1 1 5AEDC681
P 8370 3870
F 0 "C2108" H 8395 3970 50  0000 L CNN
F 1 "330pF" H 8395 3770 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 8408 3720 50  0001 C CNN
F 3 "" H 8395 3970 50  0001 C CNN
F 4 "0603" H 8220 3970 50  0000 R CNN "display_footprint"
F 5 "50V" H 8220 3870 50  0000 R CNN "Voltage"
F 6 "C0G" H 8220 3770 50  0000 R CNN "Dielectric"
F 7 "490-4964-1-ND" H 8370 3870 60  0001 C CNN "Digi-Key PN"
	1    8370 3870
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C2106
U 1 1 5AEC90A1
P 6480 3420
F 0 "C2106" H 6505 3520 50  0000 L CNN
F 1 "0.1uF" H 6505 3320 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6518 3270 50  0001 C CNN
F 3 "" H 6505 3520 50  0001 C CNN
F 4 "0603" H 6330 3520 50  0000 R CNN "display_footprint"
F 5 "50V" H 6330 3420 50  0000 R CNN "Voltage"
F 6 "X7R" H 6330 3320 50  0000 R CNN "Dielectric"
F 7 "478-9903-1-ND" H 6480 3420 60  0001 C CNN "Digi-Key PN"
	1    6480 3420
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR2114
U 1 1 5AEB51FD
P 6480 3570
F 0 "#PWR2114" H 6480 3320 50  0001 C CNN
F 1 "GND" H 6480 3420 50  0000 C CNN
F 2 "" H 6480 3570 50  0001 C CNN
F 3 "" H 6480 3570 50  0001 C CNN
	1    6480 3570
	1    0    0    -1  
$EndComp
Connection ~ 8370 3470
Wire Wire Line
	8370 3470 8370 3720
$Comp
L GND #PWR2120
U 1 1 5AB8557A
P 8370 4020
F 0 "#PWR2120" H 8370 3770 50  0001 C CNN
F 1 "GND" H 8370 3870 50  0000 C CNN
F 2 "" H 8370 4020 50  0001 C CNN
F 3 "" H 8370 4020 50  0001 C CNN
	1    8370 4020
	1    0    0    -1  
$EndComp
$Comp
L R_Custom R2104
U 1 1 5AB85573
P 7800 3470
F 0 "R2104" V 7700 3470 50  0000 C CNN
F 1 "1k" V 7800 3470 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7800 3470 50  0001 C CNN
F 3 "" H 7800 3470 50  0001 C CNN
F 4 "0603" V 7900 3470 50  0000 C CNN "display_footprint"
F 5 "1%" V 8000 3470 50  0000 C CNN "Tolerance"
F 6 "1/10W" V 8100 3470 50  0000 C CNN "Wattage"
F 7 "A102226CT-ND" H 8100 3870 60  0001 C CNN "Digi-Key PN"
	1    7800 3470
	0    1    1    0   
$EndComp
Wire Wire Line
	7950 3470 8600 3470
$Comp
L MCP9700AT-HLT U2104
U 1 1 5AB79647
P 7250 3470
F 0 "U2104" H 7000 3720 50  0000 C CNN
F 1 "MCP9700AT-HLT" H 7300 3720 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-353_SC-70-5" H 7250 3070 50  0001 C CNN
F 3 "" H 7250 3470 50  0001 C CNN
F 4 "MCP9700AT-E/TTCT-ND" H 7250 3470 60  0001 C CNN "Digi-Key PN"
	1    7250 3470
	1    0    0    -1  
$EndComp
Text GLabel 8600 3470 2    60   Output ~ 0
VAN_Temp
$Comp
L GND #PWR2118
U 1 1 5AB77802
P 7250 3770
F 0 "#PWR2118" H 7250 3520 50  0001 C CNN
F 1 "GND" H 7250 3620 50  0000 C CNN
F 2 "" H 7250 3770 50  0001 C CNN
F 3 "" H 7250 3770 50  0001 C CNN
	1    7250 3770
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR2105
U 1 1 5B3E3CD6
P 2990 1600
F 0 "#PWR2105" H 2990 1450 50  0001 C CNN
F 1 "+3.3V" H 2990 1740 50  0000 C CNN
F 2 "" H 2990 1600 50  0000 C CNN
F 3 "" H 2990 1600 50  0000 C CNN
	1    2990 1600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR2103
U 1 1 5B3E3D60
P 2100 1730
F 0 "#PWR2103" H 2100 1580 50  0001 C CNN
F 1 "+3.3V" H 2100 1870 50  0000 C CNN
F 2 "" H 2100 1730 50  0000 C CNN
F 3 "" H 2100 1730 50  0000 C CNN
	1    2100 1730
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR2101
U 1 1 5B3E3DB3
P 2010 3500
F 0 "#PWR2101" H 2010 3350 50  0001 C CNN
F 1 "+3.3V" H 2010 3640 50  0000 C CNN
F 2 "" H 2010 3500 50  0000 C CNN
F 3 "" H 2010 3500 50  0000 C CNN
	1    2010 3500
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR2107
U 1 1 5B3E3EC6
P 2990 3170
F 0 "#PWR2107" H 2990 3020 50  0001 C CNN
F 1 "+3.3V" H 2990 3310 50  0000 C CNN
F 2 "" H 2990 3170 50  0000 C CNN
F 3 "" H 2990 3170 50  0000 C CNN
	1    2990 3170
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR2111
U 1 1 5B3E3F61
P 6140 1810
F 0 "#PWR2111" H 6140 1660 50  0001 C CNN
F 1 "+3.3V" H 6140 1950 50  0000 C CNN
F 2 "" H 6140 1810 50  0000 C CNN
F 3 "" H 6140 1810 50  0000 C CNN
	1    6140 1810
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR2115
U 1 1 5B3E405C
P 7200 1620
F 0 "#PWR2115" H 7200 1470 50  0001 C CNN
F 1 "+3.3V" H 7200 1760 50  0000 C CNN
F 2 "" H 7200 1620 50  0000 C CNN
F 3 "" H 7200 1620 50  0000 C CNN
	1    7200 1620
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR2117
U 1 1 5B3E42A5
P 7250 3170
F 0 "#PWR2117" H 7250 3020 50  0001 C CNN
F 1 "+3.3V" H 7250 3310 50  0000 C CNN
F 2 "" H 7250 3170 50  0000 C CNN
F 3 "" H 7250 3170 50  0000 C CNN
	1    7250 3170
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR2113
U 1 1 5B3E43B8
P 6480 3270
F 0 "#PWR2113" H 6480 3120 50  0001 C CNN
F 1 "+3.3V" H 6480 3410 50  0000 C CNN
F 2 "" H 6480 3270 50  0000 C CNN
F 3 "" H 6480 3270 50  0000 C CNN
	1    6480 3270
	1    0    0    -1  
$EndComp
Text Notes 2280 1290 0    60   ~ 0
Place away from heating components
Text Notes 6960 1300 0    60   ~ 0
Place near POS3P3 power supply
Text Notes 2530 2920 0    60   ~ 0
Place near VFF power supply
Text Notes 6630 2880 0    60   ~ 0
Place near VAN power supply
$EndSCHEMATC

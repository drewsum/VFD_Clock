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
Sheet 18 21
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
L AT24CS01-STUM U1801
U 1 1 5B2E4F43
P 4670 3590
F 0 "U1801" H 4370 3840 50  0000 C CNN
F 1 "AT24CS01-STUM" H 4770 3340 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 4670 3590 50  0001 C CNN
F 3 "" H 4670 3590 50  0001 C CNN
	1    4670 3590
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0278
U 1 1 5B2E4F8E
P 4670 3890
F 0 "#PWR0278" H 4670 3640 50  0001 C CNN
F 1 "GND" H 4670 3740 50  0000 C CNN
F 2 "" H 4670 3890 50  0001 C CNN
F 3 "" H 4670 3890 50  0001 C CNN
	1    4670 3890
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR0279
U 1 1 5B2E537B
P 4670 3290
F 0 "#PWR0279" H 4670 3140 50  0001 C CNN
F 1 "+3.3V" H 4670 3430 50  0000 C CNN
F 2 "" H 4670 3290 50  0000 C CNN
F 3 "" H 4670 3290 50  0000 C CNN
	1    4670 3290
	1    0    0    -1  
$EndComp
$Comp
L C_Custom C1801
U 1 1 5B2E5850
P 3660 3670
F 0 "C1801" H 3685 3770 50  0000 L CNN
F 1 "0.1uF" H 3685 3570 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3698 3520 50  0001 C CNN
F 3 "" H 3685 3770 50  0001 C CNN
F 4 "0603" H 3510 3770 50  0000 R CNN "display_footprint"
F 5 "50V" H 3510 3670 50  0000 R CNN "Voltage"
F 6 "X7R" H 3510 3570 50  0000 R CNN "Dielectric"
	1    3660 3670
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR0280
U 1 1 5B2E585D
P 3660 3520
F 0 "#PWR0280" H 3660 3370 50  0001 C CNN
F 1 "+3.3V" H 3660 3660 50  0000 C CNN
F 2 "" H 3660 3520 50  0000 C CNN
F 3 "" H 3660 3520 50  0000 C CNN
	1    3660 3520
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0281
U 1 1 5B2E586E
P 3660 3820
F 0 "#PWR0281" H 3660 3570 50  0001 C CNN
F 1 "GND" H 3660 3670 50  0000 C CNN
F 2 "" H 3660 3820 50  0001 C CNN
F 3 "" H 3660 3820 50  0001 C CNN
	1    3660 3820
	1    0    0    -1  
$EndComp
$Comp
L +3.3V-RESCUE-VFD_Clock #PWR0282
U 1 1 5B2E5DE6
P 6350 3110
F 0 "#PWR0282" H 6350 2960 50  0001 C CNN
F 1 "+3.3V" H 6350 3250 50  0000 C CNN
F 2 "" H 6350 3110 50  0001 C CNN
F 3 "" H 6350 3110 50  0001 C CNN
	1    6350 3110
	1    0    0    -1  
$EndComp
$Comp
L +3.3V-RESCUE-VFD_Clock #PWR0283
U 1 1 5B2E5DEC
P 6900 3110
F 0 "#PWR0283" H 6900 2960 50  0001 C CNN
F 1 "+3.3V" H 6900 3250 50  0000 C CNN
F 2 "" H 6900 3110 50  0001 C CNN
F 3 "" H 6900 3110 50  0001 C CNN
	1    6900 3110
	1    0    0    -1  
$EndComp
Wire Wire Line
	7160 3490 5070 3490
Wire Wire Line
	6350 3410 6350 3490
Wire Wire Line
	7160 3590 5070 3590
Wire Wire Line
	6900 3590 6900 3410
Connection ~ 6350 3490
Connection ~ 6900 3590
Text GLabel 7460 3490 2    60   Output ~ 0
IIC_SCL
Text GLabel 7460 3590 2    60   BiDi ~ 0
IIC_SDA
$Comp
L Res_Custom R1805
U 1 1 5B2E5DFD
P 7310 3490
F 0 "R1805" V 7210 3490 50  0000 C CNN
F 1 "0" V 7310 3490 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7310 3490 50  0001 C CNN
F 3 "" H 7310 3490 50  0001 C CNN
F 4 "0402" V 7410 3490 50  0001 C CNN "display_footprint"
F 5 "1%" V 7510 3490 50  0001 C CNN "Tolerance"
F 6 "1/16W" V 7610 3490 50  0001 C CNN "Wattage"
	1    7310 3490
	0    1    1    0   
$EndComp
$Comp
L Res_Custom R1806
U 1 1 5B2E5E07
P 7310 3590
F 0 "R1806" V 7210 3590 50  0000 C CNN
F 1 "0" V 7300 3590 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 7310 3590 50  0001 C CNN
F 3 "" H 7310 3590 50  0001 C CNN
F 4 "0402" V 7410 3590 50  0001 C CNN "display_footprint"
F 5 "1%" V 7510 3590 50  0001 C CNN "Tolerance"
F 6 "1/16W" V 7610 3590 50  0001 C CNN "Wattage"
	1    7310 3590
	0    1    -1   0   
$EndComp
$Comp
L R_Custom R1804
U 1 1 5B2E5E11
P 6900 3260
F 0 "R1804" H 6840 3260 50  0000 R CNN
F 1 "10k" V 6900 3260 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6900 3260 50  0001 C CNN
F 3 "" H 6900 3260 50  0001 C CNN
F 4 "0603" H 6970 3340 50  0000 L CNN "display_footprint"
F 5 "1%" H 6970 3260 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 6970 3190 50  0000 L CNN "Wattage"
	1    6900 3260
	-1   0    0    1   
$EndComp
$Comp
L R_Custom R1803
U 1 1 5B2E5E1B
P 6350 3260
F 0 "R1803" H 6290 3260 50  0000 R CNN
F 1 "10k" V 6350 3260 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 6350 3260 50  0001 C CNN
F 3 "" H 6350 3260 50  0001 C CNN
F 4 "0603" H 6420 3340 50  0000 L CNN "display_footprint"
F 5 "1%" H 6420 3260 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 6420 3190 50  0000 L CNN "Wattage"
	1    6350 3260
	-1   0    0    1   
$EndComp
$Comp
L R_Custom R1802
U 1 1 5B2E5EBD
P 5650 4060
F 0 "R1802" H 5590 4060 50  0000 R CNN
F 1 "10k" V 5650 4060 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 5650 4060 50  0001 C CNN
F 3 "" H 5650 4060 50  0001 C CNN
F 4 "0603" H 5720 4140 50  0000 L CNN "display_footprint"
F 5 "1%" H 5720 4060 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 5720 3990 50  0000 L CNN "Wattage"
	1    5650 4060
	1    0    0    1   
$EndComp
Wire Wire Line
	5650 3410 5650 3910
Wire Wire Line
	5650 3690 5070 3690
$Comp
L GND #PWR0284
U 1 1 5B2E5F39
P 5650 4210
F 0 "#PWR0284" H 5650 3960 50  0001 C CNN
F 1 "GND" H 5650 4060 50  0000 C CNN
F 2 "" H 5650 4210 50  0001 C CNN
F 3 "" H 5650 4210 50  0001 C CNN
	1    5650 4210
	1    0    0    -1  
$EndComp
$Comp
L R_Custom R1801
U 1 1 5B2E5F63
P 5650 3260
F 0 "R1801" H 5590 3260 50  0000 R CNN
F 1 "0" V 5650 3260 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" H 5650 3260 50  0001 C CNN
F 3 "" H 5650 3260 50  0001 C CNN
F 4 "0603" H 5720 3340 50  0000 L CNN "display_footprint"
F 5 "1%" H 5720 3260 50  0000 L CNN "Tolerance"
F 6 "1/10W" H 5720 3190 50  0000 L CNN "Wattage"
F 7 "DNP" H 5720 3120 50  0000 L CNN "CFG"
	1    5650 3260
	-1   0    0    1   
$EndComp
$Comp
L +3.3V-RESCUE-VFD_Clock #PWR0285
U 1 1 5B2E5FE8
P 5650 3110
F 0 "#PWR0285" H 5650 2960 50  0001 C CNN
F 1 "+3.3V" H 5650 3250 50  0000 C CNN
F 2 "" H 5650 3110 50  0001 C CNN
F 3 "" H 5650 3110 50  0001 C CNN
	1    5650 3110
	1    0    0    -1  
$EndComp
Connection ~ 5650 3690
$EndSCHEMATC

EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 18 25
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
U 1 1 5E0D0F62
P 5700 3430
F 0 "U?" H 5400 3880 50  0000 L CNN
F 1 "TCA9803" H 5900 3880 50  0000 L CNN
F 2 "Package_SO:VSSOP-8_3.0x3.0mm_P0.65mm" H 6600 2980 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tca9803.pdf" H 5400 3880 50  0001 C CNN
	1    5700 3430
	1    0    0    -1  
$EndComp
Text Notes 4880 4430 0    50   ~ 0
READ DATASHEET, PULLUP/DECOUPLING WEIRDNESS
Text GLabel 6100 3430 2    50   BiDi ~ 0
TELEM_I2C_SDA
Text GLabel 6100 3330 2    50   Output ~ 0
TELEM_I2C_SCL
$EndSCHEMATC

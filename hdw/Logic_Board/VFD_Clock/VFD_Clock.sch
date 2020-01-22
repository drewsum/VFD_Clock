EESchema Schematic File Version 4
LIBS:VFD_Clock-cache
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 30
Title "VFD Clock"
Date "2019-04-11"
Rev "A"
Comp "Drew Maatman"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr

$Sheet
S 3420 1340 500  150 
U 5CB6F1ED
F0 "+12V Input" 50
F1 "POS12_Input.sch" 50
$EndSheet

$Sheet
S 3420 1690 500  150 
U 5E0652BA
F0 "+12V Telemetry" 50
F1 "POS12_Telemetry.sch" 50
$EndSheet

$Sheet
S 3420 2040 500  150 
U 5CB7718D
F0 "+3.3V Power Supply" 50
F1 "POS3P3_Power_Supply.sch" 50
$EndSheet

$Sheet
S 3420 2390 500  150 
U 5E0A0E29
F0 "+3.3V Telemetry" 50
F1 "POS3P3_Telemetry.sch" 50
$EndSheet

$Sheet
S 3420 2740 500  150 
U 5E0DC082
F0 "+5V Power Supply" 50
F1 "POS5_Power_Supply.sch" 50
$EndSheet

$Sheet
S 3420 3090 500  150 
U 5E0DC084
F0 "+5V Telemetry" 50
F1 "POS5_Telemetry.sch" 50
$EndSheet

$Sheet
S 3420 3440 500  150 
U 5E0F9110
F0 "+1.2VFF Power Supply" 50
F1 "POS1P2_VFF_Power_Supply.sch" 50
$EndSheet

$Sheet
S 3420 3790 500  150 
U 5E0F9112
F0 "+1.2VFF Telemetry" 50
F1 "POS1P2_VFF_Telemetry.sch" 50
$EndSheet

$Sheet
S 3420 4140 500  150 
U 5A0BC776
F0 "+60VAN Power Supply" 50
F1 "POS60_VAN_Power_Supply.sch" 50
$EndSheet

$Sheet
S 3420 4490 500  150 
U 5E164364
F0 "+60VAN Telemetry" 50
F1 "POS60_VAN_Telemetry.sch" 50
$EndSheet

$Sheet
S 3420 4840 500  150 
U 5A557C58
F0 "+3.3V BCKP Supply" 50
F1 "POS3P3_BCKP_Supply.sch" 50
$EndSheet

$Sheet
S 3420 5190 500  150 
U 5E1352F5
F0 "Misc Power" 50
F1 "Misc_Power.sch" 50
$EndSheet

$Sheet
S 3420 5540 500  150 
U 5A0A42E8
F0 "Microcontroller" 50
F1 "Microcontroller.sch" 50
$EndSheet

$Sheet
S 3420 5890 500  150 
U 5CB0BC26
F0 "Microcontroller Programming" 50
F1 "Microcontroller_Programming.sch" 50
$EndSheet

$Sheet
S 3420 6240 500  150 
U 5CB25152
F0 "Microcontroller Bypass" 50
F1 "Microcontroller_Bypass.sch" 50
$EndSheet

$Sheet
S 3420 6590 500  150 
U 5E01BCC3
F0 "Microcontroller Clocking" 50
F1 "Microcontroller_Clocking.sch" 50
$EndSheet

$Sheet
S 3420 6940 500  150 
U 5E2843EF
F0 "Misc Circuits" 50
F1 "Misc_Circuits.sch" 50
$EndSheet

$Sheet
S 3420 7290 500  150 
U 5E213465
F0 "Backup RTC" 50
F1 "Backup_RTC.sch" 50
$EndSheet

$Sheet
S 8270 1340 500  150 
U 5CB7A8BC
F0 "Status LEDs" 50
F1 "Status_LEDs.sch" 50
$EndSheet

$Sheet
S 8270 1690 500  150 
U 5CB7A8C3
F0 "PGOOD LEDs" 50
F1 "PGOOD_LEDs.sch" 50
$EndSheet

$Sheet
S 8270 2040 500  150 
U 5E0CF7BC
F0 "I2C Buffer" 50
F1 "I2C_Buffer.sch" 50
$EndSheet

$Sheet
S 8270 2390 500  150 
U 5E07B870
F0 "Time of Flight" 50
F1 "Time_of_Flight.sch" 50
$EndSheet

$Sheet
S 8270 2740 500  150 
U 5CAD2D97
F0 "USB UART Bridge" 50
F1 "USB_UART_Bridge.sch" 50
$EndSheet

$Sheet
S 8270 3090 500  150 
U 5CAD2DA3
F0 "USB UART Isolation" 50
F1 "USB_UART_Isolation.sch" 50
$EndSheet

$Sheet
S 8270 3440 500  150 
U 5E052856
F0 "USB Telemetry" 50
F1 "USB_Telemetry.sch" 50
$EndSheet

$Sheet
S 8270 3790 500  150 
U 5CB8A16A
F0 "IO Buffers 1" 50
F1 "IO_Buffers_1.sch" 50
$EndSheet

$Sheet
S 8270 4140 500  150 
U 5CC31B3E
F0 "IO Buffers 2" 50
F1 "IO_Buffers_2.sch" 50
$EndSheet

$Sheet
S 8270 4490 500  150 
U 5CB7B79E
F0 "IO Connectors" 50
F1 "IO_Connectors.sch" 50
$EndSheet




$Sheet
S 8270 4840 500  150 
U 5B583C3D
F0 "Mechanical" 50
F1 "Mechanical.sch" 50
$EndSheet




Text Notes 6280 6020 0    50   ~ 0
Consider adding net ties on all current sense shunt resistors for net isolation



Text Notes 3380 980  0    250  ~ 50
VFD Clock Logic Board
Text Notes 720  1490 0    100  ~ 20
02. +12V Input
Text Notes 720  1840 0    100  ~ 20
03. +12V Telemetry
Text Notes 720  2190 0    100  ~ 20
04. +3.3V Power Supply
Text Notes 720  2540 0    100  ~ 20
05. +3.3V Telemetry
Text Notes 720  2890 0    100  ~ 20
06. +5V Power Supply
Text Notes 720  3240 0    100  ~ 20
07. +5V Telemetry 
Text Notes 720  3590 0    100  ~ 20
08. +1.2VFF Power Supply
Text Notes 720  3940 0    100  ~ 20
09. +1.2VFF Telemetry
Text Notes 720  4290 0    100  ~ 20
10. +60VAN Power Supply
Text Notes 720  4640 0    100  ~ 20
11. +60VAN Telemetry
Text Notes 720  4990 0    100  ~ 20
12. +3.3V BCKP Power Supply
Text Notes 720  5340 0    100  ~ 20
13. Misc Power
Text Notes 720  5690 0    100  ~ 20
14. Microcontroller
Text Notes 720  6040 0    100  ~ 20
15. Microcontroller Programming
Text Notes 720  6390 0    100  ~ 20
16. Microcontroller Bypass
Text Notes 720  6740 0    100  ~ 20
17. Microcontroller Clocking
Text Notes 720  7090 0    100  ~ 20
18. Misc Circuits
Text Notes 720  7440 0    100  ~ 20
19. Backup RTC
Text Notes 720  1140 0    100  ~ 20
01. Table of Contents
Text Notes 6370 1490 0    100  ~ 20
20. Status LEDs
Text Notes 6370 1840 0    100  ~ 20
21. PGOOD LEDs
Text Notes 6370 2190 0    100  ~ 20
22. I2C Buffer
Text Notes 6370 2540 0    100  ~ 20
23. Time of Flight
Text Notes 6370 2890 0    100  ~ 20
24. USB UART Bridge
Text Notes 6370 3240 0    100  ~ 20
25. USB UART Isolation
Text Notes 6370 3590 0    100  ~ 20
26. USB Telemetry
Text Notes 6370 3940 0    100  ~ 20
27. IO Buffers 1
Text Notes 6370 4290 0    100  ~ 20
28. IO Buffers 2
Text Notes 6370 4640 0    100  ~ 20
29. IO Connectors
Text Notes 6370 4990 0    100  ~ 20
30. Mechanical
$EndSCHEMATC

EESchema Schematic File Version 2
LIBS:74xgxx
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
LIBS:cmos4000
LIBS:cmos_ieee
LIBS:conn
LIBS:contrib
LIBS:cypress
LIBS:dc-dc
LIBS:device
LIBS:digital-audio
LIBS:diode
LIBS:display
LIBS:dsp
LIBS:elec-unifil
LIBS:ESD_Protection
LIBS:espressif-xess
LIBS:ftdi
LIBS:gennum
LIBS:graphic
LIBS:hc11
LIBS:intel
LIBS:interface
LIBS:ir
LIBS:Lattice
LIBS:leds
LIBS:linear
LIBS:logo
LIBS:maxim
LIBS:mechanical
LIBS:memory
LIBS:microchip
LIBS:microchip_dspic33dsc
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic24mcu
LIBS:microchip_pic32mcu
LIBS:microcontrollers
LIBS:modules
LIBS:motor_drivers
LIBS:motorola
LIBS:motors
LIBS:msp430
LIBS:nordicsemi
LIBS:nxp
LIBS:nxp_armmcu
LIBS:onsemi
LIBS:opto
LIBS:Oscillators
LIBS:philips
LIBS:power
LIBS:powerint
LIBS:Power_Management
LIBS:pspice
LIBS:references
LIBS:regul
LIBS:relays
LIBS:rfcom
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
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L ESP-12F U2
U 1 1 598DC688
P 4550 1200
F 0 "U2" H 4750 1450 60  0000 L CNN
F 1 "ESP-12F" H 4750 1350 60  0000 L CNN
F 2 "" H 4550 1200 60  0001 C CNN
F 3 "" H 4550 1200 60  0001 C CNN
	1    4550 1200
	1    0    0    -1  
$EndComp
$Comp
L AP1117 U1
U 1 1 598DC7D7
P 3450 1200
F 0 "U1" H 3550 950 50  0000 C CNN
F 1 "AP1117" H 3450 1450 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-223" H 3450 850 50  0001 C CNN
F 3 "" H 3550 950 50  0001 C CNN
	1    3450 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1200 3950 1200
Wire Wire Line
	3950 1200 3950 1900
Wire Wire Line
	3950 1900 4550 1900
Wire Wire Line
	1850 3200 2300 3200
Wire Wire Line
	2300 3200 2600 3200
Wire Wire Line
	2600 3200 3000 3200
Wire Wire Line
	3000 3200 3450 3200
Wire Wire Line
	3450 3200 7100 3200
Wire Wire Line
	7100 3200 7100 1900
Wire Wire Line
	7100 1900 6450 1900
$Comp
L GND #PWR?
U 1 1 598DCABC
P 3450 3200
F 0 "#PWR?" H 3450 2950 50  0001 C CNN
F 1 "GND" H 3450 3050 50  0000 C CNN
F 2 "" H 3450 3200 50  0001 C CNN
F 3 "" H 3450 3200 50  0001 C CNN
	1    3450 3200
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 598DCADA
P 3950 1200
F 0 "#PWR?" H 3950 1050 50  0001 C CNN
F 1 "+3.3V" H 3950 1340 50  0000 C CNN
F 2 "" H 3950 1200 50  0001 C CNN
F 3 "" H 3950 1200 50  0001 C CNN
	1    3950 1200
	1    0    0    -1  
$EndComp
Connection ~ 3950 1200
Wire Wire Line
	3000 1200 3000 1950
Wire Wire Line
	3000 2250 3000 3200
$Comp
L CP C1
U 1 1 598DCC4F
P 2600 2100
F 0 "C1" H 2625 2200 50  0000 L CNN
F 1 "100µF" H 2625 2000 50  0000 L CNN
F 2 "" H 2638 1950 50  0001 C CNN
F 3 "" H 2600 2100 50  0001 C CNN
	1    2600 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 1200 2600 1950
Connection ~ 3000 1200
Wire Wire Line
	2600 2250 2600 3200
Connection ~ 3000 3200
$Comp
L JACK_2P J1
U 1 1 598DCD5A
P 1400 1350
F 0 "J1" H 1050 1150 50  0000 C CNN
F 1 "JACK_2P" H 1250 1600 50  0000 C CNN
F 2 "" H 1400 1350 50  0001 C CNN
F 3 "" H 1400 1350 50  0001 C CNN
	1    1400 1350
	1    0    0    -1  
$EndComp
Connection ~ 2600 1200
Connection ~ 2600 3200
$Comp
L SW_DPST_x2 SW1
U 1 1 598DD025
P 2050 1200
F 0 "SW1" H 2050 1325 50  0000 C CNN
F 1 "SW_DPST_x2" H 2050 1100 50  0000 C CNN
F 2 "" H 2050 1200 50  0001 C CNN
F 3 "" H 2050 1200 50  0001 C CNN
	1    2050 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 1200 2300 1200
Wire Wire Line
	2300 1200 2600 1200
Wire Wire Line
	2600 1200 3000 1200
Wire Wire Line
	3000 1200 3150 1200
Wire Wire Line
	1850 1200 1850 1200
Wire Wire Line
	1850 1350 1850 1450
Wire Wire Line
	1850 1450 1850 3200
Connection ~ 1850 1450
$Comp
L +5V #PWR?
U 1 1 598DD3F9
P 3000 1200
F 0 "#PWR?" H 3000 1050 50  0001 C CNN
F 1 "+5V" H 3000 1340 50  0000 C CNN
F 2 "" H 3000 1200 50  0001 C CNN
F 3 "" H 3000 1200 50  0001 C CNN
	1    3000 1200
	1    0    0    -1  
$EndComp
$Comp
L LED D1
U 1 1 598DD425
P 2300 2350
F 0 "D1" H 2300 2450 50  0000 C CNN
F 1 "LED" H 2300 2250 50  0000 C CNN
F 2 "" H 2300 2350 50  0001 C CNN
F 3 "" H 2300 2350 50  0001 C CNN
	1    2300 2350
	0    -1   -1   0   
$EndComp
$Comp
L D D1
U 1 1 598DD4FB
P 3000 2100
F 0 "D1" H 3000 2200 50  0000 C CNN
F 1 "D" H 3000 2000 50  0000 C CNN
F 2 "" H 3000 2100 50  0001 C CNN
F 3 "" H 3000 2100 50  0001 C CNN
	1    3000 2100
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 598DD62D
P 2300 1950
F 0 "R1" V 2380 1950 50  0000 C CNN
F 1 "270" V 2300 1950 50  0000 C CNN
F 2 "" V 2230 1950 50  0001 C CNN
F 3 "" H 2300 1950 50  0001 C CNN
	1    2300 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 2100 2300 2200
Wire Wire Line
	2300 1800 2300 1200
Connection ~ 2300 1200
Wire Wire Line
	2300 2500 2300 3200
Connection ~ 2300 3200
Wire Wire Line
	3450 1500 3450 3200
Connection ~ 3450 3200
$EndSCHEMATC

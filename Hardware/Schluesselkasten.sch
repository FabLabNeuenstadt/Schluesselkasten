EESchema Schematic File Version 2
LIBS:74hc595
LIBS:Schluesselkasten-rescue
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
LIBS:hc11
LIBS:intel
LIBS:interface
LIBS:ir
LIBS:Lattice
LIBS:leds
LIBS:linear
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
LIBS:cd74hc4067
LIBS:irlr_7843
LIBS:buck_converter
LIBS:rfid_reader
LIBS:programmer_breakout
LIBS:Schluesselkasten-cache
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
P 4700 1200
F 0 "U2" H 4900 1450 60  0000 L CNN
F 1 "ESP-12F" H 4900 1350 60  0000 L CNN
F 2 "" H 4700 1200 60  0001 C CNN
F 3 "" H 4700 1200 60  0001 C CNN
	1    4700 1200
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR01
U 1 1 598DCADA
P 3850 1100
F 0 "#PWR01" H 3850 950 50  0001 C CNN
F 1 "+3.3V" H 3850 1240 50  0000 C CNN
F 2 "" H 3850 1100 50  0001 C CNN
F 3 "" H 3850 1100 50  0001 C CNN
	1    3850 1100
	1    0    0    -1  
$EndComp
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
$Comp
L JACK_2P J0
U 1 1 598DCD5A
P 1400 1350
F 0 "J0" H 1050 1150 50  0000 C CNN
F 1 "JACK_2P" H 1250 1600 50  0000 C CNN
F 2 "" H 1400 1350 50  0001 C CNN
F 3 "" H 1400 1350 50  0001 C CNN
	1    1400 1350
	1    0    0    -1  
$EndComp
$Comp
L SW_DPST_x2-RESCUE-Schluesselkasten SW1
U 1 1 598DD025
P 2050 1200
F 0 "SW1" H 2050 1325 50  0000 C CNN
F 1 "SW_DPST_x2" H 2050 1100 50  0000 C CNN
F 2 "" H 2050 1200 50  0001 C CNN
F 3 "" H 2050 1200 50  0001 C CNN
	1    2050 1200
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
L D D2
U 1 1 598DD4FB
P 3000 2100
F 0 "D2" H 3000 2200 50  0000 C CNN
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
F 1 "670" V 2300 1950 50  0000 C CNN
F 2 "" V 2230 1950 50  0001 C CNN
F 3 "" H 2300 1950 50  0001 C CNN
	1    2300 1950
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 598DED92
P 7000 2000
F 0 "R4" V 7080 2000 50  0000 C CNN
F 1 "12k" V 7000 2000 50  0000 C CNN
F 2 "" V 6930 2000 50  0001 C CNN
F 3 "" H 7000 2000 50  0001 C CNN
	1    7000 2000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 598DEE50
P 6900 2350
F 0 "#PWR02" H 6900 2100 50  0001 C CNN
F 1 "GND" H 6900 2200 50  0000 C CNN
F 2 "" H 6900 2350 50  0001 C CNN
F 3 "" H 6900 2350 50  0001 C CNN
	1    6900 2350
	1    0    0    -1  
$EndComp
$Comp
L CD74HC4067 U3
U 1 1 598DEC4B
P 5750 5400
F 0 "U3" H 5750 4800 60  0000 C CNN
F 1 "CD74HC4067" H 5750 6100 60  0000 C CNN
F 2 "" H 5700 5400 60  0001 C CNN
F 3 "" H 5700 5400 60  0001 C CNN
	1    5750 5400
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 598DF2F5
P 4750 4800
F 0 "R5" V 4830 4800 50  0000 C CNN
F 1 "1k" V 4750 4800 50  0000 C CNN
F 2 "" V 4680 4800 50  0001 C CNN
F 3 "" H 4750 4800 50  0001 C CNN
	1    4750 4800
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR03
U 1 1 598DF76B
P 6500 4800
F 0 "#PWR03" H 6500 4650 50  0001 C CNN
F 1 "+3.3V" H 6500 4940 50  0000 C CNN
F 2 "" H 6500 4800 50  0001 C CNN
F 3 "" H 6500 4800 50  0001 C CNN
	1    6500 4800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 598DFBAE
P 4900 5900
F 0 "#PWR05" H 4900 5650 50  0001 C CNN
F 1 "GND" H 4900 5750 50  0000 C CNN
F 2 "" H 4900 5900 50  0001 C CNN
F 3 "" H 4900 5900 50  0001 C CNN
	1    4900 5900
	1    0    0    -1  
$EndComp
Text GLabel 4700 5700 0    60   Input ~ 0
S_0
Text GLabel 4950 5800 0    60   Input ~ 0
S_1
Text GLabel 6500 5900 2    60   Input ~ 0
S_3
Text GLabel 6300 5800 2    60   Input ~ 0
S_2
$Comp
L R R6
U 1 1 598E0EDB
P 4250 1400
F 0 "R6" V 4330 1400 50  0000 C CNN
F 1 "12k" V 4250 1400 50  0000 C CNN
F 2 "" V 4180 1400 50  0001 C CNN
F 3 "" H 4250 1400 50  0001 C CNN
	1    4250 1400
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR06
U 1 1 598E265E
P 2800 3250
F 0 "#PWR06" H 2800 3000 50  0001 C CNN
F 1 "GND" H 2800 3100 50  0000 C CNN
F 2 "" H 2800 3250 50  0001 C CNN
F 3 "" H 2800 3250 50  0001 C CNN
	1    2800 3250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 598E2B3B
P 4600 4800
F 0 "#PWR07" H 4600 4550 50  0001 C CNN
F 1 "GND" H 4600 4650 50  0000 C CNN
F 2 "" H 4600 4800 50  0001 C CNN
F 3 "" H 4600 4800 50  0001 C CNN
	1    4600 4800
	1    0    0    -1  
$EndComp
$Comp
L XLR3 J1
U 1 1 598E2EFE
P 1600 5700
F 0 "J1" H 1750 5950 50  0000 C CNN
F 1 "XLR3" H 1800 5450 50  0000 C CNN
F 2 "" H 1600 5700 50  0001 C CNN
F 3 "" H 1600 5700 50  0001 C CNN
	1    1600 5700
	1    0    0    -1  
$EndComp
$Comp
L XLR3 J2
U 1 1 598E3262
P 2700 5700
F 0 "J2" H 2850 5950 50  0000 C CNN
F 1 "XLR3" H 2900 5450 50  0000 C CNN
F 2 "" H 2700 5700 50  0001 C CNN
F 3 "" H 2700 5700 50  0001 C CNN
	1    2700 5700
	1    0    0    -1  
$EndComp
$Comp
L XLR3 J3
U 1 1 598E32DC
P 3950 5700
F 0 "J3" H 4100 5950 50  0000 C CNN
F 1 "XLR3" H 4150 5450 50  0000 C CNN
F 2 "" H 3950 5700 50  0001 C CNN
F 3 "" H 3950 5700 50  0001 C CNN
	1    3950 5700
	1    0    0    -1  
$EndComp
$Comp
L XLR3 J4
U 1 1 598E38AE
P 1600 6450
F 0 "J4" H 1750 6700 50  0000 C CNN
F 1 "XLR3" H 1800 6200 50  0000 C CNN
F 2 "" H 1600 6450 50  0001 C CNN
F 3 "" H 1600 6450 50  0001 C CNN
	1    1600 6450
	1    0    0    -1  
$EndComp
$Comp
L XLR3 J5
U 1 1 598E38B4
P 2700 6450
F 0 "J5" H 2850 6700 50  0000 C CNN
F 1 "XLR3" H 2900 6200 50  0000 C CNN
F 2 "" H 2700 6450 50  0001 C CNN
F 3 "" H 2700 6450 50  0001 C CNN
	1    2700 6450
	1    0    0    -1  
$EndComp
$Comp
L XLR3 J6
U 1 1 598E38BA
P 3800 6450
F 0 "J6" H 3950 6700 50  0000 C CNN
F 1 "XLR3" H 4000 6200 50  0000 C CNN
F 2 "" H 3800 6450 50  0001 C CNN
F 3 "" H 3800 6450 50  0001 C CNN
	1    3800 6450
	1    0    0    -1  
$EndComp
$Comp
L XLR3 J7
U 1 1 598E397C
P 1600 7200
F 0 "J7" H 1750 7450 50  0000 C CNN
F 1 "XLR3" H 1800 6950 50  0000 C CNN
F 2 "" H 1600 7200 50  0001 C CNN
F 3 "" H 1600 7200 50  0001 C CNN
	1    1600 7200
	1    0    0    -1  
$EndComp
$Comp
L XLR3 J8
U 1 1 598E3982
P 2700 7200
F 0 "J8" H 2850 7450 50  0000 C CNN
F 1 "XLR3" H 2900 6950 50  0000 C CNN
F 2 "" H 2700 7200 50  0001 C CNN
F 3 "" H 2700 7200 50  0001 C CNN
	1    2700 7200
	1    0    0    -1  
$EndComp
$Comp
L XLR3 J9
U 1 1 598E3988
P 3800 7200
F 0 "J9" H 3950 7450 50  0000 C CNN
F 1 "XLR3" H 4000 6950 50  0000 C CNN
F 2 "" H 3800 7200 50  0001 C CNN
F 3 "" H 3800 7200 50  0001 C CNN
	1    3800 7200
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR08
U 1 1 598E3CE1
P 800 6800
F 0 "#PWR08" H 800 6650 50  0001 C CNN
F 1 "+3.3V" H 800 6940 50  0000 C CNN
F 2 "" H 800 6800 50  0001 C CNN
F 3 "" H 800 6800 50  0001 C CNN
	1    800  6800
	1    0    0    -1  
$EndComp
NoConn ~ 1950 5700
NoConn ~ 1950 6450
NoConn ~ 1950 7200
NoConn ~ 3050 7200
NoConn ~ 3050 6450
NoConn ~ 3050 5700
NoConn ~ 4300 5700
NoConn ~ 4150 6450
NoConn ~ 4150 7200
Text GLabel 1250 5700 0    60   Input ~ 0
I_0
Text GLabel 2350 5700 0    60   Input ~ 0
I_1
Text GLabel 3600 5700 0    60   Input ~ 0
I_2
Text GLabel 3450 6450 0    60   Input ~ 0
I_5
Text GLabel 3450 7200 0    60   Input ~ 0
I_8
Text GLabel 2350 6450 0    60   Input ~ 0
I_4
Text GLabel 1250 6450 0    60   Input ~ 0
I_3
Text GLabel 1250 7200 0    60   Input ~ 0
I_6
Text GLabel 2350 7200 0    60   Input ~ 0
I_7
Text GLabel 5200 5600 0    60   Input ~ 0
I_0
Text GLabel 5200 5500 0    60   Input ~ 0
I_1
Text GLabel 5200 5400 0    60   Input ~ 0
I_2
Text GLabel 5200 5300 0    60   Input ~ 0
I_3
Text GLabel 5200 5200 0    60   Input ~ 0
I_4
Text GLabel 5200 5100 0    60   Input ~ 0
I_5
Text GLabel 5200 5000 0    60   Input ~ 0
I_6
Text GLabel 5200 4900 0    60   Input ~ 0
I_7
Text GLabel 6300 4900 2    60   Input ~ 0
I_8
NoConn ~ 6300 5000
NoConn ~ 6300 5100
NoConn ~ 6300 5200
NoConn ~ 6300 5300
NoConn ~ 6300 5400
NoConn ~ 6300 5500
NoConn ~ 6300 5600
$Comp
L IRLR_7843 Q1
U 1 1 598E6E65
P 10750 4050
F 0 "Q1" H 10950 4125 50  0000 L CNN
F 1 "IRLR_7843" H 10950 4050 50  0000 L CNN
F 2 "" H 10950 3975 50  0001 L CIN
F 3 "" H 10750 4050 50  0001 L CNN
	1    10750 4050
	1    0    0    -1  
$EndComp
$Comp
L L Solenoid1
U 1 1 598E716E
P 10850 3600
F 0 "Solenoid1" V 10800 3600 50  0000 C CNN
F 1 "L" V 10950 3500 50  0000 C CNN
F 2 "" H 10850 3600 50  0001 C CNN
F 3 "" H 10850 3600 50  0001 C CNN
	1    10850 3600
	1    0    0    -1  
$EndComp
$Comp
L D D3
U 1 1 598E73CC
P 11050 3600
F 0 "D3" H 11050 3700 50  0000 C CNN
F 1 "D" H 10950 3500 50  0000 C CNN
F 2 "" H 11050 3600 50  0001 C CNN
F 3 "" H 11050 3600 50  0001 C CNN
	1    11050 3600
	0    1    1    0   
$EndComp
$Comp
L +12V #PWR09
U 1 1 598E762B
P 10850 3300
F 0 "#PWR09" H 10850 3150 50  0001 C CNN
F 1 "+12V" H 10850 3440 50  0000 C CNN
F 2 "" H 10850 3300 50  0001 C CNN
F 3 "" H 10850 3300 50  0001 C CNN
	1    10850 3300
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 598E77EB
P 10500 4250
F 0 "R7" V 10580 4250 50  0000 C CNN
F 1 "10k" V 10500 4250 50  0000 C CNN
F 2 "" V 10430 4250 50  0001 C CNN
F 3 "" H 10500 4250 50  0001 C CNN
	1    10500 4250
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 598E7B97
P 10350 4100
F 0 "R8" V 10430 4100 50  0000 C CNN
F 1 "1k" V 10350 4100 50  0000 C CNN
F 2 "" V 10280 4100 50  0001 C CNN
F 3 "" H 10350 4100 50  0001 C CNN
	1    10350 4100
	0    1    1    0   
$EndComp
$Comp
L SW_Reed-RESCUE-Schluesselkasten SW2
U 1 1 598E8EA0
P 7250 2000
F 0 "SW2" H 7250 2100 50  0000 C CNN
F 1 "SW_Reed" H 7250 1900 50  0000 C CNN
F 2 "" H 7250 2000 50  0001 C CNN
F 3 "" H 7250 2000 50  0001 C CNN
	1    7250 2000
	0    1    1    0   
$EndComp
$Comp
L +12V #PWR012
U 1 1 598E9577
P 2750 1100
F 0 "#PWR012" H 2750 950 50  0001 C CNN
F 1 "+12V" H 2750 1240 50  0000 C CNN
F 2 "" H 2750 1100 50  0001 C CNN
F 3 "" H 2750 1100 50  0001 C CNN
	1    2750 1100
	1    0    0    -1  
$EndComp
$Comp
L Buck_Converter U1
U 1 1 598E99AA
P 3400 1350
F 0 "U1" H 3450 1200 60  0000 C CNN
F 1 "Buck_Converter" H 3400 1600 60  0000 C CNN
F 2 "" H 3400 1350 60  0001 C CNN
F 3 "" H 3400 1350 60  0001 C CNN
	1    3400 1350
	1    0    0    -1  
$EndComp
$Comp
L Jumper_NC_Dual JP1
U 1 1 598E11BD
P 7550 2300
F 0 "JP1" H 7600 2200 50  0000 L CNN
F 1 "Jumper_NC_Dual" H 7550 2400 50  0000 C BNN
F 2 "" H 7550 2300 50  0001 C CNN
F 3 "" H 7550 2300 50  0001 C CNN
	1    7550 2300
	-1   0    0    1   
$EndComp
$Comp
L Programmer_Breakout P1
U 1 1 598E2DF3
P 7250 1200
F 0 "P1" H 7450 1200 60  0001 C CNN
F 1 "Programmer_Breakout" H 7500 1400 60  0000 C CNN
F 2 "" H 7600 1200 60  0001 C CNN
F 3 "" H 7600 1200 60  0001 C CNN
	1    7250 1200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 598E3254
P 6750 1100
F 0 "#PWR013" H 6750 850 50  0001 C CNN
F 1 "GND" H 6750 950 50  0000 C CNN
F 2 "" H 6750 1100 50  0001 C CNN
F 3 "" H 6750 1100 50  0001 C CNN
	1    6750 1100
	-1   0    0    1   
$EndComp
$Comp
L R R9
U 1 1 598ED712
P 4450 4600
F 0 "R9" V 4530 4600 50  0000 C CNN
F 1 "10k" V 4450 4600 50  0000 C CNN
F 2 "" V 4380 4600 50  0001 C CNN
F 3 "" H 4450 4600 50  0001 C CNN
	1    4450 4600
	0    1    1    0   
$EndComp
$Comp
L R R10
U 1 1 598ED8B4
P 4850 4600
F 0 "R10" V 4930 4600 50  0000 C CNN
F 1 "23k" V 4850 4600 50  0000 C CNN
F 2 "" V 4780 4600 50  0001 C CNN
F 3 "" H 4850 4600 50  0001 C CNN
	1    4850 4600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR014
U 1 1 598EDF59
P 4300 4600
F 0 "#PWR014" H 4300 4350 50  0001 C CNN
F 1 "GND" H 4300 4450 50  0000 C CNN
F 2 "" H 4300 4600 50  0001 C CNN
F 3 "" H 4300 4600 50  0001 C CNN
	1    4300 4600
	1    0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 598EEEB8
P 4300 1200
F 0 "R11" V 4380 1200 50  0000 C CNN
F 1 "12k" V 4300 1200 50  0000 C CNN
F 2 "" V 4230 1200 50  0001 C CNN
F 3 "" H 4300 1200 50  0001 C CNN
	1    4300 1200
	0    -1   -1   0   
$EndComp
$Comp
L SW_Push SW3
U 1 1 598EF1C7
P 4900 750
F 0 "SW3" H 4950 850 50  0000 L CNN
F 1 "SW_Push" H 4900 690 50  0000 C CNN
F 2 "" H 4900 950 50  0001 C CNN
F 3 "" H 4900 950 50  0001 C CNN
	1    4900 750 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 598EF323
P 5150 750
F 0 "#PWR015" H 5150 500 50  0001 C CNN
F 1 "GND" H 5150 600 50  0000 C CNN
F 2 "" H 5150 750 50  0001 C CNN
F 3 "" H 5150 750 50  0001 C CNN
	1    5150 750 
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR016
U 1 1 598DE79A
P 8050 2350
F 0 "#PWR016" H 8050 2200 50  0001 C CNN
F 1 "+3.3V" H 8050 2490 50  0000 C CNN
F 2 "" H 8050 2350 50  0001 C CNN
F 3 "" H 8050 2350 50  0001 C CNN
	1    8050 2350
	-1   0    0    1   
$EndComp
$Comp
L R R2
U 1 1 598DE608
P 8050 2000
F 0 "R2" V 8130 2000 50  0000 C CNN
F 1 "12k" V 8050 2000 50  0000 C CNN
F 2 "" V 7980 2000 50  0001 C CNN
F 3 "" H 8050 2000 50  0001 C CNN
	1    8050 2000
	-1   0    0    1   
$EndComp
$Comp
L R R13
U 1 1 598F6AB8
P 10350 2600
F 0 "R13" V 10430 2600 50  0000 C CNN
F 1 "10k" V 10350 2600 50  0000 C CNN
F 2 "" V 10280 2600 50  0001 C CNN
F 3 "" H 10350 2600 50  0001 C CNN
	1    10350 2600
	0    -1   -1   0   
$EndComp
$Comp
L Q_NPN_CBE Q2
U 1 1 598F70CC
P 10750 2600
F 0 "Q2" H 10950 2650 50  0000 L CNN
F 1 "BC547" H 10950 2550 50  0000 L CNN
F 2 "" H 10950 2700 50  0001 C CNN
F 3 "" H 10750 2600 50  0001 C CNN
	1    10750 2600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 598F837C
P 10850 2900
F 0 "#PWR017" H 10850 2650 50  0001 C CNN
F 1 "GND" H 10850 2750 50  0000 C CNN
F 2 "" H 10850 2900 50  0001 C CNN
F 3 "" H 10850 2900 50  0001 C CNN
	1    10850 2900
	1    0    0    -1  
$EndComp
$Comp
L Buzzer BZ1
U 1 1 598F84E2
P 10950 2250
F 0 "BZ1" H 11100 2300 50  0000 L CNN
F 1 "Buzzer" H 11100 2200 50  0000 L CNN
F 2 "" V 10925 2350 50  0001 C CNN
F 3 "" V 10925 2350 50  0001 C CNN
	1    10950 2250
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR018
U 1 1 5990658A
P 10850 2000
F 0 "#PWR018" H 10850 1850 50  0001 C CNN
F 1 "+3.3V" H 10850 2140 50  0000 C CNN
F 2 "" H 10850 2000 50  0001 C CNN
F 3 "" H 10850 2000 50  0001 C CNN
	1    10850 2000
	1    0    0    -1  
$EndComp
$Comp
L RFID_Reader U4
U 1 1 5991AA74
P 5950 3300
F 0 "U4" H 5950 2850 60  0000 C CNN
F 1 "RFID_Reader" H 5950 3750 60  0000 C CNN
F 2 "" H 5950 2950 60  0001 C CNN
F 3 "" H 5950 2950 60  0001 C CNN
	1    5950 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 5991B7D0
P 4850 3500
F 0 "#PWR019" H 4850 3250 50  0001 C CNN
F 1 "GND" H 4850 3350 50  0000 C CNN
F 2 "" H 4850 3500 50  0001 C CNN
F 3 "" H 4850 3500 50  0001 C CNN
	1    4850 3500
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR020
U 1 1 5991BA63
P 5050 3650
F 0 "#PWR020" H 5050 3500 50  0001 C CNN
F 1 "+3.3V" H 5050 3790 50  0000 C CNN
F 2 "" H 5050 3650 50  0001 C CNN
F 3 "" H 5050 3650 50  0001 C CNN
	1    5050 3650
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 59C1D5C6
P 7550 2000
F 0 "R?" V 7630 2000 50  0000 C CNN
F 1 "12k" V 7550 2000 50  0000 C CNN
F 2 "" V 7480 2000 50  0001 C CNN
F 3 "" H 7550 2000 50  0001 C CNN
	1    7550 2000
	-1   0    0    1   
$EndComp
Text GLabel 9600 4200 2    60   Input ~ 0
S_3
Text GLabel 9350 4100 2    60   Input ~ 0
S_2
Text GLabel 9100 4000 2    60   Input ~ 0
S_1
Text GLabel 8850 3900 2    60   Input ~ 0
S_0
$Comp
L GND #PWR?
U 1 1 59C26751
P 8300 5050
F 0 "#PWR?" H 8300 4800 50  0001 C CNN
F 1 "GND" H 8300 4900 50  0000 C CNN
F 2 "" H 8300 5050 50  0001 C CNN
F 3 "" H 8300 5050 50  0001 C CNN
	1    8300 5050
	1    0    0    -1  
$EndComp
$Comp
L 74HC595 U?
U 1 1 59C27C69
P 8300 4350
F 0 "U?" H 8650 4950 50  0000 C CNN
F 1 "74HC595" H 8500 3750 50  0000 C CNN
F 2 "" H 8300 4350 50  0001 C CNN
F 3 "" H 8300 4350 50  0001 C CNN
	1    8300 4350
	1    0    0    -1  
$EndComp
Connection ~ 3850 1200
Wire Wire Line
	3750 1200 4150 1200
Connection ~ 3450 1600
Wire Wire Line
	3450 3200 3450 1600
Wire Wire Line
	3100 1600 3100 1400
Wire Wire Line
	3100 1600 3750 1600
Wire Wire Line
	3750 1600 3750 1400
Connection ~ 2750 1200
Wire Wire Line
	2750 1200 2750 1100
Connection ~ 10500 4100
Connection ~ 10850 4400
Wire Wire Line
	10850 4250 10850 4600
Wire Wire Line
	10500 4400 10850 4400
Wire Wire Line
	10500 4100 10550 4100
Connection ~ 10850 3400
Connection ~ 10850 3800
Wire Wire Line
	11050 3800 11050 3750
Wire Wire Line
	10850 3800 11050 3800
Wire Wire Line
	10850 3750 10850 3850
Wire Wire Line
	10850 3300 10850 3450
Wire Wire Line
	11050 3400 10850 3400
Wire Wire Line
	11050 3450 11050 3400
Connection ~ 950  6800
Connection ~ 1600 6800
Connection ~ 1600 6050
Connection ~ 1600 7550
Wire Wire Line
	950  6050 950  7550
Connection ~ 2700 6800
Connection ~ 2700 7550
Wire Wire Line
	950  7550 3800 7550
Wire Wire Line
	800  6800 3800 6800
Connection ~ 2700 6050
Wire Wire Line
	950  6050 3950 6050
Connection ~ 2800 3200
Wire Wire Line
	2800 3200 2800 3250
Wire Wire Line
	4700 1600 4300 1600
Wire Wire Line
	4400 1700 4700 1700
Wire Wire Line
	6300 5900 6500 5900
Wire Wire Line
	6300 5800 6300 5800
Wire Wire Line
	4950 5800 5200 5800
Wire Wire Line
	4700 5700 5200 5700
Wire Wire Line
	4900 5900 5200 5900
Wire Wire Line
	6300 4800 6500 4800
Wire Wire Line
	4650 1300 4700 1300
Wire Wire Line
	4900 4800 5200 4800
Wire Wire Line
	1850 3200 3450 3200
Connection ~ 2300 3200
Wire Wire Line
	2300 2500 2300 3200
Connection ~ 2300 1200
Wire Wire Line
	2300 1800 2300 1200
Wire Wire Line
	2300 2100 2300 2200
Connection ~ 1850 1450
Wire Wire Line
	1850 1350 1850 3200
Wire Wire Line
	1850 1200 1850 1200
Wire Wire Line
	2250 1200 3100 1200
Connection ~ 2600 3200
Connection ~ 2600 1200
Connection ~ 3000 3200
Wire Wire Line
	2600 3200 2600 2250
Connection ~ 3000 1200
Wire Wire Line
	2600 1200 2600 1950
Wire Wire Line
	3000 3200 3000 2250
Wire Wire Line
	3000 1200 3000 1950
Wire Wire Line
	3850 1900 4700 1900
Wire Wire Line
	3850 1100 3850 1900
Wire Wire Line
	6600 1700 8150 1700
Wire Wire Line
	8050 1700 8050 1850
Wire Wire Line
	6750 1100 6850 1100
Wire Wire Line
	4600 4600 4700 4600
Connection ~ 4650 4600
Wire Wire Line
	4650 4600 4650 1300
Wire Wire Line
	5000 4600 5000 4800
Connection ~ 5000 4800
Wire Wire Line
	4400 1400 4700 1400
Connection ~ 3850 1400
Wire Wire Line
	3850 1400 4100 1400
Wire Wire Line
	4450 1200 4700 1200
Connection ~ 4550 1200
Wire Wire Line
	4550 1200 4550 750 
Wire Wire Line
	4550 750  4700 750 
Wire Wire Line
	5150 750  5100 750 
Wire Wire Line
	7000 1850 7000 1800
Wire Wire Line
	6600 1800 7250 1800
Wire Wire Line
	6900 1900 6900 2350
Wire Wire Line
	6900 2200 7000 2200
Wire Wire Line
	6900 1900 6600 1900
Connection ~ 6900 2200
Wire Wire Line
	10850 2900 10850 2800
Wire Wire Line
	10850 2350 10850 2400
Wire Wire Line
	10500 2600 10550 2600
Wire Wire Line
	9900 2600 10200 2600
Wire Wire Line
	10850 2000 10850 2150
Wire Wire Line
	5050 3650 5700 3650
Wire Wire Line
	5700 3450 4850 3450
Wire Wire Line
	4850 3450 4850 3500
Wire Wire Line
	4400 3250 5700 3250
Wire Wire Line
	4500 3150 5700 3150
Wire Wire Line
	5250 3550 5250 3650
Connection ~ 5250 3650
Wire Wire Line
	5250 3550 5700 3550
Wire Wire Line
	6600 1300 6850 1200
Wire Wire Line
	6600 1200 6850 1300
Wire Wire Line
	7800 2300 8050 2300
Wire Wire Line
	6900 2300 7300 2300
Connection ~ 6900 2300
Connection ~ 8050 2300
Wire Wire Line
	8050 2150 8050 2350
Wire Wire Line
	7550 2200 7550 2150
Wire Wire Line
	7550 1600 7550 1850
Wire Wire Line
	4300 1600 4300 3050
Wire Wire Line
	4300 3050 5700 3050
Wire Wire Line
	4400 1700 4400 3250
Wire Wire Line
	4500 3150 4500 1800
Wire Wire Line
	4500 1800 4700 1800
Wire Wire Line
	4200 2950 5700 2950
Wire Wire Line
	6600 1600 7650 1600
Wire Wire Line
	8800 3900 8850 3900
Wire Wire Line
	9100 4000 8800 4000
Wire Wire Line
	9350 4100 8800 4100
Wire Wire Line
	9600 4200 8800 4200
Wire Wire Line
	10000 4100 10200 4100
Wire Wire Line
	8300 5000 8300 5050
$Comp
L +3.3V #PWR?
U 1 1 59C2892F
P 8300 3600
F 0 "#PWR?" H 8300 3450 50  0001 C CNN
F 1 "+3.3V" H 8300 3740 50  0000 C CNN
F 2 "" H 8300 3600 50  0001 C CNN
F 3 "" H 8300 3600 50  0001 C CNN
	1    8300 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 3600 8300 3700
Wire Wire Line
	7750 3650 8300 3650
Connection ~ 8300 3650
$Comp
L LED D?
U 1 1 59C28C52
P 10200 4500
F 0 "D?" H 10200 4600 50  0000 C CNN
F 1 "R_LED" H 10200 4400 50  0000 C CNN
F 2 "" H 10200 4500 50  0001 C CNN
F 3 "" H 10200 4500 50  0001 C CNN
	1    10200 4500
	-1   0    0    1   
$EndComp
$Comp
L LED D?
U 1 1 59C28E07
P 10550 4600
F 0 "D?" H 10550 4700 50  0000 C CNN
F 1 "G_LED" H 10550 4500 50  0000 C CNN
F 2 "" H 10550 4600 50  0001 C CNN
F 3 "" H 10550 4600 50  0001 C CNN
	1    10550 4600
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 59C29029
P 9450 4500
F 0 "R?" V 9530 4500 50  0000 C CNN
F 1 "290" V 9450 4500 50  0000 C CNN
F 2 "" V 9380 4500 50  0001 C CNN
F 3 "" H 9450 4500 50  0001 C CNN
	1    9450 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	8800 4500 9300 4500
Wire Wire Line
	9600 4500 10050 4500
$Comp
L R R?
U 1 1 59C29398
P 9150 4600
F 0 "R?" V 9230 4600 50  0000 C CNN
F 1 "270" V 9150 4600 50  0000 C CNN
F 2 "" V 9080 4600 50  0001 C CNN
F 3 "" H 9150 4600 50  0001 C CNN
	1    9150 4600
	0    1    1    0   
$EndComp
Wire Wire Line
	8800 4600 9000 4600
Wire Wire Line
	9300 4600 10400 4600
$Comp
L GND #PWR?
U 1 1 59C29829
P 10850 4600
F 0 "#PWR?" H 10850 4350 50  0001 C CNN
F 1 "GND" H 10850 4450 50  0000 C CNN
F 2 "" H 10850 4600 50  0001 C CNN
F 3 "" H 10850 4600 50  0001 C CNN
	1    10850 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 4600 10700 4600
Wire Wire Line
	10850 4500 10350 4500
Connection ~ 10850 4600
Text GLabel 8150 1700 2    60   Input ~ 0
GPIO_2
Connection ~ 8050 1700
Text GLabel 7350 4100 0    60   Input ~ 0
GPIO_2
Wire Wire Line
	7750 4500 7800 4500
Text GLabel 7650 1600 2    60   Input ~ 0
GPIO_0
Connection ~ 7550 1600
Text GLabel 7250 1500 2    60   Input ~ 0
GPIO_4
Wire Wire Line
	7250 1500 6600 1500
Text GLabel 6650 1400 2    60   Input ~ 0
GPIO_5
Wire Wire Line
	6650 1400 6600 1400
Text GLabel 7350 4400 0    60   Input ~ 0
GPIO_0
Text GLabel 7750 4500 0    60   Input ~ 0
GPIO_4
Text GLabel 7350 3900 0    60   Input ~ 0
GPIO_5
Wire Wire Line
	7750 4200 7800 4200
Wire Wire Line
	7350 4100 7800 4100
Wire Wire Line
	7350 4400 7800 4400
Text Notes 7250 4700 0    60   ~ 0
OE_ENABLE
Wire Wire Line
	7350 3900 7800 3900
Wire Wire Line
	7750 3650 7750 4200
Text Notes 7100 4250 0    60   ~ 0
Storage Reset
Text Notes 6500 4450 0    60   ~ 0
Latch Pin
Text Notes 6550 3950 0    60   ~ 0
Data Pin
Connection ~ 7000 1800
Text GLabel 6550 5700 2    60   Input ~ 0
GPIO_2
Wire Wire Line
	6550 5700 6300 5700
Wire Wire Line
	7000 2200 7000 2150
NoConn ~ 5700 3350
Wire Wire Line
	4200 2950 4200 1500
Wire Wire Line
	4200 1500 4700 1500
$Comp
L +3.3V #PWR?
U 1 1 59CE6639
P 7250 2350
F 0 "#PWR?" H 7250 2200 50  0001 C CNN
F 1 "+3.3V" H 7250 2490 50  0000 C CNN
F 2 "" H 7250 2350 50  0001 C CNN
F 3 "" H 7250 2350 50  0001 C CNN
	1    7250 2350
	-1   0    0    1   
$EndComp
Wire Wire Line
	7250 2350 7250 2200
Wire Wire Line
	9900 4300 8800 4300
Wire Wire Line
	10000 4400 8800 4400
Connection ~ 10850 4500
Wire Wire Line
	10000 4400 10000 4100
Wire Wire Line
	9900 4300 9900 2600
$EndSCHEMATC

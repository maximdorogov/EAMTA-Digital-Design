## This file is a general .xdc for the ARTY Rev. B
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal

set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clock }]; #IO_L12P_T1_MRCC_35 Sch=gclk[100]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clock }];

##LEDs

set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { o_leds[0] }]; #IO_L24N_T3_35 Sch=led[4]
set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { o_leds[1] }]; #IO_25_35 Sch=led[5]
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { o_leds[2] }]; #IO_L24P_T3_A01_D17_14 Sch=led[6]
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { o_leds[3] }]; #IO_L24N_T3_A00_D16_14 Sch=led[7]

##RGB LEDs
set_property -dict { PACKAGE_PIN G6    IOSTANDARD LVCMOS33 } [get_ports { o_led_r[0] }]; #IO_L18N_T2_35 Sch=led0_b
set_property -dict { PACKAGE_PIN F6    IOSTANDARD LVCMOS33 } [get_ports { o_led_g[0] }]; #IO_L19N_T3_VREF_35 Sch=led0_g
set_property -dict { PACKAGE_PIN E1    IOSTANDARD LVCMOS33 } [get_ports { o_led_b[0] }]; #IO_L19P_T3_35 Sch=led0_r
set_property -dict { PACKAGE_PIN G3    IOSTANDARD LVCMOS33 } [get_ports { o_led_r[1] }]; #IO_L20P_T3_35 Sch=led1_b
set_property -dict { PACKAGE_PIN J4    IOSTANDARD LVCMOS33 } [get_ports { o_led_g[1] }]; #IO_L21P_T3_DQS_35 Sch=led1_g
set_property -dict { PACKAGE_PIN G4    IOSTANDARD LVCMOS33 } [get_ports { o_led_b[1] }]; #IO_L20N_T3_35 Sch=led1_r
set_property -dict { PACKAGE_PIN J3    IOSTANDARD LVCMOS33 } [get_ports { o_led_r[2] }]; #IO_L21N_T3_DQS_35 Sch=led2_b
set_property -dict { PACKAGE_PIN J2    IOSTANDARD LVCMOS33 } [get_ports { o_led_g[2] }]; #IO_L22N_T3_35 Sch=led2_g
set_property -dict { PACKAGE_PIN H4    IOSTANDARD LVCMOS33 } [get_ports { o_led_b[2] }]; #IO_L22P_T3_35 Sch=led2_r
set_property -dict { PACKAGE_PIN K1    IOSTANDARD LVCMOS33 } [get_ports { o_led_r[3] }]; #IO_L23P_T3_35 Sch=led3_b
set_property -dict { PACKAGE_PIN H6    IOSTANDARD LVCMOS33 } [get_ports { o_led_g[3] }]; #IO_L24P_T3_35 Sch=led3_g
set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { o_led_b[3] }]; #IO_L23N_T3_35 Sch=led3_r


##Misc. ChipKit signals
set_property -dict { PACKAGE_PIN C2    IOSTANDARD LVCMOS33 } [get_ports { i_reset }]; #IO_L16P_T2_35 Sch=ck_rst

##Switches
set_property -dict { PACKAGE_PIN A8    IOSTANDARD LVCMOS33 } [get_ports { i_enable[0] }]; #IO_L12N_T1_MRCC_16 Sch=sw[0]
set_property -dict { PACKAGE_PIN C11   IOSTANDARD LVCMOS33 } [get_ports { i_enable[1] }]; #IO_L13P_T2_MRCC_16 Sch=sw[1]
set_property -dict { PACKAGE_PIN C10   IOSTANDARD LVCMOS33 } [get_ports { i_enable[2] }]; #IO_L13N_T2_MRCC_16 Sch=sw[2]
set_property -dict { PACKAGE_PIN A10   IOSTANDARD LVCMOS33 } [get_ports { i_enable[3] }]; #IO_L14P_T2_SRCC_16 Sch=sw[3]


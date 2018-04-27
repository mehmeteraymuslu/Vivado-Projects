create_project -in_memory -part xc7z020clg484-1
read_vhdl part1.vhd
synth_design -top part1 -part xc7z020clg484-1

opt_design

set_property PACKAGE_PIN T22 [get_ports {LEDG[0]}]
set_property PACKAGE_PIN T21 [get_ports {LEDG[1]}]
set_property PACKAGE_PIN U22 [get_ports {LEDG[2]}]
set_property PACKAGE_PIN U21 [get_ports {LEDG[3]}]
set_property PACKAGE_PIN V22 [get_ports {LEDG[4]}]
set_property PACKAGE_PIN W22 [get_ports {LEDG[5]}]
set_property PACKAGE_PIN U19 [get_ports {LEDG[6]}]
set_property PACKAGE_PIN U14 [get_ports {LEDG[7]}]

set_property IOSTANDARD "LVCMOS33" [get_ports {LEDG[*]}]

set_property PACKAGE_PIN F22 [get_ports {SW[0]}]
set_property PACKAGE_PIN G22 [get_ports {SW[1]}]
set_property PACKAGE_PIN H22 [get_ports {SW[2]}]
set_property PACKAGE_PIN F21 [get_ports {SW[3]}]
set_property PACKAGE_PIN H19 [get_ports {SW[4]}]
set_property PACKAGE_PIN H18 [get_ports {SW[5]}]
set_property PACKAGE_PIN H17 [get_ports {SW[6]}]
set_property PACKAGE_PIN M15 [get_ports {SW[7]}]
set_property IOSTANDARD "LVCMOS18" [get_ports {SW[*]}]

place_design
phys_opt_design
route_design

set_property BITSTREAM.STARTUP.STARTUPCLK JtagClk [current_design]
set_property BITSTREAM.CONFIG.DCIUPDATEMODE Quiet [current_design]
write_bitstream -verbose -mask_file -force part1.bit

exit
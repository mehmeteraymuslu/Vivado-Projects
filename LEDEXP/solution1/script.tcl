############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project LEDEXP
add_files LED/LED.srcs/sources_1/new/LEDBlink.vhd
open_solution "solution1"
set_part {xc7z020clg484-1} -tool vivado
create_clock -period 10 -name default
#source "./LEDEXP/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog

-makelib xcelium_lib/xil_defaultlib -sv \
  "D:/install_location/vivado18_3/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/install_location/vivado18_3/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_2 \
  "../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../four_way_out.srcs/sources_1/ip/ROM_320x16_S_I/sim/ROM_320x16_S_I.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib


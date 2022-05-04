-makelib ies_lib/xil_defaultlib -sv \
  "D:/install_location/vivado18_3/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/install_location/vivado18_3/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xbip_utils_v3_0_9 \
  "../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/axi_utils_v2_0_5 \
  "../../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/fir_compiler_v7_2_11 \
  "../../../ipstatic/hdl/fir_compiler_v7_2_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../four_way_out.srcs/sources_1/ip/Conv_Si_Hi/sim/Conv_Si_Hi.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib


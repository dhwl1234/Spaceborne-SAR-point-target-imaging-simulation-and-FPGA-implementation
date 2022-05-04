set_property SRC_FILE_INFO {cfile:C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out_chipscope/Plus_Compress_Wave_Out.srcs/constrs_1/new/plus_compress_constrains.xdc rfile:../Plus_Compress_Wave_Out.srcs/constrs_1/new/plus_compress_constrains.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:94 export:INPUT save:INPUT read:READ} [current_design]
create_debug_core u_ila_0 ila
set_property src_info {type:XDC file:1 line:95 export:INPUT save:INPUT read:READ} [current_design]
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:96 export:INPUT save:INPUT read:READ} [current_design]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:97 export:INPUT save:INPUT read:READ} [current_design]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:98 export:INPUT save:INPUT read:READ} [current_design]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:99 export:INPUT save:INPUT read:READ} [current_design]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:100 export:INPUT save:INPUT read:READ} [current_design]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:101 export:INPUT save:INPUT read:READ} [current_design]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:102 export:INPUT save:INPUT read:READ} [current_design]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:103 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
set_property src_info {type:XDC file:1 line:104 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/clk [get_nets [list sys_clk_IBUF_BUFG]]
set_property src_info {type:XDC file:1 line:105 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property src_info {type:XDC file:1 line:106 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 16 [get_debug_ports u_ila_0/probe0]
set_property src_info {type:XDC file:1 line:107 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe0 [get_nets [list {rom_fir_connect_inst/ROM_Control_inst/SI[0]} {rom_fir_connect_inst/ROM_Control_inst/SI[1]} {rom_fir_connect_inst/ROM_Control_inst/SI[2]} {rom_fir_connect_inst/ROM_Control_inst/SI[3]} {rom_fir_connect_inst/ROM_Control_inst/SI[4]} {rom_fir_connect_inst/ROM_Control_inst/SI[5]} {rom_fir_connect_inst/ROM_Control_inst/SI[6]} {rom_fir_connect_inst/ROM_Control_inst/SI[7]} {rom_fir_connect_inst/ROM_Control_inst/SI[8]} {rom_fir_connect_inst/ROM_Control_inst/SI[9]} {rom_fir_connect_inst/ROM_Control_inst/SI[10]} {rom_fir_connect_inst/ROM_Control_inst/SI[11]} {rom_fir_connect_inst/ROM_Control_inst/SI[12]} {rom_fir_connect_inst/ROM_Control_inst/SI[13]} {rom_fir_connect_inst/ROM_Control_inst/SI[14]} {rom_fir_connect_inst/ROM_Control_inst/SI[15]}]]
set_property src_info {type:XDC file:1 line:108 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:109 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property src_info {type:XDC file:1 line:110 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 16 [get_debug_ports u_ila_0/probe1]
set_property src_info {type:XDC file:1 line:111 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe1 [get_nets [list {rom_fir_connect_inst/ROM_Control_inst/SQ[0]} {rom_fir_connect_inst/ROM_Control_inst/SQ[1]} {rom_fir_connect_inst/ROM_Control_inst/SQ[2]} {rom_fir_connect_inst/ROM_Control_inst/SQ[3]} {rom_fir_connect_inst/ROM_Control_inst/SQ[4]} {rom_fir_connect_inst/ROM_Control_inst/SQ[5]} {rom_fir_connect_inst/ROM_Control_inst/SQ[6]} {rom_fir_connect_inst/ROM_Control_inst/SQ[7]} {rom_fir_connect_inst/ROM_Control_inst/SQ[8]} {rom_fir_connect_inst/ROM_Control_inst/SQ[9]} {rom_fir_connect_inst/ROM_Control_inst/SQ[10]} {rom_fir_connect_inst/ROM_Control_inst/SQ[11]} {rom_fir_connect_inst/ROM_Control_inst/SQ[12]} {rom_fir_connect_inst/ROM_Control_inst/SQ[13]} {rom_fir_connect_inst/ROM_Control_inst/SQ[14]} {rom_fir_connect_inst/ROM_Control_inst/SQ[15]}]]
set_property src_info {type:XDC file:1 line:112 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:113 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property src_info {type:XDC file:1 line:114 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 40 [get_debug_ports u_ila_0/probe2]
set_property src_info {type:XDC file:1 line:115 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe2 [get_nets [list {compress_result_OBUF[0]} {compress_result_OBUF[1]} {compress_result_OBUF[2]} {compress_result_OBUF[3]} {compress_result_OBUF[4]} {compress_result_OBUF[5]} {compress_result_OBUF[6]} {compress_result_OBUF[7]} {compress_result_OBUF[8]} {compress_result_OBUF[9]} {compress_result_OBUF[10]} {compress_result_OBUF[11]} {compress_result_OBUF[12]} {compress_result_OBUF[13]} {compress_result_OBUF[14]} {compress_result_OBUF[15]} {compress_result_OBUF[16]} {compress_result_OBUF[17]} {compress_result_OBUF[18]} {compress_result_OBUF[19]} {compress_result_OBUF[20]} {compress_result_OBUF[21]} {compress_result_OBUF[22]} {compress_result_OBUF[23]} {compress_result_OBUF[24]} {compress_result_OBUF[25]} {compress_result_OBUF[26]} {compress_result_OBUF[27]} {compress_result_OBUF[28]} {compress_result_OBUF[29]} {compress_result_OBUF[30]} {compress_result_OBUF[31]} {compress_result_OBUF[32]} {compress_result_OBUF[33]} {compress_result_OBUF[34]} {compress_result_OBUF[35]} {compress_result_OBUF[36]} {compress_result_OBUF[37]} {compress_result_OBUF[38]} {compress_result_OBUF[39]}]]
set_property src_info {type:XDC file:1 line:116 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:117 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property src_info {type:XDC file:1 line:118 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 40 [get_debug_ports u_ila_0/probe3]
set_property src_info {type:XDC file:1 line:119 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe3 [get_nets [list {m_axis_data_tdata_sihi[0]} {m_axis_data_tdata_sihi[1]} {m_axis_data_tdata_sihi[2]} {m_axis_data_tdata_sihi[3]} {m_axis_data_tdata_sihi[4]} {m_axis_data_tdata_sihi[5]} {m_axis_data_tdata_sihi[6]} {m_axis_data_tdata_sihi[7]} {m_axis_data_tdata_sihi[8]} {m_axis_data_tdata_sihi[9]} {m_axis_data_tdata_sihi[10]} {m_axis_data_tdata_sihi[11]} {m_axis_data_tdata_sihi[12]} {m_axis_data_tdata_sihi[13]} {m_axis_data_tdata_sihi[14]} {m_axis_data_tdata_sihi[15]} {m_axis_data_tdata_sihi[16]} {m_axis_data_tdata_sihi[17]} {m_axis_data_tdata_sihi[18]} {m_axis_data_tdata_sihi[19]} {m_axis_data_tdata_sihi[20]} {m_axis_data_tdata_sihi[21]} {m_axis_data_tdata_sihi[22]} {m_axis_data_tdata_sihi[23]} {m_axis_data_tdata_sihi[24]} {m_axis_data_tdata_sihi[25]} {m_axis_data_tdata_sihi[26]} {m_axis_data_tdata_sihi[27]} {m_axis_data_tdata_sihi[28]} {m_axis_data_tdata_sihi[29]} {m_axis_data_tdata_sihi[30]} {m_axis_data_tdata_sihi[31]} {m_axis_data_tdata_sihi[32]} {m_axis_data_tdata_sihi[33]} {m_axis_data_tdata_sihi[34]} {m_axis_data_tdata_sihi[35]} {m_axis_data_tdata_sihi[36]} {m_axis_data_tdata_sihi[37]} {m_axis_data_tdata_sihi[38]} {m_axis_data_tdata_sihi[39]}]]
set_property src_info {type:XDC file:1 line:120 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:121 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property src_info {type:XDC file:1 line:122 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 40 [get_debug_ports u_ila_0/probe4]
set_property src_info {type:XDC file:1 line:123 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe4 [get_nets [list {m_axis_data_tdata_sihq[0]} {m_axis_data_tdata_sihq[1]} {m_axis_data_tdata_sihq[2]} {m_axis_data_tdata_sihq[3]} {m_axis_data_tdata_sihq[4]} {m_axis_data_tdata_sihq[5]} {m_axis_data_tdata_sihq[6]} {m_axis_data_tdata_sihq[7]} {m_axis_data_tdata_sihq[8]} {m_axis_data_tdata_sihq[9]} {m_axis_data_tdata_sihq[10]} {m_axis_data_tdata_sihq[11]} {m_axis_data_tdata_sihq[12]} {m_axis_data_tdata_sihq[13]} {m_axis_data_tdata_sihq[14]} {m_axis_data_tdata_sihq[15]} {m_axis_data_tdata_sihq[16]} {m_axis_data_tdata_sihq[17]} {m_axis_data_tdata_sihq[18]} {m_axis_data_tdata_sihq[19]} {m_axis_data_tdata_sihq[20]} {m_axis_data_tdata_sihq[21]} {m_axis_data_tdata_sihq[22]} {m_axis_data_tdata_sihq[23]} {m_axis_data_tdata_sihq[24]} {m_axis_data_tdata_sihq[25]} {m_axis_data_tdata_sihq[26]} {m_axis_data_tdata_sihq[27]} {m_axis_data_tdata_sihq[28]} {m_axis_data_tdata_sihq[29]} {m_axis_data_tdata_sihq[30]} {m_axis_data_tdata_sihq[31]} {m_axis_data_tdata_sihq[32]} {m_axis_data_tdata_sihq[33]} {m_axis_data_tdata_sihq[34]} {m_axis_data_tdata_sihq[35]} {m_axis_data_tdata_sihq[36]} {m_axis_data_tdata_sihq[37]} {m_axis_data_tdata_sihq[38]} {m_axis_data_tdata_sihq[39]}]]
set_property src_info {type:XDC file:1 line:124 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:125 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property src_info {type:XDC file:1 line:126 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 40 [get_debug_ports u_ila_0/probe5]
set_property src_info {type:XDC file:1 line:127 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe5 [get_nets [list {m_axis_data_tdata_sqhi[0]} {m_axis_data_tdata_sqhi[1]} {m_axis_data_tdata_sqhi[2]} {m_axis_data_tdata_sqhi[3]} {m_axis_data_tdata_sqhi[4]} {m_axis_data_tdata_sqhi[5]} {m_axis_data_tdata_sqhi[6]} {m_axis_data_tdata_sqhi[7]} {m_axis_data_tdata_sqhi[8]} {m_axis_data_tdata_sqhi[9]} {m_axis_data_tdata_sqhi[10]} {m_axis_data_tdata_sqhi[11]} {m_axis_data_tdata_sqhi[12]} {m_axis_data_tdata_sqhi[13]} {m_axis_data_tdata_sqhi[14]} {m_axis_data_tdata_sqhi[15]} {m_axis_data_tdata_sqhi[16]} {m_axis_data_tdata_sqhi[17]} {m_axis_data_tdata_sqhi[18]} {m_axis_data_tdata_sqhi[19]} {m_axis_data_tdata_sqhi[20]} {m_axis_data_tdata_sqhi[21]} {m_axis_data_tdata_sqhi[22]} {m_axis_data_tdata_sqhi[23]} {m_axis_data_tdata_sqhi[24]} {m_axis_data_tdata_sqhi[25]} {m_axis_data_tdata_sqhi[26]} {m_axis_data_tdata_sqhi[27]} {m_axis_data_tdata_sqhi[28]} {m_axis_data_tdata_sqhi[29]} {m_axis_data_tdata_sqhi[30]} {m_axis_data_tdata_sqhi[31]} {m_axis_data_tdata_sqhi[32]} {m_axis_data_tdata_sqhi[33]} {m_axis_data_tdata_sqhi[34]} {m_axis_data_tdata_sqhi[35]} {m_axis_data_tdata_sqhi[36]} {m_axis_data_tdata_sqhi[37]} {m_axis_data_tdata_sqhi[38]} {m_axis_data_tdata_sqhi[39]}]]
set_property src_info {type:XDC file:1 line:128 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:129 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property src_info {type:XDC file:1 line:130 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 40 [get_debug_ports u_ila_0/probe6]
set_property src_info {type:XDC file:1 line:131 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe6 [get_nets [list {m_axis_data_tdata_sqhq[0]} {m_axis_data_tdata_sqhq[1]} {m_axis_data_tdata_sqhq[2]} {m_axis_data_tdata_sqhq[3]} {m_axis_data_tdata_sqhq[4]} {m_axis_data_tdata_sqhq[5]} {m_axis_data_tdata_sqhq[6]} {m_axis_data_tdata_sqhq[7]} {m_axis_data_tdata_sqhq[8]} {m_axis_data_tdata_sqhq[9]} {m_axis_data_tdata_sqhq[10]} {m_axis_data_tdata_sqhq[11]} {m_axis_data_tdata_sqhq[12]} {m_axis_data_tdata_sqhq[13]} {m_axis_data_tdata_sqhq[14]} {m_axis_data_tdata_sqhq[15]} {m_axis_data_tdata_sqhq[16]} {m_axis_data_tdata_sqhq[17]} {m_axis_data_tdata_sqhq[18]} {m_axis_data_tdata_sqhq[19]} {m_axis_data_tdata_sqhq[20]} {m_axis_data_tdata_sqhq[21]} {m_axis_data_tdata_sqhq[22]} {m_axis_data_tdata_sqhq[23]} {m_axis_data_tdata_sqhq[24]} {m_axis_data_tdata_sqhq[25]} {m_axis_data_tdata_sqhq[26]} {m_axis_data_tdata_sqhq[27]} {m_axis_data_tdata_sqhq[28]} {m_axis_data_tdata_sqhq[29]} {m_axis_data_tdata_sqhq[30]} {m_axis_data_tdata_sqhq[31]} {m_axis_data_tdata_sqhq[32]} {m_axis_data_tdata_sqhq[33]} {m_axis_data_tdata_sqhq[34]} {m_axis_data_tdata_sqhq[35]} {m_axis_data_tdata_sqhq[36]} {m_axis_data_tdata_sqhq[37]} {m_axis_data_tdata_sqhq[38]} {m_axis_data_tdata_sqhq[39]}]]
set_property src_info {type:XDC file:1 line:132 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:133 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property src_info {type:XDC file:1 line:134 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 40 [get_debug_ports u_ila_0/probe7]
set_property src_info {type:XDC file:1 line:135 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe7 [get_nets [list {result_compress_i[0]} {result_compress_i[1]} {result_compress_i[2]} {result_compress_i[3]} {result_compress_i[4]} {result_compress_i[5]} {result_compress_i[6]} {result_compress_i[7]} {result_compress_i[8]} {result_compress_i[9]} {result_compress_i[10]} {result_compress_i[11]} {result_compress_i[12]} {result_compress_i[13]} {result_compress_i[14]} {result_compress_i[15]} {result_compress_i[16]} {result_compress_i[17]} {result_compress_i[18]} {result_compress_i[19]} {result_compress_i[20]} {result_compress_i[21]} {result_compress_i[22]} {result_compress_i[23]} {result_compress_i[24]} {result_compress_i[25]} {result_compress_i[26]} {result_compress_i[27]} {result_compress_i[28]} {result_compress_i[29]} {result_compress_i[30]} {result_compress_i[31]} {result_compress_i[32]} {result_compress_i[33]} {result_compress_i[34]} {result_compress_i[35]} {result_compress_i[36]} {result_compress_i[37]} {result_compress_i[38]} {result_compress_i[39]}]]
set_property src_info {type:XDC file:1 line:136 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:137 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property src_info {type:XDC file:1 line:138 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 40 [get_debug_ports u_ila_0/probe8]
set_property src_info {type:XDC file:1 line:139 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe8 [get_nets [list {result_compress_q[0]} {result_compress_q[1]} {result_compress_q[2]} {result_compress_q[3]} {result_compress_q[4]} {result_compress_q[5]} {result_compress_q[6]} {result_compress_q[7]} {result_compress_q[8]} {result_compress_q[9]} {result_compress_q[10]} {result_compress_q[11]} {result_compress_q[12]} {result_compress_q[13]} {result_compress_q[14]} {result_compress_q[15]} {result_compress_q[16]} {result_compress_q[17]} {result_compress_q[18]} {result_compress_q[19]} {result_compress_q[20]} {result_compress_q[21]} {result_compress_q[22]} {result_compress_q[23]} {result_compress_q[24]} {result_compress_q[25]} {result_compress_q[26]} {result_compress_q[27]} {result_compress_q[28]} {result_compress_q[29]} {result_compress_q[30]} {result_compress_q[31]} {result_compress_q[32]} {result_compress_q[33]} {result_compress_q[34]} {result_compress_q[35]} {result_compress_q[36]} {result_compress_q[37]} {result_compress_q[38]} {result_compress_q[39]}]]
set_property src_info {type:XDC file:1 line:140 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:141 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property src_info {type:XDC file:1 line:142 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
set_property src_info {type:XDC file:1 line:143 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe9 [get_nets [list sys_clk_IBUF_BUFG]]
set_property src_info {type:XDC file:1 line:144 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:145 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property src_info {type:XDC file:1 line:146 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
set_property src_info {type:XDC file:1 line:147 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe10 [get_nets [list sys_rst_n_IBUF]]
set_property src_info {type:XDC file:1 line:148 export:INPUT save:INPUT read:READ} [current_design]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:1 line:149 export:INPUT save:INPUT read:READ} [current_design]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:1 line:150 export:INPUT save:INPUT read:READ} [current_design]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:1 line:151 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port dbg_hub/clk [get_nets sys_clk_IBUF_BUFG]

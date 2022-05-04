# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param general.maxThreads 32
set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7k325tfbg676-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.cache/wt [current_project]
set_property parent.project_path C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.xpr [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files C:/Users/WYHAIRCAS/Desktop/plus_compress/Origion_Wave_IQ/si.coe
add_files C:/Users/WYHAIRCAS/Desktop/plus_compress/Origion_Wave_IQ/sq.coe
add_files C:/Users/WYHAIRCAS/Desktop/plus_compress/Origion_Wave_IQ/hi.coe
add_files C:/Users/WYHAIRCAS/Desktop/plus_compress/Origion_Wave_IQ/hq.coe
read_verilog -library xil_defaultlib {
  C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/imports/new/ROM_Control.v
  C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/imports/new/four_way_out.v
  C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/new/result_out_abs.v
  C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/imports/new/rom_fir_connect.v
  C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/new/compress_result_top.v
}
read_ip -quiet C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/Conv_Sq_Hq/Conv_Sq_Hq.xci
set_property used_in_implementation false [get_files -all c:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/Conv_Sq_Hq/constraints/fir_compiler_v7_2.xdc]
set_property used_in_implementation false [get_files -all c:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/Conv_Sq_Hq/Conv_Sq_Hq_ooc.xdc]

read_ip -quiet C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/Conv_Sq_Hi/Conv_Sq_Hi.xci
set_property used_in_implementation false [get_files -all c:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/Conv_Sq_Hi/constraints/fir_compiler_v7_2.xdc]
set_property used_in_implementation false [get_files -all c:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/Conv_Sq_Hi/Conv_Sq_Hi_ooc.xdc]

read_ip -quiet C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/ROM_320x16_S_I/ROM_320x16_S_I.xci
set_property used_in_implementation false [get_files -all c:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/ROM_320x16_S_I/ROM_320x16_S_I_ooc.xdc]

read_ip -quiet C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/ROM_320x16_S_Q/ROM_320x16_S_Q.xci
set_property used_in_implementation false [get_files -all c:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/ROM_320x16_S_Q/ROM_320x16_S_Q_ooc.xdc]

read_ip -quiet C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/Conv_Si_Hi/Conv_Si_Hi.xci
set_property used_in_implementation false [get_files -all c:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/Conv_Si_Hi/constraints/fir_compiler_v7_2.xdc]
set_property used_in_implementation false [get_files -all c:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/Conv_Si_Hi/Conv_Si_Hi_ooc.xdc]

read_ip -quiet C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/Conv_Si_Hq/Conv_Si_Hq.xci
set_property used_in_implementation false [get_files -all c:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/Conv_Si_Hq/constraints/fir_compiler_v7_2.xdc]
set_property used_in_implementation false [get_files -all c:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/Conv_Si_Hq/Conv_Si_Hq_ooc.xdc]

read_ip -quiet C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/cordic_0/cordic_0.xci
set_property used_in_implementation false [get_files -all c:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/cordic_0/cordic_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/constrs_1/new/plus_compress_constrains.xdc
set_property used_in_implementation false [get_files C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/constrs_1/new/plus_compress_constrains.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top compress_result_top -part xc7k325tfbg676-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef compress_result_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file compress_result_top_utilization_synth.rpt -pb compress_result_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
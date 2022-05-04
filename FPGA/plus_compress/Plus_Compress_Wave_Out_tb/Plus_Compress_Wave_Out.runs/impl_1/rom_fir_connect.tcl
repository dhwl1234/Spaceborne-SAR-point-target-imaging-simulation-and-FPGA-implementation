# 
# Report generation script generated by Vivado
# 

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
proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}


start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param general.maxThreads 32
  create_project -in_memory -part xc7k325tfbg676-2
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out_tb/Plus_Compress_Wave_Out.cache/wt [current_project]
  set_property parent.project_path C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out_tb/Plus_Compress_Wave_Out.xpr [current_project]
  set_property ip_output_repo C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out_tb/Plus_Compress_Wave_Out.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES XPM_MEMORY [current_project]
  add_files -quiet C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out_tb/Plus_Compress_Wave_Out.runs/synth_1/rom_fir_connect.dcp
  read_ip -quiet C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out_tb/Plus_Compress_Wave_Out.srcs/sources_1/ip/Conv_Sq_Hq/Conv_Sq_Hq.xci
  read_ip -quiet C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out_tb/Plus_Compress_Wave_Out.srcs/sources_1/ip/Conv_Sq_Hi/Conv_Sq_Hi.xci
  read_ip -quiet C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out_tb/Plus_Compress_Wave_Out.srcs/sources_1/ip/ROM_320x16_S_I/ROM_320x16_S_I.xci
  read_ip -quiet C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out_tb/Plus_Compress_Wave_Out.srcs/sources_1/ip/ROM_320x16_S_Q/ROM_320x16_S_Q.xci
  read_ip -quiet C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out_tb/Plus_Compress_Wave_Out.srcs/sources_1/ip/Conv_Si_Hi/Conv_Si_Hi.xci
  read_ip -quiet C:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out_tb/Plus_Compress_Wave_Out.srcs/sources_1/ip/Conv_Si_Hq/Conv_Si_Hq.xci
  link_design -top rom_fir_connect -part xc7k325tfbg676-2
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force rom_fir_connect_opt.dcp
  create_report "impl_1_opt_report_drc_0" "report_drc -file rom_fir_connect_drc_opted.rpt -pb rom_fir_connect_drc_opted.pb -rpx rom_fir_connect_drc_opted.rpx"
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  if { [llength [get_debug_cores -quiet] ] > 0 }  { 
    implement_debug_core 
  } 
  place_design 
  write_checkpoint -force rom_fir_connect_placed.dcp
  create_report "impl_1_place_report_io_0" "report_io -file rom_fir_connect_io_placed.rpt"
  create_report "impl_1_place_report_utilization_0" "report_utilization -file rom_fir_connect_utilization_placed.rpt -pb rom_fir_connect_utilization_placed.pb"
  create_report "impl_1_place_report_control_sets_0" "report_control_sets -verbose -file rom_fir_connect_control_sets_placed.rpt"
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force rom_fir_connect_routed.dcp
  create_report "impl_1_route_report_drc_0" "report_drc -file rom_fir_connect_drc_routed.rpt -pb rom_fir_connect_drc_routed.pb -rpx rom_fir_connect_drc_routed.rpx"
  create_report "impl_1_route_report_methodology_0" "report_methodology -file rom_fir_connect_methodology_drc_routed.rpt -pb rom_fir_connect_methodology_drc_routed.pb -rpx rom_fir_connect_methodology_drc_routed.rpx"
  create_report "impl_1_route_report_power_0" "report_power -file rom_fir_connect_power_routed.rpt -pb rom_fir_connect_power_summary_routed.pb -rpx rom_fir_connect_power_routed.rpx"
  create_report "impl_1_route_report_route_status_0" "report_route_status -file rom_fir_connect_route_status.rpt -pb rom_fir_connect_route_status.pb"
  create_report "impl_1_route_report_timing_summary_0" "report_timing_summary -max_paths 10 -file rom_fir_connect_timing_summary_routed.rpt -pb rom_fir_connect_timing_summary_routed.pb -rpx rom_fir_connect_timing_summary_routed.rpx -warn_on_violation "
  create_report "impl_1_route_report_incremental_reuse_0" "report_incremental_reuse -file rom_fir_connect_incremental_reuse_routed.rpt"
  create_report "impl_1_route_report_clock_utilization_0" "report_clock_utilization -file rom_fir_connect_clock_utilization_routed.rpt"
  create_report "impl_1_route_report_bus_skew_0" "report_bus_skew -warn_on_violation -file rom_fir_connect_bus_skew_routed.rpt -pb rom_fir_connect_bus_skew_routed.pb -rpx rom_fir_connect_bus_skew_routed.rpx"
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force rom_fir_connect_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_property XPM_LIBRARIES XPM_MEMORY [current_project]
  catch { write_mem_info -force rom_fir_connect.mmi }
  write_bitstream -force rom_fir_connect.bit 
  catch {write_debug_probes -quiet -force rom_fir_connect}
  catch {file copy -force rom_fir_connect.ltx debug_nets.ltx}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}


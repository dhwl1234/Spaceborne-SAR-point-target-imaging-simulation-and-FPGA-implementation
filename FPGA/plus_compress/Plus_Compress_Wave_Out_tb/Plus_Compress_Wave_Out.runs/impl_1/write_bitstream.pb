
o
Command: %s
53*	vivadotcl2>
*write_bitstream -force rom_fir_connect.bit2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7k325t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7k325t2default:defaultZ17-349h px? 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px? 
>
IP Catalog is up to date.1232*coregenZ19-1839h px? 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px? 
?
?Unspecified I/O Standard: 182 out of 182 logical ports use I/O standard (IOSTANDARD) value 'DEFAULT', instead of a user assigned specific value. This may cause I/O contention or incompatibility with the board power or connectivity affecting performance, signal integrity or in extreme cases cause damage to the device or the components to which it is connected. To correct this violation, specify all I/O standards. This design will fail to generate a bitstream unless all logical ports have a user specified I/O standard value defined. To allow bitstream creation with unspecified I/O standard values (not recommended), use this command: set_property SEVERITY {Warning} [get_drc_checks NSTD-1].  NOTE: When using the Vivado Runs infrastructure (e.g. launch_runs Tcl command), add this command to a .tcl file and add that file as a pre-hook for write_bitstream step for the implementation run. Problem ports: %s.%s*DRC2?	
 "&
sys_clksys_clk2default:default"H
s_axis_data_tready_sq_hqs_axis_data_tready_sq_hq2default:default"H
s_axis_data_tvalid_sq_hqs_axis_data_tvalid_sq_hq2default:default"H
s_axis_data_tready_si_hqs_axis_data_tready_si_hq2default:default"H
s_axis_data_tvalid_si_hqs_axis_data_tvalid_si_hq2default:default"H
s_axis_data_tready_sq_his_axis_data_tready_sq_hi2default:default"H
s_axis_data_tvalid_sq_his_axis_data_tvalid_sq_hi2default:default"H
s_axis_data_tready_si_his_axis_data_tready_si_hi2default:default"H
s_axis_data_tvalid_si_his_axis_data_tvalid_si_hi2default:default"L
m_axis_data_tdata_sq_hi[39:0]m_axis_data_tdata_sq_hi2default:default"H
m_axis_data_tvalid_sq_him_axis_data_tvalid_sq_hi2default:default"L
m_axis_data_tdata_si_hq[39:0]m_axis_data_tdata_si_hq2default:default"H
m_axis_data_tvalid_si_hqm_axis_data_tvalid_si_hq2default:default"L
m_axis_data_tdata_si_hi[39:0]m_axis_data_tdata_si_hi2default:default"D
m_axis_data_tvalid_si_him_axis_data_tvalid_si_hi2default:..."/
(the first 15 of 18 listed)2default:default2default:default2(
 DRC|Pin Planning2default:default8ZNSTD-1h px? 
?
?Unconstrained Logical Port: 182 out of 182 logical ports have no user assigned specific location constraint (LOC). This may cause I/O contention or incompatibility with the board power or connectivity affecting performance, signal integrity or in extreme cases cause damage to the device or the components to which it is connected. To correct this violation, specify all pin locations. This design will fail to generate a bitstream unless all logical ports have a user specified site LOC constraint defined.  To allow bitstream creation with unspecified pin locations (not recommended), use this command: set_property SEVERITY {Warning} [get_drc_checks UCIO-1].  NOTE: When using the Vivado Runs infrastructure (e.g. launch_runs Tcl command), add this command to a .tcl file and add that file as a pre-hook for write_bitstream step for the implementation run.  Problem ports: %s.%s*DRC2?	
 "&
sys_clksys_clk2default:default"H
s_axis_data_tready_sq_hqs_axis_data_tready_sq_hq2default:default"H
s_axis_data_tvalid_sq_hqs_axis_data_tvalid_sq_hq2default:default"H
s_axis_data_tready_si_hqs_axis_data_tready_si_hq2default:default"H
s_axis_data_tvalid_si_hqs_axis_data_tvalid_si_hq2default:default"H
s_axis_data_tready_sq_his_axis_data_tready_sq_hi2default:default"H
s_axis_data_tvalid_sq_his_axis_data_tvalid_sq_hi2default:default"H
s_axis_data_tready_si_his_axis_data_tready_si_hi2default:default"H
s_axis_data_tvalid_si_his_axis_data_tvalid_si_hi2default:default"L
m_axis_data_tdata_sq_hi[39:0]m_axis_data_tdata_sq_hi2default:default"H
m_axis_data_tvalid_sq_him_axis_data_tvalid_sq_hi2default:default"L
m_axis_data_tdata_si_hq[39:0]m_axis_data_tdata_si_hq2default:default"H
m_axis_data_tvalid_si_hqm_axis_data_tvalid_si_hq2default:default"L
m_axis_data_tdata_si_hi[39:0]m_axis_data_tdata_si_hi2default:default"D
m_axis_data_tvalid_si_him_axis_data_tvalid_si_hi2default:..."/
(the first 15 of 18 listed)2default:default2default:default2(
 DRC|Pin Planning2default:default8ZUCIO-1h px? 
?
?Missing CFGBVS and CONFIG_VOLTAGE Design Properties: Neither the CFGBVS nor CONFIG_VOLTAGE voltage property is set in the current_design.  Configuration bank voltage select (CFGBVS) must be set to VCCO or GND, and CONFIG_VOLTAGE must be set to the correct configuration voltage, in order to determine the I/O voltage support for the pins in bank 0.  It is suggested to specify these either using the 'Edit Device Properties' function in the GUI or directly in the XDC file using the following syntax:

 set_property CFGBVS value1 [current_design]
 #where value1 is either VCCO or GND

 set_property CONFIG_VOLTAGE value2 [current_design]
 #where value2 is the voltage provided to configuration bank 0

Refer to the device configuration user guide for more information.%s*DRC2(
 DRC|Pin Planning2default:default8ZCFGBVS-1h px? 
?
?enum_USE_MULT_NONE_connects_CEM_GND: %s: When the DSP48E1 USE_MULT attribute is set to NONE, the CEM input pin should be tied to GND to save power.%s*DRC2?
 "?
?four_way_out_inst/Conv_Si_Hi_inst/U0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e1	?four_way_out_inst/Conv_Si_Hi_inst/U0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e12default:default2default:default2A
 )DRC|Netlist|Instance|Required Pin|DSP48E12default:default8ZREQP-28h px? 
?
?enum_USE_MULT_NONE_connects_CEM_GND: %s: When the DSP48E1 USE_MULT attribute is set to NONE, the CEM input pin should be tied to GND to save power.%s*DRC2?
 "?
?four_way_out_inst/Conv_Si_Hq_inst/U0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e1	?four_way_out_inst/Conv_Si_Hq_inst/U0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e12default:default2default:default2A
 )DRC|Netlist|Instance|Required Pin|DSP48E12default:default8ZREQP-28h px? 
?
?enum_USE_MULT_NONE_connects_CEM_GND: %s: When the DSP48E1 USE_MULT attribute is set to NONE, the CEM input pin should be tied to GND to save power.%s*DRC2?
 "?
?four_way_out_inst/Conv_Sq_Hi_inst/U0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e1	?four_way_out_inst/Conv_Sq_Hi_inst/U0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e12default:default2default:default2A
 )DRC|Netlist|Instance|Required Pin|DSP48E12default:default8ZREQP-28h px? 
?
?enum_USE_MULT_NONE_connects_CEM_GND: %s: When the DSP48E1 USE_MULT attribute is set to NONE, the CEM input pin should be tied to GND to save power.%s*DRC2?
 "?
?four_way_out_inst/Conv_Sq_Hq_inst/U0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e1	?four_way_out_inst/Conv_Sq_Hq_inst/U0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e12default:default2default:default2A
 )DRC|Netlist|Instance|Required Pin|DSP48E12default:default8ZREQP-28h px? 
?
?enum_MREG_0_connects_CEM_GND: %s: When the DSP48E1 MREG attribute is set to 0, the CEM input pin should be tied to GND to save power.%s*DRC2?
 "?
?four_way_out_inst/Conv_Si_Hi_inst/U0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e1	?four_way_out_inst/Conv_Si_Hi_inst/U0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e12default:default2default:default2A
 )DRC|Netlist|Instance|Required Pin|DSP48E12default:default8ZREQP-30h px? 
?
?enum_MREG_0_connects_CEM_GND: %s: When the DSP48E1 MREG attribute is set to 0, the CEM input pin should be tied to GND to save power.%s*DRC2?
 "?
?four_way_out_inst/Conv_Si_Hq_inst/U0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e1	?four_way_out_inst/Conv_Si_Hq_inst/U0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e12default:default2default:default2A
 )DRC|Netlist|Instance|Required Pin|DSP48E12default:default8ZREQP-30h px? 
?
?enum_MREG_0_connects_CEM_GND: %s: When the DSP48E1 MREG attribute is set to 0, the CEM input pin should be tied to GND to save power.%s*DRC2?
 "?
?four_way_out_inst/Conv_Sq_Hi_inst/U0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e1	?four_way_out_inst/Conv_Sq_Hi_inst/U0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e12default:default2default:default2A
 )DRC|Netlist|Instance|Required Pin|DSP48E12default:default8ZREQP-30h px? 
?
?enum_MREG_0_connects_CEM_GND: %s: When the DSP48E1 MREG attribute is set to 0, the CEM input pin should be tied to GND to save power.%s*DRC2?
 "?
?four_way_out_inst/Conv_Sq_Hq_inst/U0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e1	?four_way_out_inst/Conv_Sq_Hq_inst/U0/i_synth/g_single_rate.i_single_rate/g_semi_parallel_and_smac.g_paths[0].g_madd_array_and_accum.g_accum.i_accum/i_add_accum/g_dsp48.g_dsp48e1.i_dsp48e12default:default2default:default2A
 )DRC|Netlist|Instance|Required Pin|DSP48E12default:default8ZREQP-30h px? 
t
DRC finished with %s
1905*	planAhead26
"2 Errors, 1 Warnings, 8 Advisories2default:defaultZ12-3199h px? 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px? 
R
+Error(s) found during DRC. Bitgen not run.
1345*	planAheadZ12-1345h px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1062default:default2
52default:default2
02default:default2
32default:defaultZ4-41h px? 
Q

%s failed
30*	vivadotcl2#
write_bitstream2default:defaultZ4-43h px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Thu Apr  7 22:22:52 20222default:defaultZ17-206h px? 


End Record
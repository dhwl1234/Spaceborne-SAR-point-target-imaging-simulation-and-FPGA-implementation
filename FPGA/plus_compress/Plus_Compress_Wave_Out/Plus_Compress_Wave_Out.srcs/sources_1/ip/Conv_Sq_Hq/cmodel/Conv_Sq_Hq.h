
//------------------------------------------------------------------------------
// (c) Copyright 2014 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//------------------------------------------------------------------------------ 
//
// C Model configuration for the "Conv_Sq_Hq" instance.
//
//------------------------------------------------------------------------------
//
// coefficients: 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23170,-31794,30982,-19260,-572,21062,-32364,27165,-6252,-19260,32642,-22762,-5126,29451,-28087,0,28659,-27165,-5126,31794,-18794,-19260,30982,2286,-32364,11207,28659,-19260,-24730,22762,23170,-22762,-24730,19260,28659,-11207,-32364,-2286,30982,19260,-18794,-31794,-5126,27165,28659,0,-28087,-29451,-5126,22762,32642,19260,-6252,-27165,-32364,-21062,-572,19260,30982,31794,23170,9032,-6252,-19260,-28087,-32269,-32364,-29451,-24730,-19260,-13848,-9032,-5126,-2286,-572,0,-572,-2286,-5126,-9032,-13848,-19260,-24730,-29451,-32364,-32269,-28087,-19260,-6252,9032,23170,31794,30982,19260,-572,-21062,-32364,-27165,-6252,19260,32642,22762,-5126,-29451,-28087,0,28659,27165,-5126,-31794,-18794,19260,30982,-2286,-32364,-11207,28659,19260,-24730,-22762,23170,22762,-24730,-19260,28659,11207,-32364,2286,30982,-19260,-18794,31794,-5126,-27165,28659,0,-28087,29451,-5126,-22762,32642,-19260,-6252,27165,-32364,21062,-572,-19260,30982,-31794,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
// chanpats: 173
// name: Conv_Sq_Hq
// filter_type: 0
// rate_change: 0
// interp_rate: 1
// decim_rate: 1
// zero_pack_factor: 1
// coeff_padding: 0
// num_coeffs: 320
// coeff_sets: 1
// reloadable: 0
// is_halfband: 0
// quantization: 0
// coeff_width: 16
// coeff_fract_width: 0
// chan_seq: 0
// num_channels: 1
// num_paths: 1
// data_width: 16
// data_fract_width: 0
// output_rounding_mode: 1
// output_width: 37
// output_fract_width: 0
// config_method: 0

const double Conv_Sq_Hq_coefficients[320] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23170,-31794,30982,-19260,-572,21062,-32364,27165,-6252,-19260,32642,-22762,-5126,29451,-28087,0,28659,-27165,-5126,31794,-18794,-19260,30982,2286,-32364,11207,28659,-19260,-24730,22762,23170,-22762,-24730,19260,28659,-11207,-32364,-2286,30982,19260,-18794,-31794,-5126,27165,28659,0,-28087,-29451,-5126,22762,32642,19260,-6252,-27165,-32364,-21062,-572,19260,30982,31794,23170,9032,-6252,-19260,-28087,-32269,-32364,-29451,-24730,-19260,-13848,-9032,-5126,-2286,-572,0,-572,-2286,-5126,-9032,-13848,-19260,-24730,-29451,-32364,-32269,-28087,-19260,-6252,9032,23170,31794,30982,19260,-572,-21062,-32364,-27165,-6252,19260,32642,22762,-5126,-29451,-28087,0,28659,27165,-5126,-31794,-18794,19260,30982,-2286,-32364,-11207,28659,19260,-24730,-22762,23170,22762,-24730,-19260,28659,11207,-32364,2286,30982,-19260,-18794,31794,-5126,-27165,28659,0,-28087,29451,-5126,-22762,32642,-19260,-6252,27165,-32364,21062,-572,-19260,30982,-31794,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

const xip_fir_v7_2_pattern Conv_Sq_Hq_chanpats[1] = {P_BASIC};

static xip_fir_v7_2_config gen_Conv_Sq_Hq_config() {
  xip_fir_v7_2_config config;
  config.name                = "Conv_Sq_Hq";
  config.filter_type         = 0;
  config.rate_change         = XIP_FIR_INTEGER_RATE;
  config.interp_rate         = 1;
  config.decim_rate          = 1;
  config.zero_pack_factor    = 1;
  config.coeff               = &Conv_Sq_Hq_coefficients[0];
  config.coeff_padding       = 0;
  config.num_coeffs          = 320;
  config.coeff_sets          = 1;
  config.reloadable          = 0;
  config.is_halfband         = 0;
  config.quantization        = XIP_FIR_INTEGER_COEFF;
  config.coeff_width         = 16;
  config.coeff_fract_width   = 0;
  config.chan_seq            = XIP_FIR_BASIC_CHAN_SEQ;
  config.num_channels        = 1;
  config.init_pattern        = Conv_Sq_Hq_chanpats[0];
  config.num_paths           = 1;
  config.data_width          = 16;
  config.data_fract_width    = 0;
  config.output_rounding_mode= XIP_FIR_TRUNCATE_LSBS;
  config.output_width        = 37;
  config.output_fract_width  = 0,
  config.config_method       = XIP_FIR_CONFIG_SINGLE;
  return config;
}

const xip_fir_v7_2_config Conv_Sq_Hq_config = gen_Conv_Sq_Hq_config();


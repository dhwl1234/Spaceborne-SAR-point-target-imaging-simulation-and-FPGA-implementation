
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
// C Model configuration for the "fir_h_i" instance.
//
//------------------------------------------------------------------------------
//
// coefficients: 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-23170,7927,10668,-26509,32762,-25101,5126,18323,-32165,26509,-2856,-23571,32364,-14364,-16876,32767,-15886,-18323,32364,-7927,-26841,26509,10668,-32687,5126,30791,-15886,-26509,21497,23571,-23170,-23571,21497,26509,-15886,-30791,5126,32687,10668,-26509,-26841,7927,32364,18323,-15886,-32767,-16876,14364,32364,23571,-2856,-26509,-32165,-18323,5126,25101,32762,26509,10668,-7927,-23170,-31498,-32165,-26509,-16876,-5690,5126,14364,21497,26509,29697,31498,32364,32687,32762,32767,32762,32687,32364,31498,29697,26509,21497,14364,5126,-5690,-16876,-26509,-32165,-31498,-23170,-7927,10668,26509,32762,25101,5126,-18323,-32165,-26509,-2856,23571,32364,14364,-16876,-32767,-15886,18323,32364,7927,-26841,-26509,10668,32687,5126,-30791,-15886,26509,21497,-23571,-23170,23571,21497,-26509,-15886,30791,5126,-32687,10668,26509,-26841,-7927,32364,-18323,-15886,32767,-16876,-14364,32364,-23571,-2856,26509,-32165,18323,5126,-25101,32762,-26509,10668,7927,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
// chanpats: 173
// name: fir_h_i
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
// output_width: 24
// output_fract_width: 0
// config_method: 0

const double fir_h_i_coefficients[320] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-23170,7927,10668,-26509,32762,-25101,5126,18323,-32165,26509,-2856,-23571,32364,-14364,-16876,32767,-15886,-18323,32364,-7927,-26841,26509,10668,-32687,5126,30791,-15886,-26509,21497,23571,-23170,-23571,21497,26509,-15886,-30791,5126,32687,10668,-26509,-26841,7927,32364,18323,-15886,-32767,-16876,14364,32364,23571,-2856,-26509,-32165,-18323,5126,25101,32762,26509,10668,-7927,-23170,-31498,-32165,-26509,-16876,-5690,5126,14364,21497,26509,29697,31498,32364,32687,32762,32767,32762,32687,32364,31498,29697,26509,21497,14364,5126,-5690,-16876,-26509,-32165,-31498,-23170,-7927,10668,26509,32762,25101,5126,-18323,-32165,-26509,-2856,23571,32364,14364,-16876,-32767,-15886,18323,32364,7927,-26841,-26509,10668,32687,5126,-30791,-15886,26509,21497,-23571,-23170,23571,21497,-26509,-15886,30791,5126,-32687,10668,26509,-26841,-7927,32364,-18323,-15886,32767,-16876,-14364,32364,-23571,-2856,26509,-32165,18323,5126,-25101,32762,-26509,10668,7927,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

const xip_fir_v7_2_pattern fir_h_i_chanpats[1] = {P_BASIC};

static xip_fir_v7_2_config gen_fir_h_i_config() {
  xip_fir_v7_2_config config;
  config.name                = "fir_h_i";
  config.filter_type         = 0;
  config.rate_change         = XIP_FIR_INTEGER_RATE;
  config.interp_rate         = 1;
  config.decim_rate          = 1;
  config.zero_pack_factor    = 1;
  config.coeff               = &fir_h_i_coefficients[0];
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
  config.init_pattern        = fir_h_i_chanpats[0];
  config.num_paths           = 1;
  config.data_width          = 16;
  config.data_fract_width    = 0;
  config.output_rounding_mode= XIP_FIR_TRUNCATE_LSBS;
  config.output_width        = 24;
  config.output_fract_width  = 0,
  config.config_method       = XIP_FIR_CONFIG_SINGLE;
  return config;
}

const xip_fir_v7_2_config fir_h_i_config = gen_fir_h_i_config();


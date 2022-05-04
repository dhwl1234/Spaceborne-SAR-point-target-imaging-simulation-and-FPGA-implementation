-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Wed Mar 30 20:58:14 2022
-- Host        : LAPTOP-50M5PQTT running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/WYHAIRCAS/Desktop/plus_compress/Plus_Compress_Wave_Out/Plus_Compress_Wave_Out.srcs/sources_1/ip/ROM_320x16_S_Q/ROM_320x16_S_Q_stub.vhdl
-- Design      : ROM_320x16_S_Q
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROM_320x16_S_Q is
  Port ( 
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end ROM_320x16_S_Q;

architecture stub of ROM_320x16_S_Q is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,addra[8:0],douta[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_2,Vivado 2018.3";
begin
end;
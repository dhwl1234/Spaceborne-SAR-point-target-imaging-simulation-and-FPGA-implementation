onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L xpm -L xbip_utils_v3_0_9 -L axi_utils_v2_0_5 -L fir_compiler_v7_2_11 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.Conv_Sq_Hi xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {Conv_Sq_Hi.udo}

run -all

quit -force

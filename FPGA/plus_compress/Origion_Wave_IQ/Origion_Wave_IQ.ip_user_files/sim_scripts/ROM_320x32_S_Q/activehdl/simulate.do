onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+ROM_320x32_S_Q -L xil_defaultlib -L xpm -L blk_mem_gen_v8_4_2 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ROM_320x32_S_Q xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {ROM_320x32_S_Q.udo}

run -all

endsim

quit -force

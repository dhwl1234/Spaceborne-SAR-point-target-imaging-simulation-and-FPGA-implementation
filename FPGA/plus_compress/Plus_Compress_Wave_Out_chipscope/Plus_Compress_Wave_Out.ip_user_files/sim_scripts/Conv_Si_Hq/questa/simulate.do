onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Conv_Si_Hq_opt

do {wave.do}

view wave
view structure
view signals

do {Conv_Si_Hq.udo}

run -all

quit -force

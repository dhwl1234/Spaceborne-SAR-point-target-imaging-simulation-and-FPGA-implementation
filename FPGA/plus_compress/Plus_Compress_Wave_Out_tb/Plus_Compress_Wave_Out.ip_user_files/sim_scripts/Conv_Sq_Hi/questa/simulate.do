onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Conv_Sq_Hi_opt

do {wave.do}

view wave
view structure
view signals

do {Conv_Sq_Hi.udo}

run -all

quit -force

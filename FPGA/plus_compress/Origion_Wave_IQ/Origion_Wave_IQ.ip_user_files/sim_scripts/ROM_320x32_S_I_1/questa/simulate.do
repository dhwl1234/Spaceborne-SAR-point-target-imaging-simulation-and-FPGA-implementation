onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ROM_320x32_S_I_opt

do {wave.do}

view wave
view structure
view signals

do {ROM_320x32_S_I.udo}

run -all

quit -force

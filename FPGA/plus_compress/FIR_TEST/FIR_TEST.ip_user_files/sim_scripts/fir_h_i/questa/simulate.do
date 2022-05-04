onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fir_h_i_opt

do {wave.do}

view wave
view structure
view signals

do {fir_h_i.udo}

run -all

quit -force

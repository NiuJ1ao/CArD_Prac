onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib cpu_clock_gen_opt

do {wave.do}

view wave
view structure
view signals

do {cpu_clock_gen.udo}

run -all

quit -force

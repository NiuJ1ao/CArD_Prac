# Compile the Mandlebrot program
#
riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 -O2 -fno-inline-small-functions -S mbrot.c
riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 -o mbrot.o mbrot.s

# Link against the soft-float library functions
#
riscv64-unknown-elf-ld -m elf32lriscv -o mbrot.out -T link_map.txt ../../tests/init.o mbrot.o ../lib/*.o 

# Dump a map file
#
riscv64-unknown-elf-objdump -D -s mbrot.out > mbrot.dump

# Generate a hex file for the FPGA
#
elf2hex 4 4096 mbrot.out > mbrot.hex

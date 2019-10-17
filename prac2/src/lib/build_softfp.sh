# Compile all required soft-fp library routines to assembler
#
riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 -O2 -fno-inline-small-functions -S addsf3.c
riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 -O2 -fno-inline-small-functions -S _clzsi2.c
riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 -O2 -fno-inline-small-functions -S divsf3.c
riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 -O2 -fno-inline-small-functions -S floatsisf.c
riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 -O2 -fno-inline-small-functions -S floatunsisf.c
riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 -O2 -fno-inline-small-functions -S lesf2.c
riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 -O2 -fno-inline-small-functions -S gesf2.c
riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 -O2 -fno-inline-small-functions -S mulsf3.c
riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 -O2 -fno-inline-small-functions -S subsf3.c
riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 -O2 -fno-inline-small-functions -S vga.c

# Assemble all generated .s files for soft-fp
#
riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 -o addsf3.o addsf3.s
riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 -o _clzsi2.o _clzsi2.s
riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 -o divsf3.o divsf3.s
riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 -o floatsisf.o floatsisf.s
riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 -o floatunsisf.o floatunsisf.s
riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 -o lesf2.o lesf2.s
riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 -o gesf2.o gesf2.s
riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 -o mulsf3.o mulsf3.s
riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 -o subsf3.o subsf3.s
riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 -o vga.o vga.s

# Assemble I/O library files
#
riscv64-unknown-elf-as -march=rv32im -mabi=ilp32 -o vga.o vga.s

echo "Done"

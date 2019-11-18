#!/bin/bash
clear
source /afs/inf.ed.ac.uk/group/teaching/card/practical3/shrc
BP_EXAMPLE=$HOME/CArD/prac3/pin-3.5-97503-gac534ca30-gcc-linux/source/tools/BPExample
cd $BP_EXAMPLE
make obj-intel64/s1740055.so TARGET=intel64

pin -t $BP_EXAMPLE/obj-intel64/s1740055.so -BP_type local -num_BP_entries 4096 -o stats_local_gromacs_4096.out -- $GROMACS_PATH/gromacs_base.amd64-m64-gcc41-nn -silent -deffnm $GROMACS_PATH/input/gromacs -nice 0 > gromacs.out
pin -t $BP_EXAMPLE/obj-intel64/s1740055.so -BP_type local -num_BP_entries 4096 -o stats_local_gobmk_4096.out -- $GOBMK_PATH/gobmk_base.amd64-m64-gcc41-nn --quiet --mode gtp < $GOBMK_PATH/13x13.tst > gobmk.out
pin -t $BP_EXAMPLE/obj-intel64/s1740055.so -BP_type local -num_BP_entries 4096 -o stats_local_sjeng_4096.out -- $SJENG_PATH/sjeng_base.amd64-m64-gcc41-nn $SJENG_PATH/ref.txt > sjeng.out

pin -t $BP_EXAMPLE/obj-intel64/s1740055.so -BP_type gshare -num_BP_entries 4096 -o stats_gshare_gromacs_4096.out -- $GROMACS_PATH/gromacs_base.amd64-m64-gcc41-nn -silent -deffnm $GROMACS_PATH/input/gromacs -nice 0 > gromacs.out
pin -t $BP_EXAMPLE/obj-intel64/s1740055.so -BP_type gshare -num_BP_entries 4096 -o stats_gshare_gobmk_4096.out -- $GOBMK_PATH/gobmk_base.amd64-m64-gcc41-nn --quiet --mode gtp < $GOBMK_PATH/13x13.tst > gobmk.out
pin -t $BP_EXAMPLE/obj-intel64/s1740055.so -BP_type gshare -num_BP_entries 4096 -o stats_gshare_sjeng_4096.out -- $SJENG_PATH/sjeng_base.amd64-m64-gcc41-nn $SJENG_PATH/ref.txt > sjeng.out

pin -t $BP_EXAMPLE/obj-intel64/s1740055.so -BP_type tournament -num_BP_entries 4096 -o stats_tournament_gromacs_4096.out -- $GROMACS_PATH/gromacs_base.amd64-m64-gcc41-nn -silent -deffnm $GROMACS_PATH/input/gromacs -nice 0 > gromacs.out
pin -t $BP_EXAMPLE/obj-intel64/s1740055.so -BP_type tournament -num_BP_entries 4096 -o stats_tournament_gobmk_4096.out -- $GOBMK_PATH/gobmk_base.amd64-m64-gcc41-nn --quiet --mode gtp < $GOBMK_PATH/13x13.tst > gobmk.out
pin -t $BP_EXAMPLE/obj-intel64/s1740055.so -BP_type tournament -num_BP_entries 4096 -o stats_tournament_sjeng_4096.out -- $SJENG_PATH/sjeng_base.amd64-m64-gcc41-nn $SJENG_PATH/ref.txt > sjeng.out
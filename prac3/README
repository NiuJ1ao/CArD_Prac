Path to a file with code skeleton:
/afs/inf.ed.ac.uk/group/teaching/card/practical3/tools/pin-3.5-97503-gac534ca30-gcc-linux/source/tools/BPExample/branch_predictor_example.cpp

To compile this file please follow the instructions below.


###########################################################################

# How to compile the code and use Pin?
1. Firstly you must source shrc using the following command:
source /afs/inf.ed.ac.uk/group/teaching/card/practical3/shrc

Sourcing shrc will create the environment variables $GROMACS_PATH, $GOBMK_PATH, $SJENG_PATH and $CARD.
In addition, it allows you to run the "pin" command.

2. Compile your tool (with a branch predictor)
A Pin tool is a dynamic shared library (file with .so filename extension).

NOTE: You don't have write permissions on $CARD shared filespace space.
      In order to compile your code, please copy the whole pin directory to your home directory.

Copy pin directory to your DICE home and compile a tool with the following commands:
mkdir -p $HOME/card/
cp -r $CARD/practical3/tools/pin-3.5-97503-gac534ca30-gcc-linux $HOME/card/
BP_EXAMPLE=$HOME/card/pin-3.5-97503-gac534ca30-gcc-linux/source/tools/BPExample

Rename the branch_predictor_example.cpp using your student-id. For example if your s-id is s1234567, you can execute the following commands:
cd $BP_EXAMPLE
mv branch_predictor_example.cpp s1234567.cpp

Then you need to modify the file $BP_EXAMPLE/s1234567.cpp to implement your branch predictors.
You can recompile the tool with the following command:
make obj-intel64/s1234567.so TARGET=intel64
After this the tool $BP_EXAMPLE/obj-intel64/s1234567.so will be updated with your changes.
NOTE: 'make' should be launched from within the $BP_EXAMPLE directory

3. Run Pin with the tool
pin -t <tool> <tool options> -- <benchmark>

Any of three benchmarks defined (in the section below) can be used as a <benchmark> here. For example

pin \
  -t $BP_EXAMPLE/obj-intel64/s1234567.so                                       \
  -BP_type always_taken -o stats_always_taken.out                                              \
  --                                                                                           \
  $GROMACS_PATH/gromacs_base.amd64-m64-gcc41-nn -silent -deffnm $GROMACS_PATH/input/gromacs -nice 0  \
  > gromacs.out

You can also run the tool which we already precompiled for you with the following command

pin \
  -t $CARD/practical3/tools/pin-3.5-97503-gac534ca30-gcc-linux/source/tools/BPExample/example_tool/branch_predictor_example.so \
  -BP_type always_taken -o stats_always_taken.out                                                                  \
  --                                                                                                               \
  $GROMACS_PATH/gromacs_base.amd64-m64-gcc41-nn -silent -deffnm $GROMACS_PATH/input/gromacs -nice 0                      \
  > gromacs.out

###########################################################################

# The three benchmarks
Firstly, to run the benchmarks you must have sourced shrc (to setup the environment variables $GROMACS_PATH, $GOBMK_PATH, $SJENG_PATH)
source /afs/inf.ed.ac.uk/group/teaching/card/practical3/shrc

There are three benchmarks. The following commands are to be used as the <benchamark> argument when running pin (i.e. in the command: pin -t <tool> <tool options> -- <benchmark>)

1. Gromacs
$GROMACS_PATH/gromacs_base.amd64-m64-gcc41-nn -silent -deffnm $GROMACS_PATH/input/gromacs -nice 0 > gromacs.out

2. Gobmk
$GOBMK_PATH/gobmk_base.amd64-m64-gcc41-nn --quiet --mode gtp < $GOBMK_PATH/13x13.tst > gobmk.out

3. Sjeng
$SJENG_PATH/sjeng_base.amd64-m64-gcc41-nn $SJENG_PATH/ref.txt > sjeng.out

NOTE 1: You can use any program of your choice as a benchmark when running pin. For example, when debugging your code, you can use 'ls' as your <benchmark> argument.

NOTE 2: Do not run pin from within the shared space (i.e. /afs/inf.ed.ac.uk/group/teaching/card/practical3/). Doing so may result in an error, as you do not have write permissions for that directory!

###########################################################################


# How to submit your code and report? 

   NOTE: Make sure you are on DICE.
   NOTE: Make sure you name you .cpp and your .pdf using your student id.
   
   For isntance, a student with student id s1234567 will submit their work running the following command:
   submit card cw3 s1234567.cpp s1234567.pdf  


   You will receive an email confirming that submission was successful. 

###########################################################################

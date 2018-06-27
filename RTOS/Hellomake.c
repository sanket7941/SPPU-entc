#!/bin/sh

export PATH=$PATH:/home/src/workspace/toolchain/host_eabi_4.5
/usr/bin
export LD_LIBRARY_PATH=/home/src/workspace/toolchain/host_eabi_4.5
/usr/lib:/usr/lib

echo cleaning all output files
rm -rf *.out *.o
echo 
compiling program

arm-linux-gcc  helloworld.c -o helloworld.out


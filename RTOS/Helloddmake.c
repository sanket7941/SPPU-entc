#!/bin/sh

OUTHOME=/media/sf_winshared

OUTDIR=$OUTHOME/output/.


export 
PATH=$PATH:/home/src/workspace/toolchain/host_eabi_4.5
/usr/bin
export LD_LIBRARY_PATH=/home/src/workspace/toolchain/host_eabi_4.5
/usr/lib:/usr/lib

make all
cp -rf /home/src/workspace/programs/hello_dd 
$OUTDIR 

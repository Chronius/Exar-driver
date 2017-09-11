#!/bin/bash
#set +x
xr_list=`lspci | awk '/Exar Corp/ {print $1}'`

for i in $xr_list; do
    echo -n "0000:$i" > /sys/bus/pci/drivers/serial/unbind
done

rmmod xr17v35x
insmod ./xr17v35x.ko ##nr_uarts=50 rts_noIRQ=0 rs_typeL=0xffffffff


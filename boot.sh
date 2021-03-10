#!/bin/bash
#replace 0000:41:05.0 with your bus ID for now
echo 1 > /sys/bus/pci/devices/0000:41:05.0/enable
echo 0 > /sys/bus/pci/devices/0000:41:05.0/rom
setpci -d 1011:0046 30.l
setpci -d 1011:0046 30.l=0xFFFFFFFE
setpci -d 1011:0046 30.l
echo 1 > /sys/bus/pci/devices/0000:41:05.0/rom
setpci -v -d 1011:0046 0xd8.l=1
devmem2 0xc40000a0 h 0xffff
devmem2 0xc4000098 h 0xffff
setpci -v -d 1011:0046 0xa4.l=0
setpci -v -d 1011:0046 0xa8.l=0
setpci -v -d 1011:0046 0x98.l=0
setpci -v -d 1011:0046 0x0d.b=0x20
setpci -v -d 1011:0046 0x4d.b=0x20
setpci -v -d 1011:0046 0xd8.l=1
devmem2 0xc40000a8 w 0
devmem2 0xc40000ac w 0
devmem2 0xc40000b0 w 0
devmem2 0xc40000b4 w 0
devmem2 0xc40000b8 w 0
devmem2 0xc40000bc w 0
devmem2 0xc40000c0 w 0
devmem2 0xc40000c4 w 0
setpci -v -d 1011:0046 0xd8.l=0
sleep 1
#MFGM (manufacturing mode)
devmem2 0xc40000a8 w 0x4D46474D
#BOOT (won't work, requires interrupts)
#devmem2 0xc40000a8 w 0x474f474f


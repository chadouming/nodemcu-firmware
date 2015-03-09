make clobber && make
esptool.py elf2image app/.output/eagle/debug/image/eagle.app.v6.out
rm bin/0x00000.bin
rm bin/0x10000.bin
mv app/.output/eagle/debug/image/eagle.app.v6.out-0x00000.bin bin/0x00000.bin
mv app/.output/eagle/debug/image/eagle.app.v6.out-0x10000.bin bin/0x10000.bin
dd if=bin/0x00000.bin ibs=65k count=100 of=bin/0x00000Padded.bin conv=sync
cat bin/0x00000Padded.bin bin/0x10000.bin > prebuilt/firmware_latest.bin

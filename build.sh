make clobber && make
esptool.py elf2image app/.output/eagle/debug/image/eagle.app.v6.out
rm bin/0x00000.bin
rm bin/0x10000.bin
mv app/.output/eagle/debug/image/eagle.app.v6.out-0x00000.bin bin/0x00000.bin
mv app/.output/eagle/debug/image/eagle.app.v6.out-0x10000.bin bin/0x10000.bin

make clobber && make
esptool.py elf2image app/.output/eagle/debug/image/eagle.app.v6.out
rm bin/0x00000.bin
rm bin/0x10000.bin
rm prebuilt/firmware_latest.bin
mv app/.output/eagle/debug/image/eagle.app.v6.out-0x00000.bin bin/0x00000.bin
mv app/.output/eagle/debug/image/eagle.app.v6.out-0x10000.bin bin/0x10000.bin
srec_cat -output "prebuilt/firmware_latest.bin" -binary bin/0x00000.bin -binary -fill 0xff 0x00000 0x10000 bin/0x10000.bin -binary -offset 0x10000

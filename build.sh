make clobber && make
esptool.py elf2image app/.output/eagle/debug/image/eagle.app.v6.out
rm bin/0x00000.bin
rm bin/0x10000.bin
mv app/.output/eagle/debug/image/eagle.app.v6.out-0x00000.bin bin/0x00000.bin
mv app/.output/eagle/debug/image/eagle.app.v6.out-0x10000.bin bin/0x10000.bin
newsize=$((65 * 1024))
filesize=$(stat -c "%s" bin/0x00000.bin)
padcount=$((newsize - filesize))
dd if=/dev/zero ibs=1 count="$padcount" | tr "\000" "\377" >> bin/0x00000.bin
cat bin/0x00000 bin/0x10000.bin > prebuilt/firmware_latest.bin

if [ -e /data/bluez_provider/bluez_reg ]; then
echo "bluez registered"
else
cat /system/etc/bluecore6.psr > /data/bluez_provider/bluecore6.psr
chmod 777 /data/bluez_provider/bluecore6.psr
fi

mount -w -o remount -t yaffs2 /dev/block/mtdblock3 /system
ln -s /data/bluez_provider/bluecore6.psr /system/etc/bluez/bluecore6.psr
mount -r -o remount -t yaffs2 /dev/block/mtdblock3 /system

sleep 30

if [ -e /data/.shuttle_install ]; then
	exit
else
	sh /system/bin/pm install /system/etc/shuttle_priv/libflashplayer_froyo_gles2_20101019_v10.1.95.18_signed.apk
#sh /system/bin/pm install /data/eGalaxTester.apk
#sh /system/bin/pm install /data/Shuttle_Test.apk
#sh /system/bin/pm install /data/eGalaxUpdateAuto.apk
	echo 0 > /data/.shuttle_install
fi

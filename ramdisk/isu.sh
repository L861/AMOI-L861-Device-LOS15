#!/system/bin/sh
# Service for iSu support to make sure we don't lose root

if [ -e /system/xbin/su ]; then
 exit
fi

mount -o rw,remount /system


# Move bin and xbin back
# Isu support

if [ -e /data/backup_isu ]; then
	cp /data/backup_isu /system/xbin/su
fi

if [ ! -e /system/bin/su ]; then
	ln -s -f /system/xbin/su /system/bin/su
fi

# give su root:root to adb su work optional/recommended
if [ -e /system/xbin/su ]; then
	chown root:root /system/xbin/su
fi

# Changed from original code --blastagator
mount -o ro,remount /system

# enforce selinux need to pass safety net
#setenforce 1

exit

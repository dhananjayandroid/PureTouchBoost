#!/system/bin/sh
umount /vendor/etc/powerhint.json 2>/dev/null
pkill -f android.hardware.power-service.lineage-libperfmgr 2>/dev/null
sysctl -w walt.input_boost.input_boost_freq="1132800 0 0 0 0 0 0 0" 2>/dev/null
sysctl -w walt.input_boost.input_boost_ms=250 2>/dev/null

#!/system/bin/sh
# Pure PowerHAL Touch Booster v2.2
# Author: imdjay
MODDIR="${0%/*}"

until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 2
done

# Ensure SELinux context matches vendor_configs_file
chcon u:object_r:vendor_configs_file:s0 "$MODDIR/vendor/etc/powerhint.json" 2>/dev/null

# Bind mount the boosted powerhint.json if not already mounted
if ! mount | grep -q "/vendor/etc/powerhint.json"; then
    mount -o bind "$MODDIR/vendor/etc/powerhint.json" /vendor/etc/powerhint.json
fi

# Apply kernel WALT scheduler boost via sysctl
if [ -f "$MODDIR/sysctl_boost.conf" ]; then
    sysctl -p "$MODDIR/sysctl_boost.conf" 2>/dev/null
fi

# Restart libperfmgr to reload the boosted powerhint.json
pkill -f android.hardware.power-service.lineage-libperfmgr 2>/dev/null

# Kernel scheduler & input boost optimizations for instant wake-up response
echo 1 > /dev/cpuctl/top-app/cpu.uclamp.latency_sensitive 2>/dev/null
echo 20.00 > /dev/cpuctl/top-app/cpu.uclamp.min 2>/dev/null
echo 1 1 > /proc/sys/walt/sched_wake_up_idle 2>/dev/null
echo 1 1 > /proc/sys/walt/sched_low_latency 2>/dev/null

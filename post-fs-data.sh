#!/system/bin/sh
MODDIR="${0%/*}"

# Early bind mount powerhint.json before HAL initialization
if [ -f "$MODDIR/vendor/etc/powerhint.json" ]; then
    chcon u:object_r:vendor_configs_file:s0 "$MODDIR/vendor/etc/powerhint.json" 2>/dev/null
    mount -o bind "$MODDIR/vendor/etc/powerhint.json" /vendor/etc/powerhint.json 2>/dev/null
fi

# Early apply kernel WALT scheduler boost
if [ -f "$MODDIR/sysctl_boost.conf" ]; then
    sysctl -p "$MODDIR/sysctl_boost.conf" 2>/dev/null
fi

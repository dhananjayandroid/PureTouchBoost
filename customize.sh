# Pure PowerHAL Touch Booster v2.2 - Installer Script
# Author: imdjay

ui_print "**********************************************"
ui_print "*        Pure PowerHAL Touch Booster v2.2    *"
ui_print "*                 by imdjay                  *"
ui_print "**********************************************"
ui_print "- Applying hardware PowerHAL overlay for marble..."
ui_print "- Cortex-X3 Prime Core (1.28 GHz) touch boost: ACTIVE"
ui_print "- Big Cores (1.32 GHz) touch boost: ACTIVE"
ui_print "- Kernel WALT low-latency scheduler boost: ACTIVE"
ui_print "- Zero visual/theme modifications: 100% SAFE"

set_perm "$MODPATH/post-fs-data.sh" 0 0 0755
set_perm "$MODPATH/service.sh" 0 0 0755
set_perm "$MODPATH/uninstall.sh" 0 0 0755
set_perm "$MODPATH/module.prop" 0 0 0644
set_perm "$MODPATH/sysctl_boost.conf" 0 0 0644
if [ -f "$MODPATH/vendor/etc/powerhint.json" ]; then
    set_perm "$MODPATH/vendor/etc/powerhint.json" 0 0 0644 "u:object_r:vendor_configs_file:s0"
fi

ui_print " "
ui_print "=============================================="
ui_print "  Installed successfully!"
ui_print "  Author: imdjay"
ui_print "  Your custom theme, colors & QS stay 100% intact!"
ui_print "=============================================="
ui_print " "

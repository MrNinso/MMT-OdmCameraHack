#!/system/bin/sh

# Check root implementation
ui_print "- Checking root implementation"
if [ "$BOOTMODE" ] && [ "$KSU" ]; then
ui_print "- Installing from KernelSU app"
ui_print "   KernelSU version: $KSU_KERNEL_VER_CODE (kernel) + $KSU_VER_CODE (ksud)"
if [ "$(which magisk)" ]; then
ui_print "   Multiple root implementation is NOT supported"
abort    "   Aborting!"
fi
elif [ "$BOOTMODE" ] && [ "$MAGISK_VER_CODE" ]; then
ui_print "- Installing from Magisk app"
else
ui_print "   Installation from recovery is NOT supported"
ui_print "   Please install from Magisk / KernelSU app"
abort    "   Aborting!"
fi

# Patch default hosts file
PATH=/system/etc
ui_print "- Patching hosts file"
mkdir -p $MODPATH$PATH
cp -f $MODPATH/fwk_config.json $MODPATH$PATH
cp -f $MODPATH/fwk_config_v2.json $MODPATH$PATH

PATH_FINAL=/odm/etc/camera

cp -f $MODPATH/fwk_config.json $MODPATH$PATH_FINAL
cp -f $MODPATH/fwk_config_v2.json $MODPATH$PATH_FINAL

# Clean up
rm -rf $MODPATH/fwk_config.json
rm -rf $MODPATH/fwk_config_v2.json
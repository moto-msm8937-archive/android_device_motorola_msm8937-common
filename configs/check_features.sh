#!/sbin/sh

sku=`getprop ro.boot.hardware.sku`
device=`getprop ro.boot.device`
radio=`getprop ro.boot.radio`

if [ -L /system/vendor ]; then
    mount /vendor
fi

if [ -L /vendor ]; then
    umount /vendor
fi

if [ "$device" == "cedric" ] || [ "$device" == "owens" ] || [ "$device" == "perry" ]; then
    # owens, perry and cedric don't have e-compasses
    rm /vendor/etc/permissions/android.hardware.sensor.compass.xml
fi

if [ "$device" == "montana" ]; then
    if [ "$radio" != "APAC" ] && [ "$radio" != "EMEA" ]; then
        # On montana radios other than APAC and EMEA don't have NFC chips
        rm /system/etc/permissions/com.android.nfc_extras.xml
        rm /vendor/etc/libnfc-nci.conf
        rm /vendor/etc/libnfc-nxp.conf
        rm /vendor/etc/permissions/android.hardware.nfc.xml
        rm /vendor/etc/permissions/android.hardware.nfc.hce.xml
        rm /vendor/etc/permissions/com.android.nfc_extras.xml
        rm /vendor/firmware/libpn548ad_fw.so
        rm -r /system/app/NfcNci
    fi
    if [ "$radio" == "APAC" ] || [ "$radio" == "EMEA" ]; then
        # On montana APAC and EMEA radios don't have e-compasses
        rm /vendor/etc/permissions/android.hardware.sensor.compass.xml
    fi
fi

if [ -L /system/vendor ]; then
    umount /vendor
fi

#!/sbin/sh

sku=`getprop ro.boot.hardware.sku`
device=`getprop ro.boot.device`
radio=`getprop ro.boot.radio`

if [ "$device" == "montana" ]; then
    if [ "$radio" != "APAC" ] && [ "$radio" != "EMEA" ]; then
        # On montana radios other than APAC and EMEA don't have NFC chips
        rm /system/etc/permissions/com.android.nfc_extras.xml
        rm /system/vendor/etc/permissions/android.hardware.nfc.xml
        rm /system/vendor/etc/permissions/android.hardware.nfc.hce.xml
        rm /system/vendor/etc/permissions/android.hardware.nfc.hcef.xml
        rm -r /system/app/NfcNci
    fi
    if ["$radio" == "Brazil" ] || [ "$radio" == "APAC" ] || [ "$radio" == "EMEA" ]; then
        # On montana APAC and EMEA radios don't have e-compasses
        rm /system/vendor/etc/permissions/android.hardware.sensor.compass.xml
    fi
fi

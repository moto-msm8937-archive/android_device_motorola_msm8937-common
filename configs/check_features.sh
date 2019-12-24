#!/sbin/sh

device=`getprop ro.boot.device`
radio=`getprop ro.boot.radio`

umount /vendor

mount /dev/block/bootdevice/by-name/oem /vendor

if [ "$device" == "montana" ]; then
    if [ "$radio" != "APAC" ] && [ "$radio" != "EMEA" ]; then
        # On montana radios other than APAC and EMEA don't have NFC chips
        rm /system/etc/permissions/com.android.nfc_extras.xml
        rm /vendor/etc/permissions/android.hardware.nfc.xml
        rm /vendor/etc/permissions/android.hardware.nfc.hce.xml
        rm -r /system/app/NfcNci
    fi
    if [ "$radio" == "APAC" ] || [ "$radio" == "EMEA" ] && [ "$device" != "cedric" ] && [ "$device" != "owens" ] && [ "$device" != "perry" ]; then
        # On montana APAC and EMEA radios don't have e-compasses and cedric, owens & perry have e-compasses
        rm /vendor/etc/permissions/android.hardware.sensor.compass.xml
    fi
fi

umount /vendor

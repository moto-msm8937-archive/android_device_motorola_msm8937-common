#!/sbin/sh

sku=`getprop ro.boot.hardware.sku`
device=`getprop ro.boot.device`
radio=`getprop ro.boot.radio`

if [ "$device" == "cedric" ] || [ "$device" == "owens" ] || [ "$device" == "perry" ]; then
    # perry and cedric don't have NFC chips and e-compasses
    rm /system/vendor/etc/permissions/android.hardware.nfc.xml
    rm /system/vendor/etc/permissions/android.hardware.nfc.hce.xml
    rm /system/vendor/etc/permissions/com.android.nfc_extras.xml
    rm -r /system/app/NfcNci
	rm /system/vendor/etc/permissions/android.hardware.sensor.compass.xml
fi

if [ "$device" == "montana" ]; then
    if [ "$radio" != "APAC" ] || [ "$radio" != "EMEA" ]; then
        # On montana radios other than APAC and EMEA don't have NFC chips
		rm /system/vendor/etc/permissions/android.hardware.nfc.xml
        rm /system/vendor/etc/permissions/android.hardware.nfc.hce.xml
        rm /system/vendor/etc/permissions/com.android.nfc_extras.xml
        rm -r /system/app/NfcNci
	fi
fi
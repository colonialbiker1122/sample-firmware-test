#load 3G modules

if [ -f /usr/lib/modules/extdrv/usbserial.ko ];then
        insmod /usr/lib/modules/extdrv/usbserial.ko
fi
if [ -f /usr/lib/modules/extdrv/usbserial.ko ];then
        insmod /usr/lib/modules/extdrv/usb_wwan.ko
fi
if [ -f /usr/lib/modules/extdrv/usbserial.ko ];then
        insmod /usr/lib/modules/extdrv/option.ko
        insmod /usr/lib/modules/extdrv/GobiNet.ko
        insmod /usr/lib/modules/extdrv/ki_cdc_ether.ko
fi


#!/bin/bash

case "$1" in
         3g)
            VARIANT="eur_3g"
            ;;

        lte)
            VARIANT="eur_lte"
            ;;

          *)
            VARIANT="eur_3g"
esac

if [ ! -d $(pwd)/output ]; 
    then
	mkdir $(pwd)/output; 
    fi

make -C $(pwd) O=output alexax_serrano_defconfig  VARIANT_DEFCONFIG=msm8930_serrano_$VARIANT"_defconfig" SELINUX_DEFCONFIG=selinux_defconfig

make -j5 -C $(pwd) O=output

cp $(pwd)/output/arch/arm/boot/zImage $(pwd)/arch/arm/boot/zImage

if [ ! -d $(pwd)/output/modules ]; 
    then
	mkdir $(pwd)/output/modules; 
    fi
find $(pwd)/output -name '*.ko' -exec cp -v {} $(pwd)/output/modules \;

exit

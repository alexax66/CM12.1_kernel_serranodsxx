#!/bin/bash

if [ ! -d $(pwd)/output ]; 
    then
	mkdir $(pwd)/output; 
    fi

make -C $(pwd) O=output alexax_serrano_eur_3g_defconfig  VARIANT_DEFCONFIG=msm8930_serrano_eur_3g_defconfig SELINUX_DEFCONFIG=selinux_defconfig
#make -C $(pwd) O=output alexax_serrano_eur_lte_defconfig  VARIANT_DEFCONFIG=msm8930_serrano_eur_lte_defconfig SELINUX_DEFCONFIG=selinux_defconfig

make -j5 -C $(pwd) O=output

cp $(pwd)/output/arch/arm/boot/zImage $(pwd)/arch/arm/boot/zImage

if [ ! -d $(pwd)/output/modules ]; 
    then
	mkdir $(pwd)/output/modules; 
    fi
find $(pwd)/output -name '*.ko' -exec cp -v {} $(pwd)/output/modules \;

exit

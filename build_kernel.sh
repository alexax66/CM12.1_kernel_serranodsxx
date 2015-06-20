mkdir output
make -C $(pwd) O=output alexax_serrano_defconfig  VARIANT_DEFCONFIG=msm8930_serrano_eur_3g_defconfig SELINUX_DEFCONFIG=selinux_defconfig
make -j5 -C $(pwd) O=output
cp $(pwd)/output/arch/arm/boot/zImage $(pwd)/arch/arm/boot/zImage

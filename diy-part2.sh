#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

# Modify hostname
#sed -i 's/ImmortalWrt/rax3000m_256m/g' package/base-files/files/bin/config_generate

#修改wifi名称（mtwifi-cfg）
#sed -i 's/ImmortalWrt-2.4G/OpenWrt/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
#sed -i 's/ImmortalWrt-5G/OpenWrt5G/g' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh

#修改闪存为256M版本(这是针对原厂128闪存来的，但又要编译256M固件来的）
#sed -i 's/<0x580000 0x7200000>/<0x580000 0xee00000>/g' target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7981-cmcc-rax3000m.dts
#sed -i 's/116736k/240128k/g' target/linux/mediatek/image/mt7981.mk

#删除冲突的软件包
rm -rf ./package/istore
rm -rf ./feeds/kenzo/luci-app-quickstart
rm -rf ./feeds/kenzo/luci-app-store
rm -rf ./feeds/kenzo/luci-lib-taskd
rm -rf ./feeds/kenzo/luci-app-wrtbwmon

#mosdns
# remove v2ray-geodata package from feeds (openwrt-22.03 & master)
#find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
#find ./ | grep Makefile | grep mosdns | xargs rm -f
#rm -rf feeds/packages/net/v2ray-geodata
#git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
#git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

#rm -rf feeds/packages/lang/golang
#git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang

#rm -rf feeds/packages/lang/golang
#git clone https://github.com/kenzok8/golang feeds/packages/lang/golang



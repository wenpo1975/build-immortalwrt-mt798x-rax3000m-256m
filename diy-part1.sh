#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#



# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> ./feeds.conf.default
#echo "src-git small https://github.com/kenzok8/small-package" >> ./feeds.conf.default
#echo "src-git OpenClash https://github.com/vernesong/OpenClash.git" >> ./feeds.conf.default
#echo "src-git homeproxy https://github.com/immortalwrt/homeproxy" >> ./feeds.conf.default
#echo "src-git fakemesh https://github.com/kenzok8/small-package/tree/main/luci-app-fakemesh" >> ./feeds.conf.default

#删除冲突的软件包homeproxy
#rm -rf ./feeds/small/luci-app-homeproxy
#rm -rf ./feeds/small/sing-box
#git clone https://github.com/immortalwrt/homeproxy package/homeproxy
#git clone https://github.com/kenzok8/small-package/tree/main/luci-app-fakemesh package/fakemesh

#golang
#rm -rf feeds/packages/lang/golang
#git clone https://github.com/kenzok8/golang feeds/packages/lang/golang

#Full Cone 补丁
FW4_PATCH="package/network/config/firewall4/patches/001-firewall4-add-support-for-fullcone-nat.patch"

rm -f \
  package/network/config/firewall4/patches/001-firewall4-disable-full-cone.patch \
  "$FW4_PATCH"

curl -fL --retry 3 \
  "https://raw.githubusercontent.com/padavanonly/immortalwrt-mt798x-6.6/4ffcb16a05c5aaa7cf10c3bc19e4ec65e0d93a0c/package/network/config/firewall4/patches/001-firewall4-add-support-for-fullcone-nat.patch" \
  -o "$FW4_PATCH"

grep -q 'option fullcone' "$FW4_PATCH" || {
  echo "恢复 firewall4 Full Cone 补丁失败"
  exit 1
}


./scripts/config --enable PACKAGE_kmod-nft-fullcone
./scripts/config --disable PACKAGE_kmod-ipt-fullconenat
./scripts/config --disable PACKAGE_iptables-mod-fullconenat




#删除冲突的软件包
rm -rf ./package/istore
rm -rf ./feeds/kenzo/luci-app-quickstart
rm -rf ./feeds/kenzo/luci-app-store
rm -rf ./feeds/kenzo/luci-lib-taskd


#添加额外软件包
#git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
#git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
#git clone https://github.com/sirpdboy/netspeedtest.git package/netspeedtest
#git clone https://github.com/sirpdboy/luci-app-poweroffdevice.git package/luci-app-poweroffdevice


# git clone https://github.com/gngpp/luci-theme-design.git  package/luci-theme-design
# make menuconfig # choose LUCI->Theme->Luci-theme-design V=s

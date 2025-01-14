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

# 添加PPA源
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt update

# 安装最新的GCC（假设为GCC 11）
sudo apt install gcc-11 g++-11

# 设置默认版本
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 100
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 100

# 配置默认版本
sudo update-alternatives --config gcc
sudo update-alternatives --config g++

# 验证安装
gcc --version
g++ --version


# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo "src-git kenzo https://github.com/kiddin9/kwrt-packages" >> ./feeds.conf.default
echo "src-git small https://github.com/kenzok8/small-package" >> ./feeds.conf.default
#echo "src-git OpenClash https://github.com/vernesong/OpenClash.git" >> ./feeds.conf.default

#添加额外软件包
#git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
#git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
#git clone https://github.com/sirpdboy/netspeedtest.git package/netspeedtest
#git clone https://github.com/sirpdboy/luci-app-poweroffdevice.git package/luci-app-poweroffdevice

# git clone https://github.com/gngpp/luci-theme-design.git  package/luci-theme-design
# make menuconfig # choose LUCI->Theme->Luci-theme-design V=s

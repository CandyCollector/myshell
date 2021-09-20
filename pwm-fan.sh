#!/bin/sh /etc/rc.common


#Nanopi R2S 风扇脚本1

START=99

start ( ) {

echo 0 > /sys/class/pwm/pwmchip0/export

echo 0 > /sys/class/pwm/pwmchip0/pwm0/enable

echo 50000 > /sys/class/pwm/pwmchip0/pwm0/period

echo 1 > /sys/class/pwm/pwmchip0/pwm0/enable

echo 49990 > /sys/class/pwm/pwmchip0/pwm0/duty_cycle; # 初始风扇不转

while true

do

temp=$ ( cat /sys/class/thermal/thermal_zone0/temp )

if [ $temp -gt 55000 ] ; then # 温度高于 55 风扇开始转，可修改

echo 30000 > /sys/class/pwm/pwmchip0/pwm0/duty_cycle;

elif [ $temp -le 45000 ] ; then # 温度低于 45 风扇停转，可修改

echo 49990 > /sys/class/pwm/pwmchip0/pwm0/duty_cycle;

sleep 60s; # 每分钟检测一次

done

}


#Nanopi R2S 风扇脚本---来自馆长

# https://github.com/fanck0605/openwrt-nanopi-r2s/issues/9#issuecomment-767224902

mkdir -p files/usr/bin/ files/etc/init.d/ files/etc/rc.d/
wget https://raw.githubusercontent.com/friendlyarm/friendlywrt/master-v19.07.1/target/linux/rockchip-rk3328/base-files/usr/bin/start-rk3328-pwm-fan.sh \
    -O files/usr/bin/start-rk3328-pwm-fan.sh

wget https://raw.githubusercontent.com/friendlyarm/friendlywrt/master-v19.07.1/target/linux/rockchip-rk3328/base-files/etc/init.d/fa-rk3328-pwmfan \
    -O files/etc/init.d/fa-rk3328-pwmfan

chmod 0755 files/usr/bin/start-rk3328-pwm-fan.sh  files/etc/init.d/fa-rk3328-pwmfan

# 相对路径处理，符合规范
(
    cd files/etc/rc.d/
    ln -sf ../init.d/fa-rk3328-pwmfan S96fa-rk3328-pwmfan
)

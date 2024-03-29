#!/bin/bash
apt-get install nginx -y
apt-get install vim -y
apt-get install lrzsz -y
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh) --version v4.34.0
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
systemctl enable v2ray

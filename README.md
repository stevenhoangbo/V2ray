# V2ray
v2rayN windows 4.12版本完全使用教程2021.03.17
最近的v2rayN windows 4.12版本配置文件可同步shadowsock,但是不支持加密格式为aes-256-cfb, 支持 aes-256-gcm,也就是说ssr应该用不了。
程序运行环境（linux debian 9 x64）</br>
debian 10 报错 执行 rm -rf /var/lib/apt/lists/* 

1.准备工作 升级和安装curl </br>
apt-get update && apt-get install curl -y </br>

一键安装脚本：bash <(curl -L -s https://raw.githubusercontent.com/stevenhoangbo/V2ray/main/master.sh) </br>

wget -O https://github.com/stevenhoangbo/V2ray/blob/main/config.json </br>

安装后调试配置文件（config.json），我的是文件地址是，/usr/local/etc/v2ray/config.json

配置文件样本。（最新的不支持aes-256-cfb,支持aes-256-gcm）SSR 就不能用了。
生成后替换配置文件，然后重启服务。

开启BBR加速

echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf </br>

echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf </br>

sysctl -p  //保存状态

lsmod | grep bbr //查询BBR状态 </br>

systemctl enable v2ray   开机自启动

systemctl daemon-reload  //重新加载配置

systemctl restart v2ray start/stop/status/restart 控制 V2Ray 的运行.

本地下载v2ranN,配置和服务器一样就行了。

nginx在linux系统的默认端口是80，可能由于是端口未开放导致连接不上。

解决办法可以对外开放访问端口 /sbin/iptables -I INPUT -p tcp --dport 80 -j ACCEPT

保存开放端口 /etc/rc.d/init.d/iptables save

直接看图不说话！
iptables -P INPUT ACCEPT 
iptables -P OUTPUT ACCEPT 

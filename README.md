# V2ray
v2rayN windows 4.12版本完全使用教程2021.03.17
最近的v2rayN windows 4.12版本配置文件可同步shadowsock,但是不支持加密格式为aes-256-cfb, 支持 aes-256-gcm,也就是说ssr应该用不了。
程序运行环境（linux debian 9 x64）

1.准备工作 升级和安装curl </br>
apt-get update</br>
apt-get install curl -y  </br>
apt-get install nginx -y  </br>
apt-get install vim -y  </br>
apt-get install lrzsz -y  </br>




一件安装脚本：bash <(curl -L -s https://raw.githubusercontent.com/stevenhoangbo/V2ray/main/master.sh) </br>
2.安装v2ray(自带shadowsocks）

bash <(curl -L -s https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)

安装后调试配置文件（config.json），我的是文件地址是，/usr/local/etc/v2ray/config.json

配置文件样本。（最新的不支持aes-256-cfb,支持aes-256-gcm）SSR就不能用了。

<a href="https://tools.sprov.xyz/v2ray/" target="_black">https://tools.sprov.xyz/v2ray/</a> 配置文件生成网站，支持ss和v2ray同时配置。

生成后替换配置文件，然后重启服务。

开启BBR加速
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf </br>
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf </br>
sysctl -p </br> //保存状态
lsmod | grep bbr //查询BBR状态

systemctl enable v2ray   开机自启动
systemctl daemon-reload  //重新加载配置
systemctl start|restart|stop|status v2ray 控制 V2Ray 的运行.

本地下载v2ranN,配置和服务器一样就行了。

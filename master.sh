#!/bin/bash
apt-get update -y
apt-get install curl -y
apt-get install nginx -y
apt-get install vim -y
bash <(curl -L -s https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
done

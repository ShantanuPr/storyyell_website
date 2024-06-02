#!/bin/bash

# becomming root
sudo su

# updating and upgrading system
apt update -y && apt upgrade -y

apt install -y nginx snapd ufw

ufw allow ssh
ufw allow 80
ufw allow 443
ufw allow 8443
ufw allow 5555

ufw -f enable
ufw status

systemctl stop nginx
systemctl stop apache2

sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot

# ------ certbot ------  CHANGE DOMAIN NAME

sudo certbot certonly --standalone --preferred-challenges http --agree-tos --email blueblaze305@gmail.com -d lightray-server-test.eternityvpn.co.in

# auto renewal test
sudo certbot renew --dry-run

# lightray-server-test.eternityvpn.co.in

# path to certificate

# Certificate is saved at: /etc/letsencrypt/live/lightray-server-test.eternityvpn.co.in/fullchain.pem
# Key is saved at:         /etc/letsencrypt/live/lightray-server-test.eternityvpn.co.in/privkey.pem

# ------ install x-ui ------
bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)

x-ui start

x-ui status 

# login to dashboard

# ------ update in ui dashboard ------

# add cert path

# username:admin
# password:password

# change username and password by going tp dashboard panel settings
x-ui restart



# ------ create profile in ui dashboard ------

# proto-vless-[ws,tcp]-tls
# vless://56ec7872-92de-4def-ae9d-731f3937a0a9@lightray-server-test.eternityvpn.co.in:443?type=ws&security=tls&path=%2F#ios

# ios - port - 443
# android - port - 8443
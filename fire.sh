#!/bin/bash
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
wget http://soft.vpser.net/security/denyhosts/DenyHosts-2.6.tar.gz
tar zxvf DenyHosts-2.6.tar.gz
cd DenyHosts-2.6
python setup.py install
cd /usr/share/denyhosts/
wget https://raw.githubusercontent.com/zerolovely/mess/master/denyhosts.cfg
cp daemon-control-dist daemon-control
chown root daemon-control
chmod 700 daemon-control
ln -s /usr/share/denyhosts/daemon-control /etc/init.d/denyhosts
apt install ufw -y
ufw default allow outgoing
ufw default deny incoming

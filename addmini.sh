apt update
apt install curl gnupg2 ca-certificates lsb-release zip lrzsz figlet -y
apt install -y xz-utils openssl gawk file jq net-tools htop screen debian-archive-keyring
rm .bashrc
wget https://raw.githubusercontent.com/zerolovely/mess/master/.bashrc
wget https://raw.githubusercontent.com/zerolovely/mess/master/.nanorc

cat > /etc/apt/sources.list << EOF
deb http://cdn-aws.deb.debian.org/debian $(lsb_release -sc) main contrib non-free
deb http://cdn-aws.deb.debian.org/debian-security $(lsb_release -sc)/updates main contrib non-free
deb http://cdn-aws.deb.debian.org/debian $(lsb_release -sc)-updates main contrib non-free
deb http://cdn-aws.deb.debian.org/debian $(lsb_release -sc)-backports main contrib non-free
EOF

if [[ $(lsb_release -sr) -gt 10 ]]; then
    sed -i 's/\/updates/-security/g' /etc/apt/sources.list
fi

apt update

cat <<EOF >/etc/rc.local
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

exit 0
EOF

chmod +x /etc/rc.local
systemctl start rc-local
timedatectl set-timezone Asia/Singapore
apt install fail2ban -y
wget -O /etc/fail2ban/jail.local https://raw.githubusercontent.com/zerolovely/mess/master/jail.local
wget -O /etc/fail2ban/filter.d/nginxerr.conf https://raw.githubusercontent.com/zerolovely/mess/master/nginxerr.conf
wget -O /etc/fail2ban/filter.d/nginx-00.conf https://raw.githubusercontent.com/zerolovely/mess/master/nginx-00.conf

apt install vnstat ufw -y
ufw default allow outgoing
ufw default deny incoming
source /root/.bashrc

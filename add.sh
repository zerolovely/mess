apt update
apt install curl gnupg2 ca-certificates lsb-release zip lrzsz -y
apt install -y xz-utils openssl gawk file jq net-tools htop
rm .bashrc
wget https://raw.githubusercontent.com/zerolovely/mess/master/.bashrc

cat > /etc/apt/sources.list << EOF
deb http://cdn-aws.deb.debian.org/debian $(lsb_release -sc) main contrib non-free
deb http://cdn-aws.deb.debian.org/debian-security $(lsb_release -sc)/updates main contrib non-free
deb http://cdn-aws.deb.debian.org/debian $(lsb_release -sc)-updates main contrib non-free
deb http://cdn-aws.deb.debian.org/debian $(lsb_release -sc)-backports main contrib non-free
EOF

if [[ $(lsb_release -sr) -gt 10 ]]; then
    sed -i 's/\/updates/-security/g' /etc/apt/sources.list
fi
echo "deb http://nginx.org/packages/debian `lsb_release -cs` nginx" | tee /etc/apt/sources.list.d/nginx.list
echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" |tee /etc/apt/preferences.d/99nginx
curl -o /tmp/nginx_signing.key https://nginx.org/keys/nginx_signing.key
gpg --dry-run --quiet --import --import-options import-show /tmp/nginx_signing.key
mv /tmp/nginx_signing.key /etc/apt/trusted.gpg.d/nginx_signing.asc
apt update
apt install nginx libmaxminddb-dev mmdb-bin -y
mkdir /var/www
mkdir /var/www/html
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
timedatectl set-timezone Asia/Shanghai

wget -O /home/check.sh https://pastebin.com/raw/ZxWEbqd2
cat <<EOF >/home/my.cron
0 */4 * * * bash /root/getdata.sh
*/5 * * * * source /home/check.sh
EOF
crontab /home/my.cron
apt install fail2ban -y
wget -O /etc/fail2ban/jail.local https://raw.githubusercontent.com/zerolovely/mess/master/jail.local
wget -O /etc/fail2ban/filter.d/nginxerr.conf https://raw.githubusercontent.com/zerolovely/mess/master/nginxerr.conf
wget -O /etc/fail2ban/filter.d/nginx-00.conf https://raw.githubusercontent.com/zerolovely/mess/master/nginx-00.conf
apt install python3-pip -y
pip install requests yagmail
apt install vnstat -y
vnstat -u -i eth0
chown vnstat:vnstat /var/lib/vnstat/.eth0
systemctl restart vnstat
apt install ufw -y
ufw default allow outgoing
ufw default deny incoming
source /root/.bashrc

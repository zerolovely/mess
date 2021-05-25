#/bin/bash
read -p "input your hostname:" hostname
hostnamectl set-hostname $hostname
num=$(grep -n "pam_unix" /etc/pam.d/common-session-noninteractive | cut -d ":" -f 1)
echo "pam in line $num"
sed -i "${num}i\session [success=1 default=ignore] pam_succeed_if.so service in cron quiet use_uid" /etc/pam.d/common-session-noninteractive
/etc/init.d/cron restart

curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
cd /etc/systemd/system
wget https://github.com/zerolovely/mess/raw/master/filebrowser.service
cd /var/www
wget https://github.com/zerolovely/mess/raw/master/filebrowserconfig.json
cd ~
systemctl enable filebrowser

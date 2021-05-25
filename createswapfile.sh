mkdir -p /swap
cd /swap
dd if=/dev/zero of=swapfile bs=1MB count=384
chmod 600 ./swapfile
mkswap ./swapfile
swapon ./swapfile
echo "/swap/swapfile swap swap defaults 0 0" >>/etc/fstab

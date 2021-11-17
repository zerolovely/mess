#!/bin/bash
read -p "input nginx version:" version
apt install libpcre3 libpcre3-dev git -y
wget https://nginx.org/download/nginx-${version}.tar.gz
git clone https://github.com/leev/ngx_http_geoip2_module.git
tar xf nginx-${version}.tar.gz
cd nginx-${version}
./configure --with-compat --add-dynamic-module=../ngx_http_geoip2_module/
make modules
cp objs/ngx_http_geoip2_module.so /etc/nginx/modules/
make clean
cd ..
rm -rf ng*
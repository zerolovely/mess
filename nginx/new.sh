#!/bin/bash
set -e
rm /etc/nginx/modules/ngx_http_geoip2_module.so
read -p "input nginx version:" version
apt install libpcre3 libpcre3-dev  libpcre2-dev zlib1g-dev git -y
wget https://nginx.org/download/nginx-${version}.tar.gz
git clone https://github.com/leev/ngx_http_geoip2_module.git
tar xf nginx-${version}.tar.gz
cd nginx-${version}
./configure --with-compat --add-dynamic-module=../ngx_http_geoip2_module/ --with-stream
make modules
strip objs/*.so
cp objs/ngx_http_geoip2_module.so /etc/nginx/modules/
make clean
cd ..
rm -rf ng*

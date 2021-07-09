#!/bin/bash
cd /etc/nginx/GeoLite2
rm *
wget https://raw.githubusercontent.com/P3TERX/GeoLite.mmdb/download/GeoLite2-Country.mmdb
read -p "geoip2.so version:" version
cd /etc/nginx/modules
rm ngx_http_geoip2_module.so
wget https://raw.githubusercontent.com/zerolovely/mess/master/nginx/${version}/ngx_http_geoip2_module.so
cd ~
curl https://get.acme.sh | sh
source .bashrc
acme.sh --set-default-ca  --server  letsencrypt

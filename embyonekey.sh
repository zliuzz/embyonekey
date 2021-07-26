#!/bin/sh
cd /etc/nginx/sites-enabled
wget https://raw.githubusercontent.com/zliuzz/embyonekey/master/proxy.conf
curl https://raw.githubusercontent.com/zliuzz/embyonekey/master/guomi.cer >> /etc/ssl/certs/ca-certificates.crt
cd /var/packages/EmbyServer/target/mono/bin
./cert-sync /etc/ssl/certs/ca-certificates.crt
cd /volume1/web/mb3admin.com
wget https://raw.githubusercontent.com/zliuzz/embyonekey/master/mb3admin.com.cert.pem
wget https://raw.githubusercontent.com/zliuzz/embyonekey/master/mb3admin.com.key.pem
cat mb3admin.com.cert.pem >> /etc/ssl/certs/ca-certificates.crt
cd /usr/local/etc/nginx/conf.d/*-*-*-*
wget https://raw.githubusercontent.com/zliuzz/embyonekey/master/user.conf
nginx -s reload
done

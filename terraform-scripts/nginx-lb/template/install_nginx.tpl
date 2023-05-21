#!/bin/bash
set -e

apt update

apt install -y nginx
apt install -y php-fpm

cat > "/etc/nginx/nginx.conf" <<EOF
user www-data;
worker_processes auto;
events {
worker_connections 1024;
}

http {

    include mime.types;

    server {

       listen 80;

       root /website_template/;

       index info.php;

    #    location ~\.php {
    #             include fastcgi.conf;
    #             fastcgi_pass unix:/run/php/php7.4-fpm.sock;
    #    }
   }
}
EOF

systemctl enable nginx
systemctl restart nginx

systemctl enable php-fpm
systemctl restart php-fpm
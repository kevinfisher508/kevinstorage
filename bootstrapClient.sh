#!/usr/bin/env bash


printf "nameserver 8.8.8.8\noptions edns0" > /etc/resolv.conf
sudo apt-get update
#sudo apt-get install -y nginx
apt-get install --no-install-recommends python-apt apt-transport-https -y


#sudo cp /vagrant/confCli/index.html /var/www/html/
#sudo sh /vagrant/iptables_n.sh

#if ! [ -L /etc/nginx/conf.d ]; then
#  rm -rf /etc/nginx/conf.d
#  ln -fs /vagrant/confCli /etc/nginx/conf.d
#  ln -fs /vagrant/htmlCli /var/www/html
#fi

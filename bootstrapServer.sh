#!/usr/bin/env bash


printf "nameserver 8.8.8.8\noptions edns0" > /etc/resolv.conf
printf "127.0.0.1       localhost\n127.0.1.1       vagrant.vm      vagrant\n10.0.55.14		client			client\n127.0.0.1		server			server" > /etc/hosts
sudo ssh-keyscan -H 10.0.55.14 >> ~/.ssh/known_hosts


sudo apt-add-repository --yes --update ppa:ansible/ansible


sudo apt-get update
sudo apt install -y apt-transport-https software-properties-common python-apt
sudo apt-get install -y ansible
sudo cp /vagrant/hosts /etc/ansible/hosts
sudo cp /vagrant/ansible.cfg /etc/ansible/ansible.cfg
ansible-playbook /vagrant/playbook.yml


#sudo cp /vagrant/confSrv/index.html /var/www/html/
#sudo cp /vagrant/confSrv/prom.conf /etc/nginx/conf.d/
#sudo rm -f /etc/nginx/site-enabled/*

#if ! [ -L /etc/nginx/conf.d ]; then
#  rm -rf /etc/nginx/conf.d
#  ln -fs /vagrant/confSrv /etc/nginx/conf.d
#  ln -fs /vagrant/htmlSrv /var/www/html
#fi
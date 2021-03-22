#!/bin/bash
#export iptables="iptables"
#local
export LAN1=eth1
export LAN1_IP=10.0.55.16
export LAN1_NET="10.0.55.0/24"

export SRV_IP=10.0.55.16
iptables -F
iptables -F -t nat
iptables -F -t mangle
iptables -X
iptables -t nat -X
iptables -t mangle -X
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -i lo -j ACCEPT
#iptables -A INPUT -s $SRV_IP -j ACCEPT
iptables -A OUTPUT -d $SRV_IP -j ACCEPT
iptables -A INPUT -s $SRV_IP -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -s $SRV_IP -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -s $SRV_IP -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -s $SRV_IP -p tcp --dport 9090 -j ACCEPT
iptables -A INPUT -s $SRV_IP -p tcp --dport 9100 -j ACCEPT
#/sbin/iptables-save > /etc/sysconfig/iptables

#!/bin/bash
#export iptables="iptables"
#local
export LAN1=eth1
export LAN1_IP=10.0.55.16
export LAN1_NET="10.0.55.0/24"

export WAN1=eth2
export WAN1_IP=192.168.1.211
export WAN1_NET="192.168.1.0/24"

export SRV_IP=10.0.55.16

iptables -t nat -A PREROUTING -i eth2 -p tcp -m tcp --dport 9200 -j DNAT --to-destination 10.0.55.16:9200
#iptables -t nat -A PREROUTING -i eth2 -p tcp -m tcp --dport 9090 -j DNAT --to-destination 10.0.55.16:9090
iptables -t nat -A PREROUTING -i eth2 -p tcp -m tcp --dport 5601 -j DNAT --to-destination 10.0.55.16:5601
#iptables -t nat -A PREROUTING -i eth2 -p tcp -m tcp --dport 3000 -j DNAT --to-destination 10.0.55.16:3000
#iptables -t nat -A PREROUTING -i eth2 -p tcp -m tcp --dport 9100 -j DNAT --to-destination 10.0.55.16:9100

#/sbin/iptables-save > /etc/sysconfig/iptables


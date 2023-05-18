#!/bin/bash


iptables -L
iptables -t nat -A OUTPUT -p tcp -j DNAT --to-destination 10.17.0.3:4000
iptables -t nat -A OUTPUT -p udp -j DNAT --to-destination 10.17.0.2:4000

/usr/sbin/named -f -c /etc/bind/named.conf -u bind
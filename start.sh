#!/bin/bash

connect_to_sshuttle() {
    ip route add local default dev lo table 100
    ip rule add fwmark 1 lookup 100
    ip -6 route add local default dev lo table 100
    ip -6 rule add fwmark 1 lookup 100

    if [ -z "$SSH_KEY" ]; then
        sshuttle --no-latency-control --dns -r $SSH_USER@$SSH_HOST 0.0.0.0/0 --method tproxy \
            --ssh-cmd "sshpass -p $SSH_PASSWORD ssh -o "StrictHostKeyChecking=no" -p $SSH_PORT" \
            -x $SSH_HOST -x 127.0.0.1 -x 172.17.0.0/16 -x 172.21.0.0/24 -x 172.22.0.0/24 -x 172.23.0.0/24 -x 10.17.0.0/24 -x 192.168.1.0/24 \
            --disable-ipv6
    else
        chmod 600 /app/key.pem
        sshuttle --no-latency-control --dns -r $SSH_USER@$SSH_HOST 0.0.0.0/0 --method tproxy \
            --ssh-cmd "ssh -o "StrictHostKeyChecking=no" -i /app/key.pem -p $SSH_PORT" \
            -x $SSH_HOST -x 127.0.0.1 -x 172.17.0.0/16 -x 172.21.0.0/24 -x 172.22.0.0/24 -x 172.23.0.0/24 -x 10.17.0.0/24 -x 192.168.1.0/24 \
            --disable-ipv6
    fi

}

/usr/sbin/named -f -c /etc/bind/named.conf -u bind &
connect_to_sshuttle

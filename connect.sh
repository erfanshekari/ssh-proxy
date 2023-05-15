#!/bin/bash

if [ -z "$SSH_KEY" ]
then
    sshpass -p $SSH_PASSWORD ssh -p $SSH_PORT -o "StrictHostKeyChecking=no" -tt $SSH_USER@$SSH_HOST -D 0.0.0.0:$SOCKS5_PORT
else
    chmod 400 $SSH_KEY  
    ssh -i $SSH_KEY  -p $SSH_PORT -o "StrictHostKeyChecking=no" -tt $SSH_USER@$SSH_HOST -D 0.0.0.0:$SOCKS5_PORT
fi


#!/bin/bash

sshpass -p $SSH_PASSWORD ssh -p $SSH_PORT -o "StrictHostKeyChecking=no" $SSH_USER@$SSH_HOST -D 0.0.0.0:$SOCKS5_PORT
#!/bin/bash


if [ -z "$SSH_KEY" ]; then
    sshpass -p $SSH_PASSWORD ssh -p $SSH_PORT -o "StrictHostKeyChecking=no" -tt $SSH_USER@$SSH_HOST -D 0.0.0.0:1089
else
    chmod 600 /app/key.pem
    ssh -p $SSH_PORT -o "StrictHostKeyChecking=no" -tt -i /app/key.pem $SSH_USER@$SSH_HOST -D 0.0.0.0:1089
fi
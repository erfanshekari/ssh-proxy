#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root user or run with sudo"
  exit
fi

if [ -f .env ]; then
  export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
fi

if [ -z "$SSH_KEY" ]; then
    export SSH_KEY=./.env
fi

install_requirements() {
    docker --version
    if [ $? -ne 0 ]
    then
        curl -fsSL https://get.docker.com | sh
    fi
    docker compose pull
}

up_services() {
    docker compose up -d
}


down_services() {
    docker compose down
}

build_images() {
    docker compose build
}


case $1 in
    "install") install_requirements
    ;;
    "up") up_services
    ;;
    "down") down_services
    ;;
    "build") build_images
    ;;
esac
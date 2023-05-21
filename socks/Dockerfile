FROM alpine:3.17

RUN apk add --update curl bash openssh sshpass

WORKDIR /app

COPY ./start.ssh.sh /app/start.ssh.sh

RUN chmod +x start.ssh.sh
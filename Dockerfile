FROM alpine:3.17.3

RUN apk add --update curl bash openssh sshpass redsocks

WORKDIR /app

COPY . .

RUN chmod +x connect.sh

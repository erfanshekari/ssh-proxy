FROM alpine:3.17.3

RUN apk update

RUN apk add curl
RUN apk add --update bash openssh sshpass

WORKDIR /app

COPY . .

RUN chmod +x connect.sh

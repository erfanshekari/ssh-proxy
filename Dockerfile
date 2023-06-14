FROM internetsystemsconsortium/bind9:9.19

RUN apt-get update

RUN apt-get install -y iptables python3 python3-pip openssh-client sshpass sshuttle curl host

WORKDIR /manage

COPY ./start.sshuttle.sh ./start.sshuttle.sh
RUN chmod +x start.sshuttle.sh

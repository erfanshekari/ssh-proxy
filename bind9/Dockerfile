FROM internetsystemsconsortium/bind9:9.19

RUN apt-get install -y iptables

WORKDIR /manage

COPY ./run.sh ./run.sh
RUN chmod +x run.sh

CMD ["./run.sh"]
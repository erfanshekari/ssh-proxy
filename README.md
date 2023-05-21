# UDP/TCP Tunnel Over OpenSSH
The problem is that the OpenSSH connection itself does not support UDP, so it is not a good solution for VPN. But with the power of TProxy we can also send udp traffic which solves common problems related to DNS queries etc.

This setup will provide you with v2ray and bind9 services which you can customize the configurations according to your needs.
Customize the ports in the compose.override.yaml file.
~~~yaml
services:
  proxy:
    ports:
      - '53:53/udp' # DNS Server (bind9)
      - '8080:8080' # HTTP Proxy (v2ray)
      - '1089:1089' # Socks5 Proxy (v2ray)
~~~

# How to Install
First Clone repository
~~~shell
git clone https://github.com/erfanshekari/ssh-proxy
~~~
Then change current directory to ssh-proxy
~~~shell
cd ssh-proxy
~~~
Now you need to install docker and pull images. The command below will do that for you.
~~~shell
sudo ./manage.sh install
~~~

# How to connect
First set Environment variables in .env file like this example:
### Using Password:
~~~shell
SSH_HOST=x.x.x.x
SSH_PORT=22
SSH_USER=root
SSH_PASSWORD=xxxxx
~~~
### Using Private Key:
~~~shell
SSH_HOST=x.x.x.x
SSH_PORT=22
SSH_USER=root
SSH_KEY=/path/to/key.pem
~~~
after that run services:
~~~shell
sudo ./manage.sh up
~~~

# How to disconnect
~~~shell
sudo ./manage.sh down
~~~
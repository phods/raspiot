# raspiot


# header H1
## header H2
### header H3
#### header H4
##### header H5
###### header H6

How to configure a raspberry for IOT, with docker, Mosquitto, Node-Red, Grafana, influxDB, Postgres, Portainer, and Adminer.

1- download the raspbian img from:
https://www.raspberrypi.org/downloads/raspberry-pi-desktop/

2- using o rufus "burn" the iso in the sd

3- boot the sd, configure wifi, enable vnc and ssh

4- install docker & docker-compose

$ sudo apt update && sudo apt upgrade -y
$ curl -sSL https://get.docker.com | sh
$ sudo usermod -aG docker pi
$ sudo apt install libffi-dev libssl-dev python3 python3-pip
$ sudo apt remove python-configparser
$ sudo pip3 install docker-compose
$ reboot

# header H1
The reboot is only required to be able to execute docker commands as normal Pi user without the sudo command.

5- confirm using the docker-compose ps

docker-compose -f {compose file name} up -d 

docker-compose -f docker-compose.yml up -d 

( to run the compose in background)

docker exec -it influxdb influx


pihole
https://github.com/pi-hole/docker-pi-hole/#running-pi-hole-docker
breask

https://www.youtube.com/watch?v=dH3DdLy574M&ab_channel=NetworkChuck


# raspiot

How to configure a raspberry for IOT, with docker, Mosquitto, Node-Red, Grafana, influxDB, Postgres, Portainer, and Adminer.

1- download the raspbian img from:
https://www.raspberrypi.org/downloads/raspberry-pi-desktop/

2- using o rufus "burn" the iso in the sd

3- boot the sd, configure wifi, enable vnc and ssh

4- install docker

sudo apt-get update && sudo apt-get upgrade

curl -sSL https://get.docker.com | sh

5- Once Docker has finished installing to the Pi, there are a couple more things we need to do.

For another user to be able to interact with Docker, it needs to be added to the docker group.

So our next step is to add our pi user to the docker group by using the command below.

sudo usermod -aG docker pi

ince we made some changes to our pi user, we will now need to log out and log back in for it to take effect.

You can log out by running the following command in the terminal.

logout
3. Once you have logged back in, you can verify that the docker group has been successfully added to your user by running the following command.

groups

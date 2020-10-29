# RaspIOT
## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Extras](#extras)

## General info
How to configure a raspberry for IOT, with docker, Mosquitto, Node-Red, Grafana, influxDB, Postgres, Portainer, Adminer, Pi-Hole.
	
## Technologies
Project is created with:
* docker
* Mosquitto: 2.33
* Node-Red: 999
	
## Setup
1- download the raspbian img from:
https://www.raspberrypi.org/downloads/raspberry-pi-desktop/

2- using o rufus "burn" the iso in the sd
3- boot the sd, configure wifi, enable vnc and ssh
4- install docker & docker-compose
```
$ sudo apt update && sudo apt upgrade -y
$ curl -sSL https://get.docker.com | sh
$ sudo usermod -aG docker pi
$ sudo apt install libffi-dev libssl-dev python3 python3-pip
$ sudo apt remove python-configparser
$ sudo pip3 install docker-compose
$ reboot

```
The reboot is only required to be able to execute docker commands as normal Pi user without the sudo command.

5- confirm using 
```
docker-compose ps
```
6- copy your docker-compose.yml file to an especif path

7- run you compose
```
docker-compose -f {compose file name} up -d 

docker-compose -f docker-compose.yml up -d 

( -d  to run the compose in background)
```


docker exec -it influxdb influx


pihole
https://github.com/pi-hole/docker-pi-hole/#running-pi-hole-docker


https://www.youtube.com/watch?v=dH3DdLy574M&ab_channel=NetworkChuck


https://www.youtube.com/watch?v=dH3DdLy574M&ab_channel=NetworkChuck


## EXtras:
- Enabling SSH on Raspberry Pi Without a Screen
To enable SSH on your Raspberry Pi perform the following steps:

1-Power off your Raspberry Pi and remove the SD card.
2-Insert the SD card into your computer’s card reader. The SD card will mount automatically.
3-Navigate to the SD card boot directory using your OS file manager. Linux and macOS users can also do this from the command line.
4-Create a new empty file named ssh, without any extension, inside the boot directory.
5-Remove the SD card from your computer and put it in your Raspberry Pi.
6-Power on your Pi board. On boot Pi will check whether this file exists and if it does, SSH will be enabled and the file is removed.
7-Once Raspberry Pi boots up you can SSH into it.

```
sudo systemctl enable sshsudo systemctl start ssh
```

- Configuring wifi without screen
1-Power off your Raspberry Pi and remove the SD card.
2-Insert the SD card into your computer’s card reader. The SD card will mount automatically.
3-Navigate to the SD card boot directory using your OS file manager. Linux and macOS users can also do this from the command line.
4-Create a new empty file named wpa_supplicant.conf, inside the boot directory.
5-Add the lines below, replacing variables with your SSID and password, and change the country value if needed.
Insert your Raspbian SD card into your computer.

```
country=US
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
network={
ssid="YOURSSID"
scan_ssid=1
psk="YOURPASSWORD"
key_mgmt=WPA-PSK
}
```

The wireless configuration on the Raspberry Pi is located in /etc/wpa_supplicant.
You can edit the configuration file with nano:
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf

- Network configuration
If you need a static IP on your network, the interface configuration can be done in dhcpcd.conf:

Open the file:
sudo nano /etc/dhcpcd.conf
Find the “Example static IP configuration” paragraph.
Uncomment every line you need (probably ip_address, routers and domaine_name_servers), and change the values to adapt to your network.
```
interface wlan0
static ip_address=192.168.1.10/24
static routers=192.168.1.1
static domain_name_servers=8.8.8.8
```
Save and exit, then reboot the Raspberry Pi:
```
sudo reboot
```

- How to Reset a Forgotten Raspberry Pi Password

1-Power down the Pi and remove the SD card. Insert it into your PC.
2-Edit cmdline.txt
The boot partition should be visible and contain a file named “cmdline.txt”. Edit this file in a text editor and add the following to the end of the existing text :
```
init=/bin/sh
```
Before:
```
dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1 root=PARTUUID=04ceb741-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait
```
After:
```
dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1 root=PARTUUID=04ceb741-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait init=/bin/sh
```

Make sure it is all one line! Save the text file and eject the SD card from the PC.

Step 4 – Reset the Pi Password
Insert the card into the Pi with a monitor and keyboard connected. Power up the Pi. There may be a delay but you should be presented with a cursor.

At the prompt type the following command :
```
mount -o remount, rw /
```
If this results in an error message such as :
```
/bin/sh: 0: can’t access tty; job control turned off [ 21.366191] random: crng init done
```
Try the mount command again :
```
mount -o remount, rw /
```

Finally you can now attempt to change the password :
```
passwd pi
```

You will then be prompted for a new password. Enter it carefully and press the [Return] key. It will now ask you to retype the password.

The password has been changed.

Now type the following commands :
```
sync
exec /sbin/init
```
The Pi will continue to boot and return you to the normal command line prompt.

Shutdown the Pi and power it off.
```
sudo halt
```

Step 5 – Edit cmdline.txt
Remove the SD card from the Pi and using the PC edit the “cmdline.txt” file again and remove the “init=/bin/sh” text you added in Step 2.

Safely eject the SD card from the PC and re-insert into the Pi.

Power up the Pi and your new password should now be active.


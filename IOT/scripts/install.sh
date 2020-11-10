sudo apt update && sudo apt upgrade -y
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker pi
sudo apt install libffi-dev libssl-dev python3 python3-pip
sudo apt remove python-configparser
sudo pip3 install docker-compose
reboot
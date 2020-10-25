#!/usr/bin/env bash

set -e

function error { echo -e "[Error] $*"; exit 1; }
function warn  { echo -e "[Warning] $*"; }

DIR_ME="ubuntu"
DIR_HASSIO=/home/ubuntu/docker/hassio

sudo apt-get update

echo "[Info] Install dependencies: bash jq curl avahi-daemon dbus software-properties-common apparmor-utils"
#sudo snap install jq
sudo apt-get install bash jq curl avahi-daemon dbus software-properties-common apparmor-utils

echo ""
echo ""
echo ""
echo "[Info] Install apt-transport-https ca-certificates curl software-properties-common -y"
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

echo ""
echo ""
echo ""
echo "[Info] Install Docker Ubuntu"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce -y

sudo chmod 777 /etc
sudo su

echo ""
echo ""
echo ""
echo "[Info] Install Home Assistant -"
sudo curl -sL https://raw.githubusercontent.com/icanfixitweb/Hassio-Virtual-Machine/master/hassio_install_script/original_script/installer.sh | bash -s -- -d $DIR_HASSIO

echo ""
echo ""
echo ""
echo "[Info] Install network-manager"
sudo apt-get install network-manager

echo ""
echo ""
echo ""
echo "[Info] Install Home Assistant from latest script from Home assistant GitHub (working as of Sept. 2020)"
sudo curl -sL https://raw.githubusercontent.com/home-assistant/supervised-installer/master/installer.sh | bash -s
echo ""
echo ""
echo ""
echo "Once the installation is completed go to http://hassio.local:8123/ or http://yourIPaddress:8123/"
echo "(replace yourIPaddress with your actual IP address) from your web browser to access your new Home Assistant installation."
echo ""
echo ""
echo "Baixar o Portainerio" 
echo "docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /path/on/host/data:/data portainer/portainer"
echo "docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /path/to/certs:/certs -v portainer_data:/data portainer/portainer -H tcp://<DOCKER_HOST>:<DOCKER_PORT> --tlsverify"
echo ""
echo ""

echo "[Info] Create folders for mosquitto"
sudo mkdir /mosquitto
sudo mkdir /mosquitto/config
sudo mkdir /mosquitto/data
sudo mkdir /mosquitto/log
sudo chmod 757 mosquitto
sudo chmod 757 mosquitto/config
#sudo chmod 755 mosquitto/data
#sudo chmod 755 mosquitto/log

echo "[Info] Download mosquitto.conf for "
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/mosquitto.conf > "/mosquitto/config/mosquitto.conf"
                                                                                                # "/var/lib/docker/volumes/mosquitto.conf"

sudo docker run -it –name=“mosquitto” -p 1883:1883 -p 1884:1884 -p 8883:8883 -p 8884:8884 -p 9001:9001 -v mosquitto.conf:/mosquitto/config/mosquitto.conf eclipse-mosquitto
# Example: sudo docker run -it –name=“mosquitto” –restart on-failure -p 1883:1883 -p 9001:9001 -p 1883:8884 -p 1883:8883 -p 9001:9001 -v /srv/mqtt/config:/mqtt/config:ro  -v /srv/mqtt/log:/mqtt/log  -v /srv/mqtt/data/:/mqtt/data/ eclipse-mosquitto


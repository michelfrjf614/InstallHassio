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

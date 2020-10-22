
#!/usr/bin/env bash

function error { echo -e "[Error] $*"; exit 1; }
function warn  { echo -e "[Warning] $*"; }
set -e


DIR_ME = ubuntu
DIR_HASSIO = /home/${DIR_ME}/docker/hassio


echo "[Info] Install dependencies: bash jq curl avahi-daemon dbus software-properties-common apparmor-utils“
sudo apt-get install bash jq curl avahi-daemon dbus software-properties-common apparmor-utils

echo "[Info] Install apt-transport-https ca-certificates curl software-properties-common -y“
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y


echo "[Info] Install Docker Ubuntu“
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce -y


echo "[Info] Install Docker“
curl -sL https://raw.githubusercontent.com/icanfixitweb/Hassio-Virtual-Machine/master/hassio_install_script/original_script/installer.sh | bash -s -- -d $DIR_HASSIO


echo "[Info] Install Home Assistant from latest script from Home assistant GitHub (working as of Sept. 2020)
curl -sL https://raw.githubusercontent.com/home-assistant/supervised-installer/master/installer.sh | bash -s

# If Network Manager is not installed [[error] missing: NetworkManager] install it first and then run the command above again:
# sudo apt-get install network-manager


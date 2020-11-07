#!/usr/bin/env bash

set -e

function error { echo -e "[Error] $*"; exit 1; }
function warn  { echo -e "[Warning] $*"; }

DIR_ME="ubuntu"
DIR_HASSIO=/home/ubuntu/docker/hassio

echo ""
echo ""
echo ""
echo "[Update] update SO"
sudo apt-get update

echo ""
echo ""
echo ""
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
#echo "[Info] Install Home Assistant - from https://github.com/icanfixitweb/Hassio-Virtual-Machine/tree/master/hassio_install_script"
#sudo curl -sL https://raw.githubusercontent.com/icanfixitweb/Hassio-Virtual-Machine/master/hassio_install_script/original_script/installer.sh | bash -s -- -d $DIR_HASSIO

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
echo "[Info] Create folders for mosquitto"
sudo mkdir /usr/share/hassio/share/mosquitto/
sudo mkdir /usr/share/hassio/share/mosquitto/config/
sudo mkdir /usr/share/hassio/share/mosquitto/data
sudo mkdir /usr/share/hassio/share/mosquitto/log

sudo chmod 777 /usr/share/hassio/share/mosquitto/
sudo chmod 777 /usr/share/hassio/share/mosquitto/config/
sudo chmod 777 /usr/share/hassio/share/mosquitto/data
sudo chmod 777 /usr/share/hassio/share/mosquitto/log

echo ""
echo ""
echo ""
echo "[Info] File ACL - accesscontrollist"
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/accesscontrollist > "/usr/share/hassio/share/mosquitto/config/accesscontrollist"
sudo chmod 777 /usr/share/hassio/share/mosquitto/config/accesscontrollist

echo ""
echo ""
echo ""
echo "[Info] Download addMosquitto.conf"
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/addMosquitto.conf > "/usr/share/hassio/share/mosquitto/config/addMosquitto.conf"
sudo chmod 777 /usr/share/hassio/share/mosquitto/config/addMosquitto.conf

echo ""
echo ""
echo ""
echo "[Info] File Password - passwd"
echo "" > "/share/mosquitto/config/passwd"
sudo chmod 777 /usr/share/hassio/share/mosquitto/config/passwd

echo ""
echo ""
echo ""
echo "[Info] Run mosquitto on docker "
           sudo docker run -it --name=mosquitto                       -p 1883:1883 -p 1884:1884 -p 8883:8883 -p 8884:8884 -p 9001:9001 -v /mosquitto/:/mosquitto/           -v /mosquitto/log:/mosquitto/log -v /mosquitto/data/:/mosquitto/data/  eclipse-mosquitto
# Example: sudo docker run -it --name=“mosquitto” –restart on-failure -p 1883:1883 -p 1884:1884 -p 8883:8883 -p 8884:8884 -p 9001:9001 -v /srv/mqtt/config:/mqtt/config:ro  -v /srv/mqtt/log:/mqtt/log       -v /srv/mqtt/data/:/mqtt/data/        eclipse-mosquitto
# Example: sudo docker run -it --name=mosquitto                       -p 1883:1883 -p 1884:1884 -p 8883:8883 -p 8884:8884 -p 9001:9001 -v mosquitto.conf:/mosquitto/config/mosquitto.conf eclipse-mosquitto
# para permnitira a configuracao de usuario e senha
#--env , -e		Set environment variables
# docker run -e MYVAR1 --env MYVAR2=foo --env-file ./env.list ubuntu bash
#export VAR1=value1
#export VAR2=value2
#$ docker run --env VAR1 --env VAR2 ubuntu env | grep VAR
#VAR1=value1
#VAR2=value2



echo ""
echo ""
echo ""
echo "[Info] Run mosquitto on docker "
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/config.yaml > "/usr/share/hassio/homeassistant/configuration.yaml"


echo ""
echo ""
echo "Baixar o Portainerio" 
sudo docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /path/on/host/data:/data portainer/portainer
echo ""
echo ""
echo "[Info] Referencia de erros:"
echo "Para imagem docker https://hub.docker.com/_/eclipse-mosquitto"
echo "Para problemas de pasta com o parametro -v... https://github.com/eclipse/mosquitto/issues/457"
echo ""
echo ""
echo "[Info] Para Configuracoes no hassio"
echo "https://www.home-assistant.io/docs/mqtt/broker#run-your-own"
echo "https://community.home-assistant.io/t/solved-connect-ha-to-mqtt-broker-with-tls-ca-crt/158415"
echo ""
echo ""
echo "Once the installation is completed go to http://hassio.local:8123/ or http://yourIPaddress:8123/"
echo "(replace yourIPaddress with your actual IP address) from your web browser to access your new Home Assistant installation."

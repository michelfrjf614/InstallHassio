#!/usr/bin/env bash

set -e

function error { echo -e "[Error] $*"; exit 1; }
function warn  { echo -e "[Warning] $*"; }

DIR_ME="ubuntu"
DIR_HASSIO=/home/ubuntu/docker/hassio


# info "Digite o nome do nome dominio duckdns. Exemplo se for NOME_DO_DNS.duckdns.org informar O NOME_DO_DNS: "
# read answer < /dev/tty
read -p "Digite o nome do nome dominio duckdns. Exemplo se for NOME_DO_DNS.duckdns.org informar O NOME_DO_DNS: " answer

echo ""
echo ""
echo "[Update] update SO"
sudo apt-get -y update

echo ""
echo ""
echo "[Info] Install dependencies: bash jq curl avahi-daemon dbus software-properties-common apparmor-utils"
#sudo snap install jq
sudo apt-get -y install bash jq curl avahi-daemon dbus software-properties-common apparmor-utils

echo ""
echo ""
echo "[Info] Install apt-transport-https ca-certificates curl software-properties-common -y"
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common -y

echo ""
echo ""
echo "[Info] Install Docker Ubuntu"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get -y update
sudo apt-get -y install docker-ce -y

sudo chmod 777 /etc
sudo su

echo ""
echo ""
echo "[Info] Install network-manager"
sudo apt-get -y install network-manager

echo ""
echo ""
echo "[Info] Install Home Assistant from latest script from Home assistant GitHub (working as of Sept. 2020)"
sudo curl -sL https://raw.githubusercontent.com/home-assistant/supervised-installer/master/installer.sh | bash -s

echo ""
echo ""
echo "Run the Portainerio" 
sudo docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /path/on/host/data:/data portainer/portainer

echo ""
echo ""
echo "[Info] Aguardando 40 segundos para configurar todo o mosquitto"
# sleep 5
# echo "[Info] falta 45 segundos"
# sleep 5
# echo "[Info] falta 40 segundos"
sleep 5
echo "[Info] falta 35 segundos"
sleep 5
echo "[Info] falta 30 segundos"
sleep 5
echo "[Info] falta 25 segundos"
sleep 5
echo "[Info] falta 20 segundos"
sleep 5
echo "[Info] falta 15 segundos"
sleep 5
echo "[Info] falta 10 segundos"
sleep 5
echo "[Info] falta 5 segundos"
sleep 5
echo "[Info] passou 40 segundo"

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
echo "[Info] copy configuration.yaml to homeassistant"
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/configuration.yaml > "/usr/share/hassio/homeassistant/configuration.yaml"
sed -i "s/smartboardneww/$answer/" /usr/share/hassio/homeassistant/configuration.yaml


echo ""
echo ""
echo "[Info] copy light.yaml to homeassistant"
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/light.yaml > "/usr/share/hassio/homeassistant/light.yaml"
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/groups.yaml > "/usr/share/hassio/homeassistant/groups.yaml"
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/automations.yaml > "/usr/share/hassio/homeassistant/automations.yaml"
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/scripts.yaml > "/usr/share/hassio/homeassistant/scripts.yaml"
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/scenes.yaml > "/usr/share/hassio/homeassistant/scenes.yaml"


echo ""
echo ""
echo "[Info] File ACL - accesscontrollist"
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Mosquitto/Config/accesscontrollist > "/usr/share/hassio/share/mosquitto/config/accesscontrollist"
sudo chmod 777 /usr/share/hassio/share/mosquitto/config/accesscontrollist


echo ""
echo ""
echo "[Info] Download addMosquitto.conf"
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Mosquitto/Config/addMosquitto.conf > "/usr/share/hassio/share/mosquitto/config/addMosquitto.conf"
sudo chmod 777 /usr/share/hassio/share/mosquitto/config/addMosquitto.conf


echo ""
echo ""
echo "[Info] File Password - passwd"
echo "" > "/usr/share/hassio/share/mosquitto/config/passwd"
sudo chmod 777 /usr/share/hassio/share/mosquitto/config/passwd
sudo chmod 777 /usr/share/hassio/ssl

echo ""
echo ""
info "Once the installation is completed go to http://hassio.local:8123/ or http://yourIPaddress:8123/ in the future http://$answer.duckdns.org/"
warn "(replace yourIPaddress with your actual IP address) from your web browser to access your new Home Assistant installation."

echo ""
echo ""
echo "##[Info] Referencia de erros:"
echo "##Para imagem docker https://hub.docker.com/_/eclipse-mosquitto"
echo "##Para problemas de pasta com o parametro -v... https://github.com/eclipse/mosquitto/issues/457"

echo ""
echo ""
echo "##[Info] Para Configuracoes no hassio"
echo "##https://www.home-assistant.io/docs/mqtt/broker#run-your-own"
echo "##https://community.home-assistant.io/t/solved-connect-ha-to-mqtt-broker-with-tls-ca-crt/158415"

#echo ""
#echo ""
#echo ""
#echo "[Info] Run mosquitto on docker "
#           sudo docker run -it --name=mosquitto                       -p 1883:1883 -p 1884:1884 -p 8883:8883 -p 8884:8884 -p 9001:9001 -v /mosquitto/:/mosquitto/           -v /mosquitto/log:/mosquitto/log -v /mosquitto/data/:/mosquitto/data/  eclipse-mosquitto
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

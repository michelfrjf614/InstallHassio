#!/usr/bin/env bash

reset=`tput sgr0`
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`$
darkblue=`tput setaf 4`
pink=`tput setaf 5`
whiteblue=`tput setaf 6`
white=`tput setaf 7`

DIR_ME="ubuntu"
DIR_HASSIO=/home/ubuntu/docker/hassio

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
sudo docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /path/on/host/data:/data portainer/portainer-ce

echo ""
echo ""
echo "[Info] Aguardando 60 segundos para configurar todo o mosquitto"
sleep 5
echo "[Info] falta 55 segundos"
sleep 5
echo "[Info] falta 50 segundos"
sleep 5
echo "[Info] falta 45 segundos"
sleep 5
echo "[Info] falta 40 segundos"
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
echo "[Info] passou 60 segundos"

echo ""
echo ""
echo "[Info] Aguardando 60 segundos para configurar todo o mosquitto"
sleep 5
echo "[Info] falta 55 segundos"
sleep 5
echo "[Info] falta 50 segundos"
sleep 5
echo "[Info] falta 45 segundos"
sleep 5
echo "[Info] falta 40 segundos"
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
echo "[Info] passou 60 segundos"

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



info "Digite o nome do nome dominio no duckdns. Exemplo se for NOME_DO_DNS.duckdns.org informar o NOME_DO_DNS:"
read answer < /dev/tty
sed -i "s/smartboardneww/$answer/" /usr/share/hassio/homeassistant/configuration.yaml


echo ""
echo ""
echo "[Info] copy light.yaml, groups.yaml, automations.yaml, scripts.yaml e scenes.yaml  to homeassistant"
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/light.yaml > "/usr/share/hassio/homeassistant/light.yaml"
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/groups.yaml > "/usr/share/hassio/homeassistant/groups.yaml"
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/automations.yaml > "/usr/share/hassio/homeassistant/automations.yaml"
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/scripts.yaml > "/usr/share/hassio/homeassistant/scripts.yaml"
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/scenes.yaml > "/usr/share/hassio/homeassistant/scenes.yaml"






#########################################################################################################################################################
#### Aqui inicia as informações para controle de Usuários
#########################################################################################################################################################

echo ""
echo ""
echo "##[Info] Install zip"
sudo apt-get update  -y
sudo apt install zip -y

echo ""
echo ""
echo "##[Info] Verifica a versão do Python deve ser 3.8, caso contrario o diretorio precisa ser ajustado"
python3 -V
#sudo apt install python3.8  -y
#python3 -V
#python3.8 -V
#sudo update-alternatives —install /usr/bin/python3 python3 /usr/bin/python3.6 1
#sudo update-alternatives —install /usr/bin/python3 python3 /usr/bin/python3.8 2
#sudo update-alternatives —config python3

echo ""
echo ""
echo "##[Info] Install PIP"
sudo apt-get install python3-pip -y

echo ""
echo ""
echo "##[Info] Install testresources"
sudo apt install python3-testresources -y

echo ""
echo ""
echo "##[Info] Install paramiko"
mkdir -p build/python/lib/python3.8/site-packages
pip3 install paramiko -t build/python/lib/python3.8/site-packages --system

echo ""
echo ""
echo "##[Info] Cria o Zip packageParamiko"
cd build
zip -r packageParamiko.zip .

aws --version
#Caso não retorne informações 
   curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip
   unzip awscliv2.zip
   sudo ./aws/install --update

echo ""
echo ""
echo "##[Info] Sobe o arquivo packageParamiko para S3 de nome smartboards3"
aws s3 cp  packageParamiko.zip s3://smartboards3

echo ""
echo ""
echo "[Info] File Password - users.sh"
sudo curl -L https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Mosquitto/Users/users.sh > /usr/share/hassio/share/mosquitto/config/users.sh
#sudo curl -L https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Mosquitto/Config/sh/configUsers.sh > /usr/share/hassio/share/mosquitto/config/configUsers.sh

echo ""
echo ""
echo "[Info] File ACL - accesscontrollist"
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Mosquitto/Config/accesscontrollist > "/usr/share/hassio/share/mosquitto/config/accesscontrollist"
sudo chmod 777 /usr/share/hassio/share/mosquitto/config/accesscontrollist

echo ""
echo ""
echo "[Info] File Password - passwd"
echo "" > "/usr/share/hassio/share/mosquitto/config/passwd"
sudo chmod 777 /usr/share/hassio/share/mosquitto/config/passwd
sudo chmod 777 /usr/share/hassio/ssl

echo ""
echo ""
echo "[Info] Download addMosquitto.conf"
sudo curl -sL https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Mosquitto/Config/addMosquitto.conf > "/usr/share/hassio/share/mosquitto/config/addMosquitto.conf"
sudo chmod 777 /usr/share/hassio/share/mosquitto/config/addMosquitto.conf



echo ${yellow}

echo ""
echo ""
echo "Fist Set Finished"

echo ""
echo ""
echo "Once the installation is completed go to http://hassio.local:8123/ or http://yourIPaddress:8123/ in the future http://$answer.duckdns.org/"
echo "(replace yourIPaddress with your actual IP address) from your web browser to access your new Home Assistant installation."

echo ${red}

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

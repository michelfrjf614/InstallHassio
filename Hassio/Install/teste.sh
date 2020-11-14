#!/usr/bin/env bash

reset=`tput sgr0`
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
darkblue=`tput setaf 4`
pink=`tput setaf 5`
whiteblue=`tput setaf 6`
white=`tput setaf 7`


echo "Username: $1";
echo "Age: $2";
echo "Full Name: $3";
# bash userReg-positional-parameter.sh john 25 'John Smith'


info "Digite o nome do nome dominio no duckdns. Exemplo se for NOME_DO_DNS.duckdns.org informar o NOME_DO_DNS:"
read answer

sudo sed -i "s/smartboardneww/$answer/" /usr/share/hassio/homeassistant/configuration.yaml

echo ${red}

echo "Once the installation is completed go to http://hassio.local:8123/ or http://yourIPaddress:8123/ in the future http://$answer.duckdns.org/"

echo ${yellow}

echo "Once the installation is completed go to http://hassio.local:8123/ or http://yourIPaddress:8123/ in the future http://$answer.duckdns.org/"

echo ${green}

echo "Once the installation is completed go to http://hassio.local:8123/ or http://yourIPaddress:8123/ in the future http://$answer.duckdns.org/"

echo ${white}

echo "Once the installation is completed go to http://hassio.local:8123/ or http://yourIPaddress:8123/ in the future http://$answer.duckdns.org/"



#sudo curl -L https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/Install/teste.sh | bash teste.sh john 25 'John Smith'

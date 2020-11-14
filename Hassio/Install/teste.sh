#!/usr/bin/env bash

info "Digite o nome do nome dominio no duckdns. Exemplo se for NOME_DO_DNS.duckdns.org informar o NOME_DO_DNS:"
read answer < /dev/tty

sed -i "s/smartboardneww/$answer/" /usr/share/hassio/homeassistant/configuration.yaml

echo "Once the installation is completed go to http://hassio.local:8123/ or http://yourIPaddress:8123/ in the future http://$answer.duckdns.org/"



#sudo curl -L https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/Install/teste.sh | bash -s

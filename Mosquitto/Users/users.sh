#!/usr/bin/env bash

echo "Add user [$1]"

echo "user [$1]" >> /usr/share/hassio/share/mosquitto/config/accesscontrollist
echo "topic readwrite #" >> /usr/share/hassio/share/mosquitto/config/accesscontrollist
echo "" >> /usr/share/hassio/share/mosquitto/config/accesscontrollist


#sudo curl -L https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Mosquitto/Users/users.sh > users.sh
#users.sh nome_do_usuario 

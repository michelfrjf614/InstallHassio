#!/usr/bin/env bash

echo "Add user"

user teste > /usr/share/hassio/share/mosquitto/config/accesscontrollist_teste
topic readwrite # > /usr/share/hassio/share/mosquitto/config/accesscontrollist_teste
echo # > /usr/share/hassio/share/mosquitto/config/accesscontrollist_teste


#sudo curl -L https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/Users/users.sh | bash -s


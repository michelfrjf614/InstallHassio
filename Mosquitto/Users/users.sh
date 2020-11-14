#!/usr/bin/env bash

echo "Add user [$1]"

echo "user [$1]" >> /usr/share/hassio/share/mosquitto/config/accesscontrollist
echo "topic readwrite #" >> /usr/share/hassio/share/mosquitto/config/accesscontrollist
echo "" >> /usr/share/hassio/share/mosquitto/config/accesscontrollist

# API deve chahar esse dois comandos
# bash /usr/share/hassio/share/mosquitto/config/users.sh nome_do_usuario 

#!/usr/bin/env bash

echo “Baixando Shell”
https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/certificates/certificates.sh > /usr/share/hassio/share/mosquitto/certificatesFulll.sh


echo “Execuntando Shell”
bash /usr/share/hassio/share/mosquitto/certificatesFulll.sh

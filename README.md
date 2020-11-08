# InstallHassio
Bashes for Install

How to execute:

1) Segir esse tutorial https://aws.amazon.com/pt/blogs/iot/how-to-bridge-mosquitto-mqtt-broker-to-aws-iot/ até antes "udo apt-add-repository ppa:mosquitto-dev/mosquitto-ppa" 
1.1) Configurar as portas 9000, 8884, 8123, 1884, 8883, 1883, 81 para serem liberadas confome a imagem https://d2908q01vomqb2.cloudfront.net/f6e1126cedebf23e1463aee73f9df08783640400/2020/05/04/Screen-Shot-2020-04-22-at-2.18.38-PM.png



2) sudo curl -L https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/Install/InstallHass.io.sh | bash -s 
(pode ser o git insira alguns cararcteres especiais nesse url, caso tenha esse problema basta colar na url do Browser e depois de copiar vc pode executar)

3) you need to create um dominio no duckdns https://www.duckdns.org/
 
4) Install Mosquitto, MariaDB, Duckdns on "Hassio / Supervisor;"

5) Copy de infomations from Git to Hassio / Supervisor -> Mosquitto / MariaDB / Duckdns; ==> See file https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/Tools/configTools

6) Install File editor, Terminal & SSH on "Hassio / Supervisor (for help- optional);"

7)  Update your param broker on configuration.yaml
       mqtt:
          broker: testexpto.duckdns.org

8) copy file chain.pem:

set <o nome do DNS configurado no duckdns>
cp /usr/share/hassio/addons/data/core_duckdns/letsencrypt/$1.duckdns.org/chain.pem /usr/share/hassio/ssl


9) sudo curl -L https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/certificates/certificates.sh | bash -s 
(pode ser o git insira alguns cararcteres especiais nesse url, caso tenha esse problema basta colar na url do Browser e depois de copiar vc pode executar)


# Init system
echo "[Info] Run Hass.io"
systemctl start hassio-supervisor.service

# End system
echo "[Info] Finish Hass.io"
systemctl stop hassio-supervisor.service

# Change password of "ubuntu"
sudo passwd ubuntu

# Reset user and password of Home assistent
sudo rmdir /usr/share/hassio/homeassistant/.storage

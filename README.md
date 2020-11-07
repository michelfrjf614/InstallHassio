# InstallHassio
Bashes for Install

How to execute:

1) Segir esse tutorial https://aws.amazon.com/pt/blogs/iot/how-to-bridge-mosquitto-mqtt-broker-to-aws-iot/ até antes "udo apt-add-repository ppa:mosquitto-dev/mosquitto-ppa" 

2) Configurar as portas 9000, 8884, 8123, 1884, 8883, 1883, 81 para sereme liberadas no link https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#SecurityGroups:

3) sudo curl -L https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/Install/InstallHass.io.sh | bash -s (pode ser o git insira algun cararcter especisl nesse chama, caso tenha esse problema basta colar na url do Browser e depois de copiar vc pode executar)

4) Criar um dominio do duckdns
 
5) Install Mosquitto, MariaDB, Duckdns on "Hassio / Supervisor;"

6) Copy de infomations from Git to Hassio / Supervisor -> Mosquitto / MariaDB / Duckdns; ==> See file https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/Tools/configTools

7) Install File editor, Terminal & SSH on "Hassio / Supervisor (for help- optional);"

8) sudo curl -L https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/certificates/certificates.sh | bash -s (pode ser o git insira algun cararcter especisl nesse chama, caso tenha esse problema basta colar na url do Browser e depois de copiar vc pode executar)



if you need, you can use:
# Init system
echo "[Info] Run Hass.io"
systemctl start hassio-supervisor.service

# End system
echo "[Info] Finish Hass.io"
systemctl stop hassio-supervisor.service

# Change password of "ubuntu"
sudo passwd ubuntu

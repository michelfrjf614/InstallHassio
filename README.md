# A - Intalls Ubuntu on EC2 by AWS

1. You need to follow this tutorial (https://aws.amazon.com/pt/blogs/iot/how-to-bridge-mosquitto-mqtt-broker-to-aws-iot/)
   - Until Fig. 9 (https://d2908q01vomqb2.cloudfront.net/f6e1126cedebf23e1463aee73f9df08783640400/2020/05/04/Screen-Shot-2020-04-22-at-2.18.38-PM.png)
     - Add the porta 8123, 1883, 8883, 1884, 8884, 9000, 81 like image above to open ports
   - Ande stop before install "sudo apt-add-repository ppa:mosquitto-dev/mosquitto-ppa"

2. Create one domain on duckdns **https://www.duckdns.org/**. with the IP by EC2 from AWS (ipAWS)



# B - Intalls HASSIO on Ubuntu and config tools from HASSIO

1. Exec: **sudo curl -L https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/Install/InstallHass.io.sh | bash -s**
   - During the execution im input domain from duckdns

2. Uodate domain on duckdns **https://www.duckdns.org/** with the IP by EC2 from AWS (ipAWS)

3. Open ipAWS:8123 and on menu "Hassio / Supervisor" install Mosquitto, MariaDB, Duckdns

4. Copy the infomations from git to Hassio / Supervisor -> Mosquitto / MariaDB / Duckdns -> Con figuration. Get the information in the link **https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/Tools/configTools** 

5. Install the tools (this is optional) File editor, Terminal & SSH on "Hassio / Supervisor



# C - Built the certification to Mosquittto and firmware ESP8266

1. sudo curl -L https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/certificates/certificates.sh | bash -s



# D - Commands to hekp you

1. [Info] Init service - Run Hass.io
   - systemctl start hassio-supervisor.service

2. [Info] End service -  Finish Hass.io
   - systemctl stop hassio-supervisor.service

3. [Info] Change password of "ubuntu"
   - sudo passwd ubuntu

4. [Info] Reset user and password of Home assistent
   - sudo rmdir /usr/share/hassio/homeassistant/.storage

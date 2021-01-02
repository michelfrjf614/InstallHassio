# A - Intalls Ubuntu on EC2 by AWS
1. You need to follow this tutorial (in this video you can visually see the information: https://www.youtube.com/watch?v=jFAipm0NsVA&ab_channel=SrceCde)
   - Open this link: https://console.aws.amazon.com/console/home?
      - Input "EC2" on field "Find Services": (like https://youtu.be/jFAipm0NsVA?t=104);
      - In the next page, click on button "Launch Instance": (https://youtu.be/jFAipm0NsVA?t=111);
      - In the next page, select "Ubuntu Server 20.04" (64-bits): (https://youtu.be/jFAipm0NsVA?t=114);
      - In the next page, click on button "Next": with de machine "Free tier eligible" selected (https://youtu.be/jFAipm0NsVA?t=124);
      - In the next page, click on button "Next";
      - In the next page, click on button "Next", again;
      - In the next page: (https://youtu.be/jFAipm0NsVA?t=140);
         - click on "click to add name tag";
         - input "Lambda-Layer";
         - and click on button "Next";
      - In the next page, clck on button "AddRule":
         - on filed "Type" select the value "HTTP";
         - Add the porta 8123, 1883, 8883, 1884, 8884, 9000, 81 like image above to open ports
            - Until Fig. 9 (https://d2908q01vomqb2.cloudfront.net/f6e1126cedebf23e1463aee73f9df08783640400/2020/05/04/Screen-Shot-2020-04-22-at-2.18.38-PM.png)
         - and click on button "Review and Launch";
         
      - In the next page, click on button "Launch": (https://youtu.be/jFAipm0NsVA?t=178)
         - select "Create a new pair";
         - and informe on "key pair name" the information "labdassh";
         - and click on the button "Download key pair";
         - check the checkbox;
         - click on button "Launch Instance":
         - after that, click on button "View INstance";
      - In the next page, 
        - check the instance 
        - click on button "conect";
      - In the next page, 
        - click on button "conect" again;

2. Create one domain on duckdns **https://www.duckdns.org/**. with the IP by EC2 from AWS (ipAWS)

3. Create one repository with name "smartboards3" in the link: https://s3.console.aws.amazon.com/s3/


# B - Intalls HASSIO on Ubuntu, config tools from HASSIO and confid datas to manager users

1. Exec: **sudo curl -L https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/Install/InstallHass.io.sh | bash -s**
   - During the execution input domain from duckdns

2. Uodate domain on duckdns **https://www.duckdns.org/** with the IP by EC2 from AWS (ipAWS)

3. Open ipAWS:8123 and on menu "Hassio / Supervisor" install Mosquitto, MariaDB, Duckdns

4. Copy the infomations from git to Hassio / Supervisor -> Mosquitto / MariaDB / Duckdns -> Configuration. Get the information in the link **https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/Tools/configTools** 
   - At the configuration duckdns chage o dns **smartboardneww**.duckdns.org to the dns inputed on duckdns


5. Install the tools (this is optional) File editor, Terminal & SSH on "Hassio / Supervisor




# Rever essa parte - Inicio

Vai até o IAM 
Click em Create role
  Selecione EC2  e click em next
  Depois selecione “AmazonS3FullAccess  e click em next
  Informe Name / “ec2 S3 access”

Crie mais uma rule 
  Selecione Lambda  e click em next
  Depois selecione “AWSLambdaBasicExecutionRole , selecione também “AmazonEC2FullAccess”, selecione também “AmazonS3FullAccess” e click em next
  Informe Name / “Lambda_ssh”

Video de referencia: https://www.youtube.com/watch?v=jFAipm0NsVA&ab_channel=SrceCde

Na Criação do instancia do EC2 selecione o iAM “ec2 S3 access” e “”

# Rever essa parte - Fim




# C - Built the certification to Mosquittto and firmware ESP8266

1. sudo curl -L https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/certificates/certificates.sh | bash -s
   - Update the IP on domain from duckdns;
   - Get the address showed in the final on terminal 

# D - Commands to hekp you

1. [Info] Init service - Run Hass.io
   - systemctl start hassio-supervisor.service

2. [Info] End service -  Finish Hass.io
   - systemctl stop hassio-supervisor.service

3. [Info] Change password of "ubuntu"
   - sudo passwd ubuntu

4. [Info] Reset user and password of Home assistent
   - sudo rmdir /usr/share/hassio/homeassistant/.storage 








*****************************************
** backup remover depois 
*****************************************
//1. You need to follow this tutorial (https://aws.amazon.com/pt/blogs/iot/how-to-bridge-mosquitto-mqtt-broker-to-aws-iot/)
//   - Until Fig. 9 (https://d2908q01vomqb2.cloudfront.net/f6e1126cedebf23e1463aee73f9df08783640400/2020/05/04/Screen-Shot-2020-04-22-at-2.18.38-PM.png)
//     - Add the porta 8123, 1883, 8883, 1884, 8884, 9000, 81 like image above to open ports
//   - Ande stop before install "sudo apt-add-repository ppa:mosquitto-dev/mosquitto-ppa"

//2. Create one domain on duckdns **https://www.duckdns.org/**. with the IP by EC2 from AWS (ipAWS)

# A - Intalls Ubuntu on EC2 by AWS
1. Open this link: https://console.aws.amazon.com/iam/home?#/roles
   - And create one IAN rule:
      - Click on Create role;
      - Click on EC2 and after click on next;
      - after that, pick “AmazonS3FullAccess"
      - click on next and next again;
      - finaly input the name "ec2-S3-access”;  --**REVER: POIS DURANTE UM TESTE FOI NECESSÁRIO RECRIAR ESSA RULE**
      - after that, click on Create role;
      - Click on Lambda and after click on next;
      - after that pick “AWSLambdaBasicExecutionRole" and "AmazonEC2FullAccess"
      - click on next and next again;
      - finaly input the name "LambdaAccess”;

2. You need to follow this tutorial (in this video you can visually see the information: https://www.youtube.com/watch?v=jFAipm0NsVA&ab_channel=SrceCde)
   - Open this link: https://console.aws.amazon.com/console/home?
      - Input "EC2" on field "Find Services": (like https://youtu.be/jFAipm0NsVA?t=104);
      - In the next page, click on button "Launch Instance": (https://youtu.be/jFAipm0NsVA?t=111);
      - In the next page, select "Ubuntu Server 20.04" (64-bits): (https://youtu.be/jFAipm0NsVA?t=114);
      - In the next page, click on button "Next": with de machine "Free tier eligible" selected (https://youtu.be/jFAipm0NsVA?t=124);
      - In the next page, click on button "Next": with "ec2-S3-access” on the field "IAM role" selected;
      - In the next page, click on button "Next", again;
      - In the next page: (https://youtu.be/jFAipm0NsVA?t=140);
         - click on "click to add name tag";
         - input "Lambda-Layer";
         - and click on button "Next";
      - In the next page, input on field "Security group name" the name: "HassIO_Ports"
         - input on field "Security group name" the name: "HassIO_Ports";
         - input on field "Description" the name: "Ports opens of HassIO";
         - click on button "AddRule":
            - on filed "Type" select the value "HTTP";
            - Add the porta 22, 81, 8123, 1883, 8883, 1884, 8884, 9000, similar image above to open ports
               - Until Fig. 9 (https://d2908q01vomqb2.cloudfront.net/f6e1126cedebf23e1463aee73f9df08783640400/2020/05/04/Screen-Shot-2020-04-22-at-2.18.38-PM.png)
            - for all ports, inputs "Sources" like "AnyWhere";
            - and click on button "Review and Launch";
         
      - In the next page, click on button "Launch": (https://youtu.be/jFAipm0NsVA?t=178)
         - select "Create a new pair";
         - and informe on "key pair name" the information "labdassh";
         - and click on the button "Download key pair";
         - check the checkbox;
         - click on button "Launch Instance":
         - after that, click on button "View Instance";
      - In the next page, 
        - check the instance 
        - click on button "conect";
      - In the next page, 
        - click on button "conect" again;

3. Create one domain on duckdns **https://www.duckdns.org/**. with the IP by EC2 from AWS (ipAWS)

4. Create one repository with name "smartboards3" in the link: https://s3.console.aws.amazon.com/s3/
   - Click in the button create buckets and the next page input on field "bucket name": "smartboards3";
   - after that click on create bucket;


# B - Intalls HASSIO on Ubuntu, config tools from HASSIO and config datas to manager users

1. Exec: **sudo curl -L https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/Install/InstallHass.io.sh | bash -s**
   - (OBS.: Sugestion: Copy the text above and paste it into your browser's address bar, then copy the text again and paste it into the terminal)
   - During the execution, input y (for yes) and domain from duckdns

2. Update domain on duckdns **https://www.duckdns.org/** with the IP by EC2 from AWS (ipAWS);

3. Open ipAWS:8123, create your user and password and restart the instance
   - To restart got to https://console.aws.amazon.com/ec2/v2/home?#Instances select "Lambda-Layer" and click "Instance State" / "Start Instance";

4. After that, open ipAWS:8123 again and on menu "Hassio / Supervisor / Add-on Store" install this Addons: Mosquitto, MariaDB, Duckdns

5. Copy the infomations from git to Hassio / Supervisor -> Mosquitto / MariaDB / Duckdns -> Configuration. Get the information in the link **https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/Hassio/Tools/configTools** 
   - get your token on site duckdns.org and chang to "**GET_YOUR_TOKEN_ON_DUCKDNS.ORG_AND_INPUP_HERE**"
   - At the configuration duckdns chage o dns **YOUR_DNS**.duckdns.org to the dns inputed on duckdns
   - After that, start all addons;

6. Restar your Hassio, go to "Configuration" / "Server Control" / "Restart";

7. After that, open o Hassio with https://**YOUR_DNS**.duckdns.org:8123;  --**REVER DEPOIS PQ AINDA É PRECISO COLOCCAR A PORTA**

7. Install the tools (this is optional) File editor, Terminal & SSH on "Hassio / Supervisor


# C - Built the certification to Mosquittto and firmware ESP8266

1. sudo curl -L https://raw.githubusercontent.com/michelfrjf614/InstallHassio/main/certificates/certificates.sh | bash -s
   - Input the DNS_Domain from duckdns (https://www.duckdns.org/domains), **Obs.: Only DNS_Domain, not DNS_Domain.duckdns.org **;
   - Get the address showed in the final on terminal 

# D - Config Lambda
   - Open this tha Lambda service on the link: https://sa-east-1.console.aws.amazon.com/lambda/home?region=sa-east-1#/functions (in this video you can visually see the information: https://youtu.be/jFAipm0NsVA?t=1095);
   - Click Layer;
   - Click create Layer;
   - Input Name: "paramikoPackage"'
   - Select, "Upload a file from Amazon S3";
   - Go to https://s3.console.aws.amazon.com/s3/buckets/smartboards3 and click on "packageParamiko.zip";
   - Copy Object URL;
   - Paste on "Amazon S3 link URL";
   - Compatible runtime: "Phython 3.8";
   - Click Create;


# E - Commands to hekp you

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

{\rtf1\ansi\ansicpg1252\cocoartf2513
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 Courier;\f1\fnil\fcharset0 HelveticaNeue-Medium;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red27\green31\blue34;\red255\green255\blue255;
\red27\green31\blue34;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\cssrgb\c14118\c16078\c18039;\cssrgb\c100000\c100000\c100000;
\cssrgb\c14118\c16078\c18039;}
\paperw11900\paperh16840\margl1440\margr1440\vieww18400\viewh7880\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 \
\pard\pardeftab720\partightenfactor0
\cf2 \expnd0\expndtw0\kerning0
#!/usr/bin/env bash\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 \kerning1\expnd0\expndtw0 \
\pard\pardeftab720\partightenfactor0
\cf2 \expnd0\expndtw0\kerning0
function error \{ echo -e "[Error] $*"; exit 1; \}\
function warn  \{ echo -e "[Warning] $*"; \}\
set -e\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 \kerning1\expnd0\expndtw0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 DIR_ME = ubuntu\
\pard\pardeftab720\partightenfactor0
\cf2 \outl0\strokewidth0 DIR_HASSIO = \cf3 \cb4 /home/$\{\cf2 \cb1 DIR_ME\}\cf3 \cb4 /docker/hassio\cf2 \cb1 \outl0\strokewidth0 \strokec2 \
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
\
\pard\pardeftab720\partightenfactor0
\cf2 \expnd0\expndtw0\kerning0
echo "[Info] \cf5 \cb4 \outl0\strokewidth0 \strokec5 Install dependencies: \cf3 \outl0\strokewidth0 bash jq curl avahi-daemon dbus software-properties-common apparmor-utils\cf2 \cb1 \'93\cf0 \kerning1\expnd0\expndtw0 \
\pard\tx566\pardeftab720\partightenfactor0
\cf3 \cb4 \expnd0\expndtw0\kerning0
sudo apt-get install bash jq curl avahi-daemon dbus software-properties-common apparmor-utils\
\cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 echo "[Info] \cf3 \cb4 Install \cf3 apt-transport-https ca-certificates curl software-properties-common -y\cf2 \cb1 \'93\cf3 \
\pard\tx566\pardeftab720\partightenfactor0
\cf3 \cb4 sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y\
\
\pard\tx566\pardeftab720\partightenfactor0
\cf3 \cb1 \
\pard\pardeftab720\partightenfactor0
\cf2 echo "[Info] \cf3 \cb4 Install Docker Ubuntu\cf2 \cb1 \'93\cf3 \
\pard\tx566\pardeftab720\partightenfactor0
\cf3 \cb4 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -\cb1 \
\cb4 sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"\cb1 \
\cb4 sudo apt-get update\cb1 \
\cb4 sudo apt-get install docker-ce -y\
\
\
\pard\pardeftab720\partightenfactor0
\cf2 \cb1 echo "[Info] \cf3 \cb4 Install Docker\cf2 \cb1 \'93\cf3 \cb4 \
\pard\tx566\pardeftab720\partightenfactor0
\cf3 curl -sL https://raw.githubusercontent.com/icanfixitweb/Hassio-Virtual-Machine/master/hassio_install_script/original_script/installer.sh | bash -s -- -d $\cf2 \cb1 DIR_HASSIO\cf3 \
\

\f1\b\fs21 \cf5 \cb4 \outl0\strokewidth0 \strokec5 \
\pard\pardeftab720\partightenfactor0

\f0\b0\fs24 \cf2 \cb1 \outl0\strokewidth0 echo "[Info] \cf3 \cb4 Install Home Assistant from latest script from Home assistant GitHub (working as of Sept. 2020)\
\pard\tx566\pardeftab720\partightenfactor0
\cf3 curl -sL https://raw.githubusercontent.com/home-assistant/supervised-installer/master/installer.sh | bash -s\cb1 \
\pard\pardeftab720\partightenfactor0
\cf3 \
\cb4 # If Network Manager is not installed [[error] missing: NetworkManager] install it first and then run the command above again:\
# sudo apt-get install network-manager\cb1 \
\pard\tx566\pardeftab720\partightenfactor0
\cf3 \
}
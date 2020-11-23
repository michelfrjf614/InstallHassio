#Site de referencia
#https://medium.com/jungletronics/mosquitto-acls-ac062aea3f9
#https://www.learnshell.org/en/Passing_Arguments_to_the_Script


#como chamar esse shell
#./bin/my_shopping.sh michel       michel.123   /Panel456f7d
#./bin/my_shopping.sh var_username var_password var_topic_geral

var_username=#1  
var_password=#2
var_topic_geral=#3



#Create a file with user and password
mosquitto_passwd -b /share/mosquitto/config/passwd $var_username $var_password

echo "user $var_username" > /share/mosquitto/config/accesscontrollist
echo "topic $var_topic_geral/#" > /share/mosquitto/config/accesscontrollist
echo "" > /share/mosquitto/config/accesscontrollist






###if you need to update the password of this user
###mosquitto_passwd -U /share/mosquitto/config/passwd $var_username $var_new_password

###Create a new password file. If the file already exists, it will be overwritten.
###mosquitto_passwd -c /share/mosquitto/config/passwd $var_username

###Delete the specified user from the password file.
###mosquitto_passwd -D /share/mosquitto/config/passwd $var_username

#!/bin/bash

gebruikersnaam=$1
wachtwoord=$2
ipadres=$3

sudo rm -rf /home/${gebruikersnaam} # directory
sudo userdel -rf ${gebruikersnaam} # linux user yeet & private directory
sudo docker stop ${gebruikersnaam} # container stoppen

# mysql user remove + database gone!
mysql -u dev-team -pmysqlloginT3am4! -h 172.26.4.170 -se "DROP USER '${gebruikersnaam}'@'%'; DROP database ${gebruikersnaam}; flush privileges;"

#!/bin/bash
gebruikersnaam=$1
wachtwoord=$2

mysql -u dev-team -pmysqlloginT3am4! -h 172.26.4.170 -se "CREATE USER '${gebruikersnaam}'@'%' identified by '${wachtwoord}S3cur3!';
Create database ${gebruikersnaam};
use ${gebruikersnaam};
grant all on ${gebruikersnaam}.* to '${gebruikersnaam}'@'%';
flush privileges;"


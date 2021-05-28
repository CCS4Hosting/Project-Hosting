#!/bin/bash

echo $MYDB $MYUSER $MYPASS

t=1
toEcho=""
read result <<<$(mysql -u dev-team -pmysqlloginT3am4! -h 172.26.4.170 -se "USE user_database;SELECT Gebruikersnaam,IP FROM Gebruikers;")

rm -rf /var/named/fwd.ccs4.hosting.db
rm -rf /home/dev-team/fwd.hosting.db
cp /home/dev-team/fwd.hosting.db.ex /home/dev-team/fwd.hosting.db

for i in $result
do
:
   if [ $(expr $t % 2) -gt 0 ]
   then
        toEcho="${i}.ccs4 IN A "
        t=$((t+1))
   else
        toEcho+="${i}"
        t=$((t+1))
        echo $toEcho >> /home/dev-team/fwd.hosting.db
        toEcho=""
   fi
done

mv /home/dev-team/fwd.hosting.db /var/named/fwd.ccs4.hosting.db

sudo chmod 777 /var/named/fwd.ccs4.hosting.db
sudo systemctl restart named.service

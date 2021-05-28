#!/bin/bash

$1
$2

adduser $1
passwd $1 << EOD
$2
$2
EOD

echo "$1 updated"

echo "$1" | sudo tee -a /etc/vsftpd/user_list

sudo mkdir -p /home/$1/ftp/upload
sudo chmod 550 /home/$1/ftp
sudo chmod 750 /home/$1/ftp/upload
sudo chown -R $1: /home/$1/ftp
sudo chmod 755 /home/$1

sudo systemctl restart vsftpd

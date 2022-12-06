#!/bin/bash

# Copier le fichier de configuration sur le serveur

cp ./config__files/ssh/sshd_config /etc/ssh/sshd_config

cp ./config__files/ssh/Banner /etc/Banner

echo "Nom user:"
read username
adduser $username
usermod -a -G sudo $username

echo"MDP"
passwd $username

echo "clé pub"
read sshkey
echo $sshkey >> ~/.ssh/authorized_keys


# Redemarrer le service sshd 

systemctl restart sshd 


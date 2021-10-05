#!/bin/bash


border='================================'
thin_border="------------------------------------------------"


if [ "$EUID" != 0 ]; then

	echo -e "\n [!] Run script as root"
	exit

fi


echo "$border"
echo 'UPDATING'
echo "$border"

sudo apt update && sudo apt upgrade -y


echo -e '\n\n\n'
echo -e "$thin_border"


echo "$border"
echo 'INSTALLING APPLICATIONS'
echo "$border"

sudo apt install git timeshift vim pdfsam atril python3 speedtest-cli -y


sudo timeshift --create --comment "Creating initial backup from setup script"

#!/bin/bash


border='================================'


echo "$border"
echo 'UPDATING'
echo "$border"

sudo apt update && sudo apt upgrade -y


echo -e '\n\n\n'


echo "$border"
echo 'INSTALLING APPLICATIONS'
echo "$border"

sudo apt install git vim pdfsam atril python3 -y

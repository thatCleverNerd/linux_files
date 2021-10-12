#!/bin/bash


border='================================'
thin_border="------------------------------------------------"


if [ "$EUID" != 0 ]; then

	echo -e "\n [!] Run script as root"
	exit

fi


echo "$border"
echo -e "\t UPGRADING SYSTEM"
echo "$border"

sudo apt update && sudo apt upgrade -y


echo -e '\n\n\n'
echo -e "$thin_border"


echo "$border"
echo -e "\t INSTALLING APPLICATIONS"
echo "$border"

sudo apt install git timeshift vim pdfsam atril python3 speedtest-cli zsh xclip  -y



echo "$border"
echo -e "\t CREATING BACKUP"
echo "$border"
sudo timeshift --create --comment "Creating initial backup from setup script"


###############
# Prompt user to press enter, then setup oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions

# Sync dotfiles/my scripts
##############

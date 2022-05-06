#!/bin/bash


border='================================'
thin_border="------------------------------------------------"


if [ "$EUID" != 0 ]; then

	echo -e "\n [!] Run script as root \n\n"
	exit

fi

clear

echo "$border"
echo -e "\t UPGRADING SYSTEM"
echo "$border"

sudo apt update && sudo apt upgrade -y


echo -e '\n\n\n'
echo -e "$thin_border"


echo "$border"
echo -e "\t INSTALLING APPLICATIONS"
echo "$border"

sudo apt install git timeshift vim feh fzf youtube-dl curl htop pdfsam atril python3 speedtest-cli zsh -y


echo "$border"
echo -e "\t SETTING UP SYMLINKS"
echo "$border"

ln -s ~/linux_files/dotfiles/vimrc ~/.vimrc && echo -e "\n[+] vimrc symlnk created"
sudo ln -s ~/linux_files/scripts/* /bin && echo -e "[+] All script symlnks created \n\n"


echo "$border"
echo -e "\t SETTING UP ZSH"
echo "$border"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

read -p $'\x0a [*] Press enter to finish setup: '
echo ""

ln -s ~/linux_files/dotfiles/zshrc ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions

echo -e "\n Done! \n\n"


exit

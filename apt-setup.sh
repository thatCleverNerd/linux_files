#!/bin/bash

border='===================================================='
thin_border="--------------------------------------------------"

clear


#============================================================

echo -e "\n\n$border"
echo -e "\t UPDATING SYSTEM..."
echo -e "$border\n\n"

sudo apt update -y

#============================================================

echo -e "\n\n$border"
echo -e "\t SETTING UP ZSH"
echo -e "$border\n\n"

sudo apt install zsh -y

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm ~/.zshrc

ln -s ~/linux_files/dotfiles/zshrc ~/.zshrc && echo -e "\n[+] zshrc symlink created \n\n"


echo -e "[*] downloading zsh plugins \n\n" && git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
echo -e "\n[+] Plugins have been setup \n\n"


#============================================================


echo -e "\n\n$border"
echo -e "\t INSTALLING APPLICATIONS"
echo -e "$border\n\n"

sudo apt install vim tilix timeshift yt-dlp speedtest-cli -y

#============================================================

echo -e "\n\n$border"
echo -e "\t FLATPAK UPDATE"
echo -e "$border\n\n"

flatpak update -y



echo -e "\n\n$border"
echo -e "\t INSTALLING FLATPAKS"
echo -e "$border\n\n"

flatpak install flathub net.agalwood.Motrix io.github.input_leap.input-leap -y


#============================================================

dir="/home/$USER/linux_files/scripts"

count=0

echo -e "\n\n$border"
echo -e "\t SETTING UP SYMLINKS"
echo -e "$border\n\n"

for file in "$dir"/*; do
	if [ -f "$file" ]; then

		sudo ln -sf "$file" /bin/
		echo "[+] Created symlink for: $(basename "$file")"
		((count++))

	fi
done


echo -e "\n\n$border"
echo -e "\t All Script Symlinks Created!"
echo -e "$border\n\n"


echo -e "\n\n Done! :) \n\n"


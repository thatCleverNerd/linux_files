#!/bin/bash


border='===================================================='
thin_border="--------------------------------------------------"

clear

=======================================================================================
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo chown root:$USER /etc/dnf/dnf.conf
sudo chmod 664 /etc/dnf/dnf.conf
echo -e "\nmax_parallel_downloads=10\nfastestmirror=True" >> /etc/dnf/dnf.conf

=======================================================================================


echo "$border"
echo -e "\t UPDATING SYSTEM..."
echo -e "$border\n\n"
sudo dnf update -y


echo "$border"
echo -e "\t SETTING UP ZSH"
echo -e "$border\n\n"

sudo dnf install zsh -y

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm ~/.zshrc

ln -s ~/linux_files/dotfiles/zshrc ~/.zshrc && echo -e "\n[+] zshrc symlink created \n\n"

echo -e "[*] downloading zsh plugins \n\n" && git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
echo -e "\n[+] Plugins have been setup \n\n"



echo "$border"
echo -e "\t INSTALLING APPLICATIONS"
echo -e "$border\n\n"

sudo dnf install tilix git timeshift vim feh fzf yt-dlp curl htop atril python3 speedtest-cli -y

flatpak install flathub trilium com.bitwarden.desktop -y



echo "$border"
echo -e "\t SETTING UP SYMLINKS"
echo -e "$border\n\n"

ln -s ~/linux_files/dotfiles/vimrc ~/.vimrc
echo -e "\n [+] vimrc symlnk created"

sudo ln -s ~/linux_files/scripts/* /bin
echo -e "\n [+] All script symlnks created \n\n"


# checks if mpv folder exists

mpvPath="/home/$USER/.config/mpv"

if [[ -d $mpvPath ]]; then
	ln -s ~/linux_files/dotfiles/mpv.conf ~/.config/mpv/
	echo -e "\n\n [+] mpv.config symlink created \n"

else
	echo -e "\n\n [+] Creating mpv directory \n"
	mkdir $mpvPath
	ln -s ~/linux_files/dotfiles/mpv.conf ~/.config/mpv/
	echo -e "\n\n [+] mpv.config symlink created \n"
fi


echo "$border"
echo -e "\t FLATPAK UPDATE"
echo -e "$border\n\n"

flatpak update -y


echo -e "\n Done :) (Dont't forget to reboot!) \n\n"


exit

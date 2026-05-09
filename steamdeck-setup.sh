#!/bin/bash


sudo steamos-devmode enable
sudo pacman -S tilix --noconfirm


dir="/home/deck/linux_files/scripts"

count=0

echo -e "\n\n\n"

for file in "$dir"/*; do
	if [ -f "$file" ]; then

		sudo ln -sf "$file" /bin/
		echo "[+] Created symlink for: $(basename "$file")"
		((count++))
	fi
done



echo -e "\n [+] All script symlnks created \n\n"


flatpak install flathub net.agalwood.Motrix be.alexandervanhee.gradia com.brave.Browser com.valvesoftware.Steam.Utility.protontricks.Locale io.github.input_leap.input-leap net.davidotek.pupgui2 net.lutris.Lutris org.musicbrainz.Picard org.onlyoffice.desktopeditors org.remmina.Remmina org.strawberrymusicplayer.strawberry -y

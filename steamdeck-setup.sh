#!/bin/bash

if [ $EUID -ne 0 ]; then
	clear
	echo -e "\n\n {!} Run Script as Root! \n\n"
	exit

fi

steamos-devmode enable
pacman -S tilix speedtest-cli --noconfirm

flatpak install flathub net.agalwood.Motrix be.alexandervanhee.gradia com.brave.Browser com.valvesoftware.Steam.Utility.protontricks.Locale io.github.input_leap.input-leap net.davidotek.pupgui2 net.lutris.Lutris org.musicbrainz.Picard org.onlyoffice.desktopeditors org.remmina.Remmina org.strawberrymusicplayer.strawberry -y

curl "https://anytype-release.fra1.cdn.digitaloceanspaces.com/Anytype-0.54.5.AppImage" -o ~/Desktop/AnyType.AppImage
chmod +x ~/Desktop/AnyType.AppImage

dir="/home/deck/linux_files/scripts"

count=0

for file in "$dir"/*; do
	if [ -f "$file" ]; then

		ln -sf "$file" /bin/
		echo "[+] Created symlink for: $(basename "$file")"
		((count++))
	fi
done



echo -e "\n [+] All script symlnks created \n\n"

#!/bin/bash

if [ $EUID -ne 0 ]; then
	clear
	echo -e "\n\n {!} Run Script as Root! \n\n"
	exit

else

	sudo ln -s ~/linux_files/scripts/* /bin
	echo -e "\n [+] All script symlnks created \n\n"


	steamos-devmode enable
	pacman -S tilix
	pacman -S speedtest-cli
	ln -s ~/linux_files/scripts/mp3rip /bin
	ln -s ~/linux_files/scripts/pserver /bin

fi


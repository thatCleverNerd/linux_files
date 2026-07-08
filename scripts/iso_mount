#!/bin/bash

border="===================================================="

mount_point="/tmp/iso_mount"
copy_target=""
script_name=$(basename "$0")
unmount_mode=false

clear


# Parse Arguments
while [[ $# -gt 0 ]]; do

	case "$1" in

		-c|--copy)

			if [ -z "$2" ]; then
				echo -e "\n [!] Error: -c requires a destination directory \n\n"
				exit 1
			fi

			copy_target="$2"
			shift 2
			;;

		-u|--unmount)
			unmount_mode=true
			shift
			;;

		-h|--help)

			echo -e "\n Usage: $script_name [Options] <iso_file> \n"

			echo -e " Options: \n\n"
			echo -e " -c, --copy <dir>  \tCopy the ISO contents to a directory after mounting"
			echo -e " -h, --help	\tDisplay this help text \n"
			echo -e " -u or --unmount \tUnmounts the ISO after everything else is completed\n\t\t\t(Can run as a standalone argument)"

			echo -e "\n\n Example: \n"
			echo -e " $script_name -c games_folder file.iso"
			echo -e " $script_name -u -c game_folder file.iso \n\n\n"
			exit 0
			;;


		*)
			if [ $# -gt 1 ]; then
				echo -e "\n [!] Error: Too many arguments \n\n"
				exit 1
			fi

			iso_file="$1"
			shift
			;;

	esac
done





# Check if copy destination exists
if [ -n "$copy_target" ] && [ ! -d "$copy_target" ]; then

	echo -e "\n [!] Error: Directory '$copy_target' does not exist \n\n"
	exit 1

fi

# Allows for Unmounting if no other arguments are provided
if [ "$unmount_mode" = true ] && [ -z "$iso_file" ] && [ -z "$copy_target" ]; then

	echo -e "\n$border"
	echo -e "\t Unmounting $mount_point"
	echo -e "$border \n"

	error_msg=$(sudo umount "$mount_point" 2>&1)

	if [ $? -eq 0 ]; then

		echo -e "\n Successfully Unmounted $mount_point \n\n"
		exit
	else
		echo -e "\n [!] Error: $error_msg \n\n"
		exit 1

	fi
fi


if [ -z "$iso_file" ]; then

	echo -e "\n [!] Error: No ISO file provided \n\n"
	echo -e " Usage: $script_name <iso_file> OR <path_to_iso_file>"
	echo -e "\n Use -h or --help for more information \n\n"
	exit 1
fi


if [ ! -f "$iso_file" ]; then
	echo -e "\n [!] Error: File '$iso_file' does not exist \n\n"
	exit 1
fi




echo -e "\n$border"
echo -e "\t Creating Mount $mount_point"
echo -e "$border\n"

sudo mkdir -p "$mount_point"
sudo mount -o loop "$iso_file" "$mount_point" 2>/dev/null



if [ $? -eq 0 ]; then

	echo -e "\n\n Mounted '$iso_file' to $mount_point \n\n"
	echo -e " Folder Contents: \n\n"
	ls -l $mount_point
	echo -e "\n\n\n"

else

	echo -e "\n [!] Error: Failed to mount '$iso_file' \n\n"
	exit 1

fi


# If copy option is used
if [ -n "$copy_target" ]; then

	echo -e "\n$border"
	echo -e "\t Copying Contents to '$copy_target'"
	echo -e "$border \n"

	echo -e "\n Be patient, this might take awhile..."

	cp -r "$mount_point"/* "$copy_target"

	if [ $? -eq 0 ]; then

		echo -e "\n [+] Files Copied Successfully \n\n"

	else
		echo -e "\n [!] Error: Failed to copy contents to '$copy_target'"
		exit 1

	fi
fi


if [ "$unmount_mode" = true ]; then

	echo -e "\n$border"
	echo -e "\t Unmounting $mount_point"
	echo -e "$border \n"

	error_msg=$(sudo umount "$mount_point" 2>&1)

	if [ $? -eq 0 ]; then

		echo -e "\n Successfully Unmounted $mount_point \n\n"
		exit
	else
		echo -e "\n [!] Error: $error_msg \n\n"
		exit 1

	fi
fi


#!/bin/bash

clear

music_dir="$HOME/Music"
dir="$HOME/Music/no_album_art"



if [ ! -d "$dir" ]; then
	echo -e "\n\n\e[31m[!]\e[0m No Directory Named \e[31m'$dir'\e[0m \n"
	mkdir "$dir"
	echo -e "\n\e[32m[+] Directory Created! \e[0m \n\n\n"

fi


count=0

# Display banner
echo -e "\e[1;33m"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                                                              ║"
echo "║               🎵  ALBUM ART CHECKER 🎵                       ║"
echo "║                                                              ║"
echo "║        Scans your Music folder for files missing             ║"
echo "║         album art and moves them to a separate               ║"
echo "║                    'no_album_art' folder                     ║"
echo "║                                                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

printf "\n \e[1;33m [?] Searching for files in ~/Music ..."

# Simple dot animation
for i in {1..5}; do
	printf "."
	sleep 0.3

done
printf "\n\n\n"



# Check for album art
for file in "$music_dir"/*.{mp3,m4a}; do


	if ! ffprobe -v quiet -select_streams v:0 -show_entries stream=codec_name "$file" 2>/dev/null | grep -q .; then
		echo "Moving: $(basename "$file")"
		mv "$file" "$dir"
		((count++))

	fi

done

echo -e "\e[0m"
echo -e "\n\n  [+] Done! Found \e[32m$count\e[0m files without album art \n\n\n"

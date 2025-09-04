#!/bin/bash

if [ -z "$3" ]; then

ffmpeg -i $1  -c:v libx264 -crf 26 -c:a aac -b:a 128k -y $2.mp4

else

ffmpeg -i $1  -c:v libx264 -crf $3 -c:a aac -b:a 128k -y $2.mp4

fi


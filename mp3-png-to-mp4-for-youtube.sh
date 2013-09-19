#!/bin/bash

# $1 = image.png
# $2 = sound.mp3
# $3 = length of mp3

# thanks ron999 in this tread http://ubuntuforums.org/showthread.php?t=1502537

if [ $# -ne 3 ];then echo "Usage: ./$0 image.png sound.mp3 length_of_mp3_as_number"; echo "Exiting...";exit 1;fi

ffmpeg -loop 1 -i $1 -t $3 silent$$.mp4
ffmpeg -i silent$$.mp4 -i $2 -vcodec copy -acodec copy out.mp4

rm silent$$.mp4
echo "Done, out.mp4 created"

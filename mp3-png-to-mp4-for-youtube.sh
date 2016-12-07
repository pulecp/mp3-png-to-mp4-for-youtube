#!/bin/bash

# $1 = image.png
# $2 = sound.mp3
# $3 = length of mp3

# thanks ron999 in this tread http://ubuntuforums.org/showthread.php?t=1502537

if [ $# -ne 2 ];then echo "Usage: ./$0 image.png sound.mp3"; echo "Exiting...";exit 1;fi

length=`sox $2 -n stat 2>&1 | sed -n 's#^Length (seconds):[^0-9]*\([0-9.]*\)$#\1#p'`
h=`basename $2 .mp3`.mp4

ffmpeg -loop 1 -i $1 -t $length silent$$.mp4
ffmpeg -i silent$$.mp4 -i $2 -vcodec copy -acodec copy $h

rm silent$$.mp4
echo "Done, out.mp4 created"

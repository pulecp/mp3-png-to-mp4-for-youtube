#!/bin/bash

# $1 = "sound with any name.mp3"

# thanks ron999 in this tread http://ubuntuforums.org/showthread.php?t=1502537

if [ $# -ne 1 ]; then 
	echo 'Usage: ./$0 "sound with any name.mp3"';
	echo "Exiting...";
	exit 1;
fi

length=`sox "$1" -n stat 2>&1 | sed -n 's#^Length (seconds):[^0-9]*\([0-9.]*\)$#\1#p'`
h=`basename "$1" .mp3`.mp4

ffmpeg -i "$1" -vf "scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2" cover$$.png
ffmpeg -loop 1 -i cover$$.png -t $length silent$$.mp4
ffmpeg -i silent$$.mp4 -i "$1" -vcodec copy -acodec copy "$h"

rm silent$$.mp4
rm cover$$.png
echo "Done, $h created"
#! /bin/bash
#This is a script for converting videos by terminal
#In an more userfriendly way (for ppl not used with the terminal)
#Convert .ogv to .mkv (specific purpos it to change "recordmydesktop"
#video to work with openshot video).
#WARRNING: This might work as well for files type but only tryed on ogv to mkv
#If not install try to install ffmpeg else this won't work.
echo "Please enter the total file name of the video you wanna convert:"
read inF
echo "Please enter the new files name:"
read outF
ffmpeg -i "$inF" -c copy "$outF"

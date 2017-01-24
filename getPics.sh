#! /bin/bash

startSrc="http://www.juxtapoz.com/media/k2/galleries/60529/JuxtapozAliceLang"

echo "What file ending is used one the picture (example: .git, .jpeg, ...)?"

read endSrc

for ((i=0; $i<=15; i=$i+1))
do
	if [ $i -lt 10 ]; then
		num="$i" #num="0$i"
	else
		num=$i
	fi
	wget $startSrc$num$endSrc
done

#So if we wanna make it hard to get copyright metterals (pics) from the web
#simple put on a "watter" mark (a see truw text on the pic) so no one wants it...

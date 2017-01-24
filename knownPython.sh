#! /bin/bash

#The python script that I used in this isn't my to distribut,
#but the function of this python script is basicly that it uses
#the english alphabet (lower and uppercase) and numbers 0-9 plus
#the following symbols: "!@#$%&/()=-.,?+" to create all combinations
#from size 1 until size M.

echo "Please enter the part of the word you know"
read start
echo "Please say the MAX size of the word"
read size

echo "what part of the password do you know?"
echo "if begining of password enter 1, else if end enter 2"
echo "if you know the part somewhere in the middle please run the program twice"
echo "one with each option."
read where

max=${#start}
let "max -= ${#size}"
#let "max += 1" #I think this is unnessicary
if [ $max -lt 1 ]; then
	echo "you have unlogic values please check them and try again"
	exit
fi

function order ()
{
	if [ $where -eq 1 ]; then
		toWrite=$start$1
	else
		if [ $where -eq 2 ]; then
			toWrite=$1$start
		else
			echo "Unvalid option please start over"
			exit
		fi;
	fi
}


python pwdStream.py -M $max | while read tmp; do
	order $tmp
	if [ ${#toWrite} -gt $size ]; then
		continue
	else
		echo "$toWrite" >> newPythonList.txt
	fi
done

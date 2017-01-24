#! /bin/bash

#script for make every possible combination with 
#2 words from a list of words, for a certain size

echo "Enter filename, that contains the words you wanna combined."
read file
clear
echo "what is the final Max size of the combination you want?"
read max
let "max += 1"
if [ $max -lt 2 ]; then
	echo "you have set a to small combination size for this script to be worth using."
	exit
fi

cat $file | awk '{ print length, $0 }' | sort -n | cut -d" " -f2 >> tmp.txt

echo "sort part done"

(cat tmp.txt | while read word1; do 
	if [ ${#word1} -lt $max ]; then
		cat tmp.txt | while read word2; do
			size=${#word1}
			let "size += ${#word2}"
			if [ $size -lt $max ]; then
				echo "$word1$word2" >> NewWordList.txt
			else
				break #Not tested but should work.
			fi
		done;
	else
		echo "word that stop it was: $word1 and has the lenght ${#word1}"
		break
	fi
done )

rm tmp.txt

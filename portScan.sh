#! /bin/bash/
echo off
#commet out if not ubuntu/(maybe other debian systems)
sudo apt-get install torsocks nmap
#stop comment out.

echo "Wanna find random target push 1, Wanna portScan a target push 2"
read choice
if [ $choice -eq 1 ]; then
	echo "How many are you hoping to find?"
	read target
	sudo torsocks nmap -iR $target >> resultOfScan.txt
else
	if [ $choice -eq 2 ]; then
		echo "what is the adress to the target?"
		read target
		sudo torsocks nmap -T Insane -A -v $target >> resultOfScan.txt
	else
		echo "Your input is not valid"
	fi
fi

#!/bin/bash
echo "Name the process you wanna check: "
read pro
echo "thx, to exit press q and then enter"
echo "you will get some complains on the program but it's ok!"
key=""
while [ "X$key" != "Xq" ]; do
	sensors
	read -t 3 key
	ps -e | grep  $pro >> processCheckResult.txt
done

#! /bin/bash
#You need to intall cowsay and lolcat first if not already got it ofc...

echo "What you wanna say?"
read say
clear
echo $say | cowsay | lolcat

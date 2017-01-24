#! /bin/bash
#This is a script written by Mejan.
#It was done to help some friends automating networkt shared disks
#that uses NTFS filesystem.
#You can do what ever you want with it.
#If you find somebugs in it please mail to: najemes0@gmail.com with subject networkDisk Script.
#Enjoy

#inform user's on script.
clear
echo "This program is made for installing a local network shared disk, that is using NTFS partitioning."
echo ""
echo "Before it begins you will need to know what the adress it's to the disk and mount the ''Folder'' name of the folder that is shared."
echo ""
echo "If you are having a encrypted home folder it will add to the booting time becouse of it won't be able to access the /home/username/password file, using encrypted home folder is still rekommended for security."
echo ""
echo ""
echo "This script will need your sudo passwd to install and config somefiles."
echo ""
echo "If any thing goes worng you will have a backup of your privouse fstab file: /etc/fstabBACKUP"
echo "That you can reinstate the old fstab do the following command in the terminal: $ sudo mv /etc/fstabBACKUP /etc/fstab"
echo ""
read -p "Press any key to conntinue..." -n 1 -s
clear

#name the disk on the computer
echo "Please state the name you wish to call the disk."
read diskName
clear

#install if not already installed software needed.
sudo cp /etc/fstab /etc/fstabBACKUP
sudo apt-get update
sudo apt-get -y install cifs-utils
sudo mkdir /media/$diskName
clear

#setting up folders and changing the premission's on them.
echo "please enter your enter your username (on this computer): "
read username
sudo chown $username:$username /media/$diskName
sudo chmod 700 /media/$diskName
clear

#finds out where the computer can find the sheared disk.
echo "please enter the adress (ip-address/dns name) to your locol shared disk: "
read ip
echo "please enter folder to mount on local sheard disk: "
read folder
clear

#Get data needed for the mount.
echo "Please enter username to your shared disk: "
read DiskUser
echo "please enter password to your shared disk: "
read DiskPasswd
echo "Please enter the domain name in your local network: "
read domain1
echo "Please enter your uid on this user can be find by terminal (id $username): "
read UserID
echo "Please enter your gid on this user can be find by terminal (id $username): "
read GrpID
clear

#Setting up premission file.
echo "username=$DiskUser" >> /home/$username/.smbcredentials
echo "password=$DiskPasswd" >> /home/$username/.smbcredentials
echo "domain=$domain1" >> /home/$username/.smbcredentials

#Adding configurations to fstab.
echo "#This is a Lokal network disk (address: $ip)" | sudo tee -a /etc/fstab
echo "//$ip/$folder	/mnt/$diskName	cifs	credentials=/home/$username/.smbcredentials,uid=$UserID,iocharset=utf8,gid=$GrpID	0 0" | sudo tee -a /etc/fstab

#Try to mount the new disk.
sudo mount -a

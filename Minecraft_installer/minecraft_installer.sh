#!/bin/bash

#assume this is run as root (sudo)

if [ $# -ne 1 ]
then
    echo "usage: $(basename $0) <on/off>"
    echo "Assuming you meant to turn it off..."
fi

if [ "$1" == "on" ]
then

echo "installing minecraft and accessories.."

#add repos (save one apt-get update):
#kazam:
apt-add-repository ppa:kazam-team/stable-series -y
#java:
#add-apt-repository ppa:webupd8team/java -y
apt-get update


#"JAVA:"
#apt-get remove openjdk* -y
#apt-get install oracle-java6-installer -y

apt-get install kazam -y
apt-get install openshot -y

#"MINECRAFT:"

#make sure we're clean:
cd /home/.skjult

rm -rf .minecraft

#get the java file:
cd Desktop
rm Minecraft.jar
wget http://62.212.66.171/m/Minecraft.jar


#get the preconfigured game data:
cd /home/.skjult/
#mkdir .minecraft
#cd .minecraft
wget http://62.212.66.171/m/.minecraft.tar.gz
tar xvf .minecraft.tar.gz

#file permissions??:
#chown -R $user /home/.skjult/Desktop/minecraft
#chown -R $user /home/.skjult/.minecraft

#cleanup:
rm .minecraft.tar.gz


else

echo "reverting minecraft installation.."

rm -rf /home/.skjult/.minecraft
rm -rf /home/.skjult/Desktop/Minecraft.jar
apt-get remove kazam -y
apt-get remove openshot -y

fi


#reboot now
echo "Done.. remember to do a reboot.."
#create launcher script
#cd minecraft
#sudo wget http://62.212.66.171/minecraft/launch_minecraft.sh
#sudo chmod 775 launch_minecraft.sh

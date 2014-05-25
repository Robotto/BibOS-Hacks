#!/bin/bash


#getting a ~/.macromedia and .wine-pipelight folder from a bibOS machine that has already visited filmstriben...

REMOTE="172.16.2.130"

echo "I AM:"
whoami
echo "I AM IN:"
pwd


sudo add-apt-repository ppa:pipelight/stable -y
sudo apt-get update
sudo apt-get install --install-recommends pipelight-multi -y
sudo pipelight-plugin -y --update

# Type in 'Y' to accept the license of Silverlight and all required modules
sudo pipelight-plugin -y --enable silverlight


echo "Removing old pipelight helper folders... if any.."
cd /home/.skjult
rm -rf .macromedia
rm -rf .wine-pipelight
echo "Fecthing new zip from gateway server..."
wget --no-proxy http://$REMOTE/pipelight_helpers.zip
echo "unpacking.."
unzip pipelight_helpers.zip
echo "cleaning up..."
rm pipelight_helpers.zip
echo "Done. You should reboot now... Bye. :)"


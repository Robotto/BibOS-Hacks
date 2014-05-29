#!/bin/bash


#getting a ~/.macromedia and .wine-pipelight folder from a bibOS machine that has already visited filmstriben...

REMOTE="172.16.2.130"

echo "I AM:"
whoami
echo "I AM IN:"
pwd

echo "Adding pipelight ppa"
add-apt-repository ppa:pipelight/stable -y
apt-get update
echo "installing pipelight"
apt-get install --install-recommends pipelight-multi -y
pipelight-plugin -y --update


echo "Activating silverlight plugin"
pipelight-plugin -y --enable silverlight


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


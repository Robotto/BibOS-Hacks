#!/bin/bash

#getting a ~/.java folder that has already allowed netbank...
#also fetches .oces2/ and .pki

echo "I AM:"
whoami
echo "I AM IN:"
pwd

echo "Removing old java folders..."
cd /home/.skjult
rm -rf .java
rm -rf .oces2
rm -rf .pki
echo "Fecthing new tarball from gateway server..."
wget http://62.212.66.171/bibOS_java_folders.tar.bz2
echo "unpacking.."
tar -xvf bibOS_java_folders.tar.bz2
echo "cleaning up..."
rm bibOS_java_folders.tar.bz2
echo "Done. You should reboot now... Bye. :)"

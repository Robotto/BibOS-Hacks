#!/bin/bash

#getting a ~/.java folder that has already allowed netbank...

echo "I AM:"
whoami
echo "I AM IN:"
pwd

echo "Removing old java folders..."
cd /home/.skjult
rm -rf .java
rm -rf .oces2
echo "Fecthing new tarball from gateway server..."
wget http://62.212.66.171/dotJava.tar.bz2
#curl http://172.16.12.220:80/dotJava.tar.bz2 -vvv -o dotJava.tar.bz2
echo "unpacking.."
tar -xvf dotJava.tar.bz2
echo "cleaning up..."
rm dotJava.tar.bz2
echo "Done. You should reboot now... Bye. :)"

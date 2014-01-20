#!/bin/bash

#getting a ~/.java folder that has already allowed netbank...

echo "Removing old java folders..."
cd /home/.skjult
rm -rf .java
rm -rf .oces2
echo "Fecthing new tarball from gateway server..."
wget 172.16.12.220/dotJava.tar.bz2
echo "unpacking.."
tar -xvf dotJava.tar.bz2
echo "cleaning up..."
rm dotJava.tar.bz2
echo "Done. You should reboot now... Bye. :)"

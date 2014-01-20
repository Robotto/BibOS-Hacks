#!/bin/bash

#getting a ~/.java folder that has already allowed netbank...

echo "Removing old .java folder..."
cd /home/.skjult
rm -rf .java
echo "Fecthing new tarball from gateway server..."
wget 172.16.12.220/dotJava.tar.bz2
echo "unpacking.."
tar -xvf dotJava.tar.bz2
echo "cleaning up..."
rm dotJava.tar.bz2
echo "Done. You should reboot now... Bye. :)"

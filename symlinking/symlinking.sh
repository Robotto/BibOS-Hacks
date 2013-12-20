#!/bin/sh

#By robotto

cd /home/.skjult
echo "Removing folders if present.."
rm -rf Downloads
rm -rf Documents
echo "Setting up symbolic links.."
cd 
ln -l Desktop Downloads
ln -l Desktop Documents
echo "done"

#!/bin/sh

#By robotto

userdir="/home/.skjult"
echo "Removing folders if present.."
rm -rf $userdir/Downloads
rm -rf $userdir/Documents
echo "Setting up symbolic links.."
cd 
ln -s $userdir/Desktop $userdir/Downloads
ln -s $userdir/Desktop $userdir/Documents
echo "done"

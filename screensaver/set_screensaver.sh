#!/bin/bash

if [ $# -ne 1 ]
then
    echo "usage: $(basename $0) <'screensaver text'>"
    echo "Assuming you meant to turn it off..."
fi
echo "Installing xscreensaver.."
apt-get install xscreensaver xscreensaver-gl-extra xscreensaver-data-extra -y --force-yes
echo "Removing gmome-screensaver"
apt-get remove gnome-screensaver

#get original .xscreensaver settings file:
cd /home/skjult/
rm .xscreensaver
wget 

#remove previous entry with simple check for "textLiteral" string
sudo sed -i_bak -e /textLiteral/d /home/.skjult/.xscreensaver


if [ "$1" == "off" ]
then
	echo
	echo "Removing text from screensaver"
    #it was done on line 11...
	echo "Done, enjoy your new text-less screensaver :)"
	exit 0
else
	echo
	echo "Setting screensaver text.."

	echo
	echo "editing /home/.skjult/.xscreensaver..."
	sed -i 's|^textFile:.*$|textLiteral:    NOGET\ntextFile: |' /home/.skjult/.xscreensaver
	echo
	echo "Done. Enjoy your chrome enabled startup :)"
	echo
	exit 0
fi




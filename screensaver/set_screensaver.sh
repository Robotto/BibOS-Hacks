#!/bin/bash

if [ $# -ne 1 ]
then
    echo "usage: $(basename $0) <'screensaver text'>"
    echo "turn off text with $(basename $0) <off>"
    exit 1
fi
#echo "Installing xscreensaver.."
#apt-get install xscreensaver xscreensaver-gl-extra xscreensaver-data-extra -y --force-yes
#echo "Removing gmome-screensaver"
#apt-get remove gnome-screensaver

#get original .xscreensaver settings file:
cd /home/.skjult/
#cd /home/user/
rm .xscreensaver
wget http://62.212.66.171/BibOS/.xscreensaver



if [ "$1" == "off" ]
then

	#remove previous entry with simple check for "textLiteral" string
	echo "Removing text from screensaver"

	#WRONG:

	#sed -i_bak -e /gltext/d /home/.skjult/.xscreensaver
	sed -i_bak -e /gltext/d /home/user/.xscreensaver

	echo "Done, enjoy your new text-less screensaver :)"
	exit 0
else
	echo
	echo "Setting new screensaver text.."

	echo
	echo "editing /home/.skjult/.xscreensaver..."

	#WRONG!
#	sed -i 's|^textFile:.*$|textLiteral:    $1\ntextFile: |' /home/.skjult/.xscreensaver
	sed -i 's|^programs.*$|programs:/\ngltext -root -text $1|' /home/user/.xscreensaver
	echo
	echo "Done. Enjoy your new screensaver text :)"
	echo
	exit 0
fi




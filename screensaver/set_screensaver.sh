#!/bin/bash

if [ $# -ne 1 ]
then
    echo "usage: $(basename $0) <'screensaver text'>"
    echo "turn off text with $(basename $0) <off>"
    exit 1
fi

echo "Wget'ing default .xscreensaver file.."
#get original .xscreensaver settings file:
#cd /home/.skjult/
cd /home/user/
rm .xscreensaver
wget http://62.212.66.171/bibOS_DOT_xscreensaver -O .xscreensaver



if [ "$1" == "off" ]
then

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
	sed -i 's|^programs.*$|programs:/\ngltext -root -text $1|' /home/user/.xscreensaver
	echo
	echo "Done. Enjoy your new screensaver text :)"
	echo
	exit 0
fi




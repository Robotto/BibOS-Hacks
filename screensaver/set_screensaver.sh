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

echo "Done."


if [ "$1" == "off" ]
then

	#echo "Removing text from screensaver"

	#WRONG:

	#sed -i_bak -e /gltext/d /home/.skjult/.xscreensaver
	#sed -i_bak -e /gltext/d /home/user/.xscreensaver
    #echo "Done."

    echo "removing xscreensaver from autostart"
    rm /home/.skjult/.config/autostart/xscreensaver.desktop

	echo "Done, enjoy your new text-less screensaver :)"
	exit 0
else

    echo "Adding xscreensaver to autostart"
    mkdir /home/.skjult/.config/autostart
    printf "[Desktop Entry]\nType=Application\nExec=xscreensaver -nosplash\nHidden=false\nNoDisplay=false\nX-GNOME-Autostart-enabled=true\nName[en_US]=xscreensaver\nName=xscreensaver\nComment[en_US]=run the xscreensaver at startup\nComment=run the xscreensaver at startup\nName[en]=xscreensaver\n" > /home/.skjult/.config/autostart/xscreensaver.desktop
    echo "Done."

	echo
	echo "Editing /home/.skjult/.xscreensaver... "

	#WRONG!
	sed -i 's|^programs.*$|programs:/\ngltext -root -text \$1|' /home/user/.xscreensaver
	echo
	echo "Done. Enjoy your new screensaver text :)"
	echo
	exit 0
fi




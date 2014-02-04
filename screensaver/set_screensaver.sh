#!/bin/bash

userdir="/home/robotto/BIBOS_HACK/screensaver/string_playground"
#userdir="/home/.skjult"

if [ $# -ne 1 ]
then
    echo "usage: $(basename $0) <'screensaver text'>"
    echo "Turn off with $(basename $0) <off>"
    exit 1
fi

echo "Removing old .xscreensaver file, if present"
rm $userdir/.xscreensaver
echo "Done."

if [ "$1" == "off" ]
then
	echo "Removing xscreensaver from autostart"
	rm $userdir/.config/autostart/xscreensaver.desktop
	echo "Done, enjoy your new text-less screensaver :)"
	exit 0
else

    echo "Wget'ing default .xscreensaver file.."
    wget http://62.212.66.171/bibOS_DOT_xscreensaver -O $userdir/.xscreensaver

    echo "Adding xscreensaver to autostart"
    mkdir $userdir/.config/autostart
    printf "[Desktop Entry]\nType=Application\nExec=xscreensaver -nosplash\nHidden=false\nNoDisplay=false\nX-GNOME-Autostart-enabled=true\nName[en_US]=xscreensaver\nName=xscreensaver\nComment[en_US]=run the xscreensaver at startup\nComment=run the xscreensaver at startup\nName[en]=xscreensaver\n" > $userdir/.config/autostart/xscreensaver.desktop
    echo "Done."
	echo
	echo "Editing $userdir/.xscreensaver... "

    newline=''' GL:                           gltext -root -text "'$1'"        \\n\\'''

	sed -i "/gltext/c$newline" $userdir/.xscreensaver
  	echo
	echo "Done. Enjoy your new screensaver text :)"
	exit 0
fi

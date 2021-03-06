#!/bin/bash

#userdir="/home/robotto/BIBOS_HACK/screensaver/string_playground"
userdir="/home/.skjult"
#remote_ip="172.16.2.130"
remote_ip="62.212.66.171/BibOS"

if [ $# -ne 2 ]
then
    echo "usage: $(basename $0) <'screensaver text'> <'timeout in minutes'>"
    echo "Turn off with $(basename $0) <off> <whatever>"
    exit 1
fi

echo "Removing old .xscreensaver file, if present"
rm $userdir/.xscreensaver
echo "Done."

if [ "$1" == "off" ]
then
	echo "Removing xscreensaver from autostart"
	rm $userdir/.config/autostart/xscreensaver.desktop
	echo "uninstalling xscreensaver"
	apt-get remove xscreensaver xscreensaver-gl-extra -y
	cho "Done"
	exit 0
else

    echo "installing xscreensaver"
    apt-get install xscreensaver xscreensaver-gl-extra -y

    echo "Wget'ing default .xscreensaver file.."
    wget http://$remote_ip/DOT_xscreensaver -e use_proxy=yes -e http_proxy=172.16.12.220:8000 -O $userdir/.xscreensaver

    echo "Adding xscreensaver to autostart:"
    mkdir $userdir/.config/autostart
    printf "[Desktop Entry]\nType=Application\nExec=xscreensaver -nosplash\nHidden=false\nNoDisplay=false\nX-GNOME-Autostart-enabled=true\nName[en_US]=xscreensaver\nName=xscreensaver\nComment[en_US]=run the xscreensaver at startup\nComment=run the xscreensaver at startup\nName[en]=xscreensaver\n" > $userdir/.config/autostart/xscreensaver.desktop
    echo "Done."
	echo
	echo "Editing $userdir/.xscreensaver... "

    #minutes=$((${2}-2))
    if [ $(($2)) -lt 10 ]
    then
        minutes="0$2"
    else minutes="$2"
    fi
        echo "setting timeout to: $minutes"


    gltextline=''' GL:                           gltext -root -no-spin -text "'$1'"        \\n\\'''
    timeoutline='''timeout: 0:'$minutes':00'''

	sed -i "/gltext/c$gltextline" $userdir/.xscreensaver
    sed -i "/timeout/c$timeoutline" $userdir/.xscreensaver

  	echo
	echo "Done. Enjoy your new screensaver text :)"
	exit 0
fi

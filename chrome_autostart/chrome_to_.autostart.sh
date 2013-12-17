#!/usr/bin/env bash

# This script will add the chrome.desktop file to /home/.skjult/.autostart which will make chrome run at boot


# Expect exactly one input parameter

if [ $# -ne 1 ]
then
    echo "usage: $(basename $0) <on/off>"
    echo ""
    exit -1
fi

if [ "$1" == "on" ]
then
    echo "Adding chrome to autostart"
    mkdir /home/.skjult/.config/autostart
    printf "[Desktop Entry]\nType=Application\nExec=google-chrome\nHidden=false\nNoDisplay=false\nX-GNOME-Autostart-enabled=true\nName[en_US]=Chrome\nName=Chrome\nComment[en_US]=run the Google-chrome webbrowser at startup\nComment=run the Google-chrome webbrowser at startup\nName[en]=Chrome\n" > /home/.skjult/.config/autostart/chrome.desktop

    echo "Done."

else
    echo "removing chrome from autostart"
    rm /home/.skjult/.config/autostart/chrome.desktop
    echo "Done."
fi

exit 0


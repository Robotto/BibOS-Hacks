#!/usr/bin/env bash

# This script will add the chrome.desktop file to /home/.skjult/.autostart which will make chrome run at boot in kiosk mode and go to the specified URL


# Expect exactly two input parameters

if [ $# -ne 1 ]
then
    echo "usage: $(basename $0) <url>"
    echo "if url is 'off' this is disabled"
    exit -1
fi

if [ "$1" -ne "off" ]
then
    echo "Setting up kiosk-mode Chrome to autostart and go to $1"
    mkdir /home/.skjult/.config/autostart
    printf "[Desktop Entry]\nType=Application\nExec= google-chrome --kiosk $1 --full-screen\nHidden=false\nNoDisplay=false\nX-GNOME-Autostart-enabled=true\nName[en_US]=Chrome\nName=Chrome\nComment[en_US]=run the Google-chrome webbrowser at startup\nComment=run the Google-chrome webbrowser at startup\nName[en]=Chrome\n" > /home/.skjult/.config/autostart/chrome.desktop

    echo "Done."

else
    echo "removing chrome from autostart"
    rm /home/.skjult/.config/autostart/chrome.desktop
    echo "Done."
fi

exit 0


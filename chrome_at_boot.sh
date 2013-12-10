#!/usr/bin/env bash

if [ $# -ne 1 ]
then
    echo "usage: $(basename $0) <on/off>"
    echo "Assuming you meant 'on'..."
fi


#remove previous numlock entries with simple check for "N/numlock" string
sudo sed -i_bak -e /[Cc]hrome/d /etc/rc.local


if [ "$1" == "off" ]
then
	echo
	echo "Removing chrome from startup"
    #it was done on line 11...
	echo "Done, enjoy your new chromeless startup :)"
	exit 0
else
	echo
	echo "Setting boot numlock to ON"

	#Add chrome lines to /etc/rc.local:
	echo
	echo "editing /etc/rc.local to enable chrome on boot..."
	sudo sed -i 's|^exit 0.*$|# Start Chrome on boot:\n[ -x /opt/google/chrome/google-chrome ] \nexit 0|' /etc/rc.local
	echo
	echo "Done. Enjoy your chrome enabled startup :)"
	echo
	exit 0
fi



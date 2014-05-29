#!/bin/bash
if [ $# -ne 1 ]
then
	echo "you forgot to enter the IP of the host!"
	echo "try again."
	exit -1
fi

HOST=$1
ssh user@$HOST -L 5900:localhost:5900 "x11vnc -display :0 -noxdamage -auth guess -nopw"

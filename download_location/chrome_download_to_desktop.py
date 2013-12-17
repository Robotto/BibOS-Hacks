#!/usr/bin/env python

#by robotto

# Magic entry in chrome settings:
#
#"download": {
#      "default_directory": "/home/robotto/Desktop",
#      "directory_upgrade": true

#the name of this script says it all... right?
#input parameter: on/off (string)

import sys
import json


download_directory = '/home/user/Desktop'
chrome_preferences = '/home/.skjult/.config/google-chrome/Default/Preferences'
#download_directory = '/home/robotto/Desktop'
#chrome_preferences = '/home/robotto/.config/google-chrome/Default/Preferences'
if len(sys.argv) == 1:
    print "No parameters supplied.. assuming you meant ON!"
    sys.argv[0]='on'
    print "Usage: chrome_download_to_desktop.py <on/off>"



#CHROME:


try:
    with open(chrome_preferences, 'r') as chrome_file:

        data = json.load(chrome_file)


    try:
        print "Removing current entries..."
        del data['download']
    except Exception as e:
        print "hmm.. It looks like no custom download location was set: " + str(e)

    if sys.argv[1]=='on':
        try:

            print "adding new download location: %s" % download_directory

            download = dict(download=dict(directory_upgrade='true',default_directory=download_directory))

            #print download

            data.update(download)

            #print data

        except Exception as e:
            print "An error occurred.. maybe this can help?: " + str(e)
            sys.exit(1)

    with open(chrome_preferences, 'w') as chrome_file:
        json.dump(data, chrome_file)

    print "Done"
    print
except Exception as e:
    print "An error occurred, probably unable to open Chrome Preferences file: " + str(e)
    print

#!/usr/bin/env python

#by robotto

#the name of this script says it all... right?
#input parameter: on/off (string)

import sys
import json

chrome_preferences = '/home/.skjult/.config/google-chrome/Default/Preferences'
#chrome_preferences = '/home/robotto/.config/google-chrome/Default/Preferences'
if len(sys.argv) == 1:
    print "No parameters supplied.. assuming you meant ON!"
    print "Usage: chrome_allow_popups.py <on/off>"


#CHROME:


try:
    with open(chrome_preferences, 'r') as chrome_file:

        data = json.load(chrome_file)

    if sys.argv[1]=='off':
        try:
            del data['profile']['default_content_settings']
        except Exception as e:
            print "An error occurred.. maybe popups are already disabled?: " + str(e)

    else:
        try:
            new_entry = dict(default_content_settings=dict(popups=1))
            data['profile'].update(new_entry)

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

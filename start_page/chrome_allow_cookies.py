#!/usr/bin/env python

#by robotto

# Change chrome settings to allow cookies
# Modify the JSON in .config/google_chrome/Default/Preferences to achieve
# this.

# Synopsis:
# Removes entries from the Preferences file which makes chrome default to accepting cookies.

import sys
import json

preferences = '/home/.skjult/.config/google-chrome/Default/Preferences'

print "Opening chrome settings in /home/.skjult/.config/google-chrome/Default/Preferences"
try:
    with open(preferences, 'r') as f:
        data = json.load(f)

	#remove cookie blocking settings:
    try:
        del data['profile']['block_third_party_cookies']
    except Exception as e:
        print "block third party cookies not set: " + str(e)

    try:
	del data['profile']['default_content_settings']
    except Exception as e:
        print "cookies already allowed: " + str(e)

    with open(preferences, 'w') as f:
        json.dump(data, f)

except Exception as e:
    print "error opening Preferences file.. did you move it?.. why would you do that?: " + str(e)
    sys.exit(1)




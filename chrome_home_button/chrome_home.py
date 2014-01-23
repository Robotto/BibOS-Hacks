#!/usr/bin/env python

#by robotto

# Magic entry in chrome settings:
# "browser": {
#       "clear_lso_data_enabled": true,
#       "last_clear_browsing_data_time": "13030504718658212",
#       "last_known_google_url": "https://www.google.dk/",
#       "last_prompted_google_url": "https://www.google.dk/",
#       "pepper_flash_settings_enabled": true,
#       "show_home_button": true,                          <----- HERE IT IS!
#       "window_placement": {
#          "bottom": 1060,
#          "left": 0,
#          "maximized": true,
#          "right": 945,
#          "top": 27,
#          "work_area_bottom": 1080,
#          "work_area_left": 0,
#          "work_area_right": 1920,
#          "work_area_top": 27
#       }
#    }
#the name of this script says it all... right?
#input parameter: on/off (string)

import sys
import json


chrome_preferences = '/home/.skjult/.config/google-chrome/Default/Preferences'
#chrome_preferences = '/home/user/.config/google-chrome/Default/Preferences'
#chrome_preferences = '/home/robotto/.config/google-chrome/Default/Preferences'

if len(sys.argv) == 1:
	print "No parameters supplied.. "
	print "Usage: chrome_home.py <on/off>"
	sys.exit(1)


#CHROME:


try:
	with open(chrome_preferences, 'r') as chrome_file:

		data = json.load(chrome_file)

	try:
		print "Removing current entry.."

		#print data['browser']
		del data['browser']['show_home_button']
        #print data['browser']


	except Exception as e:
		print "hmm.. It looks like the home button was already gone: " + str(e)

	if sys.argv[1]=='on':
		try:

			print "Unhiding the button.."

			#browser = dict(download=dict(directory_upgrade='true',default_directory=download_directory))
			show_home_button = dict(show_home_button=True)

			#print show_home_button

			data['browser'].update(show_home_button)

			#print data['browser']

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


#!/usr/bin/env python

#by robotto

#This is the magic part of the chrome settings file which exists if java is allowed from the "chrome://plugins" menu:

# in ['profile']['content_settings'] after '"clear_on_exit_migrated": true,' and before "pref_version": 1
# "pattern_pairs": {
#             "*,*": {
#                "per_plugin": {
#                   "java-runtime-environment": 1
#                }
#             }
#          },
#          "plugin_whitelist": {
#             "java-runtime-environment": true
#          }


#JSON manipulation doesn't fly when objects are named with hyphens, so we're stuck with string manipulation...
#The data will be inserted by using string splits and concactenations.
#The script checks for redundant entries, and removes them if they are found.

#THIS WORKS FROM BASH:
#sed -i '/"clear_on_exit_migrated": true,/ a "pattern_pairs": { "*,*": {"per_plugin": {"java-runtime-environment": 1}}},"plugin_whitelist": {"java-runtime-environment": true},' /home/.skjult/.config/google-chrome/Default/Preferences
#but local access is a luxury we cannot be bothered with...

import sys

chrome_preferences = '/home/.skjult/.config/google-chrome/Default/Preferences'
#chrome_preferences = '/home/robotto/.config/google-chrome/Default/Preferences'

#the split part:
middle_part='''"pref_version": 1'''

magic_string= '''"pattern_pairs": { "*,*": {"per_plugin": {"java-runtime-environment": 1}}},"plugin_whitelist": {"java-runtime-environment": true},'''

if len(sys.argv) == 1:

    print "You must supply a parameter!"
    print "Usage: chrome_allow_java.py <on/off>"
    print sys.exit(1)

#CHROME:

try:
    with open(chrome_preferences, 'r') as chrome_file:
        contents = chrome_file.read()

    #CHECK IF LINES EXIST!!!

    try:

        print "Checking if java-allow data exists in chrome settings file: %s" %chrome_preferences

        #This line will fail if the data does not exist. This fail is used as an indicator for the existence of the data. :)
        test = contents.split('''"pattern_pairs"''')[1]

        print "It does. Removing.."

        first_part = contents.split('''"pattern_pairs"''')[0]

        last_part = contents.split(middle_part)[1]

        modified_contents = first_part+middle_part+last_part

        #print modified_contents

        with open(chrome_preferences, 'w') as chrome_file:
            chrome_file.write(modified_contents)

    except:
        print "it did not..."

    if sys.argv[1]=='off':
        print 'Java-allow is disabled'
        sys.exit(0)


    try:


        print 'Inserting the java-allow data...'


        with open(chrome_preferences, 'r') as chrome_file:
            contents = chrome_file.read()

        split = contents.split(middle_part)

        #inserting magic_string AFTER '''"clear_on_exit_migrated": true,''' here:
        modified_contents=split[0]+ magic_string + middle_part + split[1]

        with open(chrome_preferences, 'w') as chrome_file:
            chrome_file.write(modified_contents)


    except Exception as e:
        print "An error occurred.. maybe this can help?: " + str(e)
        sys.exit(1)

    print "Done"
    print
except Exception as e:
    print "An error occurred, probably unable to open Chrome Preferences file: " + str(e)
    print
    sys.exit(1)

#!/usr/bin/env python

#by robotto

# Change the startpage for Google Chrome AND FIREFOX!.
# Modify the JSON in .config/google_chrome/Default/Preferences file for chrome
# and the /home/.skjult/.mozilla/firefox/e1362422.default/prefs.js file for firefox
# to achieve this

# Synopsis:
#    change_all_the_startpages <uri1> <uri2> <uri3> ... <uri?>
#I thought of using n as the unknown number id at the end of that line above, but you can see how that would look.. :D
#
# The URI is mandatory.
#
# There is no direct validation of the input parameters.
#

#call can do wonders with bash commands:
from subprocess import call

import sys
import json

chrome_preferences = '/home/.skjult/.config/google-chrome/Default/Preferences'
firefox_preferences = '/home/.skjult/.mozilla/firefox/e1362422.default/prefs.js'
#chrome_preferences = '/home/robotto/.config/google-chrome/Default/Preferences'
#firefox_preferences = '/home/robotto/.mozilla/firefox/ez1uw1yw.default/prefs.js'

if len(sys.argv) == 1:
    print "You must supply at least one URI!"
    print "Usage: change_all_the_startpages <uri> <uri2> <uri3> ... <uri?>"
    sys.exit(1)

#remove the first argument which is the name of the script...
del sys.argv[0]

#print the rest:
print "Parsing URIs.."
print "Number of URIs: ", len(sys.argv)
print "They are: " , str(sys.argv)


#CHROME:

print "Doing Chrome..."

try:
    with open(chrome_preferences, 'r') as chrome_file:

        data = json.load(chrome_file)

 #   sys.argv[1]
    try:
        data['session']['urls_to_restore_on_startup'] = sys.argv
        data['session']['restore_on_startup'] = 4
    except Exception as e:
        print "An error occurred, probably the arguments to the script were poorly formatted: " + str(e)
    #writeout:
    with open(chrome_preferences, 'w') as chrome_file:
        json.dump(data, chrome_file)

    print "Did Chrome!"
    print
except Exception as e:
    print "An error occurred, probably unable to open Chrome Preferences file: " + str(e)
    print
    #sys.exit(1)


#FIREFOX:
print "Doing Firefox.."



piped_together_startpages=str(sys.argv[0])
argcounter=1

while argcounter<len(sys.argv):
    piped_together_startpages+="|"+str(sys.argv[argcounter])
    argcounter=argcounter+1


#triple quotes to delimit this massively misformatted mismatch of a string.. kill it with fire if you figure out a better way.:
#STARTPAGE_PREFS_LINE="""'user_pref(\\\"browser.startup.homepage\\\", \\\"%s\\\");'""" % (piped_together_startpages)
STARTPAGE_PREFS_LINE='''user_pref("browser.startup.homepage", "%s");''' % (piped_together_startpages)

#print
#print "STARTPAGE_PREFS_LINE: "
#print STARTPAGE_PREFS_LINE
#print

# Remove existing start page, if any:
print "removing current startpage entry..."

try:
    call(["sed","-i","/browser.startup.homepage\>/d",firefox_preferences])
except Exception as e:
    print "An error occured, is firefox installed?!: " + str(e)

#callstring = "echo %s >> %s" % (STARTPAGE_PREFS_LINE,firefox_preferences)

#print
#print "callstring: "
#print callstring
#print


print "inserting replacement.."
try:
    with open(firefox_preferences, "a") as writeable:
        writeable.write(STARTPAGE_PREFS_LINE)
    print "done."
except Exception as e:
    print "An error occured, are you doing this right?: " + str(e)



#call(["ls", "-l"])

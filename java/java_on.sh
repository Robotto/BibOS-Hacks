#!/bin/bash
#quick and dirty. No checks. Just a nasty one-liner
sed -i '''/"clear_on_exit_migrated": true,/ a "pattern_pairs": { "*,*": {"per_plugin": {"java-runtime-environment": 1}}},"plugin_whitelist": {"java-runtime-environment": true},''' /home/robotto/.config/google-chrome/Default/Preferences
#sed -i '''/"clear_on_exit_migrated": true,/ a "pattern_pairs": { "*,*": {"per_plugin": {"java-runtime-environment": 1}}},"plugin_whitelist": {"java-runtime-environment": true},''' /home/.skjult/.config/google-chrome/Default/Preferences



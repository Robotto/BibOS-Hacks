#!/bin/bash

#getting a ~/.java folder that has already allowed netbank...

cd /home/.skjult
rm -rf .java
wget 62.212.66.171/dot_java.tgz
tar -xvf dot_java.tgz
rm dot_java.tgz
echo "Done. Bye. :)"
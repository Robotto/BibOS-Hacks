#!/bin/bash
sudo add-apt-repository ppa:pipelight/stable -y
sudo apt-get update
sudo apt-get install --install-recommends pipelight-multi -y --force-yes
sudo pipelight-plugin --update

# Type in 'Y' to accept the license of Silverlight and all required modules
sudo pipelight-plugin --enable silverlight
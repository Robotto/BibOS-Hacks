#!/bin/bash
sudo add-apt-repository ppa:pipelight/stable -y
sudo apt-get update
sudo apt-get install --install-recommends pipelight-multi -y
sudo pipelight-plugin -y --update

# Type in 'Y' to accept the license of Silverlight and all required modules
sudo pipelight-plugin -y --enable silverlight

#!/bin/bash
ifconfig eth0 down
ifconfig eth0 hw ether 40:61:86:78:a3:0a
#ifconfig eth0 hw ether 40:61:86:63:25:84
ifconfig eth0 up
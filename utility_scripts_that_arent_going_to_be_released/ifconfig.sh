#!/bin/bash
ifconfig
ping 172.16.2.130 -c 3
wget --no-proxy 172.16.2.130/Minecraft.jar
rm Minecraft.jar
wget --no-proxy 62.212.66.171/m/Minecraft.jar
rm Minecraft.jar
exit 0
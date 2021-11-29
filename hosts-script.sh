#!/bin/bash
#if your container not have internet connexion, run this script on your hosts

pkill docker
iptables -t nat -F
ifconfig docker0 down
brctl delbr docker0
service docker restart

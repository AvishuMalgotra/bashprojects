#!/bin/bash

#Monitoring the free filesystem space disk

#Getting the disk space of sda2 , This can be changed accordingly
FU=$(df -H | egrep -v "Filesystem|tmpfs" | grep "sda2" |awk '{print $5}' | tr -d %)

#setting the person who recieve alert email
TO="abc@xyz.com"


if [[ $FU -ge 80 ]]
then 
	echo "Warning! Disk space is low -$FU %" | mail -s "DISK ALERT!" $TO
else 
	echo "All good"
fi

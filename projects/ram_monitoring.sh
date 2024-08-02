#!/bin/bash

#MONITORING FREE RAM 

#Getting the free RAM 
FREE_SPACE=$(free -mt | grep "Total" | awk '{print $4}')

#Setting Threshold
TH=500

#Setting the condition
if [[ $FREE_SPACE -lt $TH ]]
then 
	echo "Warning! RAM is running low."
else
	echo "RAM Space is sufficient - $FREE_SPACE M"
fi


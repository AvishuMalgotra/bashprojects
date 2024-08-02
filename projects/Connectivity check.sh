#!/bin/bash

read -p "which site you want to check? "  site

ping -c 1 $site

#Capturing status if ping command 
pingstatus=$?

#Taking a pause
sleep 5

if [[ $pingstatus -eq 0 ]]
then
	echo "Successfully connected to $site"

else
	echo "Unable to connect to $site "
fi 

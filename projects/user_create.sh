#!/bin/bash

# Script should be executed with sudo/root access
if [[ "${UID}" -ne 0 ]]
then 
	echo "Please run with sudo or root."
	exit 1
fi

# User should provide atleast one argument as username else guide him
if [[ "${#}" -lt 1 ]]
then
	echo "Usage: ${0} USER_NAME [COMMENT]..."
	echo "Create a user with USER_NAME  and comment Field of COMMENT"
	exit 1
fi

# Store 1st argument as user name 

USER_NAME="${1}"

# In case of more than one argument , store it as account comments
shift
COMMENT="${@}"

# Create a password
PASSWORD=$(date +%s%N)

# Create the user
useradd -c "${COMMENT}" -m $USER_NAME

# Check if the user is successfully created or not
if [[ $? -ne 0 ]]
then
	echo "The Account could not be created"
	exit 1
fi

# Set the password for the user , This can be changed according to system where the script is going to run
echo $PASSWORD | passwd --stdin $USER_NAME

# Check if the password is successfuly set or not
if [[ $? -ne 0 ]]
then 
	echo "Password could not be set"
	exit 1
fi

# Force Password change on first login
passwd -e $USER_NAME

# Display the username, password and the host where the users is created
echo 
echo "Userbane: $USER_NAME"
echo 
echo "Password: $PASSWORD "
echo 
echo "Hostname: $(hostname)"


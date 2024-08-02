#!/bin/bash
#$Revision:001$
#Fri Aug  2 13:12:33 IST 2024$

#Variables
PATH=/home/macuser/folder1
DAYS=10
DEPTH=1
RUN=0

#Check if the directoru=y is present or not
if [ ! -d $PATH ]
then 
	echo "Directory does not exist: $PATH"
	exit 1
fi


#Create 'archive' folder if not present 

if [ ! -d $PATH/archive ]
then
	mkdir $PATH/archive
fi

#Find the list of files larger than 20 MB

for i in $(find $PATH -maxdepth $DEPTH -type f -size +20M)
do
	if [ $RUN -eq 0 ]
	then
		echo "[$(date "+%T-%m-%d %H:%M:%S")] archiving $i ==> $PATH/arhcive"
		gzip $i || exit 1
		mv $i.gz $PATH/archive || exit 1
	fi
done

for i in $(find $PATH -maxdepth $DEPTH -type f -mtime +"$DAYS")
do
	if [ $RUN -eq 0 ]
	then
		echo "[$(date "+%T-%m-%d %H:%M:%S")] archiving $i ==> $PATH/archive"
		gzip $i || exit 1
		mv $i.gz $PATH/archive || exit 1
	fi
done

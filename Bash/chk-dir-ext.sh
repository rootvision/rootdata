#! /bin/bash
# Script to check directory

# Define variable for the directory, which need to be check
DIR="/var/www/html/site"

if [ -d "$DIR" ]; then
# Control will enter here if $DIRECTORY exists.	
	echo "The SITE DIRECTORY Already Set UP"
else
# Control will jump here if $DIR does NOT exists	
	echo "PERFORM THE TASK YOU WISH IF IT DOESNT EXISTS"
fi
exit 0


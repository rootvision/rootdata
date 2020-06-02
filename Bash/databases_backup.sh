#!/bin/bash
# This is a database backup script 
# To take all the databases backup one by one

# Defining Color code Variables
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
NOCOLOR="\033[0m"

# Defining variables
time_stamp=$(date +%Y-%m-%d)

# Move to backup directory
echo -e "${YELLOW} Changing working directory ${NOCOLOR}"
cd /backup/
echo -e "${GREEN}$(pwd)${NOCOLOR}"

# Created new directory for the backup as per the date
mkdir -p /backup/databases_backup_${time_stamp}

if [ "${?}" -eq 0 ]; then
	echo -e "${GREEN} Directory Created SuccessFully ${NOCOLOR}"
else
	echo -e "${RED} Error: Creating Directory ${NOCOLOR}"
 
 exit 255
fi

# Move inside the newly created backup directory
cd /backup/databases_backup_*$(date +%Y-%m-%d)

if [ "${?}" -eq 0 ]; then
 	echo -e "${GREEN} Moved to Backup Directory ${NOCOLOR}" 
else
 	echo -e "${GREEN} Error: While Changing Directory ${NOCOLOR}"
 
 exit 255
fi

# Now started the Backup process of the databases on the server

echo -e "${YELLOW} Starting Backup Databases Process now ${NOCOLOR}"

for DB in $(mysql -e 'show databases' -s --skip-column-names); do
    mysqldump --skip-lock-tables $DB | gzip > $DB.sql.gz;
done

echo -e "${GREEN} Completed Process ${NOCOLOR}"

# Delete old Backup directory older than 4 days.
find /backup/ -type d -ctime +4 -exec rm -rf {} \;

exit 0

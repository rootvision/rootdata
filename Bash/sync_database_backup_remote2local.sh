# !/bin/bash
# To sync databases backup from remote server to local-system

# Defining variable and specific location to save the backup
BackupsLocation='/Backup/server-backup/databases-backup/'

# Now start the backup sync from the server to your local system
sshpass -p 'PassWord' rsync --progress -avz -e "ssh -p 1822" root@192.168.1.96:/backup/* $BackupsLocation

# Check last command output is it worked fine
if [ "${?}" -eq 0 ]; then
 echo "Databases Backup Synched Successfully at $BackupsLocation" |  mail -s "INFO: Hostname: dedicated.example.com | Logs ALERT"  user@example.com
else
 echo "Error: Databases Backup Sync Failed" |  mail -s "ERROR: Hostname: dedicated.example.com | Logs ALERT"  user@example.com
 exit 255
fi

# Delete old Backup directory older than 30 days.
find /Backup/server-backup/databases-backup/ -type d -ctime +30 -exec rm -rf {} \;

exit 0


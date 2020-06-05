#!/bin/bash
#*** SCP & RSYNC commands to pass password into the single command
LogsLocation='/Backup/AccessLogs/example.com/'

# Rsync the logs from remote server to your local system
sshpass -p 'PassWord' rsync --progress -avz -e "ssh -p 1850" root@192.168.1.54:/var/logs/httpd/* $LogsLocation

# Check are the last command out is it worked fine.
if [ "${?}" -eq 0 ]; then
 echo "Logs Synched Successfully at $LogsLocation" |  mail -s "INFO: example.com | Logs ALERT" user1@example.com user2@example.com
else
 echo "Error: Logs Sync Failed" |  mail -s "ERROR: example.com | Logs ALERT"  user1@example.com -c user2@example.com
 exit 255
fi

exit 0


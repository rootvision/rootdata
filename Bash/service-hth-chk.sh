#!/bin/bash
# In This Case, We Are Checking Crond Service

service=crond

if (( $(ps -ef | grep -v grep | grep $service | wc -l) > 0 ))
        then
                echo "$service is running!!!" | mail -s "INFO: CROND Service UP & RUNNING" user@example.com
        else
                echo "$service is starting now...!!!"
                /etc/init.d/$service start
                echo "$service is Started Sucessfully..!!!" | mail -s "INFO: CROND Started Now & ITS UP" user@example.com
fi


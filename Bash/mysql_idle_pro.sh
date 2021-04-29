#!/bin/bash
# Authur: StackOverFlow
netstat | grep mysql > /root/mysql_netstat.txt
cat /root/mysql_netstat.txt | awk '{print $5}' | sed 's/:/ /g' | awk '{print $2}' | sort -u > /root/mysql_netstat_iplist.txt
for IP in `cat /root/mysql_netstat_iplist.txt`
do
        ESCOUNT=`cat /root/mysql_netstat.txt | grep ESTABLISHED | awk '{print $5}' | grep -c "${IP}"`
        TWCOUNT=`cat /root/mysql_netstat.txt | grep TIME_WAIT   | awk '{print $5}' | grep -c "${IP}"`
        IPPAD=`echo "${IP}..................................." | cut -b -35`
        (( ESCOUNT += 1000000 ))
        (( TWCOUNT += 1000000 ))
        ES=`echo ${ESCOUNT} | cut -b 3-`
        TW=`echo ${TWCOUNT} | cut -b 3-`
        echo ${IPPAD} : ESTABLISHED:${ES} TIME_WAIT:${TW}
done
echo ; echo
netstat -nat | awk '{print $6}' | sort | uniq -c | sort -n | sed 's/d)/d/'




OutPut:
root@ip-example-com:~# bash mysqlstats.sh
13910.............................. : ESTABLISHED:00001 TIME_WAIT:00000
14640.............................. : ESTABLISHED:00001 TIME_WAIT:00000
5075............................... : ESTABLISHED:00001 TIME_WAIT:00000
5130............................... : ESTABLISHED:00001 TIME_WAIT:00000
5277............................... : ESTABLISHED:00001 TIME_WAIT:00000
5316............................... : ESTABLISHED:00001 TIME_WAIT:00000
54024.............................. : ESTABLISHED:00001 TIME_WAIT:00000
54054.............................. : ESTABLISHED:00001 TIME_WAIT:00000
54084.............................. : ESTABLISHED:00001 TIME_WAIT:00000
54110.............................. : ESTABLISHED:00001 TIME_WAIT:00000
54138.............................. : ESTABLISHED:00001 TIME_WAIT:00000
54366.............................. : ESTABLISHED:00001 TIME_WAIT:00000
mysql.............................. : ESTABLISHED:00028 TIME_WAIT:00000


      1 Foreign
      1 TIME_WAIT
      1 established
      5 SYN_RECV
     22 LISTEN
     50 ESTABLISHED


.

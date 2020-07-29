*** Create a bash script with the Code
======================================




vim http_statuscode.sh

#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
  echo "[${i}] Doing $line"
  statusCode=$(curl -s -o /dev/null -I -w "%{http_code}" $line)
  
  if [[ "$statusCode" != 1* ]]; then
    echo "Code: $statusCode"
  fi
done < "$1"


*** Then create another .txt file called urls.txt

vim urls.txt

Enter all the URLs you need to check and run the below commands

# bash http_statuscode.sh urls.txt



===============================================================================


vim httpstatus_checker.sh

#!/bin/bash
while read LINE; do
  curl -o /dev/null --silent --head --write-out "%{http_code} $LINE\n" "$LINE"
done < url-list.txt

just make sure to put the url into the file url-list.txt


$ curl -o /dev/null --silent --head --write-out '%{http_code}\n' <url>


.

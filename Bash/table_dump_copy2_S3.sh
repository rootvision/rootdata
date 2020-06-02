#!/bin/bash

# Change to /tmp directory
cd /tmp

# Setup script local variable
file=table_backup_$(date "+%b-%d-%Y-%H-%M").sql

# Take Database table Dump
mysqldump --host us-west-2.rds.amazonaws.com --port 3306 -u admin -pMf5356Kp database_name database_table > ${file}

# Checking last command excuted succesfully, if then copy the table to S3 Bucket and remove dump from /tmp
if [ "${?}" -eq 0 ]; then
  gzip ${file}
  aws s3 cp ${file}.gz s3://S3-Bucket/
  rm ${file}.gz
  echo "Table dump taken successfuly" |  mail -s "INFO: Database Dump ALERT" test@example.com -c test@example.com -b test@example.com
else
  echo "Error dumping up MySQL Table" |  mail -s "ERROR: Database Dump ALERT" test@example.com -c test@example.com -b test@example.com
  exit 255
fi


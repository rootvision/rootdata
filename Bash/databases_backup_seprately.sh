*** Take databases backup into the seprate files
================================================
cat database-dump.txt | while read line; do
  mysqldump -u root -proot --skip-lock-tables $line | gzip > ${line}_backup_$(date "+%b-%d-%Y-%H-%M-%S").sql.gz
done

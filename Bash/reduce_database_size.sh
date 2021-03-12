#! /bin/bash
# To reduce the size of the database
# In this case, we use the MySQLAdmin Utility

# Passing variables to store the values

db=trucate_database;
echo " Database name: trucate_database  ->(Created)"

# To take the database file from user inputs
echo "Enter the .SQL file need to be restored to reduces the size"
read sqlfile;

sed 's/\sDEFINER=`[^`]*`@`[^`]*`//g' -i $sqlfile

# First Create empty database to restore the database.
mysqladmin create $db

# Assiging privileges on the database
mysql -e "use trucate_database; grant all privileges on trucate_database.* to 'magento_user'@'localhost' identified by 'welcome'"

# Restore the database into the newly created DB
mysql trucate_database < $sqlfile

# Now trucate the huge tables from the database
#mysql -e 'use trucate_database; SET FOREIGN_KEY_CHECKS=0; truncate table report_viewed_product_index; truncate table quote_address; truncate table search_query; truncate table quote_item; truncate table aw_arep_product_performance_category;  truncate table quote_item_option; truncate table quote; SET FOREIGN_KEY_CHECKS=1;'

mysql -e 'use trucate_database; SET FOREIGN_KEY_CHECKS=0; truncate table quote; truncate table quote_address; truncate table quote_address_item; truncate table quote_id_mask; truncate table quote_item; truncate table quote_item_option; truncate table quote_payment; truncate table quote_shipping_rate; truncate table sales_creditmemo; truncate table sales_creditmemo_comment; truncate table sales_creditmemo_grid; truncate table sales_creditmemo_item; truncate table sales_invoice; truncate table sales_invoiced_aggregated; truncate table sales_invoiced_aggregated_order; truncate table sales_invoice_comment; truncate table sales_invoice_grid; truncate table sales_invoice_item; truncate table sales_order; truncate table sales_order_address; truncate table sales_order_aggregated_created; truncate table sales_order_aggregated_updated; truncate table sales_order_grid; truncate table sales_order_item; truncate table sales_order_payment; truncate table sales_order_status_history; truncate table sales_order_tax; truncate table sales_order_tax_item; truncate table sales_payment_transaction; truncate table sales_refunded_aggregated; truncate table sales_refunded_aggregated_order; truncate table sales_shipment; truncate table sales_shipment_comment; truncate table sales_shipment_grid; truncate table sales_shipment_item; truncate table sales_shipment_track; truncate table sales_shipping_aggregated; truncate table sales_shipping_aggregated_order; truncate table sales_bestsellers_aggregated_daily; truncate table sales_bestsellers_aggregated_monthly; truncate table sales_bestsellers_aggregated_yearly; SET FOREIGN_KEY_CHECKS=1;'

## Now dump database after truncating the tables
mysqldump trucate_database > trucate_database_dbBackup_$(date "+%b-%d-%Y-%H-%M-%S").sql

echo "The newly created database dump file: trucate_database_dbBackup_$(date "+%b-%d-%Y-%H-%M-%S").sql"

echo " NOTE REMOVING THE DATABASE RESTORED "
mysqladmin drop trucate_database
echo " ALL Done"

exit 0

#!/bin/bash
#script for Customer Personal Details

echo "Enter Name of Customer: "  #Reading input from user
read name
sqlplus -s hr/hr <<ENDOFSQL | sed '/^$/d' > Reports/Param3.csv
set heading off;
set feedback off;
set linesize 500;
select cust_id||', '||cust_name||', '|| address||', '|| mobile from customers where lower(cust_name)='$name';
exit;
ENDOFSQL


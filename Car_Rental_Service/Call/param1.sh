#!/bin/bash
#Rent chart for perticular type of Vehicle

echo "Enter type of vehicle: "	#Reading input from user
read type
sqlplus -s hr/hr <<ENDOFSQL | sed '/^$/d' |  sed -r 's/[ \t]+/, /g' > Reports/Param1.csv
set heading off;
set feedback off;
set linesize 500;
select type,v_name,model,avail,cust_name,address,rent_rate from vehicles join vehicle_details using(vehicle_id) left join customers using(cust_id) join rent_details using(rent_id) where lower(type)='$type';
exit;
ENDOFSQL


#!/bin/bash
#Rent Details (Vehicle Details + Rent Details + Customer Details)

sqlplus -s hr/hr <<ENDOFSQL | sed '/^$/d' > Reports/Gen3.csv
set heading off;
set feedback off;
set linesize 500;
select make||', '|| v_name||', '|| avail||', '|| rent_date||', '|| duration||', '|| rent_rate||', '|| cust_name ||', '|| address from vehicle_details join rent_details using(rent_id) left join customers using(cust_id);
exit;
ENDOFSQL


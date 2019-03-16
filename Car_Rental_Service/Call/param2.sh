#!/bin/bash
#Collection Report for particular period

echo "Enter from and to date in (dd-mon-rr) format: "
read from	#Reading start date
read to		#Reading end date
sqlplus -s hr/hr <<ENDOFSQL | sed '/^$/d' |  sed -r 's/[ \t]+/, /g' > Reports/Param2.csv
set heading off;
set feedback off;
set linesize 500;
select v_name,model,rent_date,duration,rent_rate,duration*rent_rate total from vehicle_details join rent_details using(rent_id) where (rent_date between '$from' and '$to');
exit;
ENDOFSQL


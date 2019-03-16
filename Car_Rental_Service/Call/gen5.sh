#!/bin/bash
#Monthly Collection Report type wise

sqlplus -s hr/hr <<ENDOFSQL | sed '/^$/d' | sed -r 's/[ \t]+/, /g' > Reports/Gen5.csv
set heading off;
set feedback off;
set linesize 500;
select type, rent_date, sum(rent_rate*duration) from vehicles join vehicle_details using(vehicle_id) join rent_details using(rent_id) where to_char(rent_date,'mon') in('jan','dec') group by type, rent_date;
exit;
ENDOFSQL

#!/bin/bash
#Scheme Profitability Report

echo "Enter Scheme ID: "  #Reading input from user
read scheme_id
sqlplus -s hr/hr <<ENDOFSQL | sed '/^$/d' | sed -r 's/[ \t]+/, /g' > Reports/Param4.csv
set heading off;
set feedback off;
set linesize 700;
select make, v_name, rent_rate, duration, type, scheme_id,discount, rent_rate*duration total_wod, (rent_rate*duration)-( (rent_rate*duration)*discount) total_wd from vehicle_details join rent_details using(rent_id) join vehicles using(vehicle_id) join schemes using(scheme_id) where scheme_id=$scheme_id;
exit;
ENDOFSQL

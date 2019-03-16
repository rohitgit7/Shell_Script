#!/bin/bash
#Daily Collection Report

sqlplus -s hr/hr <<ENDOFSQL | sed '/^$/d' | sed -r 's/[ \t]+/, /g' > Reports/Gen4.csv
set heading off;
set feedback off;
set linesize 500;
select make, v_name, rent_date, rent_rate, duration, rent_rate*duration total from vehicle_details join rent_details using(rent_id) where rent_date='25-jan-14';
exit;
ENDOFSQL


#!/bin/bash
#script for vehicles UNavailable for rent with reason

sqlplus -s hr/hr <<ENDOFSQL | sed '/^$/d' | sed -r 's/[ \t]+/, /g'  > Reports/Gen2.csv
set heading off;
set feedback off;
set linesize 500;
select reg_no,make,v_name,ac,capacity,permit,avail,problem from vehicle_details where lower(avail)='no';
exit;
ENDOFSQL

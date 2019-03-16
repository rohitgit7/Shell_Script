#!/bin/bash
#Script for Vehicle available for Rent

sqlplus -s hr/hr <<ENDOFSQL | sed '/^$/d' | sed -r 's/[ \t]+/, /g'  > Reports/Gen1.csv	
set heading off;
set feedback off;
set linesize 500;
select reg_no,make,v_name,ac,capacity,permit,avail from vehicle_details where lower(avail)='yes';
exit;
ENDOFSQL


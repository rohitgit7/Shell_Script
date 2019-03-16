#!/bin/bash
sqlplus -s hr/hr <<ENDOFSQL >/dev/null
        @drop.sql
        @create.sql
        @constraint.sql
        purge recyclebin;
        exit;
ENDOFSQL

        declare -a table                #Array Declaration
        table[1]=customers
        table[2]=schemes
        table[3]=vehicles
        table[4]=rent_details
        table[5]=vehicle_details
        c=1

        for i in customer.csv scheme.csv vehicle.csv r_details.csv v_details.csv
        do
                while read line
                do
                        sqlplus -s hr/hr <<ENDOFSQL >/dev/null
                        insert into ${table[$c]} values($line);
                        exit;
ENDOFSQL
                done<$i
                c=$(($c + 1))
        done


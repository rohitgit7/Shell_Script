#!/bin/bash
ch=0
until [ $ch -eq 4 ]
do
	echo -e "
	**********************************
        	    MENU
	**********************************
		 1] Create Schema 
		 2] General Reports
		 3] Parameterized Reports
		 4] Exit
	**********************************"
	read -p "Enter your choice: " ch
	
	case $ch in
	1)
		echo "Initializing Schema...."
		sqlplus -s hr/hr <<ENDOFSQL > create.txt
		@drop.sql
		@create.sql
		@constraint.sql
		purge recyclebin;
		exit;
ENDOFSQL

	        declare -a table
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
			sqlplus -s hr/hr <<ENDOFSQL > create.txt
			insert into ${table[$c]} values($line);
			exit;
ENDOFSQL
			done<$i
		c=$(($c + 1))
		done
		echo "Schema Generated!"
		;;

	2) 
		ch1=z
		until [ $ch1 = c ]
		do
			echo -e "
			---------General Reports--------
				a] Vehicles Available for Rent
				b] Vehicles UNAvailable for Rent
				c] Exit
			--------------------------------"
			read -p "Enter choice: " ch1
			case $ch1 in
			a)

				sqlplus -s hr/hr <<ENDOFSQL > Reports/Gen1.csv
				set heading off;
				set feedback off;
				set echo off;
				select reg_no||','||make||','||v_name||','||ac||','||capacity||','||permit||','||avail  from vehicle_details where lower(avail)='yes';
				exit;
ENDOFSQL
				echo "Report generated at [Reports/Gen_1.csv]"
				;;
			b)
				sqlplus -s hr/hr <<ENDOFSQL > Reports/Gen2.csv
				set heading off;
				set feedback off;
				set echo off;
				select reg_no||','||make||','||v_name||','||ac||','||capacity||','||permit||','||avail||','||problem from vehicle_details where lower(avail)='no';
				exit;
ENDOFSQL
	                        echo "Report generated at [Reports/Gen_2.csv]"
				;;
			c)
				ch1=c
				;;
			*)
				echo "Invalid Choice!"
				;;
			esac
		done
		;;
	3)
		ch2=z
		until [ $ch2 = c ]
		do
        		echo -e "
			---------Parameterized Reports--------
			        a] Rent Chart
        			b] Collection Chart
	        		c] Exit
			--------------------------------"
			read -p "Enter choice: " ch2
			case $ch2 in
			a)
				echo "Enter type of vehicle: "
				read type
				sqlplus -s hr/hr <<ENDOFSQL > Reports/Param1.csv
				set heading off;
				set feedback off;
				set echo off;
				select type||','||v_name||','||model||','||avail||','||cust_name||','||address||','||rent_rate from vehicles join vehicle_details using(vehicle_id) left join customers using(cust_id) join rent_details using(rent_id) where lower(type)='$type';
				exit;
ENDOFSQL
				echo "Report generated at [Reports/Param1.csv]"
				;;
			b)
				echo "Enter from and to date in (dd-mon-rr) format: "
				read from to
				sqlplus -s hr/hr <<ENDOFSQL > Reports/Param2.csv
	                        set heading off;
        	                set feedback off;
                	        set echo off;
				select v_name||','||model||','||rent_date||','||duration||','||rent_rate||','||duration*rent_rate total from vehicle_details join rent_details using(rent_id) where (rent_date between '$from' and '$to') and (rent_date+duration between '$from' and '$to');
				exit;
ENDOFSQL
				echo "Report generated at [Reports/Param2.csv]"
				;;
			c)
				ch1=c
				;;
			*)
				echo "Invalid Choice!"
				;;
			esac
		done
		;;
	4)
		ch=4
		;;	
	*)
		echo "Invalid Choice!"
		;;
esac
done


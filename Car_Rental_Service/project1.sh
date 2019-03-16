#!/bin/bash
if [ $1 = '-i' ] 2> /dev/null	#Checking Flag
then
	./Call/schema.sh	#Initializing Schema
else
	main_choice=0
	until [ $main_choice -eq 3 ]
	do
		clear
		echo -e "
		************************************
        		    MENU			
		************************************
			 1] General Reports
			 2] Parameterized Reports
			 3] Exit
		************************************"
		read -p "Enter your choice: " main_choice		#Reading main menu choice
	
		case $main_choice in
		1) 
			gen_choice=z
			until [ $gen_choice = f ]
			do
				echo -e "
				----------General Reports-----------------
					a] Vehicles Available for Rent
					b] Vehicles UNAvailable for Rent
					c] Vehicles on Rent
					d] Daily Collection Report
					e] Monthly Collection Report
					f] Exit
				------------------------------------------"
				read -p "Enter choice: " gen_choice
				case $gen_choice in
				a)
					./Call/gen1.sh			#vehicles available on rent
					clear
					echo "Report generated at [Reports/Gen_1.csv]!!" 
					;;
				b)
					./Call/gen2.sh			#vehicles UNavailable for rent
					clear
                        		echo "Report generated at [Reports/Gen_2.csv]!!"
					;;
				c)
					./Call/gen3.sh			#Rent chart
					clear
                	                echo "Report generated at [Reports/Gen_3.csv]!!"
                        	        ;;
				d)
					./Call/gen4.sh			#Daily Collection
					clear
                	                echo "Report generated at [Reports/Gen_4.csv]!!"
					;;
				e)
					./Call/gen5.sh			#Monthly Collection with vwhiclw type
					clear
                	                echo "Report generated at [Reports/Gen_5.csv]!!"
					;;
				f)
					gen_choice=f			#Exits until loop
					;;
				*)
					echo "Invalid Choice!"
					;;
				esac
			done			#General report menu ends
			;;
		2)
			param_choice=z
			until [ $param_choice = e ]
			do
        			echo -e "
				----------Parameterized Reports--------
				        a] Rent Chart Report
        				b] Collection Chart Report
						c] Scheme Profitability Report
						d] Customer Details Report
	        			e] Exit
				---------------------------------------"
				read -p "Enter choice: " param_choice
				case $param_choice in
				a)
					./Call/param1.sh		#Rent chart for particular type
					clear
					echo "Report generated at [Reports/Param1.csv]"
					;;
				b)
					./Call/param2.sh		#Collection report for particular period
					clear
					echo "Report generated at [Reports/Param2.csv]"
					;;
				c)
					./Call/param3.sh		#Scheme Profitability report
					clear
					echo "Report generated at [Reports/Param3.csv]"
					;;
				d)
					./Call/param4.sh		#Personal details
					clear
				 	echo "Report generated at [Reports/Param4.csv]"
					;;
				e)
					param_choice=e			#Exiting until loop
					;;
				*)
					echo "Invalid Choice!"
					;;
				esac
			done		#Parameterized script ends
			;;
		3)
			echo "Exiting!"
			main_choice=3
			;;	
		*)
			echo "Invalid Choice!"
			;;
esac				#Main menu ends 
done
fi

#!/bin/bash
. search.func			#Functions Sourced
. remote_login.func
. generate_xml.func

clear

remote_login 			#Logging into remote machine with its IP address

if [ $? -eq 0 ]			#checking exit status of ping
then
	echo -e "Connection Successful!\n"	
	dir_choice="y"
	while [ $dir_choice = 'y' ]
	do
			clear
			echo -e "*********************************************"
			echo -e "*              FILE BROWSER                 *"
			echo -e "*********************************************"

			echo "Enter directory name: "
			read dir_name			#Accepting Diretory name from user
			#clear
			search 				#Searching for directory on remote machine
			generate_xml 			#Generating XML of found directory
			echo -e "\n
			Do you want to list any other directory(y/n)"
			read dir_choice			#Asking for more listing od directories
	done
	rm *.tmp		#Removing all temporary files

else
        echo -e "\n\n\tHost UNreachable!\n"
fi

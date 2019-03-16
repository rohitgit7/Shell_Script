#!/bin/bash
#Creating Schema Definition

clear
d="Initializing Schema."
while [[ $time -le 5 ]]
do
	echo -ne "$d\r"
        d="$d."
        sleep 1
        time=$(($time + 1))
done
./Call/init.sh                                  #Creating Schema
echo "Schema Generated!             "
echo "Do you want to continue?(y/n) "
read schema_choice
if [ $schema_choice = 'y' ]
then
	./project1.sh
fi

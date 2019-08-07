#!/bin/bash

#this makes a list of all pedestal files for the station A23 Diffuse analysis, years 2013-2016
#results are stored in pedestalValues_station_year.txt folders

#run like "bash makeA23PedFileList.sh station year"
#like "bash makeA23PedFileList.sh 2 2013"

station=$1
year=$2

echo "[ Station: " $station " ] "
echo "[ Year: " $year " ] "

#we have to differentiate over years and stations because the location changed

if [ $year -eq 2013 ]
then
	if [ $station -eq 2 ]
	then
		find /fs/scratch/PAS0654/ara/peds/A2/2013/*/*pedestalValues* > pedestalValues_A2_2013.txt
	elif [ $station -eq 3 ]
	then
		echo "blah to A3"
	fi
elif [ $year -eq 2014 ]
then
	if [ $station -eq 2 ]
	then
		find /fs/scratch/PAS0654/ara/peds/A2/2014/*pedestalValues* > pedestalValues_A2_2014.txt
	elif [ $station -eq 3 ]
	then
		echo "blah to A3"
	fi
elif [ $year -eq 2015 ]
then
	if [ $station -eq 2 ]
	then
		find /fs/scratch/PAS0654/ara/peds/A2/2015/*pedestalValues* > pedestalValues_A2_2015.txt
	elif [ $station -eq 3 ]
	then
		echo "blah to A3"
	fi
elif [ $year -eq 2016 ]
then
	if [ $station -eq 2 ]
	then
		find /fs/scratch/PAS0654/ara/peds/A2/2016/*pedestalValues* > pedestalValues_A2_2016.txt
	elif [ $station -eq 3 ]
	then
		echo "blah to A3"
	fi
fi

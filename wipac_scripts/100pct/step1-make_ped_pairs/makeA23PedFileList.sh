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
		find /data/user/brianclark/A23Diffuse/100pct/peds/A2_2013_peds/run*/*pedestalValues* > pedestalValues_A2_2013.txt
	elif [ $station -eq 3 ]
	then
		find /data/user/brianclark/A23Diffuse/100pct/peds/A3/2013/run*/*pedestalValues* > pedestalValues_A3_2013.txt
	fi


elif [ $year -eq 2014 ]
then
	if [ $station -eq 2 ]
	then
		find /data/wipac/ARA/2014/calibration/pedestals/ARA02/*pedestalValues* > pedestalValues_A2_2014.txt
	elif [ $station -eq 3 ]
	then
		find /data/wipac/ARA/2014/calibration/pedestals/ARA03/*pedestalValues* > pedestalValues_A3_2014.txt 
	fi
elif [ $year -eq 2015 ]
then
	if [ $station -eq 2 ]
	then
		find /data/wipac/ARA/2015/calibration/pedestals/ARA02/*pedestalValues* > pedestalValues_A2_2015.txt
	elif [ $station -eq 3 ]
	then
		find /data/wipac/ARA/2015/calibration/pedestals/ARA03/*pedestalValues* > pedestalValues_A3_2015.txt 
	fi
elif [ $year -eq 2016 ]
then
	if [ $station -eq 2 ]
	then
		find /data/wipac/ARA/2016/calibration/pedestals/ARA02/*pedestalValues* > pedestalValues_A2_2016.txt
	elif [ $station -eq 3 ]
	then
		find /data/wipac/ARA/2016/calibration/pedestals/ARA03/*pedestalValues* > pedestalValues_A3_2016.txt
	fi
fi

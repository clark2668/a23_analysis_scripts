#!/bin/bash

#this makes a list of all data files for the station A23 Diffuse analysis, years 2013-2016
#results are stored in A2List_1in10.txt files and the like

#run like "bash makeA23FileList.sh station year"
#like "bash makeA23FileList.sh 2 2013"

station=$1
year=$2

echo "[ Station: " $station " ] "
echo "[ Year: " $year " ] "

#we have to differentiate over years and stations because the location changed

if [ $year -eq 2013 ]
then
	if [ $station -eq 2 ]
	then
		find /data/wipac/ARA/2013/filtered/burnSample1in10/ARA02/root/*/event*.root ! -name 'eventHk*.root' > A2List_1in10_2013.txt
	elif [ $station -eq 3 ]
	then
		find /data/wipac/ARA/2013/filtered/burnSample1in10/ARA03/root/*/event*.root ! -name 'eventHk*.root' > A3List_1in10_2013.txt 
	fi
elif [ $year -eq 2014 ]
then
	if [ $station -eq 2 ]
	then
		find /data/wipac/ARA/2014/unblinded/L1/ARA02/*/run*/event*.root ! -name 'eventHk*.root' > A2List_1in10_2014.txt
	elif [ $station -eq 3 ]
	then
		find /data/wipac/ARA/2014/unblinded/L1/ARA03/*/run*/event*.root ! -name 'eventHk*.root' > A3List_1in10_2014.txt 
	fi
elif [ $year -eq 2015 ]
then
	if [ $station -eq 2 ]
	then
		find /data/wipac/ARA/2015/unblinded/L1/ARA02/*/run*/event*.root ! -name 'eventHk*.root' > A2List_1in10_2015.txt
	elif [ $station -eq 3 ]
	then
		find /data/wipac/ARA/2015/unblinded/L1/ARA03/*/run*/event*.root ! -name 'eventHk*.root' > A3List_1in10_2015.txt 
	fi
elif [ $year -eq 2016 ]
then
	if [ $station -eq 2 ]
	then
		find /data/wipac/ARA/2016/unblinded/L1/ARA02/*/run*/event*.root ! -name 'eventHk*.root' > A2List_1in10_2016.txt
	elif [ $station -eq 3 ]
	then
		find /data/wipac/ARA/2016/unblinded/L1/ARA03/*/run*/event*.root ! -name 'eventHk*.root' > A3List_1in10_2016.txt 
	fi
fi

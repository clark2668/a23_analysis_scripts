#!/bin/bash

#this makes a list of all data files for the station A23 Diffuse analysis, years 2013-2016
#results are stored in A2List_1in10.txt files and the like

#run like "bash makeA23FileList.sh station year"
#like "bash makeA23FileList.sh 2 2013"

# do for 100pct

station=$1
year=$2

echo "[ Station: " $station " ] "
echo "[ Year: " $year " ] "

#we have to differentiate over years and stations because the location changed

if [ $year -eq 2013 ]
then
	if [ $station -eq 2 ]
	then
		find /fs/project/PAS0654/ARA_DATA/A23/RawData/A2/2013/*/event*.root ! -name 'eventHk*.root' > A2List_10in10_2013.txt
	elif [ $station -eq 3 ]
	then
		find /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A3/2013/*/event*.root ! -name 'eventHk*.root' > A3List_10in10_2013.txt
	fi
elif [ $year -eq 2014 ]
then
	if [ $station -eq 2 ]
	then
		find /fs/project/PAS0654/ARA_DATA/A23/RawData/A2/2014/*/run*/event*.root ! -name 'eventHk*.root' > A2List_10in10_2014.txt
	elif [ $station -eq 3 ]
	then
		find /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A3/2014/*/run*/event*.root ! -name 'eventHk*.root' > A3List_10in10_2014.txt
	fi
elif [ $year -eq 2015 ]
then
	if [ $station -eq 2 ]
	then
		find /fs/project/PAS0654/ARA_DATA/A23/RawData/A2/2015/*/run*/event*.root ! -name 'eventHk*.root' > A2List_10in10_2015.txt
	elif [ $station -eq 3 ]
	then
		find /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A3/2015/*/run*/event*.root ! -name 'eventHk*.root' > A3List_10in10_2015.txt
	fi
elif [ $year -eq 2016 ]
then
	if [ $station -eq 2 ]
	then
		find /fs/project/PAS0654/ARA_DATA/A23/RawData/A2/2016/*/run*/event*.root ! -name 'eventHk*.root' > A2List_10in10_2016.txt
	elif [ $station -eq 3 ]
	then
		find /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A3/2016/*/run*/event*.root ! -name 'eventHk*.root' > A3List_10in10_2016.txt
	fi
fi

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
		find /fs/project/PAS0654/ARA_DATA/A23/100pct_try2/ProcessedFile/A2/2013/*.root ! -name 'eventHk*.root' > filter_A2_2013.txt
	elif [ $station -eq 3 ]
	then
		find /fs/project/PAS0654/ARA_DATA/A23/100pct_try2/ProcessedFile/A3/2013/*.root ! -name 'eventHk*.root' > filter_A3_2013.txt
	fi
elif [ $year -eq 2014 ]
then
	if [ $station -eq 2 ]
	then
		find /fs/project/PAS0654/ARA_DATA/A23/100pct_try2/ProcessedFile/A2/2014/*.root ! -name 'eventHk*.root' > filter_A2_2014.txt
	elif [ $station -eq 3 ]
	then
		find /fs/project/PAS0654/ARA_DATA/A23/100pct_try2/ProcessedFile/A3/2014/*.root ! -name 'eventHk*.root' > filter_A3_2014.txt
	fi
elif [ $year -eq 2015 ]
then
	if [ $station -eq 2 ]
	then
		find /fs/project/PAS0654/ARA_DATA/A23/100pct_try2/ProcessedFile/A2/2015/*.root ! -name 'eventHk*.root' > filter_A2_2015.txt
	elif [ $station -eq 3 ]
	then
		find /fs/project/PAS0654/ARA_DATA/A23/100pct_try2/ProcessedFile/A3/2015/*.root ! -name 'eventHk*.root' > filter_A3_2015.txt
	fi
elif [ $year -eq 2016 ]
then
	if [ $station -eq 2 ]
	then
		find /fs/project/PAS0654/ARA_DATA/A23/100pct_try2/ProcessedFile/A2/2016/*.root ! -name 'eventHk*.root' > filter_A2_2016.txt
	elif [ $station -eq 3 ]
	then
		find /fs/project/PAS0654/ARA_DATA/A23/100pct_try2/ProcessedFile/A3/2016/*.root ! -name 'eventHk*.root' > filter_A3_2016.txt
	fi
fi

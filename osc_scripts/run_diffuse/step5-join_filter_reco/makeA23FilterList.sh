#!/bin/bash

#this makes a list of all Filter files for the station A23 Diffuse analysis, years 2013-2016
#results are stored in A2List_1in10.txt files and the like

#run like "bash makeA23FilterList.sh station year"
#like "bash makeA23FilterList.sh 2 2013"

station=$1
year=$2

echo "[ Station: " $station " ] "
echo "[ Year: " $year " ] "

if [ $year -eq 2013 ]
then
	if [ $station -eq 2 ]
	then
		find /fs/scratch/PAS0654/ara/10pct/ProcessedFile/A2/2013/*filter* > A2FilterList_1in10_2013.txt
	elif [ $station -eq 3 ]
	then
		find /fs/scratch/PAS0654/ara/10pct/ProcessedFile/A3/2013/*filter* > A3FilterList_1in10_2013.txt
	fi
elif [ $year -eq 2014 ]
then
	if [ $station -eq 2 ]
	then
		find /fs/scratch/PAS0654/ara/10pct/ProcessedFile/A2/2014/*filter* > A2FilterList_1in10_2014.txt
	elif [ $station -eq 3 ]
	then
		find /fs/scratch/PAS0654/ara/10pct/ProcessedFile/A3/2014/*filter* > A3FilterList_1in10_2014.txt
	fi
elif [ $year -eq 2015 ]
then
	if [ $station -eq 2 ]
	then
		find /fs/scratch/PAS0654/ara/10pct/ProcessedFile/A2/2015/*filter* > A2FilterList_1in10_2015.txt
	elif [ $station -eq 3 ]
	then
		find /fs/scratch/PAS0654/ara/10pct/ProcessedFile/A3/2015/*filter* > A3FilterList_1in10_2015.txt
	fi
elif [ $year -eq 2016 ]
then
	if [ $station -eq 2 ]
	then
		find /fs/scratch/PAS0654/ara/10pct/ProcessedFile/A2/2016/*filter* > A2FilterList_1in10_2016.txt
	elif [ $station -eq 3 ]
	then
		find /fs/scratch/PAS0654/ara/10pct/ProcessedFile/A3/2016/*filter* > A3FilterList_1in10_2016.txt
	fi
fi
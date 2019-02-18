#!/bin/bash

#this makes a list of all data files and their pedestal file companion for the station A23 Diffuse analysis, years 2013-2016
#results are stored in A2_2014_FilePedPairs.txt and the like

#run like "bash makeA23DataPedPairs.sh station year"
#like "bash makeA23DataPedPairs.sh 2 2013"

#importantly, we need some auxilliary functions defined in tool.sh
#the tool is the funtion "getPedFileFromRunFile" which pairs up a data run file
#with its nearest-neighbor pedestal file
source tools.sh

station=$1
year=$2

echo "[ Station: " $station " ] "
echo "[ Year: " $year " ] "
echo "[Working...This can take a ~10-15 minutes...Patience Please!]"

if [ $year -eq 2013 ]
then
	if [ $station -eq 2 ]
	then
		while read line
		do
			FileTarget=$line
			PedTarget=$(getPedFileFromRunFile pedestalValues_A2_2013.txt $FileTarget)
			echo "$FileTarget $PedTarget" #uncomment if you wanted to see this printed to the screen
			echo "$FileTarget $PedTarget" >> A2_2013_File_Ped_Pairs.txt
		done < ../step0-make_run_list/A2List_1in10_2013.txt
	elif [ $station -eq 3 ]
	then
		while read line
		do
			FileTarget=$line
			PedTarget=$(getPedFileFromRunFile pedestalValues_A3_2013.txt $FileTarget)
			echo "$FileTarget $PedTarget" #uncomment if you wanted to see this printed to the screen
			echo "$FileTarget $PedTarget" >> A3_2013_File_Ped_Pairs.txt
		done < ../step0-make_run_list/A3List_1in10_2013.txt
	fi
elif [ $year -eq 2014 ]
then
	if [ $station -eq 2 ]
	then
		while read line
		do
			FileTarget=$line
			PedTarget=$(getPedFileFromRunFile pedestalValues_A2_2014.txt $FileTarget)
			echo "$FileTarget $PedTarget" #uncomment if you wanted to see this printed to the screen
			echo "$FileTarget $PedTarget" >> A2_2014_File_Ped_Pairs.txt
		done < ../step0-make_run_list/A2List_1in10_2014.txt
	elif [ $station -eq 3 ]
	then
		while read line
		do
			FileTarget=$line
			PedTarget=$(getPedFileFromRunFile pedestalValues_A3_2014.txt $FileTarget)
			echo "$FileTarget $PedTarget" #uncomment if you wanted to see this printed to the screen
			echo "$FileTarget $PedTarget" >> A3_2014_File_Ped_Pairs.txt
		done < ../step0-make_run_list/A3List_1in10_2014.txt
	fi
elif [ $year -eq 2015 ]
then
	if [ $station -eq 2 ]
	then
		while read line
		do
			FileTarget=$line
			PedTarget=$(getPedFileFromRunFile pedestalValues_A2_2015.txt $FileTarget)
			echo "$FileTarget $PedTarget" #uncomment if you wanted to see this printed to the screen
			echo "$FileTarget $PedTarget" >> A2_2015_File_Ped_Pairs.txt
		done < ../step0-make_run_list/A2List_1in10_2015.txt
	elif [ $station -eq 3 ]
	then
		while read line
		do
			FileTarget=$line
			PedTarget=$(getPedFileFromRunFile pedestalValues_A3_2015.txt $FileTarget)
			echo "$FileTarget $PedTarget" #uncomment if you wanted to see this printed to the screen
			echo "$FileTarget $PedTarget" >> A3_2015_File_Ped_Pairs.txt
		done < ../step0-make_run_list/A3List_1in10_2015.txt
	fi
elif [ $year -eq 2016 ]
then
	if [ $station -eq 2 ]
	then
		while read line
		do
			FileTarget=$line
			PedTarget=$(getPedFileFromRunFile pedestalValues_A2_2016.txt $FileTarget)
			echo "$FileTarget $PedTarget" #uncomment if you wanted to see this printed to the screen
			echo "$FileTarget $PedTarget" >> A2_2016_File_Ped_Pairs.txt
		done < ../step0-make_run_list/A2List_1in10_2016.txt
	elif [ $station -eq 3 ]
	then
		while read line
		do
			FileTarget=$line
			PedTarget=$(getPedFileFromRunFile pedestalValues_A3_2016.txt $FileTarget)
			echo "$FileTarget $PedTarget" #uncomment if you wanted to see this printed to the screen
			echo "$FileTarget $PedTarget" >> A3_2016_File_Ped_Pairs.txt
		done < ../step0-make_run_list/A3List_1in10_2016.txt
	fi
fi

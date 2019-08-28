#!/bin/bash

station="2"
echo '[ Station: ' $station ' ]'
export station

year="2016"
echo '[ Station: ' $year ' ]'
export year

simulation='0'
echo '[ Simulation: ' $simulation ' ]'
export simulation

if [ $simulation == '1' ] #is simulation
then
	exit 1=
elif [ $simulation == '0' ] #is not simulation
then
	filer_file_dir="/data/user/brianclark/A23Diffuse/100pct/ProcessedFile/A${station}/${year}"
	reco_file_dir="/data/user/brianclark/A23Diffuse/100pct/ProcessedFile/A${station}/${year}"
	cw_file_dir="/data/user/brianclark/A23Diffuse/100pct/CWID/A${station}/${year}"
	readfile=../step1-make_ped_pairs/A${station}_${year}_File_Ped_Pairs.txt
fi

RunDir="/home/brianclark/A23_analysis_new2/AraRoot"
export RunDir

eval 'source /home/brianclark/A23_analysis_new2/env.sh'
counter=0
while read line
do
	# echo $line
	if [ $simulation == '1' ] #is simulation
	then
		exit 1
	elif [ $simulation == '0' ] #is not simulation
	then
		cd $RunDir
		./bin/v2_Audit100 $station $year $filer_file_dir $reco_file_dir $cw_file_dir $line
		# if [ $? -ne 0 ] #error handle
		# then
		# 	echo $line >> /home/brianclark/A23_analysis_new2/a23_analysis_scripts/wipac_scripts/100pct/step5-audit/problems_A${station}_${year}_audit_errors.txt
		# fi
	fi	
	counter=$((counter+1))
done < $readfile

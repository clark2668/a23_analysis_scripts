#!/bin/bash
source ~/bashrc/A23Diffuse_bashrc.sh

#what station?
STATION="2"
echo '[ Station: ' $STATION ' ]'
export STATION

#what year?
YEAR="2013"
echo '[ Station: ' $YEAR ' ]'
export YEAR

SIMULATION='0'
echo '[ Simulation: ' $SIMULATION ' ]'
export SIMULATION


#where should the outputs be stored?
OutputDir="/data/user/brianclark/A23Diffuse/RunSummary/A${STATION}/${YEAR}"
echo '[ Processed file output directory: ' $OutputDir ' ]'
export OutputDir

readfile=../step1-make_ped_pairs/A${STATION}_${YEAR}_File_Ped_Pairs.txt

while read line
do
	FileTarget="$line"
	echo $FileTarget
	export FileTarget
	condor_submit -name makeRunSummary /home/brianclark/A23Diffuse/batch_processing/step2-make_run_summary/job.submit.A23.runSummary
	
done < $readfile

#!/bin/bash
eval 'source /home/brianclark/A23_analysis_new2/env.sh'

#what station?
STATION="2"
echo '[ Station: ' $STATION ' ]'
export STATION

#what year?
CONFIG="2016" #this will work, when only doing data
echo '[ Station: ' $CONFIG ' ]'
export CONFIG

SIMULATION='0'
echo '[ Simulation: ' $SIMULATION ' ]'
export SIMULATION

OutputDir="/data/user/brianclark/A23Diffuse/100pct/ProcessedFile/A${STATION}/${CONFIG}"
echo '[ Processed file output directory: ' $OutputDir ' ]'
export OutputDir

FILTERFILEDIR="/data/user/brianclark/A23Diffuse/100pct/ProcessedFile/A${STATION}/${CONFIG}"
echo '[ Run summary directory: ' $FILTERFILEDIR ' ]'
export FILTERFILEDIR

#readfile=../step1-make_ped_pairs/A${STATION}_${CONFIG}_File_Ped_Pairs.txt
readfile=problems_reco_${CONFIG}.txt

FileNumber=0

while read line
do
	FileTarget="$line"
	echo $FileTarget
	export FileTarget
	condor_submit -name doFilter_$CONFIG_file$FileNumber /home/brianclark/A23_analysis_new2/a23_analysis_scripts/wipac_scripts/100pct/step4-reco/job.submit.A23.Reco
	FileNumber=$((FileNumber+1))
done < $readfile

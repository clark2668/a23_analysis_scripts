#!/bin/bash
source ~/bashrc/A23Diffuse_bashrc.sh

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

SUMMARYDIR="/data/user/brianclark/A23Diffuse/100pct/RunSummary/A${STATION}/${CONFIG}"
echo '[ Run summary directory: ' $SUMMARYDIR ' ]'
export SUMMARYDIR

readfile=../step1-make_ped_pairs/A${STATION}_${CONFIG}_File_Ped_Pairs.txt

FileNumber=0

while read line
do
	FileTarget="$line"
	echo $FileTarget
	export FileTarget
	condor_submit -name doFilter_$CONFIG_file$FileNumber /home/brianclark/A23_analysis_new2/a23_analysis_scripts/wipac_scripts/100pct/step3-filter/job.submit.A23.Filter
	FileNumber=$((FileNumber+1))
done < $readfile

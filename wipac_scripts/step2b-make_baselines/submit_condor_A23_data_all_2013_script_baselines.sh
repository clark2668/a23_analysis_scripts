#!/bin/bash
source ~/bashrc/A23Diffuse_bashrc.sh

#what station?
station="A2"
echo '[ Station: ' $station ' ]'

#what year?
year="2013"
echo '[ Station: ' $year ' ]'

readfile=${station}_${year}_File_Ped_Pairs.txt

#where should the outputs be stored?
OutputDir="/data/user/brianclark/A23Diffuse/Baselines/${station}/${year}"
echo '[ Processed file output directory: ' $OutputDir ' ]'
export OutputDir

#we have to define where in the list of data files we want to start

FileNumberStart=0
FileNumberEnd=5000

FileNumber=0
while read line
do
	if (( $FileNumber >= $FileNumberStart && $FileNumber <= $FileNumberEnd ))
	then
		FileTarget="$line"
		echo $FileTarget
		export FileTarget
		condor_submit -name A23_baseline /home/brianclark/A23Diffuse/batch_processing/makeBaselines/job.submit.script.baselines
	fi
	FileNumber=$((FileNumer+1))
done < $readfile



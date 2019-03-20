#!/bin/bash

station="2"
echo '[ Station: ' $station ' ]'
export station

year="2013"
echo '[ Station: ' $year ' ]'
export year

simulation='0'
echo '[ Simulation: ' $simulation ' ]'
export simulation

#where should the outputs be stored?
OutputDir="/fs/scratch/PAS0654/ara/10pct/ValsForCuts/A${station}/${year}"
echo '[ Processed file output directory: ' $OutputDir ' ]'
export OutputDir

DropBadChans='1'
echo '[ DropBadChans?: ' $DropBadChans ' ]'
export DropBadChans

RunDir="/users/PAS0654/osu0673/A23_analysis_new2/AraRoot"
export RunDir

readfile=A${station}_${year}_MergedFiles.txt

counter=0
while read line
do

	echo $line

	qsub -v RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,DROPCHANS=$DropBadChans,STATION=$station,YEAR=$year,SIMULATION=$simulation,FILE=$line -N 'vals_A'$station'_'$year'_'$counter run.sh
	counter=$((counter+1))

done < $readfile

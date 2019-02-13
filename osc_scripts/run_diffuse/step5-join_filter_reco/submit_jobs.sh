#!/bin/bash

station="3"
echo '[ Station: ' $station ' ]'
export station

year="2016"
echo '[ Station: ' $year ' ]'
export year

#where should the outputs be stored?
OutputDir="/fs/scratch/PAS0654/ara/10pct/Joined/A${station}/${year}"
echo '[ Output directory: ' $OutputDir ' ]'
export OutputDir

ProcDir="/fs/scratch/PAS0654/ara/10pct/ProcessedFile/A${station}/${year}"
echo '[ Proc file directory: ' $ProcDir ' ]'
export ProcDir

RunDir="/users/PAS0654/osu0673/A23_analysis/araROOT"
export RunDir

readfile=A${station}FilterList_1in10_${year}.txt

counter=0
while read line
do

	echo $line
	qsub -v RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,STATION=$station,YEAR=$year,FILE=$line,PROCDIR=$ProcDir -N 'join_A'$station'_'$year'_'$counter run.sh
	counter=$((counter+1))

done < $readfile

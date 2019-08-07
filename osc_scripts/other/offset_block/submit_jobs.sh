#!/bin/bash

station="3"
config="3"

#where should the outputs be stored?
OutputDir="/fs/scratch/PAS0654/ara/10pct/other_studies/OffsetBlock/A${station}/c${config}"
echo '[ Processed file output directory: ' $OutputDir ' ]'
export OutputDir

#where is your executable compiled?
RunDir="/users/PAS0654/osu0673/A23_analysis_new2/AraRoot"
export RunDir

#define the list of runs to execute on
readfile=A${station}_c${config}_Files.txt
# readfile=problems_A${station}_c${config}.txt

counter=0
while read line1
do
	qsub -v RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,FILE=$line1,STATION=$station,CONFIG=$config -N 'A'$station'_c'$config'_offsetblock_'$counter run.sh
	counter=$((counter+1))
done < $readfile

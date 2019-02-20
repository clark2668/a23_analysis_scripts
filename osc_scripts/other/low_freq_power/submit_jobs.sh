#!/bin/bash

station="3"
year="2014"

#where should the outputs be stored?
OutputDir="/fs/scratch/PAS0654/ara/10pct/LowFreqPower/A${station}/${year}"
echo '[ Processed file output directory: ' $OutputDir ' ]'
export OutputDir

#where is your executable compiled?
RunDir="/users/PAS0654/osu0673/A23_analysis_new2/araROOT"
export RunDir

#define the list of runs to execute on
readfile=A${station}_${year}_Files.txt

counter=0
while read line1
do
	qsub -v RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,FILE=$line1,STATION=$station,YEAR=$year -N 'A'$station'_'$year'_lowfreqpower_'$counter run.sh
	counter=$((counter+1))
done < $readfile

#!/bin/bash

station="3"
echo '[ Station: ' $station ' ]'
export station

year="2013"
echo '[ Station: ' $year ' ]'
export year

simulation='0'
echo '[ Simulation: ' $simulation ' ]'
export simulation

#where should the outputs be stored?
OutputDir="/fs/scratch/PAS0654/ara/10pct/ProcessedFile/A${station}/${year}"
echo '[ Processed file output directory: ' $OutputDir ' ]'
export OutputDir

#where are the run summaries?
SummaryDir="/fs/scratch/PAS0654/ara/10pct/RunSummary/A${station}/${year}"
echo '[ Run summary directory: ' $SummaryDir ' ]'
export SummaryDir

RunDir="/users/PAS0654/osu0673/A23_analysis/araROOT"
export RunDir

readfile=../step1-make_ped_pairs/A${station}_${year}_File_Ped_Pairs.txt
readfile=reque.txt
counter=0
while read line1
do
	
	sa1=($line1)
	f1=${sa1[0]}
	p1=${sa1[1]}

	echo $line1

	qsub -v RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,SUMMARYDIR=$SummaryDir,STATION=$station,YEAR=$year,SIMULATION=$simulation,FILE=$f1,PED=$p1 -N 'A'$station'_'$year'_'$counter run.sh
	counter=$((counter+1))

done < $readfile

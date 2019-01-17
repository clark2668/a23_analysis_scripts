#!/bin/bash

station="3"
echo '[ Station: ' $station ' ]'
export station

year="2015"
echo '[ Station: ' $year ' ]'
export year

simulation='0'
echo '[ Simulation: ' $simulation ' ]'
export simulation

#where should the outputs be stored?
OutputDir="/fs/scratch/PAS0654/ara/10pct/CompareFilter/A${station}/${year}"
echo '[ Processed file output directory: ' $OutputDir ' ]'
export OutputDir

#what error file should we write to?
ErrFile="/fs/scratch/PAS0654/ara/10pct/CompareFilter/problems_A${station}_${year}.txt"
echo '[ Run summary directory: ' $SummaryDir ' ]'
export SummaryDir

#where are the run summaries?
SummaryDir="/fs/scratch/PAS0654/ara/10pct/RunSummary/A${station}/${year}"
echo '[ Run summary directory: ' $SummaryDir ' ]'
export SummaryDir

RunDir="/users/PAS0654/osu0673/A23_analysis_new2/araROOT"
export RunDir

readfile=../step1-make_ped_pairs/A${station}_${year}_File_Ped_Pairs_short.txt
counter=0
while read line1
do
	
	sa1=($line1)
	f1=${sa1[0]}
	p1=${sa1[1]}

	echo $line1

	qsub -v ERRFILE=$ErrFilek,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,SUMMARYDIR=$SummaryDir,STATION=$station,YEAR=$year,SIMULATION=$simulation,FILE=$f1,PED=$p1 -N 'A'$station'_'$year'_filter_'$counter run.sh
	counter=$((counter+1))

done < $readfile

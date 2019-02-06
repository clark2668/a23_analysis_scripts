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
OutputDir="/fs/scratch/PAS0654/ara/10pct/RunSummary/A${station}/${year}"
echo '[ Processed file output directory: ' $OutputDir ' ]'
export OutputDir

#what error file should we write to?
ErrFile="/fs/scratch/PAS0654/ara/10pct/RunSummary/data_summaryproblems_A${station}_${year}.txt"
echo '[ Error file directory: ' $ErrFile ' ]'
export ErrFile

#what is the read file
readfile=../step1-make_ped_pairs/A${station}_${year}_File_Ped_Pairs.txt
echo '[ Read file: ' $readfile ' ]'

RunDir="/users/PAS0654/osu0673/A23_analysis_new2/araROOT"
export RunDir

counter=0
while read line1
do
	
	sa1=($line1)
	f1=${sa1[0]}
	p1=${sa1[1]}

	echo $line1

	qsub -v ERRFILE=$ErrFile,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,STATION=$station,YEAR=$year,SIMULATION=$simulation,FILE=$f1,PED=$p1 -N 'A'$station'_'$year'_runsummary_'$counter run.sh

	counter=$((counter+1))

done < $readfile

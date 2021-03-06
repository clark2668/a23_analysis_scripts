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

energy="18.0"
echo '[ Energy: ' $energy ']'
export energy

config="4"
echo '[ Config: ' $config ']'
export config

#what is the read file
if [ $simulation == '1' ]
then
	readfile=../sim_lists/A${station}_c${config}_E${energy}.txt
	OutputDir="/fs/scratch/PAS0654/ara/sim/RunSummary/A${station}/c${config}/E${energy}"
	ErrFile="/fs/scratch/PAS0654/ara/sim/RunSummary/sim_summaryproblems_A${station}_c${config}.txt"
elif [ $simulation == '0' ]
then
	readfile=../step1-make_ped_pairs/A${station}_${year}_File_Ped_Pairs.txt
	readfile=../step1-make_ped_pairs/A${station}_${year}_File_Ped_Pairs_pitzer_redo.txt
	readfile=/fs/scratch/PAS0654/ara/10pct/RunSummary/data_summaryproblems_A3_2013.txt
	OutputDir="/fs/scratch/PAS0654/ara/10pct/RunSummary/A${station}/${year}"
	ErrFile="/fs/scratch/PAS0654/ara/10pct/RunSummary/data_summaryproblems_A${station}_${year}_v2.txt"
fi
echo '[ Read file: ' $readfile ' ]'

#where should the outputs be stored?
echo '[ Processed file output directory: ' $OutputDir ' ]'
export OutputDir

#what error file should we write to?
echo '[ Error file directory: ' $ErrFile ' ]'
export ErrFile

RunDir="/users/PAS0654/osu0673/A23_analysis_new2/AraRoot"
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

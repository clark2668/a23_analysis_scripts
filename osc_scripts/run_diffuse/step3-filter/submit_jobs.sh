#!/bin/bash

station="2"
echo '[ Station: ' $station ' ]'
export station

year="2016"
echo '[ Station: ' $year ' ]'
export year

simulation='0'
echo '[ Simulation: ' $simulation ' ]'
export simulation

energy='20.0'
echo '[ Energy: ' $energy ']'
export energy

config="4"
echo '[ Config: ' $config ']'
export config

#where are the run summaries?
SummaryDir="/fs/scratch/PAS0654/ara/10pct/RunSummary/A${station}/${year}"
echo '[ Run summary directory: ' $SummaryDir ' ]'
export SummaryDir

if [ $simulation == '1' ] #is simulation
then
	OutputDir="/fs/scratch/PAS0654/ara/sim/ProcessedFile/A${station}/c${config}/E${energy}"
	ErrFile="/fs/scratch/PAS0654/ara/sim/ProcessedFile/sim_filterproblems_A${station}_E${energy}.txt"
	readfile=../sim_lists/raw_A${station}_c${config}_E${energy}.txt
	walltime=00:05:00
	err_out_location=/fs/scratch/PAS0654/ara/sim/err_out_logs
elif [ $simulation == '0' ] #is not simulation
then
	OutputDir="/fs/scratch/PAS0654/ara/10pct/ProcessedFile/A${station}/${year}"
	ErrFile="/fs/scratch/PAS0654/ara/10pct/ProcessedFile/data_filterproblems_A${station}_${year}_v2.txt"
	readfile=../step1-make_ped_pairs/A${station}_${year}_File_Ped_Pairs.txt
	walltime=02:00:00
	err_out_location=/fs/scratch/PAS0654/ara/10pct/err_out_logs
fi

#where should the outputs be stored?
echo '[ Processed file output directory: ' $OutputDir ' ]'
export OutputDir

#what error file should we write to?
echo '[ Error file directory: ' $ErrFile ' ]'
export ErrFile

#what is the read file
echo '[ Read file: ' $readfile ' ]'

RunDir="/users/PAS0654/osu0673/A23_analysis_new2/AraRoot"
export RunDir

counter=0
while read line1
do
	
	sa1=($line1)
	f1=${sa1[0]}
	p1=${sa1[1]}

	echo $line1

	if [ $simulation == '1' ] #is simulation
	then
		qsub -l walltime=$walltime -e $err_out_location -o $err_out_location -v ERRFILE=$ErrFile,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,SUMMARYDIR=$SummaryDir,STATION=$station,YEAR=$year,SIMULATION=$simulation,FILE=$f1,PED=$p1 -N 'A'$station'_c'$config'_E'$energy'_simfilter_'$counter run.sh
	elif [ $simulation == '0' ] #is not simulation
	then
		qsub -l walltime=$walltime -e $err_out_location -o $err_out_location -v ERRFILE=$ErrFile,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,SUMMARYDIR=$SummaryDir,STATION=$station,YEAR=$year,SIMULATION=$simulation,FILE=$f1,PED=$p1 -N 'A'$station'_'$year'_datafilter_'$counter run.sh
	fi

	counter=$((counter+1))

done < $readfile

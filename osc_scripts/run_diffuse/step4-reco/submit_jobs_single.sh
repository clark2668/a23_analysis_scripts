#!/bin/bash

station="3"
echo '[ Station: ' $station ' ]'
export station

year="2013"
echo '[ Year: ' $year ' ]'
export year

simulation='0'
echo '[ Simulation: ' $simulation ' ]'
export simulation

# RadiusBin=6
RadiusBin=19
echo '[ Radius Bin: ' $RadiusBin ' ]'
export RadiusBin

energy='20.0'
echo '[ Energy: ' $energy ']'
export energy

config="4"
echo '[ Config: ' $config ']'
export config

if [ $simulation == '1' ] #is simulation
then
	OutputDir="/fs/scratch/PAS0654/ara/sim/ProcessedFile/A${station}/c${config}/E${energy}"
	FilterDir="/fs/scratch/PAS0654/ara/sim/ProcessedFile/A${station}/c${config}/E${energy}"
	ErrFile="/fs/scratch/PAS0654/ara/sim/ProcessedFile/sim_recoproblems_A${station}_E${energy}_R${RadiusBin}.txt"
	readfile=../sim_lists/raw_A${station}_c${config}_E${energy}.txt
	walltime=00:20:00
	err_out_location=/fs/scratch/PAS0654/ara/sim/err_out_logs
elif [ $simulation == '0' ] #is not simulation
then
	OutputDir="/fs/scratch/PAS0654/ara/10pct/ProcessedFile/A${station}/${year}"
	FilterDir="/fs/scratch/PAS0654/ara/10pct/ProcessedFile/A${station}/${year}"
	ErrFile="/fs/scratch/PAS0654/ara/10pct/ProcessedFile/data_recoproblems_A${station}_${year}_R${RadiusBin}.txt"
	readfile=../make_run_lists/A${station}List_1in10_${year}_bySize.txt
	readfile=../make_run_lists/A${station}List_1in10_${year}_bySize_redo.txt
	walltime=48:00:00
	err_out_location=/fs/scratch/PAS0654/ara/10pct/err_out_logs
fi

echo '[ Fiter file directory: ' $FilterDir ' ]'
export FilterDir

echo '[ Processed file output directory: ' $OutputDir ' ]'
export OutputDir

echo '[ Error file directory: ' $ErrFile ' ]'
export ErrFile

RunDir="/users/PAS0654/osu0673/A23_analysis_new2/AraRoot"
export RunDir

FileNumberStart=0
FileNumberEnd=5000

tac $readfile > junkme.txt

FileNumber=0
while read line1
do

	if (( $FileNumber >= $FileNumberStart && $FileNumber <= $FileNumberEnd ))
	then
	
		sa1=($line1)
		f1=${sa1[0]}

		echo $line1

		if [ $simulation == '1' ] #is simulation
		then
			qsub -l walltime=$walltime -e $err_out_location -o $err_out_location -v FILTERDIR=$FilterDir,ERRFILE=$ErrFile,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,RADBIN=$RadiusBin,STATION=$station,YEAR=$year,SIMULATION=$simulation,FILE=$f1 -N 'A'$station'_c'$config'_E'$energy'_simreco_R'$RadiusBin'_'$FileNumber run_single.sh
		elif [ $simulation == '0' ] #is not simulation
		then
			qsub -l walltime=$walltime -e $err_out_location -o $err_out_location -v FILTERDIR=$FilterDir,ERRFILE=$ErrFile,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,RADBIN=$RadiusBin,STATION=$station,YEAR=$year,SIMULATION=$simulation,FILE=$f1 -N 'A'$station'_'$year'_datareco_R'$RadiusBin'_'$FileNumber run_single.sh
		fi
	fi
	FileNumber=$((FileNumber+1))
# done < $readfile
done < junkme.txt
rm junkme.txt

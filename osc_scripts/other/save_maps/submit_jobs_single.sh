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

#we have to define where in the radii selection we want to be
#usually choose either 19-20 which is 300m
RadiusBinBegin=19
RadiusBinEnd=20
#or choose 6-7 which is 41m
#RadiusBinBegin=6
#RadiusBinEnd=7
echo '[ Radius start and stop: ' $RadiusBinBegin ' , ' $RadiusBinEnd ' ]'

energy='20.0'
echo '[ Energy: ' $energy ']'
export energy

config="4"
echo '[ Config: ' $config ']'
export config

if [ $simulation == '1' ] #is simulation
then
	OutputDir="/fs/scratch/PAS0654/ara/sim/ProcessedFile/A${station}/c${config}/E${energy}"
	ErrFile="/fs/scratch/PAS0654/ara/sim/ProcessedFile/sim_recoproblems_A${station}_E${energy}.txt"
	readfile=../sim_lists/raw_A${station}_c${config}_E${energy}.txt
	walltime=00:20:00
	err_out_location=/fs/scratch/PAS0654/ara/sim/err_out_logs
elif [ $simulation == '0' ] #is not simulation
then
	OutputDir="/fs/scratch/PAS0654/ara/10pct/other_studies/MapsSave/A${station}/${year}"
	ErrFile="/fs/scratch/PAS0654/ara/10pct/other_studies/MapsSave/data_savemapsproblems_A${station}_${year}.txt"
	readfile=/users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/run_diffuse/step1-make_ped_pairs/A${station}_${year}_File_Ped_Pairs.txt
	walltime=08:00:00
	err_out_location=/fs/scratch/PAS0654/ara/10pct/err_out_logs
fi

#where should the outputs be stored?
echo '[ Processed file output directory: ' $OutputDir ' ]'
export OutputDir

#what error file should we write to?
echo '[ Error file directory: ' $ErrFile ' ]'
export ErrFile

RunDir="/users/PAS0654/osu0673/A23_analysis_new2/AraRoot"
export RunDir

#we have to define where in the list of data files we want to start
FileNumberStart=0
FileNumberEnd=5000

FileNumber=0
while read line1
do

	if (( $FileNumber >= $FileNumberStart && $FileNumber <= $FileNumberEnd ))
	then
	
		sa1=($line1)
		f1=${sa1[0]}
		p1=${sa1[1]}

		for (( RadiusBin = $RadiusBinBegin; RadiusBin < $RadiusBinEnd; RadiusBin++ ))
		do
			export RadiusBin

			echo $line1

			if [ $simulation == '1' ] #is simulation
			then
				qsub -l walltime=$walltime -e $err_out_location -o $err_out_location -v ERRFILE=$ErrFile,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,RADBIN=$RadiusBin,STATION=$station,YEAR=$year,SIMULATION=$simulation,FILE=$f1,PED=$p1 -N 'A'$station'_c'$config'_E'$energy'_simreco_R'$RadiusBin'_'$FileNumber run_single.sh
			elif [ $simulation == '0' ] #is not simulation
			then
				qsub -l walltime=$walltime -e $err_out_location -o $err_out_location -v ERRFILE=$ErrFile,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,RADBIN=$RadiusBin,STATION=$station,YEAR=$year,SIMULATION=$simulation,FILE=$f1,PED=$p1 -N 'A'$station'_'$year'_datareco_R'$RadiusBin'_'$FileNumber run_single.sh
			fi
		done
	fi
	FileNumber=$((FileNumber+1))
done < $readfile

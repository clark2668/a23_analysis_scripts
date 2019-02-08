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
OutputDir="/fs/scratch/PAS0654/ara/10pct/ProcessedFile/A${station}/${year}"
echo '[ Processed file output directory: ' $OutputDir ' ]'
export OutputDir

#what error file should we write to?
ErrFile="/fs/scratch/PAS0654/ara/10pct/ProcessedFile/data_recoproblems_A${station}_${year}.txt"
echo '[ Error file directory: ' $ErrFile ' ]'
export ErrFile

RunDir="/users/PAS0654/osu0673/A23_analysis_new2/araROOT"
export RunDir

#we have to define where in the radii selection we want to be
#usually choose either 19-20 which is 300m
RadiusBinBegin=19
RadiusBinEnd=20
#or choose 6-7 which is 41m
# RadiusBinBegin=6
# RadiusBinEnd=7
echo '[ Radius start and stop: ' $RadiusBinBegin ' , ' $RadiusBinEnd ' ]'

#we have to define where in the list of data files we want to start
FileNumberStart=0
FileNumberEnd=5000

readfile=../step1-make_ped_pairs/A${station}_${year}_File_Ped_Pairs.txt
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

			qsub -v ERRFILE=$ErrFile,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,RADBIN=$RadiusBin,STATION=$station,YEAR=$year,SIMULATION=$simulation,FILE=$f1,PED=$p1 -N 'A'$station'_'$year'_datareco_R'$RadiusBin'_'$FileNumber run_single.sh
		done
	fi
	FileNumber=$((FileNumber+1))
done < $readfile

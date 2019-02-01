#!/bin/bash

# declare -a en=("16" "17" "18" "19" "20")
declare -a en=("18")
station="3"

for j in "${en[@]}"
do

	offset=0
	export offset

	AraSimDir='/users/PAS0654/osu0673/A23_analysis_new2/araSIM'
	SetUpFile='/users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/run_arasim/setup_files/A'$station'_E'$j'.txt'
	OutputDir='/fs/scratch/PAS0654/ara/sim/RawSim/A'$station'/E'$j

	echo $AraSimDir
	echo $SetUpFile
	echo $OutputDir

	echo ""
	echo "--------------------------------------------"
	echo "----- Preparing to batch submit AraSim "
	echo "----- "
	echo "----- AraSimDir: " $AraSimDir
	echo "----- SetUpFile: " $SetUpFile
	echo "----- outputDir: " $OutputDir
	echo "----- Offset: " $offset
	echo "----- "
	echo "--------------------------------------------"
	echo ""

	qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_E'$j'_set'$offset run_monoE.sh

	if [ "$j" -eq "16" -o "$j" -eq "165" ]
	then
		offset=$((offset+200))
		qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$sation'_E'$j'_set'$offset run_monoE.sh
	fi
done

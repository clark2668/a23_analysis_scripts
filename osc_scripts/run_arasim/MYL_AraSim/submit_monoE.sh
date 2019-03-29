#!/bin/bash

# declare -a en=("16" "17" "18" "19" "20")
declare -a en=("17" "18" "19" "20")
# declare -a en=("20")
# declare -a con=("1" "2" "3" "4" "5")
declare -a con=("4")

station="2"

for config in "${con[@]}"
do
	for energy in "${en[@]}"
	do

		offset=0
		export offset

		AraSimDir='/users/PAS0654/osu0673/A23_analysis_new2/AraSim_versions/ARA0'$station'_type_'$config
		SetUpFile='/users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/run_arasim/MYL_AraSim/setups/A'$station'_c'$config'_E'$energy'.txt'
		OutputDir='/fs/scratch/PAS0654/ara/sim/RawSim/A'$station'/c'$config'/E'$energy

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

		qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$energy'_config'$config'_set'$offset run_monoE.sh

		# if [ "$j" -eq "18" -o "$j" -eq "165" ]
		# then
		# 	offset=$((offset+80))
		# 	qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$j'_set'$offset run_monoE.sh
		# 	offset=$((offset+80))
		# 	qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$j'_set'$offset run_monoE.sh
		# 	offset=$((offset+80))
		# 	qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$j'_set'$offset run_monoE.sh
		# 	offset=$((offset+80))
		# 	qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$j'_set'$offset run_monoE.sh
		# fi
	done
done

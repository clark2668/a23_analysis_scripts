#!/bin/bash
# declare -a en=("20.0" "19.0" "18.0" "17.0")
# declare -a en=("17.0" "18.0" "19.0" "20.0")
declare -a en=("17.0")
declare -a con=("4")
station="2"

for config in "${con[@]}"
do
	for energy in "${en[@]}"
	do

		offset=400
		export offset

		AraSimDir='/users/PAS0654/osu0673/A23_analysis_new2/AraSim_versions/ARA0'$station'_type_'$config
		SetUpFile='/users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/run_arasim/MYL_AraSim/setups/A'$station'_c'$config'_E'$energy'.txt'
		# SetUpFile='/users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/run_arasim/MYL_AraSim/setups/A'$station'_c'$config'_E'$energy'_noise.txt'
		OutputDir='/fs/scratch/PAS0654/ara/sim/RawSim/A'$station'/c'$config'/E'$energy
		# OutputDir='/fs/scratch/PAS0654/ara/sim/RawSim/noise_only'

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
		offset=$((offset+200))
		qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$energy'_config'$config'_set'$offset run_monoE.sh

		# if [ "$energy" -eq "17.0" -o "$energy" -eq "17.5" ]
		# then
		# 	offset=$((offset+200))
		# 	qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$energy'_config'$config'_set'$offset run_monoE.sh
		# 	offset=$((offset+200))
		# 	qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$energy'_config'$config'_set'$offset run_monoE.sh
		# fi
	done
done

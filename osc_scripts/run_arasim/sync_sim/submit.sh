#!/bin/bash
declare -a con=("1" "2" "3" "4" "5")
declare -a en=("560" "565" "570" "575" "580" "585" "590" "595" "600" "605" "610")
# declare -a con=("1")
# declare -a en=("610")
station="2"

# working_dir='/users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/run_arasim/sync_sim'
working_dir='/users/PAS0654/osu0673/A23_analysis_new2/AraRoot'

for config in "${con[@]}"
do
	for energy in "${en[@]}"
	do
		FilePath='/fs/project/PAS0654/ARA_DATA/A23/sim_MYL_copy/A'$station'_c'$config'/E'$energy
		OutputDir='/fs/project/PAS0654/ARA_DATA/A23/sim_v2/RawSim/A'$station'/c'$config'/E'$energy

		qsub -v RUN_DIR=$working_dir,OUTPUT_DIR=$OutputDir,STATION=$station,CONFIG=$config,ENERGY=$energy,FILEPATH=$FilePath -N 'sync_A'$station'_c'$config'_E'$energy run.sh

		# qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$energy'_config'$config'_set'$offset run_monoE.sh

		# AraSimDir='/users/PAS0654/osu0673/A23_analysis_new2/AraSim_versions/ARA0'$station'_type_'$config
		# SetUpFile='/users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/run_arasim/MYL_AraSim/setups/A'$station'_c'$config'/A'$station'_c'$config'_E'$energy'.txt'
		# # SetUpFile='/users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/run_arasim/MYL_AraSim/setups/A'$station'_c'$config'_E'$energy'_noise.txt'
		# OutputDir='/fs/scratch/PAS0654/ara/sim/RawSim/A'$station'/c'$config'/E'$energy
		# # OutputDir='/fs/scratch/PAS0654/ara/sim/RawSim/noise_only'

		# echo $AraSimDir
		# echo $SetUpFile
		# echo $OutputDir

		# echo ""
		# echo "--------------------------------------------"
		# echo "----- Preparing to batch submit AraSim "
		# echo "----- "
		# echo "----- AraSimDir: " $AraSimDir
		# echo "----- SetUpFile: " $SetUpFile
		# echo "----- outputDir: " $OutputDir
		# echo "----- Offset: " $offset
		# echo "----- "
		# echo "--------------------------------------------"
		# echo ""

		# qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$energy'_config'$config'_set'$offset run_monoE.sh
		# offset=$((offset+140))
		# qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$energy'_config'$config'_set'$offset run_monoE.sh
		# offset=$((offset+140))
		# qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$energy'_config'$config'_set'$offset run_monoE.sh
		# offset=$((offset+140))
		# qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$energy'_config'$config'_set'$offset run_monoE.sh
		# offset=$((offset+140))
		# qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$energy'_config'$config'_set'$offset run_monoE.sh
		# offset=$((offset+140))
		# qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$energy'_config'$config'_set'$offset run_monoE.sh
		# offset=$((offset+140))
		# qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$energy'_config'$config'_set'$offset run_monoE.sh
		# offset=$((offset+140))
		# qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$energy'_config'$config'_set'$offset run_monoE.sh
		# if [ "$energy" -eq "560" -o "$energy" -eq "565" ]
		# then
		# 	echo "more!"
		# 	offset=$((offset+200))
		# 	# qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$energy'_config'$config'_set'$offset run_monoE.sh
		# 	offset=$((offset+200))
		# 	# qsub  -v INPUTFILE=$SetUpFile,RUN_DIR=$AraSimDir,OUTPUT_DIR=$OutputDir,OFFSET=$offset -N 'arasim_A'$station'_E'$energy'_config'$config'_set'$offset run_monoE.sh
		# fi
	done
done

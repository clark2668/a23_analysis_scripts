#!/bin/bash

station=$1

if [[ $station -eq 0 ]] ; then
    echo 'Error in usage! Run like: bash sort_by_config.sh <station>'
    exit 1
fi

declare -a con=("1" "2" "3" "4" "5")
declare -a en=("560" "565" "570" "575" "580" "585" "590" "595" "600" "605" "610")

# declare -a con=("2")
# declare -a en=("560")


for config in "${con[@]}"
do
	echo 'Config '$config

	for energy in "${en[@]}"
	do

		echo '     Energy '$energy

		find /fs/project/PAS0654/ARA_DATA/A23/sim_v2/Joined/A${station}/c${config}/E${energy}/*joined* > ./sim_by_config/A${station}_c${config}_E${energy}_MergedFiles.txt

		numLines=`cat ./sim_by_config/A${station}_c${config}_E${energy}_MergedFiles.txt | wc -l`
		# echo "     Num lines is "$numLines

		numToAdd=1
		if [ "$numLines" -gt "50" ]
		then
			numToAdd=$((101-numLines))
			if [ "$numLines" -gt "200" ]
			then
				numToAdd=$((601-numLines))

				if [ "$numLines" -gt "700" ]
				then
					numToAdd=$((1001-numLines))
				fi
			fi
		fi
		# echo "          Final Num to Add is "$numToAdd

		while [ $numToAdd -gt 0 ]
		do
			# echo "               Adding a line, numLines is "$numToAdd
			echo "" >> ./sim_by_config/A${station}_c${config}_E${energy}_MergedFiles.txt
			numToAdd=$[$numToAdd-1]
		done		
	done
done
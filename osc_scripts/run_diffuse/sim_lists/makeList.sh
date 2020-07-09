
station=$1

if [[ $station -eq 0 ]] ; then
    echo 'Error in usage! Run like: bash sort_by_config.sh <station>'
    exit 1
fi

declare -a con=("1" "2" "3" "4" "5")
declare -a en=("560" "565" "570" "575" "580" "585" "590" "595" "600" "605" "610")


for config in "${con[@]}"
do
	echo 'Config '$config

	for energy in "${en[@]}"
	do

		echo '     Energy '$energy

		ls -d -1 /fs/project/PAS0654/ARA_DATA/A23/sim_v2/RawSim/A${station}/c${config}/E${energy}/* > raw_A${station}_c${config}_E${energy}.txt

		# and add one spare line so our scripting doesn't fail when we loop in intervals of 5, 10, 20, etc.

		echo "" >> raw_A${station}_c${config}_E${energy}.txt

	done
done
# ls -d -1 /fs/scratch/PAS0654/ara/sim/RawSim/A${station}/c${config}/E${energy}/* > raw_A${station}_c${config}_E${energy}.txt
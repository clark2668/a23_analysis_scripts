#!/bin/bash

station=$1
year=$2
if [[ $station -eq 0 || $year -eq 0 ]] ; then
    echo 'Error in usage! Run like: bash sort_by_config.sh <station> <year>'
    exit 1
fi

if [[ $station -eq 2 ]]; then
	mkdir -p A$station/by_config/
	mkdir -p A$station/by_config/c1
	mkdir -p A$station/by_config/c2
	mkdir -p A$station/by_config/c3
	mkdir -p A$station/by_config/c4
	mkdir -p A$station/by_config/c5
elif [[ $station -eq 3 ]]; then
	mkdir -p A$station/by_config/
	mkdir -p A$station/by_config/c1
	mkdir -p A$station/by_config/c2
	mkdir -p A$station/by_config/c3
	mkdir -p A$station/by_config/c4
	mkdir -p A$station/by_config/c5
fi

files="A$station/$year/*.root"
for f in $files
do
	a=`basename $f .root` #strip it down to runXXXX.root
	b=${a##*_} #strip down to just the run number
	run_no=$(echo $b | sed 's/^0*//') #remove any leading zeros

	if [[ $station -eq 2 ]]; then
		if [[ $run_no -ge 0 && $run_no -le 4  ]]; then
			config=1
		elif [[ $run_no -ge 11 && $run_no -le 60  ]]; then
			config=4
		elif [[ $run_no -ge 120 && $run_no -le 2274  ]]; then
			config=2
		elif [[ $run_no -ge 2275 && $run_no -le 3463  ]]; then
			config=1
		elif [[ $run_no -ge 3465 && $run_no -le 4027  ]]; then
			config=3
		elif [[ $run_no -ge 4029 && $run_no -le 6481  ]]; then
			config=4
		elif [[ $run_no -ge 6500 && $run_no -le 8097  ]]; then
			config=5
		elif [[ $run_no -ge 8100 && $run_no -le 8246  ]]; then
			config=4
		else
			echo "I don't know what to do with run number "$run_no
		fi
	elif [[ $station -eq 3 ]]; then
		if [[ $run_no -ge 0 && $run_no -le 3  ]]; then
			config=1
		elif [[ $run_no -ge 470 && $run_no -le 1448  ]]; then
			config=2
		elif [[ $run_no -ge 1449 && $run_no -le 2971  ]]; then
			config=1
		elif [[ $run_no -ge 2972 && $run_no -le 3061  ]]; then
			config=5
		elif [[ $run_no -ge 3063 && $run_no -le 6004  ]]; then
			config=3
		elif [[ $run_no -ge 6005 && $run_no -le 7653  ]]; then
			config=4
		elif [[ $run_no -ge 7658 && $run_no -le 7808  ]]; then
			config=3
		else
			echo "I don't know what to do with run number "$run_no
		fi
	fi

	#if we want to make a symlink for the first time

	base_name=`basename $f`
	new_save='/fs/scratch/PAS0654/ara/10pct/RunSummary/A'$station'/by_config/c'$config'/'$base_name
	old_full_name=/fs/scratch/PAS0654/ara/10pct/RunSummary/$f
	ln -s $old_full_name $new_save
done
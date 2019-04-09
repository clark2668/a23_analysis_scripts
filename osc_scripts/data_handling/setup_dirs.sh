#!/bin/bash

declare -a stations=("2" "3")
declare -a energies=("16.0" "16.5" "17.0" "17.5" "18.0" "18.5" "19.0" "19.5" "20.0" "20.5" "21.0")

for station in "${stations[@]}"
do

	mkdir -p A$station
	cd A$station

	if [[ $station -eq 2 ]]; then
		declare -a configs=("1" "2" "3" "4" "5")
	elif [[ $station -eq 3 ]]; then
		declare -a configs=("1" "2" "3" "4")
	fi

	for config in "${configs[@]}"
	do
		mkdir -p c$config
		cd c$config

		for energy in "${energies[@]}"
		do
			mkdir -p E$energy
		done
		cd ..
	done
	cd ..
done
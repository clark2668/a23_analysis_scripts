#!/bin/bash

#for making symlinks to all files so that we can reference them easily
#in a way that's more organized and not /year/month/run/event/
#and just /year/run%d.root

station=$1
year=$2
if [[ $station -eq 0 || $year -eq 0 ]] ; then
    echo 'Error in usage! Run like: bash make_sym_links.sh <station> <year>'
    exit 1
fi

if [[ year -eq 2013 ]]; then
	
	toSearch=/data/wipac/ARA/2013/filtered/full2013Data/ARA0$station/root/run*/event*.root
else
	#toSearch=/fs/scratch/PAS0654/ara/10pct/RawData/A$station/$year/*/run*/event*.root
	toSearch=/data/wipac/ARA/$year/blinded/L1/ARA0$station/*/run*/event*.root
fi

find $toSearch ! -name 'eventHk*.root' | while read fname; do
	echo $fname
	a=`basename $fname .root` #get basename
	b=${a#event} #strip down to just XXXXXX
	run_no=$(echo $b | sed 's/^0*//') #remove any leading zeros
	new_save='/data/user/brianclark/A23Diffuse/100pct/RawData/A'$station/$year'/event'$run_no'.root' #make a new name
	ln -s $fname $new_save #make the symlink
done

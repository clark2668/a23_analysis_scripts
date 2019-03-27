#!/bin/bash

station=$1
year=$2
if [[ $station -eq 0 || $year -eq 0 ]] ; then
    echo 'Error in usage! Run like: bash sort_by_config.sh <station> <year>'
    exit 1
fi

dir_now=$PWD
dir_go="A$station/$year/sym_links/"
cd $dir_go
files=*.root
for f in $files
do
	a=`basename $f .root` #strip it down to runXXXX.root
	b=${a#event} #strip down to just XXXX (no _ version)
	run_no=$(echo $b | sed 's/^0*//') #remove leading zeros	
	mv $f event$run_no.root
done
cd $dir_now
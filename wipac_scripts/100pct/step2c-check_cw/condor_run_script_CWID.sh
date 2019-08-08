#!/bin/bash

eval 'source /home/brianclark/A23_analysis_new2/env.sh'
cd $ARA_ROOT_DIR
./bin/v2_CW100 $SIMULATION $STATION $CONFIG 1 $FILTERFILEDIR $SUMMARYDIR $TMPDIR/ $FileTarget

if [ $? -ne 0 ] #error handle if something has gone wrong
then
	echo $FileTarget >> /data/user/brianclark/A23Diffuse/100pct/CWID/CWIDproblems_A${STATION}_${CONFIG}_rd1.txt
else
	mv $TMPDIR/*.root $OutputDir
fi

#./bin/v2_CW100 <1-simulation_flag> <2-station> <3-year/config> <4-drop_bad_chans> <5-filter_file_dir> <6-run summary directory> <7-output directory> <8-input file> <9-pedestal file> 

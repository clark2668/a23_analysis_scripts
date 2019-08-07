#!/bin/bash

eval 'source /home/brianclark/A23_analysis_new2/env.sh'
cd $ARA_ROOT_DIR
./bin/v2_Reco100 $SIMULATION $STATION $CONFIG $FILTERFILEDIR $TMPDIR/ $FileTarget

if [ $? -ne 0 ] #error handle if something has gone wrong
then
	echo $FileTarget >> /data/user/brianclark/A23Diffuse/100pct/ProcessedFile/recoproblems_A${STATION}_${CONFIG}_rd1.txt
else
	mv $TMPDIR/*.root $OutputDir
fi
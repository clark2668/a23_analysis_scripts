#!/bin/bash

uname -a #for host debugging
eval 'source /home/brianclark/A23_analysis_new2/env.sh'
cd $ARA_ROOT_DIR
./bin/v2_Filter $SIMULATION $STATION $CONFIG $SUMMARYDIR $TMPDIR/ $FileTarget

if [ $? -ne 0 ] #error handle if something has gone wrong
then
	echo $FileTarget >> /data/user/brianclark/A23Diffuse/100pct_try2/ProcessedFile/problems_A${STATION}_${CONFIG}_rd1.txt
else
	mv $TMPDIR/*.root $OutputDir
fi

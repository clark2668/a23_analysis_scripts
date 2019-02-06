#!/bin/bash

cd $ARA_ROOT_DIR
./bin/v2_RunSummary $SIMULATION $STATION $TMPDIR/ $FileTarget

if [ $? -ne 0 ] #error handle if something has gone wrong
then
	echo $FileTarget >> /data/user/brianclark/A23Diffuse/RunSummary/problems_A${STATION}_${YEAR}_rd1.txt
else
	mv $TMPDIR/*.root $OutputDir
fi

#!/bin/bash

cd $ARA_ROOT_DIR
./bin/makeBaselines $OutputDir/ $FileTarget
if [ $? -ne 0 ] #error handle if something has gone wrong
then
	echo $FileTarget >> /data/user/brianclark/A23Diffuse/Baselines/problems.txt
fi

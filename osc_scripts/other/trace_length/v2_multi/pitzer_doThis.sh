#!/bin/bash
eval 'source /users/PAS0654/osu0673/A23_analysis_new2/env.sh'
cd $RUNDIR
./bin/TraceLength_Save $1 $2 $3

#!/bin/bash
eval 'source /users/PAS0654/osu0673/A23_analysis_new2/env.sh'
cd $RUNDIR
#./bin/v2_SaveVals_Sim $1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11}
./bin/v2_SaveVals_Sim_wVertex $1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11}

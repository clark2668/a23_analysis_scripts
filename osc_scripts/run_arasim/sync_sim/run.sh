#/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l walltime=01:00:00
#PBS -l mem=4GB
#PBS -A PAS0654
#PBS -e /fs/project/PAS0654/ARA_DATA/A23/sim_v2/err_out_logs
#PBS -o /fs/project/PAS0654/ARA_DATA/A23/sim_v2/err_out_logs

eval 'source /users/PAS0654/osu0673/A23_analysis_new2/env.sh'

cd $RUN_DIR

./bin/SyncSim $STATION $CONFIG $ENERGY $TMPDIR $FILEPATH/*.root

pbsdcp -g $TMPDIR/'*.root' $OUTPUT_DIR
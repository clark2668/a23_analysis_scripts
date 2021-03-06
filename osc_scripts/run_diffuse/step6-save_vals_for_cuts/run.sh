#/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l mem=4GB
#PBS -l walltime=2:30:00
#PBS -A PAS0654
#PBS -e /fs/scratch/PAS0654/ara/10pct/err_out_logs
#PBS -o /fs/scratch/PAS0654/ara/10pct/err_out_logs

eval 'source /users/PAS0654/osu0673/A23_analysis_new2/env.sh'

cd $RUNDIR

./bin/v2_SaveVals $SIMULATION $STATION $CONFIG $ENERGY $DROPCHANS $TMPDIR $FILE

if [ $? -ne 0 ] #error handle
then
	echo $FILE >> /fs/scratch/PAS0654/ara/10pct/ValsForCuts/problems_A${STATION}_${YEAR}_rd1_v2.txt
else
	pbsdcp $TMPDIR/'*.root' $OUTPUTDIR
fi

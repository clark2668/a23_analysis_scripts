#/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l mem=4GB
#PBS -l walltime=01:00:00
#PBS -A PAS0654
#PBS -e /fs/scratch/PAS0654/ara/10pct/err_out_logs
#PBS -o /fs/scratch/PAS0654/ara/10pct/err_out_logs

eval 'source /users/PAS0654/osu0673/A23_analysis/env.sh'

cd $RUNDIR

./bin/v2_Filter $SIMULATION $STATION $SUMMARYDIR $TMPDIR $FILE $PED

if [ $? -ne 0 ] #error handle
then
	echo $FILE $PED >> /fs/scratch/PAS0654/ara/10pct/ProcessedFile/problems_A${STATION}_${YEAR}_rd1.txt
else
	pbsdcp $TMPDIR/'*.root' $OUTPUTDIR
fi
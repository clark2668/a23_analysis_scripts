#/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l mem=4760MB
#PBS -l walltime=01:20:00
#PBS -A PCON0003
#PBS -e /fs/scratch/PAS0654/ara/10pct/err_out_logs
#PBS -o /fs/scratch/PAS0654/ara/10pct/err_out_logs

eval 'source /users/PAS0654/osu0673/A23_analysis_new2/env.sh'

cd $RUNDIR

./bin/v2_RunSummary $SIMULATION $STATION $TMPDIR $FILE $PED

if [ $? -ne 0 ] #error handle
then
	echo $FILE $PED >> $ERRFILE
else
	pbsdcp $TMPDIR/'*.root' $OUTPUTDIR
fi
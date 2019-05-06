#/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l mem=4GB
#PBS -l walltime=00:02:00
#PBS -A PAS0654
#PBS -e /fs/scratch/PAS0654/ara/10pct/err_out_logs
#PBS -o /fs/scratch/PAS0654/ara/10pct/err_out_logs

# source your own shell script here
eval 'source /users/PAS0654/osu0673/A23_analysis_new2/env.sh'

cd $RUNDIR

./bin/Cuts_SaveCalReco $STATION $TMPDIR $FILE

if [ $? -ne 0 ] #error handle
then
	echo $FILE $PED >> /fs/scratch/PAS0654/ara/10pct/other_studies/RecoSave/problems_recosave_A${STATION}_c${config}.txt
else
	pbsdcp $TMPDIR/'*.root' $OUTPUTDIR
fi
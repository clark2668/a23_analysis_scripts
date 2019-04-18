#/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l mem=4GB
#PBS -l walltime=00:05:00
#PBS -A PAS0654

eval 'source /users/PAS0654/osu0673/A23_analysis_new2/env.sh'

cd $RUNDIR

./bin/v2_Join $STATION $TMPDIR $PROCDIR $FILE

if [ $? -ne 0 ] #error handle
then
	echo $FILE >> /fs/scratch/PAS0654/ara/10pct/Joined/problems_A${STATION}_${YEAR}_join_errors.txt
else
	pbsdcp $TMPDIR/'*.root' $OUTPUTDIR
fi

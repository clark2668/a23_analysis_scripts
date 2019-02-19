#/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l mem=4GB
#PBS -l walltime=2:30:00
#PBS -A PCON0003
#PBS -e /fs/scratch/PAS0654/ara/10pct/err_out_logs
#PBS -o /fs/scratch/PAS0654/ara/10pct/err_out_logs

eval 'source /users/PAS0654/osu0673/A23_analysis/env.sh'

cd $RUNDIR

./bin/v2_SaveVals $STATION $YEAR $DROPCHANS $TMPDIR $FILE

if [ $? -ne 0 ] #error handle
then
	echo $FILE >> /fs/scratch/PAS0654/ara/10pct/ValsForCuts/problems_A${STATION}_${YEAR}_rd1.txt
else
	pbsdcp $TMPDIR/'*.root' $OUTPUTDIR
fi

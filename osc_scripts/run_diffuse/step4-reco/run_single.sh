#/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l mem=4GB
#PBS -A PAS0654

eval 'source /users/PAS0654/osu0673/A23_analysis_new2/env.sh'

cd $RUNDIR

./bin/v2_Reco $SIMULATION $STATION $RADBIN $FILTERDIR $TMPDIR $FILE

if [ $? -ne 0 ] #error handle
then
	echo $FILE $PED >> $ERRFILE
else
	pbsdcp $TMPDIR/'*.root' $OUTPUTDIR
fi

#/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l mem=4GB
#PBS -l walltime=00:20:00
#PBS -A PCON0003
#PBS -e /fs/scratch/PAS0654/ara/10pct/OffsetBlock/err_out_log/
#PBS -o /fs/scratch/PAS0654/ara/10pct/OffsetBlock/err_out_log/

# source your own shell script here
eval 'source /users/PAS0654/osu0673/A23_analysis_new2/env.sh'

cd $RUNDIR

./bin/OffsetBlockVTime $STATION $YEAR $FILE $TMPDIR


if [ $? -ne 0 ] #error handle
then
    echo $FILE $PED >> /fs/scratch/PAS0654/ara/10pct/OffsetBlock/problems_A${STATION}_${YEAR}.txt
else
    pbsdcp $TMPDIR/'*.root' $OUTPUTDIR
fi

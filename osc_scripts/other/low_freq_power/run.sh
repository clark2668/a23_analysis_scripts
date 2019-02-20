#/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l mem=4GB
#PBS -l walltime=00:40:00
#PBS -A PCON0003
#PBS -e /fs/scratch/PAS0654/ara/10pct/LowFreqPower/err_out_log/
#PBS -o /fs/scratch/PAS0654/ara/10pct/LowFreqPower/err_out_log/

# source your own shell script here
eval 'source /users/PAS0654/osu0673/A23_analysis/env.sh'

# $RUNDIR was defined in the submission script 
# along with $FILE and $OUTPUTDIR

cd $RUNDIR

# $TMPDIR is the local memory of this specific node
# it's the only variable we didn't have to define

./bin/SaveLowFreqPower $STATION $YEAR $FILE $TMPDIR
 
# after we're done
# we copy the results to the $OUTPUTDIR

if [ $? -ne 0 ] #error handle
then
    echo $FILE $PED >> /fs/scratch/PAS0654/ara/10pct/LowFreqPower/problems_A${STATION}_${YEAR}.txt
else
    pbsdcp $TMPDIR/'*.root' $OUTPUTDIR
fi

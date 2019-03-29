#/bin/bash
#PBS -l nodes=1:ppn=40
#PBS -l walltime=24:00:00
#PBS -A PCON0003
#PBS -e /fs/scratch/PAS0654/ara/sim/err_out_logs
#PBS -o /fs/scratch/PAS0654/ara/sim/err_out_logs

eval 'source /users/PAS0654/osu0673/A23_analysis_new2/env.sh'

cd $RUN_DIR

for i in {1..40}
do
	./AraSim $INPUTFILE $(($i+$OFFSET)) $TMPDIR & 
done
wait
pbsdcp $TMPDIR/'*.root' $OUTPUT_DIR

for i in {41..80}
do
	./AraSim $INPUTFILE $(($i+$OFFSET)) $TMPDIR & 
done
wait
pbsdcp $TMPDIR/'*.root' $OUTPUT_DIR

for i in {81..120}
do
	./AraSim $INPUTFILE $(($i+$OFFSET)) $TMPDIR & 
done
wait
pbsdcp $TMPDIR/'*.root' $OUTPUT_DIR

for i in {121..160}
do
	./AraSim $INPUTFILE $(($i+$OFFSET)) $TMPDIR & 
done
wait
pbsdcp $TMPDIR/'*.root' $OUTPUT_DIR

for i in {161..200}
do
	./AraSim $INPUTFILE $(($i+$OFFSET)) $TMPDIR & 
done
wait
pbsdcp $TMPDIR/'*.root' $OUTPUT_DIR
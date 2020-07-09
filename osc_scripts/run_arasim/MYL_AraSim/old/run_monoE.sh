#/bin/bash
#PBS -l nodes=1:ppn=28
#PBS -l walltime=20:00:00
#PBS -A PAS0654
#PBS -e /fs/scratch/PAS0654/ara/sim/err_out_logs
#PBS -o /fs/scratch/PAS0654/ara/sim/err_out_logs

eval 'source /users/PAS0654/osu0673/A23_analysis_new2/env.sh'

cd $RUN_DIR

for i in {1..28}
do
	./AraSim $INPUTFILE $(($i+$OFFSET)) $TMPDIR & 
done
wait
pbsdcp -g $TMPDIR/'*.root' $OUTPUT_DIR

for i in {29..56}
do
	./AraSim $INPUTFILE $(($i+$OFFSET)) $TMPDIR & 
done
wait
pbsdcp -g $TMPDIR/'*.root' $OUTPUT_DIR

for i in {57..84}
do
	./AraSim $INPUTFILE $(($i+$OFFSET)) $TMPDIR & 
done
wait
pbsdcp -g $TMPDIR/'*.root' $OUTPUT_DIR

for i in {85..112}
do
	./AraSim $INPUTFILE $(($i+$OFFSET)) $TMPDIR & 
done
wait
pbsdcp -g $TMPDIR/'*.root' $OUTPUT_DIR

for i in {113..140}
do
	./AraSim $INPUTFILE $(($i+$OFFSET)) $TMPDIR & 
done
wait
pbsdcp -g $TMPDIR/'*.root' $OUTPUT_DIR
#/bin/bash
#PBS -l nodes=1:ppn=10
#PBS -A PAS0654
#PBS -l mem=30GB

cd $LAUNCHDIR

./doThis.sh $STATION $TMPDIR $F1 &
declare pid_1=$!
declare F_1=$F1
./doThis.sh $STATION $TMPDIR $F2 &
declare pid_2=$!
declare F_2=$F2
./doThis.sh $STATION $TMPDIR $F3 &
declare pid_3=$!
declare F_3=$F3
./doThis.sh $STATION $TMPDIR $F4 &
declare pid_4=$!
declare F_4=$F4
./doThis.sh $STATION $TMPDIR $F5 &
declare pid_5=$!
declare F_5=$F5
./doThis.sh $STATION $TMPDIR $F6 &
declare pid_6=$!
declare F_6=$F6
./doThis.sh $STATION $TMPDIR $F7 &
declare pid_7=$!
declare F_7=$F7
./doThis.sh $STATION $TMPDIR $F8 &
declare pid_8=$!
declare F_8=$F8
./doThis.sh $STATION $TMPDIR $F9 &
declare pid_9=$!
declare F_9=$F9
./doThis.sh $STATION $TMPDIR $F10 &
declare pid_10=$!
declare F_10=$F10


for i in `seq 1 10`
do
	declare val=pid_$i
	wait ${!val}
	declare ret_$i=$?
done

for i in `seq 1 10`
do
	declare val=ret_$i
	if [ ${!val} -ne 0 ] #error handle
	then
		declare trouble_file=F_$i
		echo "${!trouble_file}" >> /users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/other/trigger_rate/problems_triggerrate_A${STATION}_c${CONFIG}_rd1.txt
	fi
done
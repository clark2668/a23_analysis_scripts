#/bin/bash
#PBS -l nodes=1:ppn=20
#PBS -l mem=80GB

cd $LAUNCHDIR

./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F1 &
declare pid_1=$!
declare F_1=$F1
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F2 &
declare pid_2=$!
declare F_2=$F2
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F3 &
declare pid_3=$!
declare F_3=$F3
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F4 &
declare pid_4=$!
declare F_4=$F4
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F5 &
declare pid_5=$!
declare F_5=$F5
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F6 &
declare pid_6=$!
declare F_6=$F6
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F7 &
declare pid_7=$!
declare F_7=$F7
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F8 &
declare pid_8=$!
declare F_8=$F8
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F9 &
declare pid_9=$!
declare F_9=$F9
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F10 &
declare pid_10=$!
declare F_10=$F10
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F11 &
declare pid_11=$!
declare F_11=$F11
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F12 &
declare pid_12=$!
declare F_12=$F12
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F13 &
declare pid_13=$!
declare F_13=$F13
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F14 &
declare pid_14=$!
declare F_14=$F14
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F15 &
declare pid_15=$!
declare F_15=$F15
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F16 &
declare pid_16=$!
declare F_16=$F16
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F17 &
declare pid_17=$!
declare F_17=$F17
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F18 &
declare pid_18=$!
declare F_18=$F18
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F19 &
declare pid_19=$!
declare F_19=$F19
./sim_doThis.sh $SIMULATION $STATION $CONFIG $RADBIN $FILTERDIR $TMPDIR $F20 &
declare pid_20=$!
declare F_20=$F20

for i in `seq 1 20`
do
	declare val=pid_$i
	wait ${!val}
	declare ret_$i=$?
done

for i in `seq 1 20`
do
	declare val=ret_$i
	if [ ${!val} -ne 0 ] #error handle
	then
		declare trouble_file=F_$i
		echo "${!trouble_file}" >> $ERRFILE
	fi
done

pbsdcp $TMPDIR/'*.root' $OUTPUTDIR
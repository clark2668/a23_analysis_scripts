#/bin/bash
#PBS -l nodes=1:ppn=28
#PBS -A PAS0654

cd $LAUNCHDIR

./owens_doThis.sh $STATION $TMPDIR $F1 &
declare pid_1=$!
declare F_1=$F1
./owens_doThis.sh $STATION $TMPDIR $F2 &
declare pid_2=$!
declare F_2=$F2
./owens_doThis.sh $STATION $TMPDIR $F3 &
declare pid_3=$!
declare F_3=$F3
./owens_doThis.sh $STATION $TMPDIR $F4 &
declare pid_4=$!
declare F_4=$F4
./owens_doThis.sh $STATION $TMPDIR $F5 &
declare pid_5=$!
declare F_5=$F5
./owens_doThis.sh $STATION $TMPDIR $F6 &
declare pid_6=$!
declare F_6=$F6
./owens_doThis.sh $STATION $TMPDIR $F7 &
declare pid_7=$!
declare F_7=$F7
./owens_doThis.sh $STATION $TMPDIR $F8 &
declare pid_8=$!
declare F_8=$F8
./owens_doThis.sh $STATION $TMPDIR $F9 &
declare pid_9=$!
declare F_9=$F9
./owens_doThis.sh $STATION $TMPDIR $F10 &
declare pid_10=$!
declare F_10=$F10
./owens_doThis.sh $STATION $TMPDIR $F11 &
declare pid_11=$!
declare F_11=$F11
./owens_doThis.sh $STATION $TMPDIR $F12 &
declare pid_12=$!
declare F_12=$F12
./owens_doThis.sh $STATION $TMPDIR $F13 &
declare pid_13=$!
declare F_13=$F13
./owens_doThis.sh $STATION $TMPDIR $F14 &
declare pid_14=$!
declare F_14=$F14
./owens_doThis.sh $STATION $TMPDIR $F15 &
declare pid_15=$!
declare F_15=$F15
./owens_doThis.sh $STATION $TMPDIR $F16 &
declare pid_16=$!
declare F_16=$F16
./owens_doThis.sh $STATION $TMPDIR $F17 &
declare pid_17=$!
declare F_17=$F17
./owens_doThis.sh $STATION $TMPDIR $F18 &
declare pid_18=$!
declare F_18=$F18
./owens_doThis.sh $STATION $TMPDIR $F19 &
declare pid_19=$!
declare F_19=$F19
./owens_doThis.sh $STATION $TMPDIR $F20 &
declare pid_20=$!
declare F_20=$F20
./owens_doThis.sh $STATION $TMPDIR $F21 &
declare pid_21=$!
declare F_21=$F21
./owens_doThis.sh $STATION $TMPDIR $F22 &
declare pid_22=$!
declare F_22=$F22
./owens_doThis.sh $STATION $TMPDIR $F23 &
declare pid_23=$!
declare F_23=$F23
./owens_doThis.sh $STATION $TMPDIR $F24 &
declare pid_24=$!
declare F_24=$F24
./owens_doThis.sh $STATION $TMPDIR $F25 &
declare pid_25=$!
declare F_25=$F25
./owens_doThis.sh $STATION $TMPDIR $F26 &
declare pid_26=$!
declare F_26=$F26
./owens_doThis.sh $STATION $TMPDIR $F27 &
declare pid_27=$!
declare F_27=$F27
./owens_doThis.sh $STATION $TMPDIR $F28 &
declare pid_28=$!
declare F_28=$F28

for i in `seq 1 28`
do
	declare val=pid_$i
	wait ${!val}
	declare ret_$i=$?
done

for i in `seq 1 28`
do
	declare val=ret_$i
	if [ ${!val} -ne 0 ] #error handle
	then
		declare trouble_file=F_$i
		echo "${!trouble_file}" >> /users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/other/reco_vs_time_multi/v2_multi/problems_recovtime_A${STATION}_c${CONFIG}_rd1.txt
	fi
done

pbsdcp $TMPDIR/'*.png' $OUTPUTDIR
#!/bin/bash


echo ""
echo ""
echo "------------------------------------------------------------"
echo ""
echo ""


RunDir="/users/PAS0654/osu0673/A23_analysis_new2/AraRoot"
echo '[ RunDir: ' $RunDir ' ]'
export RunDir

LaunchDir="/users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/run_diffuse/step6-save_vals_for_cuts/sim"
echo '[ LaunchDir: ' $LaunchDir ' ]'
export LaunchDir

station="2"
echo '[ Station: ' $station ' ]'
export station

simulation='1'
echo '[ Simulation: ' $simulation ' ]'
export simulation

DropBadChans='1'
echo '[ DropBadChans?: ' $DropBadChans ' ]'
export DropBadChans

walltime=00:20:00

#some cut values
V_SNR_BIN=0
H_SNR_BIN=0

# initial test values for A2
V_WFRMS_CUT=-1.3
H_WFRMS_CUT=-1.4

echo ""
echo "------------------------------------------------------------"

declare -a con=("1" "2" "3" "4" "5")
#declare -a en=("610" "605" "600" "595" "590" "585" "580" "575" "570" "565" "560")
declare -a en=("560"  "565" "570" "575" "580" "585" "590" "595" "600" "605" "610" )

# declare -a con=("1" "2" "3" "4" "5")
# declare -a en=("610" "605")

#declare -a con=("2")
#declare -a en=("580")


for config in "${con[@]}"
do
	# echo 'Config '$config

	for energy in "${en[@]}"
	do

		if [ $station == '3' ] #is simulation
		then
			V_SNR_BIN=0
			H_SNR_BIN=1
			if [ $config == '1' ]
			then
				V_WFRMS_CUT=-1.2
				H_WFRMS_CUT=-1.3
			elif [ $config == '2' ] #is not simulation
			then
				V_WFRMS_CUT=-1.3
				H_WFRMS_CUT=-1.4
			elif [ $config == '3' ] #is not simulation
			then
				V_WFRMS_CUT=-1.0
				H_WFRMS_CUT=-1.1
			elif [ $config == '4' ] #is not simulation
			then
				V_WFRMS_CUT=-1.0
				H_WFRMS_CUT=-1.1
			elif [ $config == '5' ] #is not simulation
			then
				V_WFRMS_CUT=-0.7
				H_WFRMS_CUT=-0.8
			fi
		fi

		export V_SNR_BIN
		export H_SNR_BIN
		export V_WFRMS_CUT
		export H_WFRMS_CUT

		OutputDir="/fs/project/PAS0654/ARA_DATA/A23/sim_v2/ValsForCuts_wVertex/A${station}/c${config}/E${energy}"
		#OutputDir="/fs/project/PAS0654/ARA_DATA/A23/sim_v2/ValsForCuts/A${station}/c${config}/E${energy}"
		readfile=../sim_by_config/A${station}_c${config}_E${energy}_MergedFiles.txt
		err_out_location=/fs/project/PAS0654/ARA_DATA/A23/sim_v2/ValsForCuts_wVertex/err_out_logs
		#err_out_location=/fs/project/PAS0654/ARA_DATA/A23/sim_v2/ValsForCuts/err_out_logs
		ErrFile="/fs/project/PAS0654/ARA_DATA/A23/sim_v2/ValsForCuts_wVertex/problems_savevals_A${station}_c${config}_E${energy}.txt"
		#ErrFile="/fs/project/PAS0654/ARA_DATA/A23/sim_v2/ValsForCuts/problems_savevals_A${station}_c${config}_E${energy}.txt"

		#where should the outputs be stored?
		echo '[ Output directory: ' $OutputDir ' ]'
		export OutputDir

		#we have to define where in the list of data files we want to start
		FileNumberStart=0
		FileNumberEnd=5000
		# FileNumberEnd=1

		FileNumber=0
		while read line1 && read line2 && read line3 && read line4 && read line5 && read line6 && read line7 && read line8 && read line9 && read line10 && read line11 && read line12 && read line13 && read line14 && read line15 && read line16 && read line17 && read line18 && read line19 && read line20
		do

			if (( $FileNumber >= $FileNumberStart && $FileNumber <= $FileNumberEnd ))
			then

				sa1=($line1)
				f1=${sa1[0]}

				sa2=($line2)
				f2=${sa2[0]}

				sa3=($line3)
				f3=${sa3[0]}

				sa4=($line4)
				f4=${sa4[0]}

				sa5=($line5)
				f5=${sa5[0]}

				sa6=($line6)
				f6=${sa6[0]}

				sa7=($line7)
				f7=${sa7[0]}

				sa8=($line8)
				f8=${sa8[0]}
				p8=${sa8[1]}

				sa9=($line9)
				f9=${sa9[0]}

				sa10=($line10)
				f10=${sa10[0]}

				sa11=($line11)
				f11=${sa11[0]}

				sa12=($line12)
				f12=${sa12[0]}

				sa13=($line13)
				f13=${sa13[0]}

				sa14=($line14)
				f14=${sa14[0]}

				sa15=($line15)
				f15=${sa15[0]}

				sa16=($line16)
				f16=${sa16[0]}

				sa17=($line17)
				f17=${sa17[0]}

				sa18=($line18)
				f18=${sa18[0]}

				sa19=($line19)
				f19=${sa19[0]}

				sa20=($line20)
				f20=${sa20[0]}

				qsub -l walltime=$walltime -e $err_out_location -o $err_out_location -v LAUNCHDIR=$LaunchDir,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,ERRFILE=$ErrFile,DROPCHANS=$DropBadChans,STATION=$station,CONFIG=$config,ENERGY=$energy,SIMULATION=$simulation,VBIN=$V_SNR_BIN,HBIN=$H_SNR_BIN,VCUT=$V_WFRMS_CUT,HCUT=$H_WFRMS_CUT,F1=$f1,F2=$f2,F3=$f3,F4=$f4,F5=$f5,F6=$f6,F7=$f7,F8=$f8,F9=$f9,F10=$f10,F11=$f11,F12=$f12,F13=$f13,F14=$f14,F15=$f15,F16=$f16,F17=$f17,F18=$f18,F19=$f19,F20=$f20 -N 'sim_savevals_A'$station'_c'$config'_E'$energy'_set'$FileNumber sim_run.sh
					
			fi
			FileNumber=$((FileNumber+20))

		done < $readfile
	done
done

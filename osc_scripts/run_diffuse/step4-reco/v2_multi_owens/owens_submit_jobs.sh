7#!/bin/bash

station="3"
echo '[ Station: ' $station ' ]'
export station

year="2015"
echo '[ Year: ' $year ' ]'
export year

simulation='0'
echo '[ Simulation: ' $simulation ' ]'
export simulation

RadiusBin=6
#RadiusBin=19
echo '[ Radius Bin: ' $RadiusBin ' ]'
export RadiusBin

# energy='20.0'
energy='224'
echo '[ Energy: ' $energy ']'
export energy

config="1"
echo '[ Config: ' $config ']'
export config

if [ $simulation == '1' ] #is simulation
then
	OutputDir="/fs/scratch/PAS0654/ara/sim/ProcessedFile/A${station}/c${config}/E${energy}"
	FilterDir="/fs/scratch/PAS0654/ara/sim/ProcessedFile/A${station}/c${config}/E${energy}"
	ErrFile="/fs/scratch/PAS0654/ara/sim/ProcessedFile/sim_recoproblems_A${station}_E${energy}_R${RadiusBin}.txt"
	readfile=../../sim_lists/raw_A${station}_c${config}_E${energy}.txt
	walltime=00:20:00
	err_out_location=/fs/scratch/PAS0654/ara/sim/err_out_logs
elif [ $simulation == '0' ] #is not simulation
then
	OutputDir="/fs/project/PAS0654/ARA_DATA/A23/10pct_redo/ProcessedFile/A${station}/${year}"
	FilterDir="/fs/project/PAS0654/ARA_DATA/A23/10pct_redo/ProcessedFile/A${station}/${year}"
	ErrFile="/fs/project/PAS0654/ARA_DATA/A23/10pct_redo/ProcessedFile/data_recoproblems_A${station}_${year}_R${RadiusBin}.txt"
	readfile=../../make_run_lists/A${station}List_1in10_${year}_bySize_owens.txt
	walltime=09:00:00
	err_out_location=/fs/project/PAS0654/ARA_DATA/A23/10pct_redo/err_out_logs
fi

echo '[ Fiter file directory: ' $FilterDir ' ]'
export FilterDir

echo '[ Processed file output directory: ' $OutputDir ' ]'
export OutputDir

echo '[ Error file directory: ' $ErrFile ' ]'
export ErrFile

RunDir="/users/PAS0654/osu0673/A23_analysis_new2/AraRoot"
export RunDir

LaunchDir="/users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/run_diffuse/step4-reco/v2_multi_owens"
echo '[ LaunchDir: ' $LaunchDir ' ]'
export LaunchDir

account=PAS0654
# account=PCON0003

FileNumberStart=0
FileNumberEnd=5000

tac $readfile > junkme.txt

FileNumber=0
while read line1 && read line2 && read line3 && read line4 && read line5 && read line6 && read line7 && read line8 && read line9 && read line10 && read line11 && read line12 && read line13 && read line14 && read line15 && read line16 && read line17 && read line18 && read line19 && read line20 && read line21 && read line22 && read line23 && read line24 && read line25 && read line26 && read line27 && read line28
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

		sa21=($line21)
		f21=${sa21[0]}

		sa22=($line22)
		f22=${sa22[0]}

		sa23=($line23)
		f23=${sa23[0]}

		sa24=($line24)
		f24=${sa24[0]}

		sa25=($line25)
		f25=${sa25[0]}

		sa26=($line26)
		f26=${sa26[0]}

		sa27=($line27)
		f27=${sa27[0]}

		sa28=($line28)
		f28=${sa28[0]}

		# there's a bundle of files in 2013 that are *huge* (5x normal size)
                # and require special walltime considerations
                # in the "owens" version, they fall in the bundles indexed by 644 and 672
                # so we bump the walltime for those files

                #if (( $FileNumber == 0 && $station == '3' && $year == '2013' ))
                #then
                #        echo 'Bumped walltime'
                #        walltime=36:00:00
                #else
                #        nothing="nothing" #do nothing, lol 
                #        walltime=24:00:00
                #fi

                #if (( $FileNumber == 28 && $station == '3' && $year == '2013' ))
                #then
                #        echo 'Bumped walltime'
                #        walltime=36:00:00
                #else
                #        nothing="nothing" #do nothing, lol
                #        walltime=24:00:00
                #fi

		if [ $simulation == '0' ] #is no simulation
		then
			qsub -A $account -l walltime=$walltime -e $err_out_location -o $err_out_location -v FILTERDIR=$FilterDir,ERRFILE=$ErrFile,LAUNCHDIR=$LaunchDir,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,RADBIN=$RadiusBin,STATION=$station,YEAR=$year,CONFIG=$config,ENERGY=$energy,SIMULATION=$simulation,F1=$f1,P1=$p1,F2=$f2,P2=$p2,F3=$f3,P3=$p3,F4=$f4,P4=$p4,F5=$f5,P5=$p5,F6=$f6,P6=$p6,F7=$f7,P7=$p7,F8=$f8,P8=$p8,F9=$f9,P9=$p9,F10=$f10,P10=$p10,F11=$f11,P11=$p11,F12=$f12,P12=$p12,F13=$f13,P13=$p13,F14=$f14,P14=$p14,F15=$f15,P15=$p15,F16=$f16,P16=$p16,F17=$f17,P17=$p17,F18=$f18,P18=$p18,F19=$f19,P19=$p19,F20=$f20,P20=$p20,F21=$f21,P21=$p21,F22=$f22,P22=$p22,F23=$f23,P23=$p23,F24=$f24,P24=$p24,F25=$f25,P25=$p25,F26=$f26,P26=$p26,F27=$f27,P27=$p27,F28=$f28,P28=$p28 -N 'owens_multi28_A'$station'_'$year'_R'$RadiusBin'_'$FileNumber'_datareco' owens_run.sh
		elif [ $simulation == '1' ] #is simulation
		then
			qsub -A $account -l walltime=$walltime -e $err_out_location -o $err_out_location -v FILTERDIR=$FilterDir,ERRFILE=$ErrFile,LAUNCHDIR=$LaunchDir,RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,RADBIN=$RadiusBin,STATION=$station,YEAR=$year,CONFIG=$config,ENERGY=$energy,SIMULATION=$simulation,F1=$f1,P1=$p1,F2=$f2,P2=$p2,F3=$f3,P3=$p3,F4=$f4,P4=$p4,F5=$f5,P5=$p5,F6=$f6,P6=$p6,F7=$f7,P7=$p7,F8=$f8,P8=$p8,F9=$f9,P9=$p9,F10=$f10,P10=$p10,F11=$f11,P11=$p11,F12=$f12,P12=$p12,F13=$f13,P13=$p13,F14=$f14,P14=$p14,F15=$f15,P15=$p15,F16=$f16,P16=$p16,F17=$f17,P17=$p17,F18=$f18,P18=$p18,F19=$f19,P19=$p19,F20=$f20,P20=$p20,F21=$f21,P21=$p21,F22=$f22,P22=$p22,F23=$f23,P23=$p23,F24=$f24,P24=$p24,F25=$f25,P25=$p25,F26=$f26,P26=$p26,F27=$f27,P27=$p27,F28=$f28,P28=$p28 -N 'owens_multi28_A'$station'_c'$config'_E'$energy'_R'$RadiusBin'_'$FileNumber'_simreco' owens_run.sh
		fi
		echo "-----------------------------------"
	fi

	FileNumber=$((FileNumber+28))
# done < $readfile
done < junkme.txt
rm junkme.txt

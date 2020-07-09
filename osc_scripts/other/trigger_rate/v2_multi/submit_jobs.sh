#!/bin/bash

station="3"
echo '[ Station: ' $station ' ]'
export station

year="2016"
echo '[ Config: ' $year ']'
export year

# readfile=../data_by_year/A${station}List_10in10_${year}.txt
readfile=../data_by_year/filter_A${station}_${year}.txt
err_out_location=/users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/other/trigger_rate/err_out_logs
walltime=00:15:00

RunDir="/users/PAS0654/osu0673/A23_analysis_new2/AraRoot/analysis/a23_analysis_programs/other/trigger_rate"
echo '[ RunDir: ' $RunDir ' ]'
export RunDir

LaunchDir="/users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/other/trigger_rate/v2_multi"
echo '[ LaunchDir: ' $LaunchDir ' ]'
export LaunchDir

#we have to define where in the list of data files we want to start
FileNumberStart=0
FileNumberEnd=5000

# readfile=../A${station}_${year}_MergedFiles_pitzer.txt

FileNumber=0
while read line1 && read line2 && read line3 && read line4 && read line5 && read line6 && read line7 && read line8 && read line9 && read line10
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

		qsub -l walltime=$walltime -e $err_out_location -o $err_out_location -v LAUNCHDIR=$LaunchDir,RUNDIR=$RunDir,STATION=$station,YEAR=$year,F1=$f1,F2=$f2,F3=$f3,F4=$f4,F5=$f5,F6=$f6,F7=$f7,F8=$f8,F9=$f9,F10=$f10 -N 'multi10_A'$station'_'$year'_'$FileNumber'_triggerrate' run.sh
		echo "-----------------------------------"
			
	fi
	FileNumber=$((FileNumber+10))

done < $readfile

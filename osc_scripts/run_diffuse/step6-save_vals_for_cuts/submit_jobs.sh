#!/bin/bash

station="2"
echo '[ Station: ' $station ' ]'
export station

simulation='0'
echo '[ Simulation: ' $simulation ' ]'
export simulation

energy="18.0"
echo '[ Energy: ' $energy ']'
export energy

config="1"
echo '[ Config: ' $config ']'
export config

DropBadChans='1'
echo '[ DropBadChans?: ' $DropBadChans ' ]'
export DropBadChans

if [ $simulation == '1' ] #is simulation
then
	OutputDir="/fs/scratch/PAS0654/ara/sim/ValsForCuts/A${station}/c${config}/E${energy}"
	readfile=../sim_by_config/A${station}_c${config}_E${energy}_MergedFiles_pitzer.txt
	err_out_location=/fs/scratch/PAS0654/ara/sim/err_out_logs
	walltime=00:20:00
elif [ $simulation == '0' ] #is not simulation
then
	OutputDir="/fs/scratch/PAS0654/ara/10pct/ValsForCuts/A${station}/c${config}"
	readfile=../data_by_config/A${station}_c${config}_MergedFiles_pitzer.txt
	err_out_location=/fs/scratch/PAS0654/ara/10pct/err_out_logs
	walltime=04:00:00
fi

#where should the outputs be stored?
echo '[ Output directory: ' $OutputDir ' ]'
export OutputDir

RunDir="/users/PAS0654/osu0673/A23_analysis_new2/AraRoot"
echo '[ RunDir: ' $RunDir ' ]'
export RunDir

LaunchDir="/users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/run_diffuse/step6-save_vals_for_cuts/v2_multi"
echo '[ LaunchDir: ' $LaunchDir ' ]'
export LaunchDir
counter=0
while read line
do

	echo $line

	qsub -v RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,DROPCHANS=$DropBadChans,STATION=$station,YEAR=$year,SIMULATION=$simulation,FILE=$line -N 'vals_A'$station'_'$year'_'$counter run.sh
	counter=$((counter+1))

done < $readfile

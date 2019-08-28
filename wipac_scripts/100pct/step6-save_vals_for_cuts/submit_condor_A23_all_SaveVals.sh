#!/bin/bash
eval 'source /home/brianclark/A23_analysis_new2/env.sh'

#what station?
STATION="2"
echo '[ Station: ' $STATION ' ]'
export STATION

SIMULATION='0'
echo '[ Simulation: ' $SIMULATION ' ]'
export SIMULATION

#what year?
CONFIG="1" #now we actually use configs
echo '[ Station: ' $CONFIG ' ]'
export CONFIG

DROPCHANS='1'
echo '[ DropBadChans?: ' $DROPCHANS ' ]'
export DROPCHANS

ENERGY="224"
export ENERGY

#some cut values
VBIN=0
HBIN=0
VCUT=-1.30
HCUT=-1.40
export VBIN
export HBIN
export VCUT
export HCUT

OutputDir="/data/user/brianclark/A23Diffuse/100pct/SaveVals/A${STATION}/${CONFIG}"
echo '[ Processed file output directory: ' $OutputDir ' ]'
export OutputDir

readfile=../step5-audit/good_A${STATION}_c${CONFIG}_short.txt

DATADIR="/data/user/brianclark/A23Diffuse/100pct"
export DATADIR

CWDIR="/data/user/brianclark/A23Diffuse/100pct"
export CWDIR

FileNumber=0

while read line
do
	FileTarget="$line"
	echo $FileTarget
	export FileTarget
	condor_submit -name doFilter_$CONFIG_file$FileNumber /home/brianclark/A23_analysis_new2/a23_analysis_scripts/wipac_scripts/100pct/step6-save_vals_for_cuts/job.submit.A23.SaveVals
	FileNumber=$((FileNumber+1))
done < $readfile

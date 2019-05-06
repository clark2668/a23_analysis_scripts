#!/bin/bash

station="2"
config="2"

#where should the outputs be stored?
OutputDir="/fs/scratch/PAS0654/ara/10pct/other_studies/RecoSave/A${station}/c${config}"
echo '[ Processed file output directory: ' $OutputDir ' ]'
export OutputDir

#where is your executable compiled?
RunDir="/users/PAS0654/osu0673/A23_analysis_new2/AraRoot"
export RunDir

#define the list of runs to execute on
readfile=/users/PAS0654/osu0673/A23_analysis_new2/a23_analysis_scripts/osc_scripts/run_diffuse/step6-save_vals_for_cuts/data_by_config/A${station}_c${config}_MergedFiles.txt

counter=0
while read line1
do
	qsub -v RUNDIR=$RunDir,OUTPUTDIR=$OutputDir,FILE=$line1,STATION=$station,YEAR=$year -N 'A'$station'_c'$config'_reco_'$counter run.sh
	counter=$((counter+1))
done < $readfile
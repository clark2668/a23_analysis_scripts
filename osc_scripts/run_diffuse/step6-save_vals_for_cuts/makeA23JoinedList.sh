#!/bin/bash

#this makes a list of all Filter files for the station A23 Diffuse analysis, years 2013-2016
#results are stored in A2List_1in10.txt files and the like

#run like "bash makeA23FilterList.sh station year"
#like "bash makeA23FilterList.sh 2 2013"

station=$1
config=$2

echo "[ Station: " $station " ] "
echo "[ Config: " $config " ] "

find /fs/scratch/PAS0654/ara/10pct/Joined/A$station/by_config/c$config/*.root > 'A'$station'_c'$config'_MergedFiles_pitzer.txt'

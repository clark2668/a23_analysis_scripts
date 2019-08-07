station=$1
config=$2
energy=$3

ls -d -1 /fs/scratch/PAS0654/ara/sim/RawSim/A${station}/c${config}/E${energy}/* > raw_A${station}_c${config}_E${energy}.txt
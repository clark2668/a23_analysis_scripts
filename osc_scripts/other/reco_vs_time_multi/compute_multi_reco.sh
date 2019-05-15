#/bin/bash
#PBS -l nodes=1:ppn=5
#PBS -l mem=4GB
#PBS -l walltime=02:00:00
#PBS -A PAS0654
#PBS -e /fs/scratch/PAS0654/ara/10pct/err_out_logs
#PBS -o /fs/scratch/PAS0654/ara/10pct/err_out_logs


eval 'source /users/PAS0654/osu0673/A23_analysis_new2/env.sh'

cd /users/PAS0654/osu0673/A23_analysis_new2/AraRoot

./bin/RecoVsTime_Multi 2 $TMPDIR /fs/scratch/PAS0654/ara/10pct/ValsForCuts/A2/c1/cutvals_drop_snrbins_3_5_wfrmsvals_1.5_1.5_run_* &
./bin/RecoVsTime_Multi 2 $TMPDIR /fs/scratch/PAS0654/ara/10pct/ValsForCuts/A2/c2/cutvals_drop_snrbins_3_5_wfrmsvals_1.5_1.5_run_* &
./bin/RecoVsTime_Multi 2 $TMPDIR /fs/scratch/PAS0654/ara/10pct/ValsForCuts/A2/c3/cutvals_drop_snrbins_3_5_wfrmsvals_1.5_1.5_run_* &
./bin/RecoVsTime_Multi 2 $TMPDIR /fs/scratch/PAS0654/ara/10pct/ValsForCuts/A2/c4/cutvals_drop_snrbins_3_5_wfrmsvals_1.5_1.5_run_* &
./bin/RecoVsTime_Multi 2 $TMPDIR /fs/scratch/PAS0654/ara/10pct/ValsForCuts/A2/c5/cutvals_drop_snrbins_3_5_wfrmsvals_1.5_1.5_run_* &
wait

pbsdcp $TMPDIR/'*.pdf' /users/PAS0654/osu0673/A23_analysis_new2/results/reco_vs_time_multi/.

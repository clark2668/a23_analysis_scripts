#loop over every line in the pedestal pair files
while read line; do
	#echo $line
	if [[ "$line" =~ 'pedestalValues' ]]; then #if the line contains the word "pesetalValues"
		echo "Pedestal specified!"
		new=${line%%.*} # retain the part before the last dot
		runName=${new##*/}  # retain the part after the last slash
		new_save='/fs/scratch/PAS0654/ara/peds/run_specific_peds/A2/2013/'$runName'_specificPeds.dat' #make a new filename
		echo 'new save name: ' $new_save	
		pedName=${line#* }
		echo 'ped name: ' $pedName
		ln -s $pedName $new_save
		# cp $pedName $new_save
	else
		echo "Pedestal not specified; nothing to be done."
	fi
done <A2_2013_File_Ped_Pairs.txt

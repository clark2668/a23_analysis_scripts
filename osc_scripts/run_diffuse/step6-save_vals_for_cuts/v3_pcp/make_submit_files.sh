#!/bin/bash

template=/n/home00/clark.2668/Desktop/testing_job_prep/playground/job.submit_template.sh
echo $template


echo "#!/bin/bash" > submit_all.sh

cd split_run_list
#loop over all of the files
for filename in *
do
	cat $template > job.submit.${filename}
	echo -n "arguments=">>job.submit.${filename}
	#for each filename
	while read -r line
	do
		echo -n $line>>job.submit.${filename} #echo the run path
		echo -n " ">>job.submit.${filename} #put a space before the next entry
	done < $filename
	echo " " >>job.submit.${filename} #put a new line
	echo "Queue" >> job.submit.${filename} #add a queue statement for condor

	#now add it to the condor submit list
	echo -n "condor_submit ">> /n/home00/clark.2668/Desktop/testing_job_prep/playground/submit_all.sh
	echo job.submit.${filename} >> /n/home00/clark.2668/Desktop/testing_job_prep/playground/submit_all.sh
done
#move the submit files
mv *.submit* ../submit_files/.
#move upwards
cd ..
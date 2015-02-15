#!/bin/bash

clear

Study=Cambridge
#Study=Beijing

threads=0
MaximumThreads=8 # maximum number of CPU threads to use

for D in 1 2 3 4 
do

	if [ "$D" -eq "1" ] ; then
		Design=boxcar10
	elif [ "$D" -eq "2" ] ; then
		Design=boxcar30
	elif [ "$D" -eq "3" ] ; then
		Design=Event1
	elif [ "$D" -eq "4" ] ; then
		Design=Event2
	fi

	# Loop over different cluster defining thresholds
	for C in 1 2
	do

		if [ "$C" -eq "1" ] ; then
			ClusterDefiningThreshold=2.3
		elif [ "$C" -eq "2" ] ; then
			ClusterDefiningThreshold=3.1
		fi

		# Loop over different smoothing levels
		for S in 1 2 3 4
		do
			SignificantActivations=0

			date1=$(date +"%s")

			if [ "$S" -eq "1" ] ; then
				Smoothing=4mm
			elif [ "$S" -eq "2" ] ; then
				Smoothing=6mm
			elif [ "$S" -eq "3" ] ; then
				Smoothing=8mm
			elif [ "$S" -eq "4" ] ; then
				Smoothing=10mm
			fi

			rm all_subjects0.nii.gz
			rm all_subjects1.nii.gz
			rm all_subjects2.nii.gz
			rm all_subjects3.nii.gz
			rm all_subjects4.nii.gz
			rm all_subjects5.nii.gz
			rm all_subjects6.nii.gz
			rm all_subjects7.nii.gz

			# Loop over many random group analyses
			for Comparison in {1..1000}
			do
			echo "Starting random group analysis $Comparison !"

				# Read a pregenerated permutation
				Randomized=`cat /home/andek/Research_projects/RandomGroupAnalyses/${Study}_permutations/permutation${Comparison}.txt`
	
				#echo ${Randomized[@]}
	
				Subjects=()
		   		subjectstring=${Randomized[$((0))]}
			    Subjects+=($subjectstring)

				Subject1=${Subjects[$((0))]}
				Subject2=${Subjects[$((1))]}
				Subject3=${Subjects[$((2))]}
				Subject4=${Subjects[$((3))]}
				Subject5=${Subjects[$((4))]}
				Subject6=${Subjects[$((5))]}
				Subject7=${Subjects[$((6))]}
				Subject8=${Subjects[$((7))]}
				Subject9=${Subjects[$((8))]}
				Subject10=${Subjects[$((9))]}
				Subject11=${Subjects[$((10))]}
				Subject12=${Subjects[$((11))]}
				Subject13=${Subjects[$((12))]}
				Subject14=${Subjects[$((13))]}
				Subject15=${Subjects[$((14))]}
				Subject16=${Subjects[$((15))]}
				Subject17=${Subjects[$((16))]}
				Subject18=${Subjects[$((17))]}
				Subject19=${Subjects[$((18))]}
				Subject20=${Subjects[$((19))]}
				Subject21=${Subjects[$((20))]}
				Subject22=${Subjects[$((21))]}
				Subject23=${Subjects[$((22))]}
				Subject24=${Subjects[$((23))]}
				Subject25=${Subjects[$((24))]}
				Subject26=${Subjects[$((25))]}
				Subject27=${Subjects[$((26))]}
				Subject28=${Subjects[$((27))]}
				Subject29=${Subjects[$((28))]}
				Subject30=${Subjects[$((29))]}
				Subject31=${Subjects[$((30))]}
				Subject32=${Subjects[$((31))]}
				Subject33=${Subjects[$((32))]}
				Subject34=${Subjects[$((33))]}
				Subject35=${Subjects[$((34))]}
				Subject36=${Subjects[$((35))]}
				Subject37=${Subjects[$((36))]}
				Subject38=${Subjects[$((37))]}
				Subject39=${Subjects[$((38))]}
				Subject40=${Subjects[$((39))]}

				#-------------------------------------
				# Put data into one nifti file
				#-------------------------------------		
	
				fslmerge -t all_subjects${threads}.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject1}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject2}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject3}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject4}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject5}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject6}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject7}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject8}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject9}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject10}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject11}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject12}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject13}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject14}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject15}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject16}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject17}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject18}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject19}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject20}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject21}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject22}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject23}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject24}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject25}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject26}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject27}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject28}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject29}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject30}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject31}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject32}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject33}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject34}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject35}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject36}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject37}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject38}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject39}.feat/reg_standard/stats/cope1.nii.gz \
				Results/${Study}/${Smoothing}/${Design}/${Subject40}.feat/reg_standard/stats/cope1.nii.gz 

				#-------------------------------------------------------
				# Run group analysis using permutation test
				#-------------------------------------------------------

				randomise -i all_subjects${threads}.nii.gz -o test${threads} -1 -P -c ${ClusterDefiningThreshold} -n 1000 -m MNI152_T1_2mm_brain_mask.nii.gz --quiet  &
				((threads++))

				if [ "$threads" -eq "$MaximumThreads" ]; then
				    wait
				    threads=0

					rm all_subjects0.nii.gz
					rm all_subjects1.nii.gz
					rm all_subjects2.nii.gz
					rm all_subjects3.nii.gz
					rm all_subjects4.nii.gz
					rm all_subjects5.nii.gz
					rm all_subjects6.nii.gz
					rm all_subjects7.nii.gz

					# Loop over all the performed group analyses
					for (( t=$threads; t<$MaximumThreads; t++ ))
					do
						# Check max p-values
						text=`fslstats test${t}_clustere_corrp_tstat1.nii.gz -R`
						temp=${text[$((0))]}
						values=()
						values+=($temp)
						max=${values[$((1))]}
						echo "Max p-value is $max"
						threshold=0.95
			    		if [ $(echo " $max > $threshold" | bc) -eq 1 ] ; then
							((SignificantActivations++))
			    		    echo "Significant group activation detected!"
						else
			    		    echo "No significant group activation detected"
						fi
					done

					echo "Out of $Comparison random group analyses, significant group activations were detected $SignificantActivations times !"

				fi					
	
			done

			echo "Out of $Comparison random group analyses, significant group activations were detected $SignificantActivations times !" > /home/andek/Research_projects/RandomGroupAnalyses/Results/results_randomise_onesamplettest_${Study}_${Design}_${Smoothing}_perm_${ClusterDefiningThreshold}_groupsize40.txt

		done
	done
done
















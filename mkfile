<mergevcf.mk
MERGEVCF_PREREQ = `{./prereq}

results/mergevcf/$MERGEVCF_NAME.vcf.gz:D:		$MERGEVCF_PREREQ
	mkdir -p `dirname $target`
	./index_samples | sort -k 2,2V > $target.list &&
	bcftools merge $(echo $prereq | sed -e 's#\.tbi##g') \
	| bgzip -c > $target.building &&
	mv $target.building $target


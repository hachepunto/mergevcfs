<mergevcf.mk
MERGEVCF_PREREQ = `{./prereq}

results/mergevcf/$MERGEVCF_NAME.vcf.gz:D:		$MERGEVCF_PREREQ
	mkdir -p `dirname $target`
	vcf-merge $(echo $prereq | sed -e 's#\.tbi##g') \
	| bgzip -c > $target

data/%.vcf.gz:	data/%.vcf
	bgzip $prereq

data/%.vcf.gz.tbi:	data/%.vcf.gz
	tabix -p vcf $prereq

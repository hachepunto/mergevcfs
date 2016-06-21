<mergevcf.mk
MERGEVCF_PREREQ = `{find -L data/ -name '*.vcf.gz' }

results/mergevcf/$MERGEVCF_NAME.vcf.gz:		$MERGEVCF_PREREQ
	mkdir -p `dirname $target`
	vcf-merge $prereq | bgzip -c > $target

process ingress_QUALITYPIPELINE {	
	debug params.debug
	label 'ingress_QUALITYPIPELINE'
	cpus params.defaultcpus
	memory params.defaultmemory
	time params.defaulttime
	maxForks params.defaultmaxForks
	maxErrors params.maxErrors
	errorStrategy params.errorStrategy		
	maxRetries params.maxRetries		
        input:
		tuple val(ingressNAME), path(ingressFILES)
	output:
		path "*.fastq.gz", emit: ingress_QUALITYPIPELINE_OUT		
	when:
		true	
	script:		
		egressPath = params.egresspath
		
		ingressIN1 = ingressFILES[0].getName()
		ingressIN2 = ingressFILES[1].getName()

		ingressOUT1 = ingressFILES[0].getName().toLowerCase()
		ingressOUT2 = ingressFILES[1].getName().toLowerCase()

		if (ingressOUT1.lastIndexOf('_R1_001.fastq.gz') > -1) {
			ingressOUT1 = ingressOUT1.substring(0, ingressOUT1.lastIndexOf('_1')) + "_1.fastq.gz"			
		}

		if (ingressOUT2.lastIndexOf('_R2_001.fastq.gz') > -1) {
			ingressOUT2 = ingressOUT2.substring(0, ingressOUT2.lastIndexOf('_2')) + "_2.fastq.gz"			
		}

		if (ingressOUT1.lastIndexOf('.fq.gz') > -1) {
			ingressOUT1 = ingressOUT1.substring(0, ingressOUT1.lastIndexOf('.fq.gz')) + ".fastq.gz"			
		}

		if (ingressOUT2.lastIndexOf('.fq.gz') > -1) {
			ingressOUT2 = ingressOUT2.substring(0, ingressOUT2.lastIndexOf('.fq.gz')) + ".fastq.gz"			
		}

		if (ingressOUT1.lastIndexOf('_a.fastq.gz') > -1) {
			ingressOUT1 = ingressOUT1.substring(0, ingressOUT1.lastIndexOf('_a.fastq.gz')) + "_1.fastq.gz"			
		}

		if (ingressOUT2.lastIndexOf('_b.fastq.gz') > -1) {
			ingressOUT2 = ingressOUT2.substring(0, ingressOUT2.lastIndexOf('_b.fastq.gz')) + "_2.fastq.gz"			
		}

		
		if (ingressIN1.md5() == ingressOUT1.md5())
		{
			ingressOUT1 = "_" + ingressOUT1
		}

		if (ingressIN2.md5() == ingressOUT2.md5())
		{
			ingressOUT2 = "_" + ingressOUT2
		}

		template 'ingress_QUALITYPIPELINE.sh'
}
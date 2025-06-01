process egress_QUALITYPIPELINE {
	debug params.debug
	label 'egress_QUALITYPIPELINE'	
	cpus params.defaultcpus
	memory params.defaultmemory
	time params.defaulttime
	maxForks params.defaultmaxForks
	maxErrors params.maxErrors
	errorStrategy params.errorStrategy		
	maxRetries params.maxRetries
    	input:
		tuple path(egressIN1), path(egressIN2)  //pair-reads
		path(egressIN3)				//singletons
	output:		
		path "*.dedupe.good.tagged.filter.repaired.fastq.gz", includeInputs:true, emit: egress_QUALITYPIPELINE_OUT
	when:
		true
	script:			
		egressPath = params.egresspath
		egressOUT1 = params.egresspath + egressIN1.getBaseName().substring(0, egressIN1.getBaseName().lastIndexOf('.')) + ".fastq.gz"
		egressOUT2 = params.egresspath + egressIN2.getBaseName().substring(0, egressIN2.getBaseName().lastIndexOf('.')) + ".fastq.gz"
		egressOUT3 = params.egresspath + egressIN3.getBaseName().substring(0, egressIN3.getBaseName().lastIndexOf('.')) + ".fastq.gz"
		template 'egress_QUALITYPIPELINE.sh'
}
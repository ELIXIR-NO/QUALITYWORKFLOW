process fastp {
	debug params.debug
	label 'fastp'
	conda './modules/fastp/environments/fastp_0.23.4.yaml'
	cpus params.defaultcpus
	memory params.defaultmemory
	time params.defaulttime
	maxForks params.defaultmaxForks
	maxErrors params.maxErrors
	errorStrategy params.errorStrategy		
	maxRetries params.maxRetries	
	input:
		tuple path(fastpIN1), path(fastpIN2)
	output:
		path '*.dedupe.good.fastq.gz', emit: fastpOUT
	when:
		true	
	script:	
		egressPath = params.egresspath
		fastpReportJSON = params.egresspath + fastpIN1.getBaseName().substring(0, fastpIN1.getBaseName().lastIndexOf('_')) + ".dedupe_fastpReport.json"
		fastpReportFilename = params.egresspath + fastpIN1.getBaseName().substring(0, fastpIN1.getBaseName().lastIndexOf('_')) + ".dedupe_fastpReport.html"
		fastpOUT1 = fastpIN1.getBaseName().substring(0, fastpIN1.getBaseName().lastIndexOf('.')) + ".good.fastq.gz"
		fastpOUT2 = fastpIN2.getBaseName().substring(0, fastpIN2.getBaseName().lastIndexOf('.')) + ".good.fastq.gz"
		template 'fastp.sh'
}
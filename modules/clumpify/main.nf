process clumpify {	
	debug params.debug
	label 'clumpify'
	conda './modules/clumpify/environments/bbtools_37.62.yaml'
	cpus params.defaultcpus
	memory params.defaultmemory
	time params.defaulttime
	maxForks params.defaultmaxForks
	maxErrors params.maxErrors
	errorStrategy params.errorStrategy		
	maxRetries params.maxRetries
        input:
		tuple path(clumpifyIN1), path(clumpifyIN2)
	output:
		path "*.dedupe.fastq.gz", emit: clumpifyOUT
	when:
		true	
	script:		
		clumpifyOUT1 = clumpifyIN1.getBaseName().substring(0, clumpifyIN1.getBaseName().lastIndexOf('.')) + ".dedupe.fastq.gz"
		clumpifyOUT2 = clumpifyIN2.getBaseName().substring(0, clumpifyIN2.getBaseName().lastIndexOf('.')) + ".dedupe.fastq.gz"
		
		if (clumpifyOUT1.startsWith("_")) {
			clumpifyOUT1 = clumpifyIN1.getBaseName().substring(1, clumpifyIN1.getBaseName().lastIndexOf('.')) + ".dedupe.fastq.gz"
		}

		if (clumpifyOUT2.startsWith("_")) {
			clumpifyOUT2 = clumpifyIN2.getBaseName().substring(1, clumpifyIN2.getBaseName().lastIndexOf('.')) + ".dedupe.fastq.gz"
		}

		egressPath = params.egresspath		
		clumpifyReportFilename = params.egresspath + clumpifyOUT1.substring(0, clumpifyOUT1.lastIndexOf('_1')) + "_clumpifyReport.txt"

		template 'clumpify.sh'
}
process repair {
	debug params.debug
	label 'repair'
	conda './modules/repair/environments/bbtools_37.62.yaml'
	cpus params.defaultcpus
	memory params.defaultmemory
	time params.defaulttime
	maxForks params.defaultmaxForks
	cpus params.defaultcpus
	memory params.defaultmemory
	time params.defaulttime
	maxForks params.defaultmaxForks
	input:
		tuple path(repairIN1), path(repairIN2)
	output:
		path "*.dedupe.good.tagged.filter.repaired.fastq.gz"
		path "*.dedupe.good.tagged.filter.singletons.fastq.gz"
	when:
		true
	
	script:		
		egressPath = params.egresspath		 
		repairReportFilename = params.egresspath + repairIN1.getBaseName().substring(0, repairIN1.getBaseName().lastIndexOf('_1')) + ".dedupe.good.tagged.filter_repairReport.txt"
		repairOUT1 = repairIN1.getBaseName().substring(0, repairIN1.getBaseName().lastIndexOf('.')) + ".repaired.fastq.gz"
		repairOUT2 = repairIN2.getBaseName().substring(0, repairIN2.getBaseName().lastIndexOf('.')) + ".repaired.fastq.gz"
		repairOUTS = repairIN1.getBaseName().substring(0, repairIN1.getBaseName().lastIndexOf('.')) + ".singletons.fastq.gz"
		template 'repair.sh'
}


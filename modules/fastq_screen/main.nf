process fastq_screen {
	debug params.debug
	label 'fastq_screen'
	conda './modules/fastq_screen/environments/fastq_screen_0.15.3.yaml'
	cpus params.defaultcpus
	memory params.defaultmemory
	time params.defaulttime
	maxForks params.defaultmaxForks
	maxErrors params.maxErrors
	errorStrategy params.errorStrategy		
	maxRetries params.maxRetries
	input:
		tuple path(fastq_screenIN1), path(fastq_screenIN2)
	output:
		path '*.dedupe.good.tagged.filter.fastq.gz'
	when:
		true
	
	script:	
		egressPath = params.egresspath
		fastq_screenCONF = params.launchdir + "/modules/fastq_screen/resources/fastq_screen.conf"

		fastq_screenTEMPOUT1 = fastq_screenIN1.getBaseName().substring(0, fastq_screenIN1.getBaseName().lastIndexOf('.')) + ".tagged_filter.fastq.gz"
		fastq_screenTEMPOUT2 = fastq_screenIN2.getBaseName().substring(0, fastq_screenIN2.getBaseName().lastIndexOf('.')) + ".tagged_filter.fastq.gz"
		fastq_screenOUT1 = fastq_screenIN1.getBaseName().substring(0, fastq_screenIN1.getBaseName().lastIndexOf('.')) + ".tagged.filter.fastq.gz"
		fastq_screenOUT2 = fastq_screenIN2.getBaseName().substring(0, fastq_screenIN2.getBaseName().lastIndexOf('.')) + ".tagged.filter.fastq.gz"	
	
		fastq_screenTEMPREPORT1 = fastq_screenIN1.getBaseName().substring(0, fastq_screenIN1.getBaseName().lastIndexOf('.')) + "_screen.html"
		fastq_screenTEMPREPORT2 = fastq_screenIN2.getBaseName().substring(0, fastq_screenIN2.getBaseName().lastIndexOf('.')) + "_screen.html"
		fastq_screenREPORT1 = params.egresspath + fastq_screenIN1.getBaseName().substring(0, fastq_screenIN1.getBaseName().lastIndexOf('.')) + "_screenReport.html"
		fastq_screenREPORT2 = params.egresspath + fastq_screenIN2.getBaseName().substring(0, fastq_screenIN2.getBaseName().lastIndexOf('.')) + "_screenReport.html"

		fastq_screenTEMPTXT1 = fastq_screenIN1.getBaseName().substring(0, fastq_screenIN1.getBaseName().lastIndexOf('.')) + "_screen.txt"
		fastq_screenTEMPTXT2 = fastq_screenIN2.getBaseName().substring(0, fastq_screenIN2.getBaseName().lastIndexOf('.')) + "_screen.txt"
		fastq_screenTXT1 = params.egresspath + fastq_screenIN1.getBaseName().substring(0, fastq_screenIN1.getBaseName().lastIndexOf('.')) + "_screenReport.txt"
		fastq_screenTXT2 = params.egresspath + fastq_screenIN2.getBaseName().substring(0, fastq_screenIN2.getBaseName().lastIndexOf('.')) + "_screenReport.txt"

		template 'fastq_screen.sh'
}
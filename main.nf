include {QUALITYPIPELINE} from './modules/QUALITYPIPELINE'

workflow {
	def ingress_ch = channel
		.fromFilePairs(params.ingresspath + '*_{1,2}.{fq,fastq}.gz')  
		.toSortedList( { a, b -> a[0] <=> b[0] } )
		.flatMap()
	
	def QUALITYPIPELINE_ch = channel.of(QUALITYPIPELINE(ingress_ch))
	
	QUALITYPIPELINE_ch | view()
}

workflow.onComplete {
    println ( workflow.success ? """
        WORKFLOW execution summary
        ---------------------------
        Completed at: ${workflow.complete}
        Duration    : ${workflow.duration}
        Success     : ${workflow.success}
        workDir     : ${workflow.workDir}
        exit status : ${workflow.exitStatus}
        """ : """
        Failed: ${workflow.errorReport}
        exit status : ${workflow.exitStatus}
        """
    )
}
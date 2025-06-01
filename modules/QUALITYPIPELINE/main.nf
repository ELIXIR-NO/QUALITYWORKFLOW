include {ingress_QUALITYPIPELINE} from '../../modules/ingress'
include {clumpify} from '../../modules/clumpify'
include {fastp} from '../../modules/fastp'
include {fastq_screen} from '../../modules/fastq_screen'
include {repair} from '../../modules/repair'
include {egress_QUALITYPIPELINE} from '../../modules/egress'

workflow {
	def ingress_ch = channel
		.fromFilePairs(params.ingresspath + '*_{1,2}.{fq,fastq}.gz')  
		.toSortedList( { a, b -> a[0] <=> b[0] } )
		.flatMap()

	def QUALITYPIPELINE_ch = channel.of(QUALITYPIPELINE(ingress_ch))

	QUALITYPIPELINE_ch | view()
}


workflow QUALITYPIPELINE {
	take:
		ingress_ch
	main:
		ingress_QUALITYPIPELINE(ingress_ch) | clumpify | fastp | fastq_screen | repair | egress_QUALITYPIPELINE
	emit:
		egress_QUALITYPIPELINE.out
}

workflow.onComplete {
    println ( workflow.success ? """
	QUALITYPIPELINE execution summary
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
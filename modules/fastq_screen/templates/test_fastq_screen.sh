#!/bin/bash
#Default test script to test a single tool outside a pipeline
export fastq_screenIN1="../../../INPUT_test/a_test_1.fastq.gz"
export fastq_screenIN2="../../../INPUT_test/a_test_2.fastq.gz"
export fastq_screenCONF="../resources/fastq_screen.conf"
export fastq_screenTEMPOUT1="a_test_1.tagged_filter.fastq.gz"
export fastq_screenOUT1="a_test_1.tagged.filter.fastq.gz"
export fastq_screenTEMPOUT2="a_test_2.tagged_filter.fastq.gz"
export fastq_screenOUT2="a_test_2.tagged.filter.fastq.gz"
export fastq_screenTEMPREPORT1="a_test_1_screen.html"
export fastq_screenREPORT1="a_test_1_screenReport.html"
export fastq_screenTEMPREPORT2="a_test_2_screen.html"
export fastq_screenREPORT2="a_test_2_screenReport.html"
export fastq_screenTEMPTXT1="a_test_1_screen.txt"
export fastq_screenTXT1="a_test_1_screenReport.txt"
export fastq_screenTEMPTXT2="a_test_2_screen.txt"
export fastq_screenTXT2="a_test_2_screenReport.txt"
conda run -n fastq_screen_0.15.3 ./fastq_screen.sh
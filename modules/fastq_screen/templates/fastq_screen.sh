fastq_screen $fastq_screenIN1 $fastq_screenIN2 --tag --filter 0 --aligner bowtie2 --conf $fastq_screenCONF
mv $fastq_screenTEMPOUT1 $fastq_screenOUT1 &
mv $fastq_screenTEMPOUT2 $fastq_screenOUT2 &
mv $fastq_screenTEMPREPORT1 $fastq_screenREPORT1 &
mv $fastq_screenTEMPREPORT2 $fastq_screenREPORT2 &
mv $fastq_screenTEMPTXT1 $fastq_screenTXT1 &
mv $fastq_screenTEMPTXT2 $fastq_screenTXT2

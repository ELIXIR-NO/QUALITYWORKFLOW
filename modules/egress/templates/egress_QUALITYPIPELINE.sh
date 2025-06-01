#!/bin/bash
#Default pipeline or stage egress for pair read tools
if [ ! -f $egressOUT1 ]; then
	cp $egressIN1 $egressOUT1
fi

if [ ! -f $egressOUT2 ]; then
	cp $egressIN2 $egressOUT2
fi

if [ ! -f $egressOUT3 ]; then
	cp $egressIN3 $egressOUT3
fi

#Record the files
echo '$egressIN1 $egressOUT1' >> $egressPath/QUALITYPIPELINE_egressedFiles.txt
echo '$egressIN2 $egressOUT2' >> $egressPath/QUALITYPIPELINE_egressedFiles.txt
echo '$egressIN3 $egressOUT3' >> $egressPath/QUALITYPIPELINE_egressedFiles.txt

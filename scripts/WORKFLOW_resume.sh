#!/bin/bash
nohup conda run -n nextflow_25.04.2 nextflow -log ./EGRESS/QUALITYWORKFLOW.log run -profile PRODUCTION -w $1 -N $2 main.nf -resume 00000000-0000-0000-0000-000000000000 > ./EGRESS/QUALITYWORKFLOW_resume.out &

#!/bin/bash
unlink ./INGRESS
unlink ./EGRESS
ln -s $1 ./INGRESS
ln -s $2 ./EGRESS
./scripts/clean.sh
rm ./OUTPUT_QUALITYPIPELINE/*
conda run -n nextflow_25.04.2 nextflow -log ./EGRESS/QUALITYPIPELINE.log run -profile QUALITYPIPELINE_test -w $3 ./modules/QUALITYPIPELINE/main.nf
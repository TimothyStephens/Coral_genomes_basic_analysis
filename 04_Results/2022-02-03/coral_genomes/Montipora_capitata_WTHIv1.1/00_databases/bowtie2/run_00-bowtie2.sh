#!/usr/bin/env bash

# Print all info to log file
exec 1> "${0}.log.$(date +%s)" 2>&1

#### Pre-run setup
source ~/scripts/script_setup.sh
set +eu; conda activate py27; set -eu

export PATH="$PATH:/home/timothy/programs/bowtie2-2.4.4-linux-x86_64"
NCPUS=24

PREFIX="Montipora_capitata_WTHIv1.1"

#### Start Script
run_cmd "md5sum ${PREFIX}.assembly.fasta ${PREFIX}.genes.cds.fna | tee ${PREFIX}.bowtie2-build.job_md5sum_list.txt"
run_cmd "bowtie2-build --threads ${NCPUS} ${PREFIX}.assembly.fasta ${PREFIX}.assembly.fasta"
run_cmd "bowtie2-build --threads ${NCPUS} ${PREFIX}.genes.cds.fna ${PREFIX}.genes.cds.fna"



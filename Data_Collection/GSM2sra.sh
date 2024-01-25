#!/bin/bash

#SBATCH -n 8
#SBATCH -t 4:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o GSM2sra.log
#SBATCH -e GSM2sra.log
#Run program

python2 /project/zanglab_project/jkx9nz/script/fetch_SRA_new.py -i GSM.txt -o GSM2SRRmeta.txt
mkdir ChIP && awk '{print $3}' GSM2SRRmeta.txt > ./ChIP/srr_ChIP.txt && cd ChIP
prefetch `less srr_ChIP.txt`

#fastq-dump.2.11.0 --split-files %s.sra

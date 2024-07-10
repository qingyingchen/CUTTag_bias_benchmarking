# CUTTag_bias_benchmarking
1. ./Data_Collection
   GSM2sra.sh: a linux shell file to convert GSM identifier to srr identifier, then download .sra files.
   fetch_SRA_new.py: a python file to fetch sra identifier from a known list of GSM identifes.
   sra2fastq_new.py: a python file to convert .sra files to .fastq files.
2. ./Data_Processing
   ./CUTTag_ChIP_ATAC
   processBED_human: a linux shell file to use bowtie to process .fastq files to .bed files. 
   slurm_fastq2bed.py: a python file to produce slurm files, each slurm file runs processBED_human.
   slurm_combine.py: a python file to submit

# CUTTag_bias_benchmarking<br />
## 1. **/Data_Collection<br />**
   *GSM2sra.sh*: a linux shell file to convert GSM identifier to srr identifier, then download .sra files.<br /> 
   ****
   *fetch_SRA_new.py*: a python file to fetch sra identifier from a known list of GSM identifes.<br />
   *sra2fastq_new.py*: a python file to convert .sra files to .fastq files.<br />
## 2. **/Data_Processing<br />**
   **/CUTTag_ChIP_ATAC<br />**
   *processBED_human*: a linux shell file to use bowtie to process .fastq files to .bed files.<br />
   *slurm_fastq2bed.py*: a python file to produce slurm files, each slurm file runs processBED_human.<br />
   *slurm_combine.py*: a python file to submit 

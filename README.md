# CUTTag_bias_benchmarking<br />
## 1. **/Data_Collection**<br />
   *GSM2sra.sh*: a linux shell file to convert GSM identifier to srr identifier, then download .sra files.<br /> 
   *fetch_SRA_new.py*: a python file to fetch sra identifier from a known list of GSM identifes.<br />
   *sra2fastq_new.py*: a python file to convert .sra files to .fastq files.<br />
## 2. **/Data_Processing**<br />
   ### **/CUTTag_ChIP_ATAC**<br />
   ***processBED_human***: a linux shell file to use bowtie to process .fastq files to BED files.<br />
   ***slurm_fastq2bed.py***: a python file to produce slurm files, each slurm file runs *processBED_human*.<br />
   ***slurm_combine.py***: a python file to produce slurm files, each slurm file converts the name of BED files from GSM identifier to GSM_cellline_experiment_datatype_HM_pair/single-end (GSM1918579_K562_WT_ChIP_H3K27me3_PEuniq.bed).<br />
   *PEbed_To_rdSEbed.py*: a python file to convert pair-end BED file to random picked single-end BED file.<br />
   *slurm_PE2rdSE.py*: a python file to produce slurm files, each slurm file runs *PEbed_To_rdSEbed.py*.<br /> 
   ### **/RNA**<br />
   RNAprocess

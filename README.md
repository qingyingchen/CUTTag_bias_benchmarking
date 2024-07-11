# CUTTag_bias_benchmarking<br />
## /Data_Collection<br />
   ***GSM2sra.sh***: a linux shell file to convert GSM identifier to srr identifier, then download .sra files.<br /> 
   ***fetch_SRA_new.py***: a python file to fetch sra identifier from a known list of GSM identifes.<br />
   ***sra2fastq_new.py***: a python file to convert .sra files to .fastq files.<br />
## /Data_Processing<br />
   ### **/CUTTag_ChIP_ATAC**<br />
   ***processBED_human***: a linux shell file to use **bowtie** to process .fastq files to BED files for CHIP/ATAC/CUTTag.<br />
   ***slurm_fastq2bed.py***: a python file to produce slurm files, each slurm file runs *processBED_human*.<br />
   ***slurm_combine.py***: a python file to produce slurm files, each slurm file converts the name of BED files from GSM identifier to GSM_cellline_experiment_datatype_HM_pair/single-end (GSM1918579_K562_WT_ChIP_H3K27me3_PEuniq.bed).<br />
   ***PEbed_To_rdSEbed.py***: a python file to convert pair-end BED file to random picked single-end BED file.<br />
   ***slurm_PE2rdSE.py***: a python file to produce slurm files, each slurm file runs *PEbed_To_rdSEbed.py*.<br /> 
   ### **/RNA**<br />
   _**RNAprocess**_: a linux shell file to use **hisat** to process .fastq files to BED files for RNA.<br />
   _**slurm_rna.py**_: a python file to produce slurm files, each slurm file runs *RNAprocess*.<br />
   _**gene_expression_RPKM.R**_: an R file to get the top 8032 expressed genes.<br />
   _**gene_nonexpression.R**_: an R file to get the bottom 8032 expressed genes (not expressed).<br />
## /True_false_region<br />
### /H3K27me3<br />
_**true_pipeline.txt**_: the definition of true regions for H3K27me3. Python + linux shell<br />
_**false_pipeline.txt**_: the definition of false regions for H3K27me3. Python + linux shell<br />
### /H3K27ac<br />
same as /H3K27me3<br />
# /CUTTag_Benchmarking<br />
## /data_quality_check_true_false_regions<br />
_**slurm_reads_false_me3.py**_: for each CUTTag Reads, located on false regions.<br />
_**slurm_reads_true_me3.py**_: for each CUTTag Reads, located on true regions.<br />
_**slurm_reads_other_me3.py**_: for each CUTTag Reads, located neither on true regions nor on false regions.<br />
_**slurm_true_me3.py**_: for each CUTTag SICER Peaks located on its own CUTTag true region (defined by _**slurm_reads_true_me3.py**_).<br />
_**slurm_false_me3.py**_: for each CUTTag SICER Peaks located on its own CUTTag false region (defined by _**slurm_reads_false_me3.py**_).<br />
_**slurm_other_me3.py**_: for each CUTTag SICER Peaks located on its own CUTTag other region (defined by _**slurm_reads_other_me3.py**_).<br />
_**Reads_per_peak_boxplot.r**_: an R file to draw boxplot of normalized reads distributed on true/dalse/other regions for each CUTTag data.<br />
## /peakcalling_methods<br />

# /CUTTag_Open_Chromatin_bias<br />


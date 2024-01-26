import os

#folder = '/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/bed/acme3/'
folder = '/standard/vol190/zanglab/shared/CUTTag/true_false/PEbed/'
allf = os.listdir(folder)
for f in allf:
    #if os.path.isfile(folder +f) and "K562" in f and f.endswith(".bw"):
    if os.path.isfile(folder +f) and "CUTTag_" in f and f.endswith("_PE_sorted.bed"):
    #if os.path.isfile(folder +f) and f.endswith(".bw") and "pipe" in f:
    #if os.path.isfile(folder +f) and f.startswith("8dpi") and f.endswith("r1.fq.gz"):
        ID = f[:-len("_PE_sorted.bed")]
        model = """#!/bin/bash

#SBATCH -n 16
#SBATCH -t 2:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o %s_reads_other.log
#SBATCH -e %s_reads_other.log

module load gcc
module load bedtools

cat %s_other.bed| awk 'BEGIN{OFS="\t";FS="\t"}{print $1,$2,$3}'| intersectBed -a - -b /standard/vol190/zanglab/shared/CUTTag/true_false/PEbed/%s_PE_sorted.bed -wao > %s_reads_other.bed

"""%(ID,ID,ID,ID,ID)
        outf = open ('%s_reads_other.slurm'%(ID),'w')
        outf.write(model)
        outf.close()



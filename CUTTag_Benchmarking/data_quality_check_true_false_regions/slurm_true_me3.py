import os

folder = '/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/new_acme3/combineReads/sicer/'
allf = os.listdir(folder)
for f in allf:
    #if os.path.isfile(folder +f) and "K562" in f and f.endswith(".bw"):
    if os.path.isfile(folder +f) and "GSM3" in f and "H3K27me3" in f and f.endswith("_sicerPeaks_sorted.bed"):
    #if os.path.isfile(folder +f) and f.endswith(".bw") and "pipe" in f:
    #if os.path.isfile(folder +f) and f.startswith("8dpi") and f.endswith("r1.fq.gz"):
        ID = f[:-len("_sicerPeaks_sorted.bed")]
        model = """#!/bin/bash

#SBATCH -n 16
#SBATCH -t 2:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o %s_true.log
#SBATCH -e %s_true.log

module load gcc
module load bedtools

cat /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/sicer/bed/acme3/%s_sicerPeaks_sorted.bed | awk 'BEGIN{OFS="\t";FS="\t"}{print $1,$2,$3+1,$4}'|intersectBed -a - -b /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/sicer/overlap/strict_true/strong_true200_sorted.bed > %s_peaks_true.bed

"""%(ID,ID,ID,ID)
        outf = open ('%s_true.slurm'%(ID),'w')
        outf.write(model)
        outf.close()



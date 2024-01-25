import os
for i in [2,3,4,5,6,7,8,9]:
    model="""#!/bin/bash
#SBATCH -n 1
#SBATCH --mem=50GB
#SBATCH -t 1:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o ext%s00.log
#SBATCH -e ext%s00.log
#Run program

intersectBed -a H3K27ac_sicerPeak_nearHighExp1kb_ext%s00bp.bed -b /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/GSM3536507_K562_WT_CUTTag_H3K27me3_PEuniq.bed -c | intersectBed -a - -b /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/GSM3536508_K562_WT_CUTTag_H3K27me3_PEuniq.bed -c | intersectBed -a - -b /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/GSM3536509_K562_WT_CUTTag_H3K27me3_PEuniq.bed -c | intersectBed -a - -b /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/GSM3536510_K562_WT_CUTTag_H3K27me3_PEuniq.bed -c | intersectBed -a - -b /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/GSM3536511_K562_WT_CUTTag_H3K27me3_PEuniq.bed -c | intersectBed -a - -b /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/GSM3536512_K562_WT_CUTTag_H3K27me3_PEuniq.bed -c | intersectBed -a - -b /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/GSM3536513_K562_WT_CUTTag_H3K27me3_PEuniq.bed -c | intersectBed -a - -b /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/GSM3536515_K562_WT_CUTTag_H3K27me3_PEuniq.bed -c | intersectBed -a - -b /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/GSM3560261_K562_WT_CUTTag_H3K27me3_PEuniq.bed -c | intersectBed -a - -b /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/GSM3680215_K562_WT_CUTTag_H3K27me3_PEuniq.bed -c | intersectBed -a - -b /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/GSM3680216_K562_WT_CUTTag_H3K27me3_PEuniq.bed -c | intersectBed -a - -b /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/GSM3680217_K562_WT_CUTTag_H3K27me3_PEuniq.bed -c | intersectBed -a - -b /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/GSM3680218_K562_WT_CUTTag_H3K27me3_PEuniq.bed -c | intersectBed -a - -b /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/GSM3680219_K562_WT_CUTTag_H3K27me3_PEuniq.bed -c | intersectBed -a - -b /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/GSM3680220_K562_WT_CUTTag_H3K27me3_PEuniq.bed -c | intersectBed -a - -b /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/GSM3680221_K562_WT_CUTTag_H3K27me3_PEuniq.bed -c | intersectBed -a - -b /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/GSM3680222_K562_WT_CUTTag_H3K27me3_PEuniq.bed -c > H3K27ac_sicerPeak_nearHighExp1kb_ext%s00bp_OVH3K27me3reads.bed
"""%(i,i,i,i)
    outf=  open('ext%s00.slurm'%(i),'w')
    outf.write(model)
    outf.close()


import os

folder = '/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/bw/'
allf = os.listdir(folder)
for f in allf:
    #if os.path.isfile(folder +f) and "K562" in f and f.endswith(".bw"):
    if os.path.isfile(folder +f) and f.endswith(".bw"):
    #if os.path.isfile(folder +f) and f.endswith(".bw") and "pipe" in f:
    #if os.path.isfile(folder +f) and f.startswith("8dpi") and f.endswith("r1.fq.gz"):
        ID = f[:-len(".bw")]
        #ID = f[:-len("_r1.fq.gz")]

        model = """#!/bin/bash

#SBATCH -n 16
#SBATCH -t 10:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o %s_tss5K.log
#SBATCH -e %s_tss5K.log


macs2 pileup  -f BED --extsize 1 -i %s -o %s
sh ./bdg2bw %s /nv/vol190/zanglab/sh8tv/Data/Genome/%s/%s_clean.len

python /project/zanglab_project/jkx9nz/project/cut/HUMAN/combineReads/tss/get_signal_bin_centerext.py -i /nv/vol190/zanglab/sh8tv/Data/refgenes/geneID_annotation/hg38_gene_annotation_geneID_LenOrder_TSS.bed --ext 5000 -n 1000 -w /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/bw/%s.bw -o /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/tss5K/%s_tss5K.txt

"""%(ID,ID,ID,ID)
        outf = open ('%s_tss5K.slurm'%(ID),'w')
        outf.write(model)
        outf.close()

import os

folder = '/project/zanglab_project/jkx9nz/project/cut/HUMAN/RNA/'
allf = os.listdir(folder)
for f in allf:
    #if os.path.isfile(folder +f) and "dpi" and "r1.fastq.gz" in f:
     #   ID = f[:-len("_r1.fastq.gz")]
    if os.path.isfile(folder +f) and "K562" and "r1.fastq.gz" in f:
        ID = f[:-len("_r1.fastq.gz")]

        model = """#!/bin/bash

#SBATCH -n 8
#SBATCH -t 10:00:00
#SBATCH -p standard
#SBATCH -A zanglab
#SBATCH -o %s.log
#SBATCH -e %s.log

./RNAprocess %s
"""%(ID,ID,ID)
        outf = open ('%s.slurm'%(ID),'w')
        outf.write(model)
        outf.close()


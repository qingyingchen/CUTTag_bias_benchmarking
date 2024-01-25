import os

folder = '/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/new_acme3/'
allf = os.listdir(folder)
for f in allf:
    if os.path.isfile(folder+f) and f.startswith ("SRR") and f.endswith("_1.fastq"):
        ID = f[:-len("_1.fastq")]
        model = """#!/bin/bash

#SBATCH -n 8
#SBATCH -t 10:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o %s_fastq2bed.log
#SBATCH -e %s_fastq2bed.log

#Run program

./processBED_human %s 
    """%(ID,ID,ID)
        outf = open('%s_fastq2bed.slurm'%(ID),'w')
        outf.write(model)
        outf.close()

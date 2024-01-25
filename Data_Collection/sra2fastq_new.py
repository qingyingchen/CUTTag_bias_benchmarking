folder = '/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/new_acme3/sra/'
allf = os.listdir(folder)
for f in allf:
    if os.path.isfile(folder +f) and f.startswith("SRR") and f.endswith(".sra"):
        ID = f[:-len(".sra")]

        model = """#!/bin/bash

#SBATCH -n 8
#SBATCH -t 10:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o %s.log
#SBATCH -e %s.log
#Run program

fastq-dump.2.11.0 --split-files %s.sra
"""%(ID,ID,ID)
        outf = open ('%s.slurm'%(ID),'w')
        outf.write(model)
        outf.close()

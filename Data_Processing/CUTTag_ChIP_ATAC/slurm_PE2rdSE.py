import os
folder = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/new_acme3/combineReads/PEbed/"
allf = os.listdir(folder)
for f in allf:
    if os.path.isfile(folder+f) and f.endswith('_PEuniq.bed') :#and not f.endswith('_raw.bam'):
        ID = f[:-len("_PEuniq.bed")]
        model = """#!/bin/bash
#SBATCH -n 8
#SBATCH --mem=30GB
#SBATCH -t 10:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o %s_rdSE.log
#SBATCH -e %s_rdSE.log
#Run program

module load gcc
module load bedtools

python /project/zanglab_project/jkx9nz/script/PEbed_To_rdSEbed.py -i /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/new_acme3/combineReads/PEbed/%s_PEuniq.bed -o ./Reads/%s_rdSE.bed
"""%(ID,ID,ID,ID)
        outf = open('%s_rdSE.slurm'%(ID),'w')
        outf.write(model)
        outf.close()
#        os.system('sbatch %s.slurm'%(ID))

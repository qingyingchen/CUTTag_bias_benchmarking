#sicer2
import os
folder = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/new_acme3/combineReads/Reads/"
allf = os.listdir(folder)
for f in allf:
    if os.path.isfile(folder+f) and f.endswith('SE.bed') :#and not f.endswith('_raw.bam'):
        tmp = f.split("_")#[0]
        ID = "_".join(tmp[:(len(tmp)-1)])
        sicerResult = f.replace(".bed","-W200-G600.scoreisland")
        model = """#!/bin/bash
#SBATCH -n 8
#SBATCH --mem=30GB
#SBATCH -t 10:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o %s_sicer.log
#SBATCH -e %s_sicer.log
#Run program

cat /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/new_acme3/combineReads/Reads/%s | awk 'BEGIN {OFS="\t";FS="\t"}{print $1,$2,$3,"SRR",NR,$6}' > /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/new_acme3/combineReads/Reads/sicer/%s_rdSE.bed
sicer -t /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/new_acme3/combineReads/Reads/sicer/%s_rdSE.bed -o ./sicer -s hg38 
mv ./sicer/%s ./sicer/%s_sicerPeaks.bed
"""%(ID,ID,f,ID,ID,sicerResult,ID)
        outf = open('%s_sicer.slurm'%(ID),'w')
        outf.write(model)
        outf.close()
#        os.system('sbatch %s.slurm'%(ID))


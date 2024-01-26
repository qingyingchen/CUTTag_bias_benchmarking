import os

CUTTags = ["GSM3536514","GSM4797825","GSM4797826"]

cutoffs = [i/1000 for i in range(1,300,3)]+[1e-7,1e-6,1e-5,1e-4,0.05, 0.15, 0.2, 0.325, 0.375, 0.425, 0.475] + [i/100 for i in range(30,100,5)] +[1]


for CUTTagid in CUTTags:
    for cutoff in cutoffs:
        #tmp = f.split("_")#[0]
        #ID = "_".join(tmp[:(len(tmp)-1)])
        #sicerResult = f.replace(".bed","-W200-G600.scoreisland")
        outname = "%s_RSEG_cut%s"%(CUTTagid,cutoff)
        model="""#!/bin/bash

#SBATCH -n 8
#SBATCH --mem=30GB
#SBATCH -t 4:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o %s.log
#SBATCH -e %s.log
#Run program

module load gcc
module load bedtools


mkdir %s
cd %s

rseg -c /project/zanglab_project/jkx9nz/data/human-hg18-size.bed -o %s.bed -i 20 -v /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/%s_K562_WT_CUTTag_H3K27ac_PEuniq.bed -cutoff %s


"""%(outname, outname, outname, outname, outname, CUTTagid, cutoff)
        outf = open ('%s.slurm'%(outname),'w')
        outf.write(model)
        outf.close()


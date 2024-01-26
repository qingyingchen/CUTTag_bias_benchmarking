import os
import math

CUTTags = ["GSM3536514","GSM4797825","GSM4797826"]
#cutoffs = [i/10000 for i in range(35,495,5)]+[0.055, 0.06, 0.065,0.07,0.075] + [i/100 for i in range(5,100,5)] +[1]
cutoffs = [1e-67,1e-50,1e-20,1e-11,1e-9,1e-7,1e-6,1e-5,1e-4]



for CUTTagid in CUTTags:
    for cutoff in cutoffs:
        #tmp = f.split("_")#[0]
        #ID = "_".join(tmp[:(len(tmp)-1)])
        #sicerResult = f.replace(".bed","-W200-G600.scoreisland")
        outname = "%s_SEACRrel_cut%s"%(CUTTagid,cutoff)
        name = -int(math.log10(cutoff))
        model="""#!/bin/bash
#SBATCH -n 1
#SBATCH --mem=30GB
#SBATCH -t 8:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o %s.log
#SBATCH -e %s.log
#Run program

module load gcc
module load gcc/7.1.0
module load openmpi/3.1.4
module load intel/18.0
module load intelmpi/18.0
module load R/4.0.3
module load bedtools

mkdir %s
cd %s
v=$(echo "scale=%s; 1/10^%s" | bc)
bash ../SEACR_1.3.sh /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/SEACR/acme3/bdg/%s_K562_WT_CUTTag_H3K27ac.bdg ${v} non relaxed %s
#bash ../SEACR_1.3.sh /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/SEACR/acme3/bdg/%s_K562_WT_CUTTag_H3K27ac.bdg %s  non relaxed %s
"""%(outname, outname, outname, outname,name,name, CUTTagid,outname,CUTTagid,cutoff,outname)
        outf = open ('%s.slurm'%(outname),'w')
        outf.write(model)
        outf.close()


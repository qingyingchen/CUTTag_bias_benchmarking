import os

CUTTags = ["GSM4797825","GSM4797826"]
cutoffs = [i/10000 for i in range(10,495,5)]+[1e-5,5e-5,1e-4,5e-4,0.055, 0.06, 0.065,0.07,0.075] + [i/100 for i in range(5,100,5)] +[1]



for CUTTagid in CUTTags:
    for cutoff in cutoffs:
        #tmp = f.split("_")#[0]
        #ID = "_".join(tmp[:(len(tmp)-1)])
        #sicerResult = f.replace(".bed","-W200-G600.scoreisland")
        outname = "%s_SEACRstr_cut%s"%(CUTTagid,cutoff)
        model="""#!/bin/bash

#SBATCH -n 8
#SBATCH --mem=30GB
#SBATCH -t 6:00:00
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

bash ../SEACR_1.3.sh /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/SEACR/acme3/bdg/%s_K562_WT_CUTTag_H3K27ac.bdg %s non stringent %s

"""%(outname, outname, outname, outname, CUTTagid, cutoff,outname)
        outf = open ('%s.slurm'%(outname),'w')
        outf.write(model)
        outf.close()


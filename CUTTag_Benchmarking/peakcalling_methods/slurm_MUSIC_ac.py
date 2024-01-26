import os

CUTTags = ["GSM3536514","GSM4797825","GSM4797826"]
cutoffs = [i/10000 for i in range(35,495,5)]+[1e-100,1e-50,1e-20,1e-11,1e-9,1e-7,1e-6,1e-5,1e-4, 0.055, 0.06, 0.065,0.07,0.075] + [i/100 for i in range(5,100,5)] +[1]


for CUTTagid in CUTTags:
    for cutoff in cutoffs:
        #tmp = f.split("_")#[0]
        #ID = "_".join(tmp[:(len(tmp)-1)])
        #sicerResult = f.replace(".bed","-W200-G600.scoreisland")
        outname = "%s_MUSIC_cut%s"%(CUTTagid,cutoff)
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
module load bedtools


mkdir %s
cd %s
MUSIC -get_multiscale_broad_ERs -chip /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/MUSIC/%s_K562_WT_CUTTag_H3K27ac/dedup -mapp Mappability_36bp -l_mapp 36 -begin_l 1000 -end_l 16000 -step 1.5 -q_val %s


"""%(outname, outname, outname, outname, CUTTagid, cutoff)
        outf = open ('%s.slurm'%(outname),'w')
        outf.write(model)
        outf.close()


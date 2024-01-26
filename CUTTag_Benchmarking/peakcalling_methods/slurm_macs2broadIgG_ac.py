import os
CUTTags = ["GSM3536514","GSM4797825","GSM4797826"]
cutoffs = [i/1000 for i in range(1,200,2)]+[1e-7,1e-6,1e-5,1e-4, 0.0225, 0.0275]+[i/100 for i in range(5,100,5)]+[1]

for CUTTagid in CUTTags:
    for cutoff in cutoffs:
        outname = "%s_macs2broadIgG_cut%s"%(CUTTagid,cutoff)
        model="""#!/bin/bash
#SBATCH -n 8
#SBATCH --mem=30GB
#SBATCH -t 8:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o %s.log
#SBATCH -e %s.log
#Run program

module load macs2

mkdir %s
cd %s

macs2 callpeak -g hs -f BEDPE -t /project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/PEuniq/acme3/%s_K562_WT_CUTTag_H3K27ac_PEuniq.bed -c /project/zanglab_project/sh8tv/CUTTag/Result/sicer_test/sicer_results/vsATAC/K562_IgG1.bed -n %s --broad --broad-cutoff %s --keep-dup 1

"""%(outname, outname, outname, outname, CUTTagid, outname, cutoff)
        outf=  open('%s.slurm'%(outname),'w')
        outf.write(model)
        outf.close()



import os

folder = '/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/new_acme3/combineReads/PEbed/'
allf = os.listdir(folder)
for f in allf:
    if os.path.isfile(folder +f) and f.endswith("_PEuniq.bed"):
        ID = f[:-len("uniq.bed")]
        ID1 = f[:-len("_PEuniq.bed")]
        #ID = f[:-len("_r1.fq.gz")]

        model = """#!/bin/bash

#SBATCH -n 16
#SBATCH -t 4:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o %s_macs2PE.log
#SBATCH -e %s_macs2PE.log

module load gcc
module load bedtools
module load macs2

macs2 callpeak --keep-dup 1 -q 0.01 -B -g hs -f BEDPE -t ./PEbed/%suniq.bed -n ./macs2PE/%s
cat ./macs2PE/%s_peaks.narrowPeak | sort -k1,1 -k2,2g -k3,3g > ./macs2PE/%s_peaks_sorted.narrowPeak
mv ./macs2PE/%s_treat_pileup.bdg ./macs2PE/%s.bdg
sh /project/zanglab_project/jkx9nz/script/bdg2bw ./macs2PE/%s.bdg /nv/vol190/zanglab/sh8tv/Data/Genome/hg38/hg38_clean.len

"""%(ID1,ID1,ID,ID,ID,ID,ID,ID,ID)
        outf = open ('%s_macs2PE.slurm'%(ID1),'w')
        outf.write(model)
        outf.close()




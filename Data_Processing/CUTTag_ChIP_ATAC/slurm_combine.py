import os,sys

SRRfolder = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/new_acme3/PEbed/"
def cat_SRR(inSRR,tag):
    outstring = ""
    for srr in inSRR:
        thisfile = "%s%s%s"%(SRRfolder,srr,tag)
        outstring += thisfile+" "
        if not os.path.isfile(thisfile):
            print (thisfile)
    return outstring

inf = open("/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/new_acme3/meta.txt")
for line in inf:
    ll = line.strip().split("\t")
    outname = ll[0]
    SRR = ll[13].split(",")
    datatype = ll[7]
    exptype = ll[5].upper()
    spRaw = ll[2].upper()
    #if not exptype == "CHIP":
        #print ll
        #continue
    if spRaw == "HUMAN":
        sp1 = 'hs'
        sp2 = 'hg38'
    elif spRaw == "MOUSE":
        sp1 = 'mm'
        sp2 = 'mm10'
    else:
        print (ll)
        continue
    if datatype == "PE":
        SRRfiles_PE = cat_SRR(SRR, "_PE.bed")
        SRRfiles_PEuniq = cat_SRR(SRR, "_PEuniq.bed")
        #SRRfiles_rdSE = cat_SRR(SRR, "_rdSE.bed")
        #SRRfiles_rdSEuniq = cat_SRR(SRR, "_rdSEuniq.bed")
        model="""#!/bin/bash
#SBATCH -n 1
#SBATCH --mem=50GB
#SBATCH -t 20:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o %s.log
#SBATCH -e %s.log
#Run program
cat %s >  %s
cat %s >  %s
"""%(outname,outname,
     SRRfiles_PE,outname+"_PE.bed",
     SRRfiles_PEuniq,outname+"_PEuniq.bed"
     #SRRfiles_rdSE,outname+"_rdSE.bed",
     #SRRfiles_rdSEuniq,outname+"_rdSEuniq.bed",
     #sp1,outname+"_PE.bed", outname,
     #outname,outname,outname,sp2,sp2,
     #outname+"_PE.bed",outname+"_PEuniq.bed",
     #outname+"_PE.bed",outname+"_rdSE.bed"
     )
    else:
        SRRfiles_SE = cat_SRR(SRR, "_SE.bed")
        model="""#!/bin/bash
#SBATCH -n 1
#SBATCH --mem=50GB
#SBATCH -t 20:00:00
#SBATCH -p standard
#SBATCH -A cphg_cz3d
#SBATCH -o %s.log
#SBATCH -e %s.log
#Run program
cat %s >  %s
"""%(outname,outname,
     SRRfiles_SE,outname+"_SE.bed",
     #sp1,outname+"_SE.bed", outname,
     #outname,outname,outname,sp2,sp2
     )
    outf=  open('%s.slurm'%(outname),'w')
    outf.write(model)
    outf.close()


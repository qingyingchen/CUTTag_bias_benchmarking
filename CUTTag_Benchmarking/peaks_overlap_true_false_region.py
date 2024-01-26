#CUTTags = ["GSM3536507","GSM3536508","GSM3536509","GSM3536510","GSM3536511","GSM3536512","GSM3536513","GSM3536515","GSM3560261","GSM3680215","GSM3680216","GSM3680217","GSM3680218","GSM3680219","GSM3680220","GSM3680221","GSM3680222"]
CUTTags = ["GSM3536514"]
#CUTTags = ["GSM4797825","GSM4797826"]

### REMEMBER TO CHANGE cutoffs for different methods
#cutoffs = [i/1000 for i in range(13,300,3)]+[1e-100,1e-50,1e-20,1e-9,1e-7,1e-6,1e-5,1e-4,0.05, 0.15, 0.2, 0.325, 0.375, 0.425, 0.475] + [i/100 for i in range(30,100,5)]+[1]
#cutoffs = [i for i in range(50,551,50)] + [i for i in range(575,1521,25)] + [i for i in range(1550,4599,50)]+ [1,10,25,4800,100000] + [i for i in range(5000,10001,500)]

#cutoffs = [i/1000 for i in range(1,200,2)]+[1e-7,1e-6,1e-5,1e-4, 0.0225, 0.0275]+[i/100 for i in range(5,100,5)]+[1]
#cutoffs = [i/10000 for i in range(10,495,5)]+[1e-5,5e-5,1e-4,5e-4,0.055, 0.06, 0.065,0.07,0.075] + [i/100 for i in range(5,100,5)] +[1]
#cutoffs = [i/10000 for i in range(35,495,5)]+[1e-67,1e-50,1e-20,1e-11,1e-9,1e-7,1e-6,1e-5,1e-4, 0.055, 0.06, 0.065,0.07,0.075] + [i/100 for i in range(5,100,5)] +[1]
cutoffs = [i/10000 for i in range(35,495,5)]+[1e-100,1e-50,1e-20,1e-11,1e-9,1e-7,1e-6,1e-5,1e-4, 0.055, 0.06, 0.065,0.07,0.075] + [i/100 for i in range(5,100,5)] +[1]
#cutoffs = [i/1000 for i in range(1,300,3)]+[1e-7,1e-6,1e-5,1e-4,0.05, 0.15, 0.2, 0.325, 0.375, 0.425, 0.475] + [i/100 for i in range(30,100,5)] +[1]

import os

#true_file = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/sicer/overlap/strict_true/strong_true200_sorted.bed"
#false_file = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/sicer/overlap/strict_false/merge_false200_sorted.bed"
#true_file = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/sicer/overlap/K562_H3K27ac/H3K27ac_strict_true_prom200_sorted.bed"
#ifalse_file ="/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/sicer/overlap/K562_H3K27ac/H3K27ac_strict_false_prom200_sorted.bed"
#true_file = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/new_acme3/combineReads/strict_region/strict_true/true_new_pile22.bed"
#false_file = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/new_acme3/combineReads/strict_region/strict_false/false_new_pile24.bed"
true_file = "/standard/vol190/zanglab/sh8tv/Project/CUTRUN/Result/K562_H3K27me3_H3K27ac/TrueFalseRegion/H3K27ac/H3K27ac_true_regions.bed"
false_file = "/standard/vol190/zanglab/sh8tv/Project/CUTRUN/Result/K562_H3K27me3_H3K27ac/TrueFalseRegion/H3K27ac/H3K27ac_false_regions.bed"

for CUTTagid in CUTTags:
    #cmd = """ mkdir %s"""%(CUTTagid)
    #os.system(cmd)
### SEACR stringent ATAC
    #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/SEACR/acme3/rename/%s_K562_WT_CUTTag_H3K27ac_SEACRstrATAC.bed" %(CUTTagid)
    #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cutdf_SEACRstrATAC_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cutdf_SEACRstrATAC_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid, peakfile,false_file,CUTTagid)
    #os.system(cmd)

### SEACR stringent IgG
    #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/SEACR/acme3/rename/%s_K562_WT_CUTTag_H3K27ac_SEACRstrIgG.bed" %(CUTTagid)
    #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cutdf_SEACRstrIgG_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cutdf_SEACRstrIgG_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid, peakfile,false_file,CUTTagid)
    #os.system(cmd)

### SEACR relaxed ATAC
    #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/SEACR/acme3/rename/%s_K562_WT_CUTTag_H3K27ac_SEACRrelATAC.bed" %(CUTTagid)
    #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cutdf_SEACRrelATAC_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cutdf_SEACRrelATAC_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid, peakfile,false_file,CUTTagid)
    #os.system(cmd)

### SEACR relaxed IgG
    #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/SEACR/acme3/rename/%s_K562_WT_CUTTag_H3K27ac_SEACRrelIgG.bed" %(CUTTagid)
    #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cutdf_SEACRrelIgG_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cutdf_SEACRrelIgG_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid, peakfile,false_file,CUTTagid)
    #os.system(cmd)


    for cutoff in cutoffs:
        #if (cutoff == cutoffs[125]):
        #    cutoffc = "%.1f" % cutoff
        #else: 
        #    cutoffc = cutoff

### macs2broad
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/macs2broad_multiCutoff/cutoff_ac/%s_cut%s/%s_cut%s_peaks.broadPeak"%(CUTTagid, cutoff,CUTTagid, cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_macs2broad_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_macs2broad_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)

### macs2broad ATAC
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/macs2broadATAC_multiCutoff/cutoff_ac/%s_macs2broadATAC_cut%s/%s_macs2broadATAC_cut%s_peaks.broadPeak"%(CUTTagid, cutoff,CUTTagid, cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_macs2broadATAC_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_macs2broadATAC_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)

### macs2broad IgG
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/macs2broadIgG_multiCutoff/cutoff_ac/%s_macs2broadIgG_cut%s/%s_macs2broadIgG_cut%s_peaks.broadPeak"%(CUTTagid, cutoff,CUTTagid, cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_macs2broadIgG_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_macs2broadIgG_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)

### macs2
        peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/macs2_multiCutoff/cutoff_ac/%s_cut%s/%s_cut%s_peaks.narrowPeak"%(CUTTagid, cutoff,CUTTagid, cutoff)
        cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_macs2_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_macs2_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,peakfile,false_file,CUTTagid,cutoff)
        os.system(cmd)

### macs2 ATAC
        peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/macs2ATAC_multiCutoff/cutoff_ac/%s_macs2ATAC_cut%s/%s_macs2ATAC_cut%s_peaks.narrowPeak"%(CUTTagid, cutoff,CUTTagid, cutoff)
        cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_macs2ATAC_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_macs2ATAC_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        os.system(cmd)

### macs2 IgG
        peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/macs2IgG_multiCutoff/cutoff_ac/%s_macs2IgG_cut%s/%s_macs2IgG_cut%s_peaks.narrowPeak"%(CUTTagid, cutoff,CUTTagid, cutoff)
        cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_macs2IgG_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_macs2IgG_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        os.system(cmd)

### SEACR stringent
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/SEACRstr_multiCutoff/cutoff_ac/%s_SEACRstr_cut%s/%s_SEACRstr_cut%s.stringent.bed" %(CUTTagid, cutoff,CUTTagid,cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_SEACRstr_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_SEACRstr_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)

### SEACR relaxed
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/SEACRrel_multiCutoff/cutoff_ac/%s_SEACRrel_cut%s/%s_SEACRrel_cut%s.relaxed.bed" %(CUTTagid, cutoff,CUTTagid,cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_SEACRrel_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_SEACRrel_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)


### MUSIC
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/MUSIC_multiCutoff/cutoff_ac/%s_MUSIC_cut%s/%s_MUSIC_cut%s.bed" %(CUTTagid, cutoff,CUTTagid,cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_MUSIC_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_MUSIC_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)

### MUSICATAC
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/MUSICATAC_multiCutoff/cutoff_ac/%s_MUSICATAC_cut%s/%s_MUSICATAC_cut%s.bed" %(CUTTagid, cutoff,CUTTagid,cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_MUSICATAC_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_MUSICATAC_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)

### MUSICIgG
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/MUSICIgG_multiCutoff/cutoff_ac/%s_MUSICIgG_cut%s/%s_MUSICIgG_cut%s.bed" %(CUTTagid, cutoff,CUTTagid,cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_MUSICIgG_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_MUSICIgG_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)

### GoPeaks
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/GoPeaks_multiCutoff/cutoff_ac/%s_GoPeaks_cut%s/%s_GoPeaks_cut%s_peaks.bed" %(CUTTagid, cutoff,CUTTagid,cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_GoPeaks_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_GoPeaks_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)

### GoPeaksATAC
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/GoPeaksATAC_multiCutoff/cutoff_ac/%s_GoPeaksATAC_cut%s/%s_GoPeaksATAC_cut%s_peaks.bed" %(CUTTagid, cutoff,CUTTagid,cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_GoPeaksATAC_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_GoPeaksATAC_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)

### GoPeaksIgG
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/GoPeaksIgG_multiCutoff/cutoff_ac/%s_GoPeaksIgG_cut%s/%s_GoPeaksIgG_cut%s_peaks.bed" %(CUTTagid, cutoff,CUTTagid,cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_GoPeaksIgG_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_GoPeaksIgG_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)


### RSEG
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/RSEG_multiCutoff/cutoff_ac/%s_RSEG_cut%s/%s_RSEG_cut%s.bed" %(CUTTagid, cutoff,CUTTagid,cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_RSEG_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_RSEG_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)

### RSEGdz deadzone
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/RSEGdz_multiCutoff/cutoff_ac/%s_RSEGdz_cut%s/%s_RSEGdz_cut%s.bed" %(CUTTagid, cutoff,CUTTagid,cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_RSEGdz_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_RSEGdz_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)

### RSEGATAC
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/RSEGATAC_multiCutoff/cutoff_ac/%s_RSEGATAC_cut%s/%s_RSEGATAC_cut%s.bed" %(CUTTagid, cutoff,CUTTagid,cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_RSEGATAC_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_RSEGATAC_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)

### RSEGIgG
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/RSEGIgG_multiCutoff/cutoff_ac/%s_RSEGIgG_cut%s/%s_RSEGIgG_cut%s.bed" %(CUTTagid, cutoff,CUTTagid,cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_RSEGIgG_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_RSEGIgG_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)

### RSEGdzATAC
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/RSEGdzATAC_multiCutoff/cutoff_ac/%s_RSEGdzATAC_cut%s/%s_RSEGdzATAC_cut%s.bed" %(CUTTagid, cutoff,CUTTagid,cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_RSEGdzATAC_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_RSEGdzATAC_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)

### RSEGdzIgG
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/RSEGdzIgG_multiCutoff/cutoff_ac/%s_RSEGdzIgG_cut%s/%s_RSEGdzIgG_cut%s.bed" %(CUTTagid, cutoff,CUTTagid,cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_RSEGdzIgG_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_RSEGdzIgG_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)

############
### sicer ATAC
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/sicerATAC_multiCutoff/cutoff_ac/%s_sicerATAC_cut%s/%s_K562_WT_CUTTag_H3K27ac_rdSE-W200-G600-FDR%s-island.bed" %(CUTTagid, cutoff,CUTTagid,cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_sicerATAC_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_sicerATAC_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)

### sicer IgG
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/sicerIgG_multiCutoff/cutoff_ac/%s_sicerIgG_cut%s/%s_K562_WT_CUTTag_H3K27ac_rdSE-W200-G600-FDR%s-island.bed" %(CUTTagid, cutoff,CUTTagid,cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_sicerIgG_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_sicerIgG_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)

### sicer raw
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/sicertreat_multiCutoff/cutoff_ac/%s_sicer_cut%s/%s_K562_WT_CUTTag_H3K27ac_rdSE-W200-G600.scoreisland" %(CUTTagid, cutoff,CUTTagid)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_sicertreat_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_sicertreat_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)

### sicer correct
        #peakfile = "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/sicerCorrect_multiCutoff/cutoff_ac/%s_sicerCorrect_cut%s/%s_sicerCorrect_cut%s_island_stats.bed" %(CUTTagid, cutoff,CUTTagid,cutoff)
        #cmd = """cd %s && intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_sicerCorrect_TP.bed &&  intersectBed -a %s -b %s | awk '{OFS="\t";print $1,$2,$3,"peak"NR,$3-$2}' > %s_cut%s_sicerCorrect_FP.bed"""%(CUTTagid,peakfile,true_file,CUTTagid,cutoff,  peakfile,false_file,CUTTagid,cutoff)
        #os.system(cmd)


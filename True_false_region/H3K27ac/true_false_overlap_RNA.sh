### H3K27ac overlap with hg38_clean_genome200bp_mappable.bed, divided H3K27ac to bins.
intersectBed -a /standard/vol190/zanglab/sh8tv/Data/Genome/hg38/hg38_clean_genome200bp_mappable.bed -b /standard/vol190/zanglab/sh8tv/Project/CUTRUN/Result/K562_H3K27me3_H3K27ac/sicerPeaks/GSM3536514_K562_WT_CUTTag_H3K27ac_sicerPeaks_sorted.bed -u > GSM3536514_K562_WT_CUTTag_H3K27ac_sicerPeaks_200bpBin.bed

###overlap with highly expressed gene in promoter +/-1kb (true)
intersectBed -a GSM3536514_K562_WT_CUTTag_H3K27ac_sicerPeaks_200bpBin.bed  -b /project/zanglab_project/jkx9nz/project/cut/HUMAN/RNA/K562_RNA_8K_promoter1kb.bed -u > H3K27ac_sicerPeak_nearHighExp1kb.bed

###overlap with non-expressed gene in promoter +/-1kb (false)
intersectBed -a GSM3536514_K562_WT_CUTTag_H3K27ac_sicerPeaks_200bpBin.bed  -b /project/zanglab_project/jkx9nz/project/cut/HUMAN/RNA/K562_RNA_none_promoter1kb.bed -u > H3K27ac_sicerPeak_nearNonExp1kb.bed

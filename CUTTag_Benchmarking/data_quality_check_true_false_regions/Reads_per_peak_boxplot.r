
path1 <- "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/strict_regions/old/"
path2 <- "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/strict_regions/old/plots/"

CUTTags = c("GSM3536507","GSM3536508","GSM3536509","GSM3536510","GSM3536511","GSM3536512","GSM3536513",
            "GSM3536515","GSM3560261","GSM3680215","GSM3680216","GSM3680217","GSM3680218","GSM3680219",
            "GSM3680220","GSM3680221","GSM3680222")

len_CUTTag <-length(CUTTags)
#options(warn=1)
for (i in (1:len_CUTTag)){
  pdf(paste0(path2,CUTTags[i],"_reads_per_peak_boxplot.pdf"))
  par(mar=c(4,5,3,6.5),xpd=TRUE)

  trueReads_data <- read.table(paste0(path1,CUTTags[i],"_K562_WT_CUTTag_H3K27me3_reads_true.bed"))
  trueReads_data <- trueReads_data[,c(-4,-5,-6)]
  colnames(trueReads_data) <- c("chrom","start","end","length")
  trueReads_data$interval <- trueReads_data$end - trueReads_data$start
  truesums <- aggregate(trueReads_data$length, by=list(trueReads_data$chrom, trueReads_data$start, trueReads_data$end,trueReads_data$interval), sum)
  colnames(truesums) <- c("chrom",  "start", "end", "interval", "sum")
  truesums <- truesums[order(truesums$chrom, truesums$start), ]
  truesums$ReadsPeak <- truesums$sum / truesums$interval * 1000
 
  falseReads_data <- read.table(paste0(path1,CUTTags[i],"_K562_WT_CUTTag_H3K27me3_reads_false.bed"))
  falseReads_data <- falseReads_data[,c(-4,-5,-6)]
  colnames(falseReads_data) <- c("chrom","start","end","length")
  falseReads_data$interval <- falseReads_data$end - falseReads_data$start
  falsesums <- aggregate(falseReads_data$length, by=list(falseReads_data$chrom, falseReads_data$start, falseReads_data$end,falseReads_data$interval), sum)
  colnames(falsesums) <- c("chrom",  "start", "end", "interval", "sum")
  falsesums <- falsesums[order(falsesums$chrom, falsesums$start), ]
  falsesums$ReadsPeak <- falsesums$sum / falsesums$interval * 1000 

  otherReads_data <- read.table(paste0(path1,CUTTags[i],"_K562_WT_CUTTag_H3K27me3_reads_other.bed"))
  otherReads_data <- otherReads_data[,c(-4,-5,-6)]
  colnames(otherReads_data) <- c("chrom","start","end","length")
  otherReads_data$interval <- otherReads_data$end - otherReads_data$start
  othersums <- aggregate(otherReads_data$length, by=list(otherReads_data$chrom, otherReads_data$start, otherReads_data$end,otherReads_data$interval), sum)
  colnames(othersums) <- c("chrom",  "start", "end", "interval", "sum")
  othersums <- othersums[order(othersums$chrom, othersums$start), ]
  othersums$ReadsPeak <- othersums$sum / othersums$interval * 1000
  
  palette<- c("coral","lightskyblue","green4")
  boxplot(log(truesums$ReadsPeak),log(falsesums$ReadsPeak),log(othersums$ReadsPeak),main= CUTTags[i],col=palette, ylab="log normalized reads", names=c("true","false","other"), cex.axis=2, cex.lab=2, cex.main=2, las=1)
  dev.off()
  true_other <- wilcox.test(truesums$ReadsPeak, othersums$ReadsPeak, paired = FALSE)
  false_other <- wilcox.test(falsesums$ReadsPeak, othersums$ReadsPeak, paired = FALSE)
  true_false <- wilcox.test(truesums$ReadsPeak, falsesums$ReadsPeak, paired = FALSE)
  cat(paste0(CUTTags[i],":\np-value between true and other: ",true_other$p.value, ";\np-value between false and other: ", false_other$p.value, ";\np-value between true and false: ",true_false$p.value,".","\n\n"))
}
#print(warnings())

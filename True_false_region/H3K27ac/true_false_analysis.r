#### H3K27ac false
nonExp_ovme3peaks<- read.table("H3K27ac_sicerPeak_nearNonExp1kb_OVH3K27me3peaks.bed",row.names=4)
nonExp_ovme3peaks_use <- nonExp_ovme3peaks[,4:20]
nonExp_ovme3peaks_use[nonExp_ovme3peaks_use>1] <- 1
ovme3peaks_sampleCount <- apply(nonExp_ovme3peaks_use,1,sum)
length(which(ovme3peaks_sampleCount>0))
ecdf(as.numeric(table(ovme3peaks_sampleCount)))

OVH3K27me3_sampleNum <- c()
for(i in seq(17,0,-1)){
	OVH3K27me3_sampleNum <- c(OVH3K27me3_sampleNum,length(which(ovme3peaks_sampleCount>= i)) )
	thisidx <- names(ovme3peaks_sampleCount)[which(ovme3peaks_sampleCount>= i)]
	thisdata<- cbind(nonExp_ovme3peaks[thisidx,1:3], thisidx) 
	write.table(thisdata, file=paste0("H3K27ac_nonExp_ov",i,"H3K27me3samples.bed"),row.names=F,col.names=F,sep="\t",quote=F)
}
names(OVH3K27me3_sampleNum) <- paste0("n",seq(17,0,-1),"samples")

use_false_idx <- names(ovme3peaks_sampleCount)[which(ovme3peaks_sampleCount>= 1)]
use_false_peak <- cbind(nonExp_ovme3peaks[use_false_idx, 1:3], use_false_idx)
write.table(use_false_peak, file="H3K27ac_false_regions.bed",row.names=F,col.names=F,sep="\t",quote=F)


### H3K27ac true
highExp_ovChIPpeaks <- read.table("H3K27ac_sicerPeak_nearHighExp1kb_OVH3K27acChIPpeaks.bed",row.names=4)
highExp_ovChIPpeaks_idx <- rownames(highExp_ovChIPpeaks)[which(apply(highExp_ovChIPpeaks[,4:5],1,min)>0)]


extsize = 200

for(extsize in seq(200,900,100)){
highExp_ovme3reads<- read.table(paste0("H3K27ac_sicerPeak_nearHighExp1kb_ext",extsize,"bp_OVH3K27me3reads.bed"),row.names=4)
highExp_ovme3reads_use <- highExp_ovme3reads[,4:20]
highExp_ovme3reads_use[highExp_ovme3reads_use>1] <- 1
ovme3reads_sampleCount <- apply(highExp_ovme3reads_use,1,sum)
print(c(extsize, length(which(ovme3reads_sampleCount == 0))))

}


### extsize 100 ver
highExp_ovme3reads<- read.table("H3K27ac_sicerPeak_nearHighExp1kb_OVH3K27me3reads.bed",row.names=4)
highExp_ovme3reads_use <- highExp_ovme3reads[,4:20]
highExp_ovme3reads_use[highExp_ovme3reads_use>1] <- 1
ovme3reads_sampleCount <- apply(highExp_ovme3reads_use,1,sum)


####### use extsize 500 ver for true regions
highExp_peakloci<- read.table("H3K27ac_sicerPeak_nearHighExp1kb_OVH3K27me3reads.bed",row.names=4)

highExp_ovme3reads<- read.table("H3K27ac_sicerPeak_nearHighExp1kb_ext500bp_OVH3K27me3reads.bed",row.names=4)
highExp_ovme3reads_use <- highExp_ovme3reads[,4:20]
highExp_ovme3reads_use[highExp_ovme3reads_use>1] <- 1
ovme3reads_sampleCount <- apply(highExp_ovme3reads_use,1,sum)
highExp_NOme3reads_idx <- names(ovme3reads_sampleCount)[which(ovme3reads_sampleCount == 0)]

use_true_peak <- cbind(highExp_peakloci[highExp_NOme3reads_idx,1:3], highExp_NOme3reads_idx)
write.table(use_true_peak, file="H3K27ac_true_regions.bed",row.names=F,col.names=F,sep="\t",quote=F)


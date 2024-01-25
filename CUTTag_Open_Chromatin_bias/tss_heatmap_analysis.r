cut1_tmp <- read.table("/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/matrix/K562/GSM4308151_PE_K562_WT_CUTTag_H3K27me3_tss5K.txt",row.names=5)
cut2_tmp <- read.table("/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/matrix/K562/GSM4308152_PE_K562_WT_CUTTag_H3K27me3_tss5K.txt",row.names=5)
cutac_tmp <- read.table("/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/matrix/K562/GSM4797827_PE_K562_WT_CUTAC_H3K27me3_tss5K.txt",row.names=5)
cutrun_tmp <- read.table("/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/matrix/K562/GSM2803204_PE_K562_WT_CUTRUN_H3K27me3_tss5K.txt",row.names=5)
chip1_tmp <- read.table("/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/matrix/K562/GSM608166_SE_K562_WT_ChIP_H3K27me3_tss5K.txt",row.names=5)
chip2_tmp <- read.table("/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/matrix/K562/GSM608167_SE_K562_WT_ChIP_H3K27me3_tss5K.txt",row.names=5)
ATAC_tmp <- read.table("/project/zanglab_project/jkx9nz/project/cut/HUMAN/chrAcc/TSS/matrix/K562_ATAC_PE_tss5K.txt",row.names=5)
DNase_tmp <- read.table("/project/zanglab_project/jkx9nz/project/cut/HUMAN/chrAcc/TSS/matrix/K562_DNase_SE_tss5K.txt",row.names=5)
topgene <- read.table("/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/TSS_bias/TopGene/K562_RNA5K_noChIP_ATAC.bed",row.names=4)

idx <- rownames(topgene)[order(topgene[,11])]

cut1 <- cut1_tmp[idx,6:1005][,201:800]
cut2 <- cut2_tmp[idx,6:1005][,201:800]
cutac <- cutac_tmp[idx,6:1005][,201:800]
cutrun <- cutrun_tmp[idx,6:1005][,201:800]
chip1 <- chip1_tmp[idx,6:1005][,201:800]
chip2 <- chip2_tmp[idx,6:1005][,201:800]
ATAC <- ATAC_tmp[idx,6:1005][,201:800]
DNase <- DNase_tmp[idx,6:1005][,201:800]

sitepro <- function(indata, M, COL){
  plot(apply(indata,2,mean),col=COL,main=M,type='l',xlab="relative position to TSS (bp)", ylab="aggregate signal",axes=F)
  axis(side=1,at=c(1, 300.5, 600), labels=c("-3k","TSS","3k"))
  axis(side=2,las=2)
  box()
}

pdf(file="sitepro.pdf",width=16,height=3)
par(mfrow=c(1,6),mar=c(4,4,2,2))
sitepro(cut1, "cut1","red")
sitepro(cut2, "cut2","red")
sitepro(cutac, "cutac","purple")
sitepro(cutrun, "cutac","brown")
sitepro(chip1, "chip1","blue")
sitepro(ATAC, "ATAC","black")
#sitepro(DNase, "DNase","black")
dev.off()

siteproChIP <- function(indata, M, COL){
  plot(apply(indata,2,mean),ylim=c(0,0.1),col=COL,main=M,type='l',xlab="relative position to TSS (bp)", ylab="aggregate signal",axes=F)
  axis(side=1,at=c(1, 300.5, 600), labels=c("-3k","TSS","3k"))
  axis(side=2,las=2)
  box()
}

pdf(file="sitepro_v2.pdf",width=16,height=3)
par(mfrow=c(1,4),mar=c(4,4,2,2))
siteproChIP(chip1, "chip1","blue")
dev.off()

heatmap <- function(data0, M, usecolor){
  data<-data0
  data <- c(as.matrix(data))
  data <- sort(data)
  temp<-data[round(c(0.010000,0.5,0.99)*length(data))]
  p20<-temp[1]
  p50<-temp[2]
  p80<-temp[3]
  zmin=p20
  zmax=p80
  #zmin=MIN
  #zmax=MAX
  ColorRamp <- colorRampPalette(c("white",usecolor), bias=1)(10000)   #color list
  ColorLevels <- seq(to=zmax,from=zmin, length=10000)   #number sequence
  data0[data0<zmin] <- zmin
  data0[data0>zmax] <- zmax
  ColorRamp_ex <- ColorRamp[round( (min(data0)-zmin)*10000/(zmax-zmin) ) : round( (max(data0)-zmin)*10000/(zmax-zmin) )]
  image(1:ncol(data0), 1:nrow(data0), t(data0), axes=F, col=ColorRamp_ex, xlab="", ylab=paste(zmin,zmax,sep=":"),main=M,useRaster=T,cex.main=1)
  axis(side=2,las=2)
  axis(side=1,at=c(1, 300.5, 600), labels=c("-3k","TSS","3k"))
  box()
}

pdf(file="heatmap.pdf",width=12,height=6)
par(mfrow=c(1,7),mar=c(4,4,2,2))
heatmap(cut1, "cut1","red")
heatmap(cut2, "cut2","red")
heatmap(cutac, "cutac","purple")
heatmap(cutrun, "cutrun","brown")
heatmap(chip1, "chip1","blue")
heatmap(chip2, "chip2","blue")
heatmap(ATAC, "ATAC","black")
#heatmap(DNase, "DNase","black")
dev.off()


heatmap_heat <- function(data0, M, usecolor){
  png(file=paste0(M,".png"))
  par(mar=c(0,0,0,0))
  data<-data0
  data <- c(as.matrix(data))
  data <- sort(data)
  temp<-data[round(c(0.010000,0.5,0.99)*length(data))]
  p20<-temp[1]
  p50<-temp[2]
  p80<-temp[3]
  zmin=p20
  zmax=p80
  #zmin=MIN
  #zmax=MAX
  ColorRamp <- colorRampPalette(c("white",usecolor), bias=1)(10000)   #color list
  ColorLevels <- seq(to=zmax,from=zmin, length=10000)   #number sequence
  data0[data0<zmin] <- zmin
  data0[data0>zmax] <- zmax
  ColorRamp_ex <- ColorRamp[round( (min(data0)-zmin)*10000/(zmax-zmin) ) : round( (max(data0)-zmin)*10000/(zmax-zmin) )]
  image(1:ncol(data0), 1:nrow(data0), t(data0), axes=F, col=ColorRamp_ex, xlab="", ylab="",main="",useRaster=T,cex.main=1)
  #axis(side=2,las=2)
  #axis(side=1,at=c(1, 300.5, 600), labels=c("-3k","TSS","3k"))
  box()
  dev.off()
}
heatmap_heat(cut1, "cut1","red")
heatmap_heat(cut2, "cut2","red")
#heatmap_heat(cutac, "cutac","purple")
heatmap_heat(chip1, "chip1","blue")
heatmap_heat(chip2, "chip2","blue")
heatmap_heat(ATAC, "ATAC","black")
heatmap_heat(DNase, "DNase","black")

pdf(file="colorLegend.pdf")
par(mfrow=c(3,1))
for(usecolor in c("red","blue","black")){
  ColorRamp <- colorRampPalette(c("#FFFFFF",usecolor), bias=1)(100)
  ColorLevels <- seq(to=1,from=0, length=100)   #number sequence
  image(ColorLevels,1,matrix(data=ColorLevels, nrow=length(ColorLevels),ncol=1),col=ColorRamp, xlab="",ylab="",cex.axis=1,xaxt="n",yaxt="n")
}
dev.off()
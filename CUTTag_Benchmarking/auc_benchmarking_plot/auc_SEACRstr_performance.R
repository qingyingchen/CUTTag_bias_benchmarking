library(reshape2) 
library(RColorBrewer)

FPR <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/measures/FPR_SEACR.txt",
                         header=T,sep="\t")
TPR <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/measures/TPR_SEACR.txt",
                         header=T,sep="\t")
Precision <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/measures/Precision_SEACR.txt",
                        header=T,sep="\t")
FPR <- FPR[c(1,2,3),]
TPR <- TPR[c(1,2,3),]
Precision <- Precision[c(1,2,3),]
FPR <- t(FPR)
TPR <- t(TPR)
Precision <- t(Precision)

FPR_ATAC_SEACRstr <- FPR[,2] - FPR[,1]
FPR_IgG_SEACRstr <- FPR[,3] - FPR[,1]
FPR_comp <- cbind(FPR_ATAC_SEACRstr,FPR_IgG_SEACRstr)
colnames(FPR_comp) <- c("ATAC-SEACRstr","IgG-SEACRstr")

TNR_ATAC_SEACRrel <- FPR[,1] - FPR[,2]
TNR_IgG_SEACRrel <- FPR[,1] - FPR[,3]
TNR_comp <- cbind(TNR_ATAC_SEACRrel,TNR_IgG_SEACRrel)
colnames(TNR_comp) <- c("ATAC-SEACRrel","IgG-SEACRrel")

TPR_ATAC_SEACRstr <- TPR[,2] - TPR[,1]
TPR_IgG_SEACRstr <- TPR[,3] - TPR[,1]
TPR_comp <- cbind(TPR_ATAC_SEACRstr,TPR_IgG_SEACRstr)
colnames(TPR_comp) <- c("ATAC-SEACRstr","IgG-SEACRstr")

Precision_ATAC_SEACRstr <- Precision[,2] - Precision[,1]
Precision_IgG_SEACRstr <- Precision[,3] - Precision[,1]
Precision_comp <- cbind(Precision_ATAC_SEACRstr,Precision_IgG_SEACRstr)
colnames(Precision_comp) <- c("ATAC-SEACRstr","IgG-SEACRstr")


pdf("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/figures_17me3/AUC_SEACRstr_performance_diff1.pdf", w =9 ,h=4.5)
par(mfcol=c(1,4))
palette2 <- brewer.pal(n = 9, name = "Blues")
palette<- c(palette2[7],palette2[6])

plot(0, type="n",main="SEACRstr FPR", xlim=c(0.5,2.5), ylim=c(-1,1), yaxt="n", xaxt="n", xlab="", ylab="",cex.axis=2)#, ylab="auFPR_comp_rank")
box(lwd = 2)
abline(h = 0, col = palette2[9],lty = 2.5, lwd=1.5)
axis(2, at=seq(-1,1,0.5), las=1, tck=-0.08,cex.axis=1,col.axis="white",lwd=2)
box_pos <- c(1:2)
axis(1, at=box_pos, labels=colnames(FPR_comp), tick=FALSE, tck=-0.02, lwd=0, lwd.tick=1,las=2,cex.axis=1)
boxplot(FPR_comp, border=palette, add=TRUE,col= "white",yaxt="n",xaxt="n",outline = FALSE,lwd=1.5)
dot_pos <- rep(box_pos, each=17)
points(x=dot_pos, y=as.vector(FPR_comp),col=rep(palette, each=17), pch=19,cex=0.8)
for (i in 1:2) {
  y=as.vector(FPR_comp)[(17*(i-1)+1):(17*i)]
  y1 = y[order(y)]
  lines(x=rep(i, each=17), y1, lty=2,col=palette[i],lwd=1.5)
}

plot(0, type="n",main="SEACRstr TNR", xlim=c(0.5,2.5), ylim=c(-1,1), yaxt="n", xaxt="n", xlab="", ylab="",cex.axis=2)#, ylab="auFPR_comp_rank")
box(lwd = 2)
abline(h = 0, col = palette2[9],lty = 2.5, lwd=1.5)
axis(2, at=seq(-1,1,0.5), las=1, tck=-0.08,cex.axis=1,col.axis="white",lwd=2)
box_pos <- c(1:2)
axis(1, at=box_pos, labels=colnames(TNR_comp), tick=FALSE, tck=-0.02, lwd=0, lwd.tick=1,las=2,cex.axis=1)
boxplot(TNR_comp, border=palette, add=TRUE,col= "white",yaxt="n",xaxt="n",outline = FALSE,lwd=1.5)
dot_pos <- rep(box_pos, each=17)
points(x=dot_pos, y=as.vector(TNR_comp),col=rep(palette, each=17), pch=19,cex=0.8)
for (i in 1:2) {
  y=as.vector(TNR_comp)[(17*(i-1)+1):(17*i)]
  y1 = y[order(y)]
  lines(x=rep(i, each=17), y1, lty=2,col=palette[i],lwd=1.5)
}

plot(0, type="n",main="SEACRstr TPR", xlim=c(0.5,2.5), ylim=c(-1,1), yaxt="n", xaxt="n", xlab="", ylab="",cex.axis=2)#, ylab="auTPR_comp_rank")
box(lwd = 2)
abline(h = 0, col = palette2[9], lty = 2.5,lwd=1.5)
axis(2, at=seq(-1,1,0.5), las=1, tck=-0.08,cex.axis=1,col.axis="white",lwd=2)
box_pos <- c(1:2)
axis(1, at=box_pos, labels=colnames(TPR_comp), tick=FALSE, tck=-0.02, lwd=0, lwd.tick=1,las=2,cex.axis=1)
boxplot(TPR_comp, border=palette, add=TRUE,col= "white",yaxt="n",xaxt="n",outline = FALSE,lwd=1.5)
dot_pos <- rep(box_pos, each=17)
points(x=dot_pos, y=as.vector(TPR_comp),col=rep(palette, each=17), pch=19,cex=0.8)
for (i in 1:2) {
  y=as.vector(TPR_comp)[(17*(i-1)+1):(17*i)]
  y1 = y[order(y)]
  lines(x=rep(i, each=17), y1, lty=2,col=palette[i],lwd=1.5)
}

plot(0, type="n",main="SEACRstr Precision", xlim=c(0.5,2.5), ylim=c(-1,1), yaxt="n", xaxt="n", xlab="", ylab="",cex.axis=2)#, ylab="auTPR_comp_rank")
box(lwd = 2)
abline(h = 0, col = palette2[9], lty = 2.5,lwd=1.5)
axis(2, at=seq(-1,1,0.5), las=1, tck=-0.08,cex.axis=1,col.axis="white",lwd=2)
box_pos <- c(1:2)
axis(1, at=box_pos, labels=colnames(Precision_comp), tick=FALSE, tck=-0.02, lwd=0, lwd.tick=1,las=2,cex.axis=1)
boxplot(Precision_comp, border=palette, add=TRUE,col= "white",yaxt="n",xaxt="n",outline = FALSE,lwd=1.5)
dot_pos <- rep(box_pos, each=17)
points(x=dot_pos, y=as.vector(Precision_comp),col=rep(palette, each=17), pch=19,cex=0.8)
for (i in 1:2) {
  y=as.vector(Precision_comp)[(17*(i-1)+1):(17*i)]
  y1 = y[order(y)]
  lines(x=rep(i, each=17), y1, lty=2,col=palette[i],lwd=1.5)
}
dev.off()


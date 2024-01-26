library(reshape2)
library(RColorBrewer)

auroc_rank <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/measures/auROCrank_noctrl.txt",
                         header=T,sep="\t")
auprc_rank <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/measures/auPRCrank_noctrl.txt",
                         header=T,sep="\t")
mean_rank <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/measures/AUCmeanrank_noctrl.txt",
                        header=T,sep="\t")
# mean_score <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/measures/AUCmeanscore_noctrl.txt",
#                         header=T,sep="\t")
# 
# mean_score <- mean_score/max(mean_score)

auroc_rank<-t(auroc_rank)
auprc_rank<-t(auprc_rank)
mean_rank <-t(mean_rank)
# mean_score <-t(mean_score)
colnames(auroc_rank) <- c("macs2","SEACRstr","SEACRrel","MUSIC","GoPeaks","RSEG","RSEGdz")
colnames(auprc_rank) <- c("macs2","SEACRstr","SEACRrel","MUSIC","GoPeaks","RSEG","RSEGdz")
colnames(mean_rank) <- c("macs2","SEACRstr","SEACRrel","MUSIC","GoPeaks","RSEG","RSEGdz")
# colnames(mean_score) <- c("macs2","SEACRstr","SEACRrel","MUSIC","GoPeaks","RSEG","RSEGdz")

pdf("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/figures_17me3/AUC_noctrl_dots_box.pdf",w = 6.75,h=4.5)
par(mfcol=c(1,3))
#par(mar=c(8,5,3,5))
palette1 <- brewer.pal(n = 9, name = "Greens")
palette2 <- brewer.pal(n = 9, name = "Blues")
palette3 <- brewer.pal(n = 9, name = "Purples")
palette4 <- brewer.pal(n = 9, name = "Greys")
palette5<- brewer.pal(n = 9, name = "BrBG")
palette6 <- brewer.pal(n = 9, name = "RdPu")
palette7 <- brewer.pal(n = 9, name = "Reds")
palette<- c(palette1[7],palette2[7],palette3[7],palette4[7],palette5[1],palette6[7],palette7[7])

# y_auroc_rank<-range(as.vector(auroc_rank))
# y_auroc_rank<-round(y_auroc_rank,3
plot(0, type="n",main="auROC Rank no control", xlim=c(0.5,7.5), ylim=c(0,1), yaxt="n", xaxt="n", xlab="", ylab="",cex.axis=2)
axis(2, at=seq(0,1,0.2), las=1, tck=-0.06,cex.axis=2)
box_pos <- c(1:7)
axis(1, at=box_pos, labels=colnames(auroc_rank), tick=FALSE, las=2,cex.axis=1.5)
boxplot(auroc_rank, border=palette, add=TRUE,col= "white",yaxt="n",xaxt="n")
dot_pos <- rep(box_pos, each=17) 
points(x=dot_pos, y=as.vector(auroc_rank),col=rep(palette, each=17), pch=19,cex = 0.7)
for (i in 1:7) {
  y=as.vector(auroc_rank)[(17*(i-1)+1):(17*i)]
  y1 = y[order(y)]
  lines(x=rep(i, each=17), y1, lty=2,col=palette[i])
}


plot(0, type="n",main="auPRC Rank no control", xlim=c(0.5,7.5), ylim=c(0,1), yaxt="n", xaxt="n", xlab="", ylab="",cex.axis=2)
axis(2, at=seq(0,1,0.2), las=1, tck=-0.06,cex.axis=2)
box_pos <- c(1:7)
axis(1, at=box_pos, labels=colnames(auprc_rank), tick=FALSE, las=2,cex.axis=1.5)
boxplot(auprc_rank, border=palette, add=TRUE,col= "white",yaxt="n",xaxt="n")
dot_pos <- rep(box_pos, each=17) 
points(x=dot_pos, y=as.vector(auprc_rank),col=rep(palette, each=17), pch=19,cex = 0.7)
for (i in 1:7) {
  y=as.vector(auprc_rank)[(17*(i-1)+1):(17*i)]
  y1 = y[order(y)]
  lines(x=rep(i, each=17), y1, lty=2,col=palette[i])
}

plot(0, type="n", main="AUCmean Rank no control",xlim=c(0.5,7.5), ylim=c(0,1), yaxt="n", xaxt="n", xlab="", ylab="",cex.axis=2)
axis(2, at=seq(0,1,0.2), las=1, tck=-0.06,cex.axis=2)
box_pos <- c(1:7)
axis(1, at=box_pos, labels=colnames(mean_rank), tick=FALSE, las=2,cex.axis=1.5)
boxplot(mean_rank, border=palette, add=TRUE,col= "white",yaxt="n",xaxt="n")
dot_pos <- rep(box_pos, each=17) 
points(x=dot_pos, y=as.vector(mean_rank),col=rep(palette, each=17), pch=19,cex = 0.7)
for (i in 1:7) {
  y=as.vector(mean_rank)[(17*(i-1)+1):(17*i)]
  y1 = y[order(y)]
  lines(x=rep(i, each=17), y1, lty=2,col=palette[i])
}

dev.off()





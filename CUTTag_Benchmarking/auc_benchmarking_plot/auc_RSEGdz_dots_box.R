library(reshape2)
library(RColorBrewer)

auroc_rank <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/measures/auROCrank_RSEGdzonly.txt",
                         header=T,sep="\t")
auprc_rank <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/measures/auPRCrank_RSEGdzonly.txt",
                         header=T,sep="\t")
mean_rank <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/measures/AUCmeanrank_RSEGdzonly.txt",
                        header=T,sep="\t")

auroc_rank<-t(auroc_rank)
auprc_rank<-t(auprc_rank)
mean_rank <-t(mean_rank)

colnames(auroc_rank) <- c("RSEGdz","-ATAC","-IgG")
colnames(auprc_rank) <- c("RSEGdz","-ATAC","-IgG")
colnames(mean_rank) <- c("RSEGdz","-ATAC","-IgG")

pdf("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/figures_17me3/AUC_RSEGdzonly_dots_box.pdf",w = 6,h=4)
par(mfcol=c(1,3))
#par(mar=c(8,5,3,5))
palette1 <- brewer.pal(n = 9, name = "Reds")
# palette2 <- brewer.pal(n = 9, name = "Blues")
# palette3 <- brewer.pal(n = 9, name = "Purples")
# palette4 <- brewer.pal(n = 9, name = "Greys")
# palette5<- brewer.pal(n = 9, name = "BrBG")
# palette6 <- brewer.pal(n = 9, name = "RdPu")
# palette7 <- brewer.pal(n = 9, name = "Reds")
palette<- c(palette1[8],palette1[6],palette1[4])

plot(0, type="n",main="auROC Rank RSEGdz", xlim=c(0.5,3.5), ylim=c(0,1), yaxt="n", xaxt="n", xlab="", ylab="",cex.axis=2)
axis(2, at=seq(0,1,0.2), las=1, tck=-0.06,cex.axis=2)
box_pos <- c(1:3)
axis(1, at=box_pos, labels=colnames(auroc_rank), tick=FALSE, las=2,cex.axis=1.5)
boxplot(auroc_rank, border=palette, add=TRUE,col= "white",yaxt="n",xaxt="n")
dot_pos <- rep(box_pos, each=17) 
points(x=dot_pos, y=as.vector(auroc_rank),col=rep(palette, each=17), pch=19,cex = 0.7)
for (i in 1:3) {
  y=as.vector(auroc_rank)[(17*(i-1)+1):(17*i)]
  y1 = y[order(y)]
  lines(x=rep(i, each=17), y1, lty=2,col=palette[i])
}


plot(0, type="n",main="auPRC Rank RSEGdz", xlim=c(0.5,3.5), ylim=c(0,1), yaxt="n", xaxt="n", xlab="", ylab="",cex.axis=2)
axis(2, at=seq(0,1,0.2), las=1, tck=-0.06,cex.axis=2)
box_pos <- c(1:3)
axis(1, at=box_pos, labels=colnames(auprc_rank), tick=FALSE, las=2,cex.axis=1.5)
boxplot(auprc_rank, border=palette, add=TRUE,col= "white",yaxt="n",xaxt="n")
dot_pos <- rep(box_pos, each=17) 
points(x=dot_pos, y=as.vector(auprc_rank),col=rep(palette, each=17), pch=19,cex = 0.7)
for (i in 1:3) {
  y=as.vector(auprc_rank)[(17*(i-1)+1):(17*i)]
  y1 = y[order(y)]
  lines(x=rep(i, each=17), y1, lty=2,col=palette[i])
}

plot(0, type="n", main="AUCmean Rank RSEGdz",xlim=c(0.5,3.5), ylim=c(0,1), yaxt="n", xaxt="n", xlab="", ylab="",cex.axis=2)
axis(2, at=seq(0,1,0.2), las=1, tck=-0.06,cex.axis=2)
box_pos <- c(1:3)
axis(1, at=box_pos, labels=colnames(mean_rank), tick=FALSE, las=2,cex.axis=1.5)
boxplot(mean_rank, border=palette, add=TRUE,col= "white",yaxt="n",xaxt="n")
dot_pos <- rep(box_pos, each=17) 
points(x=dot_pos, y=as.vector(mean_rank),col=rep(palette, each=17), pch=19,cex = 0.7)
for (i in 1:3) {
  y=as.vector(mean_rank)[(17*(i-1)+1):(17*i)]
  y1 = y[order(y)]
  lines(x=rep(i, each=17), y1, lty=2,col=palette[i])
}

dev.off()





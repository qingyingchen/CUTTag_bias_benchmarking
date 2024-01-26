library(reshape2) 
library(RColorBrewer)

FPR <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/ac_17me3/FPR_SEACR_ac.txt",
                         header=T,sep="\t")
TPR <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/ac_17me3/TPR_SEACR_ac.txt",
                         header=T,sep="\t")
Precision <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/ac_17me3/Precision_SEACR_ac.txt",
                        header=T,sep="\t")
FPR <- FPR[c(4,5,6),]
TPR <- TPR[c(4,5,6),]
Precision <- Precision[c(4,5,6),]
FPR <- t(FPR)
TPR <- t(TPR)
Precision <- t(Precision)

FPR_ATAC_SEACRrel <- FPR[,2] - FPR[,1]
FPR_IgG_SEACRrel <- FPR[,3] - FPR[,1]
FPR_comp <- cbind(FPR_ATAC_SEACRrel,FPR_IgG_SEACRrel)
colnames(FPR_comp) <- c("ATAC-SEACRrel","IgG-SEACRrel")

TNR_ATAC_SEACRrel <- FPR[,1] - FPR[,2]
TNR_IgG_SEACRrel <- FPR[,1] - FPR[,3]
TNR_comp <- cbind(TNR_ATAC_SEACRrel,TNR_IgG_SEACRrel)
colnames(TNR_comp) <- c("ATAC-SEACRrel","IgG-SEACRrel")

TPR_ATAC_SEACRrel <- TPR[,2] - TPR[,1]
TPR_IgG_SEACRrel <- TPR[,3] - TPR[,1]
TPR_comp <- cbind(TPR_ATAC_SEACRrel,TPR_IgG_SEACRrel)
colnames(TPR_comp) <- c("ATAC-SEACRrel","IgG-SEACRrel")

Precision_ATAC_SEACRrel <- Precision[,2] - Precision[,1]
Precision_IgG_SEACRrel <- Precision[,3] - Precision[,1]
Precision_comp <- cbind(Precision_ATAC_SEACRrel,Precision_IgG_SEACRrel)
colnames(Precision_comp) <- c("ATAC-SEACRrel","IgG-SEACRrel")

pdf("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/ac_17me3/AUC_SEACRrel_performance_diff.pdf", w = 9 ,h=4.5)
par(mfcol=c(1,4))
palette2 <- brewer.pal(n = 9, name = "Purples")
palette<- c(palette2[7],palette2[6])

par(mar = c(2, 4, 4, 2))  # Adjust margins for better label placement
plot(0, type = "n", main = "SEACRrel FPR", ylim = c(-1,1), xlim = c(0, 2), yaxt = "n", xaxt = "n", xlab = "", ylab = "")
axis(2, at = seq(-1, 1, 0.5), las = 1, tck = -0.02, cex.axis = 1)
barplot(FPR_comp[1,], col = palette, border = NA,width = 0.8, names.arg = rownames(FPR_comp), las = 2,yaxt = "n", ylab = "",add = TRUE)

plot(0, type = "n", main = "SEACRstr TNR", ylim = c(-1,1), xlim = c(0, 2), yaxt = "n", xaxt = "n", xlab = "", ylab = "")
#abline(h = 0, col = palette2[8], lty = 2.5, lwd=1.5)
axis(2, at = seq(-1,1,  0.5), las = 1, tck = -0.02, cex.axis = 1)
barplot(TNR_comp[1,], col = palette, border = NA,width = 0.8, names.arg = rownames(TNR_comp), las = 2,yaxt = "n", ylab = "",add = TRUE)

par(mar = c(2, 4, 4, 2))  # Adjust margins for better label placement
plot(0, type = "n", main = "SEACRrel TPR", ylim = c(-1, 1), xlim = c(0, 2), yaxt = "n", xaxt = "n", xlab = "", ylab = "")
axis(2, at = seq(-1, 1, 0.5), las = 1, tck = -0.02, cex.axis = 1)
barplot(TPR_comp[1,], col = palette, border = NA,width = 0.8, names.arg = rownames(TPR_comp), las = 2,yaxt = "n", ylab = "",add = TRUE)

par(mar = c(2, 4, 4, 2))  # Adjust margins for better label placement
plot(0, type = "n", main = "SEACRrel Precision", ylim = c(-1, 1), xlim = c(0, 2), yaxt = "n", xaxt = "n", xlab = "", ylab = "")
axis(2, at = seq(-1, 1, 0.5), las = 1, tck = -0.02, cex.axis = 1)
barplot(Precision_comp[1,], col = palette, border = NA,width = 0.8, names.arg = rownames(Precision_comp), las = 2,yaxt = "n", ylab = "",add = TRUE)

dev.off()


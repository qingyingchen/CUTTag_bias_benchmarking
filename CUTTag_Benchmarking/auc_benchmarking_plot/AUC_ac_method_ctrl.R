# Load required libraries
library(reshape2)
library(RColorBrewer)

# Read data
AUC_ac_macs2 <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/ac_17me3/AUC_ac_macs2.txt",
                            header = TRUE, sep = "\t")
AUC_ac_MUSIC <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/ac_17me3/AUC_ac_MUSIC.txt",
                           header = TRUE, sep = "\t")
AUC_ac_GoPeaks <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/ac_17me3/AUC_ac_GoPeaks.txt",
                           header = TRUE, sep = "\t")
AUC_ac_RSEG <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/ac_17me3/AUC_ac_RSEG.txt",
                             header = TRUE, sep = "\t")
AUC_ac_RSEGdz <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/ac_17me3/AUC_ac_RSEGdz.txt",
                          header = TRUE, sep = "\t")
# Set up PDF file
pdf("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/ac_17me3/AUC_ac_method_ctrl.pdf", w = 15, h = 5)
par(mfcol=c(1,5))
# Define color palette
palette11 <- brewer.pal(n = 9, name = "Greens")
palette1<- c(palette11[6],palette11[4],palette11[2])

palette21 <- brewer.pal(n = 9, name = "Greys")
palette2<- c(palette21[6],palette21[4],palette21[2])

palette31 <- brewer.pal(n = 9, name = "BrBG")
palette3<- c(palette31[1],palette31[2],palette31[3])

palette41 <- brewer.pal(n = 9, name = "RdPu")
palette4<- c(palette41[6],palette41[4],palette41[2])

palette51 <- brewer.pal(n = 9, name = "Reds")
palette5<- c(palette51[6],palette51[4],palette51[2])

# Set up the plot area
par(mar = c(5, 4, 4, 5))  # Adjust margins for better label placement
plot(0, type = "n", main = "macs2 ac", ylim = c(0.04, 1), xlim = c(0, 3), yaxt = "n", xaxt = "n", xlab = "", ylab = "")
axis(2, at = seq(0, 1, 0.2), las = 1, tck = -0.02, cex.axis = 1)
barplot(AUC_ac_macs2$rankmean, col = palette1, border = NA,width = 0.8, names.arg = rownames(AUC_ac_macs2), las = 2,yaxt = "n", ylab = "",add = TRUE)

par(mar = c(5, 4, 4, 5))  # Adjust margins for better label placement
plot(0, type = "n", main = "MUSIC ac", ylim = c(0.04, 1), xlim = c(0, 3), yaxt = "n", xaxt = "n", xlab = "", ylab = "")
axis(2, at = seq(0, 1, 0.2), las = 1, tck = -0.02, cex.axis = 1)
barplot(AUC_ac_MUSIC$rankmean, col = palette2, border = NA,width = 0.8, names.arg = rownames(AUC_ac_MUSIC), las = 2,yaxt = "n", ylab = "",add = TRUE)

par(mar = c(5, 4, 4, 5))  # Adjust margins for better label placement
plot(0, type = "n", main = "GoPeaks ac", ylim = c(0.04, 1), xlim = c(0, 3), yaxt = "n", xaxt = "n", xlab = "", ylab = "")
axis(2, at = seq(0, 1, 0.2), las = 1, tck = -0.02, cex.axis = 1)
barplot(AUC_ac_GoPeaks$rankmean, col = palette3, border = NA,width = 0.8, names.arg = rownames(AUC_ac_GoPeaks), las = 2,yaxt = "n", ylab = "",add = TRUE)

par(mar = c(5, 4, 4, 5))  # Adjust margins for better label placement
plot(0, type = "n", main = "RSEG ac", ylim = c(0.04, 1), xlim = c(0, 3), yaxt = "n", xaxt = "n", xlab = "", ylab = "")
axis(2, at = seq(0, 1, 0.2), las = 1, tck = -0.02, cex.axis = 1)
barplot(AUC_ac_RSEG$rankmean, col = palette4, border = NA,width = 0.8, names.arg = rownames(AUC_ac_RSEG), las = 2,yaxt = "n", ylab = "",add = TRUE)

par(mar = c(5, 4, 4, 5))  # Adjust margins for better label placement
plot(0, type = "n", main = "RSEGdz ac", ylim = c(0.04, 1), xlim = c(0, 3), yaxt = "n", xaxt = "n", xlab = "", ylab = "")
axis(2, at = seq(0, 1, 0.2), las = 1, tck = -0.02, cex.axis = 1)
barplot(AUC_ac_RSEGdz$rankmean, col = palette5, border = NA,width = 0.8, names.arg = rownames(AUC_ac_RSEGdz), las = 2,yaxt = "n", ylab = "",add = TRUE)

dev.off()

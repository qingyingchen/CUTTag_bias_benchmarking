# Load required libraries
library(reshape2)
library(RColorBrewer)

# Read data
AUC_ac_noctrl <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/ac_17me3/AUC_ac_noctrl_new.txt",
                            header = TRUE, sep = "\t")

# Set up PDF file
pdf("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/ac_17me3/AUC_ac_noctrl_new.pdf", w = 4, h = 5)

# Define color palette
palette1 <- brewer.pal(n = 9, name = "Greens")
palette2 <- brewer.pal(n = 9, name = "Blues")
palette3 <- brewer.pal(n = 9, name = "Purples")
palette4 <- brewer.pal(n = 9, name = "Greys")
palette5 <- brewer.pal(n = 9, name = "BrBG")
palette6 <- brewer.pal(n = 9, name = "RdPu")
palette7 <- brewer.pal(n = 9, name = "Reds")
palette <- c(palette1[5],palette1[5], palette2[5], palette3[5], palette4[5], palette5[1], palette6[5], palette7[5])

# Set up the plot area
par(mar = c(5, 4, 4, 3))  # Adjust margins for better label placement
plot(0, type = "n", main = "AUCmean Rank noctrl ac", ylim = c(0.04, 1), xlim = c(0, 8), yaxt = "n", xaxt = "n", xlab = "", ylab = "",cex.axis=2)
axis(2, at = seq(0, 1, 0.2), las = 1, tck = -0.02, cex.axis = 1)

barplot(AUC_ac_noctrl$rankmean, col = palette, border = NA,width = 0.8, names.arg = rownames(AUC_ac_noctrl), las = 2,yaxt = "n", ylab = "",add = TRUE)
dev.off()

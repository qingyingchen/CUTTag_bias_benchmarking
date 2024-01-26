# Load required libraries
library(reshape2)
library(RColorBrewer)

# Read data
AUC_ac_ctrl <- read.table("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/ac_17me3/AUC_ac_ctrl.txt",
                            header = TRUE, sep = "\t")

# Set up PDF file
pdf("/Users/jkx9nz/Library/CloudStorage/Dropbox/CUTTagResults/result/benchmarking/cutoff_all_sicer/ac_17me3/AUC_ac_ctrl.pdf", w = 4, h = 5)

# Define color palette
palette1 <- brewer.pal(n = 9, name = "Greens")
# palette2 <- brewer.pal(n = 9, name = "Blues")
# palette3 <- brewer.pal(n = 9, name = "Purples")
palette4 <- brewer.pal(n = 9, name = "Greys")
palette5 <- brewer.pal(n = 9, name = "BrBG")
palette6 <- brewer.pal(n = 9, name = "RdPu")
palette7 <- brewer.pal(n = 9, name = "Reds")
palette <- c(palette1[4],palette1[2], palette4[4],palette4[2], palette5[2], palette5[3], palette6[4], palette6[2], palette7[4], palette7[2])

# Set up the plot area
par(mar = c(5, 4, 4, 3))  # Adjust margins for better label placement
plot(0, type = "n", main = "AUCmean Rank ctrl ac", ylim = c(0.04, 1), xlim = c(0, 10), yaxt = "n", xaxt = "n", xlab = "", ylab = "")
axis(2, at = seq(0, 1, 0.2), las = 1, tck = -0.02, cex.axis = 1)

barplot(AUC_ac_ctrl$rankmean, col = palette, border = NA,width = 0.8, names.arg = rownames(AUC_ac_ctrl), las = 2,yaxt = "n", ylab = "",add = TRUE)
dev.off()

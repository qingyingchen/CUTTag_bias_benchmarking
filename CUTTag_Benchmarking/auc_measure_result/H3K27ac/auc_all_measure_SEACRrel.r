library(RColorBrewer)

path1 <- "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/overlap_tmpfiles/cutoff_ac_17me3/"
path2<- "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/ROC_PRC/cutoff_ac_17me3/measures/"
path3<- "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/ROC_PRC/cutoff_ac_17me3/ROCplot/"

CUTTags = c("GSM3536514")
#len_CUTTag <-length(CUTTags)
method <-c("SEACRrel","SEACRrelATAC","SEACRrelIgG")
len_method <-length(method)

#final_ROC<- c()
#final_PRC<- c()
#final_mean <- c()
#score_ROC<- c()
#score_PRC<- c()

measure_data <- data.frame(matrix(nrow = 3, ncol = 6))
rownames(measure_data) <- method
colnames(measure_data) <- c("ROCscore","PRCscore","scoremean","ROCrank","PRCrank","rankmean")
scoremean <- read.table(paste0(path2,"AUCmeanscore_ac.txt"))
scoremean <- scoremean[c(7,8,9),]

auc <- read.table(paste0(path2,CUTTags[1],"_auc.txt"))
auc <- auc[c(7,8,9),]
measure_data[,1] <- auc[,3]
measure_data[,2] <- auc[,6]
measure_data[,3] <- scoremean
normRank <- apply(auc,2,rank)/len_method
rank_mean <- apply(normRank,1,mean)
measure_data[,4] <- normRank[,3]
measure_data[,5] <- normRank[,6]
measure_data[,6] <- rank_mean

write.table(measure_data,file=paste0(path2,"AUC_ac_SEACRrel.txt"),row.names=T,col.names=T,sep="\t",quote=F)


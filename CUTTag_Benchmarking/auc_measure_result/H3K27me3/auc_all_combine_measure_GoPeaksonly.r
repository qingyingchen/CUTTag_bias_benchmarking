library(RColorBrewer)

path1 <- "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/overlap_tmpfiles/cutoff_all/"
path2<- "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/ROC_PRC/cutoff_all/measures/"
path3<- "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/ROC_PRC/cutoff_all/ROCplot/"
path4<-"/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/ROC_PRC/cutoff_all/ROCplot/MethodsCombine/"
CUTTags = c("GSM3536507","GSM3536508","GSM3536509","GSM3536510","GSM3536511","GSM3536512","GSM3536513",
            "GSM3536515","GSM3560261","GSM3680215","GSM3680216","GSM3680217","GSM3680218","GSM3680219",
            "GSM3680220","GSM3680221","GSM3680222")
len_CUTTag <-length(CUTTags)

method <- c("GoPeaks","GoPeaksATAC","GoPeaksIgG")
len_method <-length(method)

final_ROC<- c()
final_PRC<- c()
final_mean <- c()
score_ROC<- c()
score_PRC<- c()

for (i in (1:len_CUTTag)){

  auc <- read.table(paste0(path2,CUTTags[i],"_auc.txt"))
  auc <- auc[c(16,17,18),]
  
  score_ROC <-cbind(score_ROC,auc[,3])
  score_PRC <-cbind(score_PRC,auc[,6])
  normRank <- apply(auc,2,rank)/len_method
  rank_mean <- apply(normRank,1,mean)
  #rank_ROC<- normRank[,3]
  #rank_PRC<- normRank[,6]
  final_mean <- cbind(final_mean,rank_mean)
  final_ROC<-cbind(final_ROC,normRank[,3])
  final_PRC<-cbind(final_PRC,normRank[,6])}

colnames(score_ROC) <- CUTTags
colnames(score_PRC) <- CUTTags
rownames(score_ROC) <- method
rownames(score_PRC) <- method
colnames(final_ROC) <- CUTTags
colnames(final_PRC) <- CUTTags
rownames(final_ROC) <- method
rownames(final_PRC) <- method
colnames(final_mean) <- CUTTags
rownames(final_mean) <- method
write.table(score_ROC,file=paste0(path2,"auROCscore_GoPeaksonly.txt"),row.names=T,col.names=T,sep="\t",quote=F)
write.table(score_PRC,file=paste0(path2,"auPRCscore_GoPeaksonly.txt"),row.names=T,col.names=T,sep="\t",quote=F)
write.table(final_ROC,file=paste0(path2,"auROCrank_GoPeaksonly.txt"),row.names=T,col.names=T,sep="\t",quote=F)
write.table(final_PRC,file=paste0(path2,"auPRCrank_GoPeaksonly.txt"),row.names=T,col.names=T,sep="\t",quote=F)
write.table(final_mean,file=paste0(path2,"AUCmeanrank_GoPeaksonly.txt"),row.names=T,col.names=T,sep="\t",quote=F)


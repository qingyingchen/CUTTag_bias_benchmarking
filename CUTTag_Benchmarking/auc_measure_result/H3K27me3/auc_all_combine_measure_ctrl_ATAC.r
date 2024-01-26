library(RColorBrewer)

path1 <- "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/overlap_tmpfiles/cutoff_all/"
path2<- "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/ROC_PRC/cutoff_all/measures/"
path3<- "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/ROC_PRC/cutoff_all/ROCplot/"
path4<-"/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/ROC_PRC/cutoff_all/ROCplot/MethodsCombine/"
#truedata <- read.table("/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/sicer/overlap/strict_true/strong_true200_sorted_length.bed",row.names=4)
#true_total <- sum(truedata[,5])
#falsedata <- read.table("/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/sicer/overlap/strict_false/merge_false200_sorted_length.bed",row.names=4)
#false_total <- sum(falsedata[,4])
CUTTags = c("GSM3536507","GSM3536508","GSM3536509","GSM3536510","GSM3536511","GSM3536512","GSM3536513","GSM3536514",
            "GSM3536515","GSM3560261","GSM3680215","GSM3680216","GSM3680217","GSM3680218","GSM3680219",
            "GSM3680220","GSM3680221","GSM3680222")
len_CUTTag <-length(CUTTags)
#method <- c("macs2broad","macs2broadATAC","macs2broadIgG","sicerATAC","sicerIgG","sicertreat","SEACRstr","SEACRstrATAC","SEACRstrIgG","SEACRrel","SEACRrelATAC","SEACRrelIgG","MUSIC","RSEG","RSEGdz","GoPeaks")
#method <-c("macs2broad","SEACRstr","SEACRrel","MUSIC","RSEG","RSEGdz","GoPeaks")
#method <- c("macs2broad","macs2broadATAC","macs2broadIgG","sicerATAC","sicerIgG","sicertreat","SEACRstr","SEACRrel","MUSIC","RSEG","RSEGdz","GoPeaks")
#method <- c("macs2broadATAC","macs2broadIgG","SEACRstrATAC","SEACRstrIgG","SEACRrelATAC","SEACRrelIgG","MUSIC","RSEG","RSEGdz","GoPeaks")
#method <- c("macs2broadATAC","macs2broadIgG","SEACRstrATAC","SEACRstrIgG","SEACRrelATAC","SEACRrelIgG")
method <- c("macs2broadATAC","SEACRstrATAC","SEACRrelATAC")
len_method <-length(method)

#palette<- c("red","red3","darkred","navy","blue","steelblue1","green4","greenyellow","darkseagreen1","yellow","gold","goldenrod3","purple","pink","hotpink","snow4")
options(scipen = 1)
a<- c(seq(0.001,0.2,0.002),c(1e-7,1e-6,1e-5,1e-4, 0.0225, 0.0275), seq(0.05,1,0.05))
b<- c(seq(0.001,0.3,0.003),c(1e-7,1e-6,1e-5,1e-4,0.05, 0.15, 0.2, 0.325, 0.375, 0.425, 0.475),seq(0.3,1,0.05))
bb<- c(seq(0.013,0.3,0.003),c(1e-100,1e-50,1e-20,1e-9,1e-7,1e-6,1e-5,1e-4,0.05, 0.15, 0.2, 0.325, 0.375, 0.425, 0.475),seq(0.3,1,0.05))
c<- c(seq(0.001,0.049,0.0005),c(1e-7,1e-6,1e-5,1e-4,0.055, 0.06, 0.065,0.07,0.075) , seq(0.05,1,0.05))
cc<-c(c(1e-100,1e-50,1e-20,1e-11,1e-9,1e-7,1e-6,1e-5,1e-4,0.055, 0.06, 0.065,0.07,0.075),seq(0.0035,0.049,0.0005),seq(0.05,1,0.05))
ccc <- c(c(1e-67,1e-50,1e-20,1e-11,1e-9,1e-7,1e-6,1e-5,1e-4,0.055, 0.06, 0.065,0.07,0.075),seq(0.0035,0.049,0.0005),seq(0.05,1,0.05))
d<- c(seq(0.001,0.049,0.0005),c(1e-5,5e-5,1e-4,5e-4,0.055, 0.06, 0.065,0.07,0.075) , seq(0.05,1,0.05))
e<- c(seq(50,550,50),seq(575,1520,25),seq(1550,4599,50),c(1,10,25,4800,100000),seq(5000,10000,500))
f<- rep("df",126) 

a1<- a[order(a)]
b1<- b[order(b)]
bb1<-bb[order(bb)]
c1<- c[order(c)]
cc1<-cc[order(cc)]
ccc1<-ccc[order(ccc)]
d1<- d[order(d)]
e1<- e[order(e)]
#cutoffs<- cbind(a1,a1,a1,bb1,bb1,e1,d1,f,f,c1,f,f,c1,b1,b1,c1)
#cutoffs<- cbind(a1,a1,a1,bb1,bb1,e1,d1,f,f,ccc1,f,f,cc1,b1,b1,cc1)

#len_cutoff<-length(cutoffs[,1])
#print(cutoffs)
#x<-seq(1,126,1)

final_ROC<- c()
final_PRC<- c()
final_mean <- c()
score_ROC<- c()
score_PRC<- c()

for (i in (1:len_CUTTag)){
  #if(i == 8){
  #  truedata <- read.table("/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/sicer/overlap/K562_H3K27ac/H3K27ac_strict_true_prom200_sorted.bed")
  #  true_total <- sum(truedata[,3]-truedata[,2])
  #  falsedata <- read.table("/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/sicer/overlap/K562_H3K27ac/H3K27ac_strict_false_prom200_sorted.bed")
  #  false_total <- sum(falsedata[,3]-falsedata[,2])}
  #else{
  #  truedata <- read.table("/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/sicer/overlap/strict_true/strong_true200_sorted_length.bed",row.names=4)
  #  true_total <- sum(truedata[,5])
  #  falsedata <- read.table("/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/sicer/overlap/strict_false/merge_false200_sorted_length.bed",row.names=4)
  #  false_total <- sum(falsedata[,4])}

  auc <- read.table(paste0(path2,CUTTags[i],"_auc.txt"))
  auc <- auc[c(2,8,11),]
  
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
write.table(score_ROC,file=paste0(path2,"auROCscore_ctrl_ATAC.txt"),row.names=T,col.names=T,sep="\t",quote=F)
write.table(score_PRC,file=paste0(path2,"auPRCscore_ctrl_ATAC.txt"),row.names=T,col.names=T,sep="\t",quote=F)
write.table(final_ROC,file=paste0(path2,"auROCrank_ctrl_ATAC.txt"),row.names=T,col.names=T,sep="\t",quote=F)
write.table(final_PRC,file=paste0(path2,"auPRCrank_ctrl_ATAC.txt"),row.names=T,col.names=T,sep="\t",quote=F)
write.table(final_mean,file=paste0(path2,"AUCmeanrank_ctrl_ATAC.txt"),row.names=T,col.names=T,sep="\t",quote=F)


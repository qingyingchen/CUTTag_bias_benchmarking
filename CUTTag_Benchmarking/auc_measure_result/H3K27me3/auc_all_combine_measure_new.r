library(RColorBrewer)

path1 <- "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/overlap_tmpfiles/cutoff_all/"
path2<- "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/ROC_PRC/cutoff_all/measures/"
path3<- "/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/ROC_PRC/cutoff_all/ROCplot/"
path4<-"/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/rank_results/ROC_PRC/cutoff_all/ROCplot/MethodsCombine/"
truedata <- read.table("/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/sicer/overlap/strict_true/strong_true200_sorted_length.bed",row.names=4)
true_total <- sum(truedata[,5])
falsedata <- read.table("/project/zanglab_project/jkx9nz/project/cut/FACTOR/HUMAN/combineReads/sicer/overlap/strict_false/merge_false200_sorted_length.bed",row.names=4)
false_total <- sum(falsedata[,4])
CUTTags = c("GSM3536507","GSM3536508","GSM3536509","GSM3536510","GSM3536511","GSM3536512","GSM3536513",
            "GSM3536515","GSM3560261","GSM3680215","GSM3680216","GSM3680217","GSM3680218","GSM3680219",
            "GSM3680220","GSM3680221","GSM3680222")
len_CUTTag <-length(CUTTags)
method <- c("macs2broad","macs2broadATAC","macs2broadIgG","sicerATAC","sicerIgG","sicertreat","SEACRstr","SEACRstrATAC","SEACRstrIgG","SEACRrel","SEACRrelATAC","SEACRrelIgG","MUSIC","MUSICATAC","MUSICIgG","GoPeaks","GoPeaksATAC","GoPeaksIgG","RSEG","RSEGATAC","RSEGIgG","RSEGdz","RSEGdzATAC","RSEGdzIgG")
len_method <-length(method)

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
cutoffs<- cbind(a1,a1,a1,bb1,bb1,e1,d1,f,f,ccc1,f,f,cc1,cc1,cc1,cc1,cc1,cc1,b1,b1,b1,b1,b1,b1)
len_cutoff<-length(cutoffs[,1])



final_ROC<- c()
final_PRC<- c()
final_mean <- c()
score_ROC<- c()
score_PRC<- c()

for (i in (1:len_CUTTag)){

  auc <- data.frame(matrix(nrow=len_method,ncol=6))
  rownames(auc) <- method
  colnames(auc) <- c("auROC_01","auROC_05","auROC","auPRC_01","auPRC_05","auPRC")
  for (j in (1:len_method)){
    len_cutoff<-length(cutoffs[,j])
    outdata <- data.frame(matrix(nrow=len_cutoff,ncol=4))
    if (j %in% c(8,9,11,12)){
      rownames(outdata)<- NULL}
    else{
    rownames(outdata) <- cutoffs[,j]}
    colnames(outdata) <- c("TP", "FP", "FN","TN")
    for(k in (1:len_cutoff)){
      if (file.info(paste0(path1,CUTTags[i],"/",CUTTags[i],"_cut",cutoffs[k,j],"_",method[j],"_TP.bed"))$size==0){
        TP<-0}
      else{
        TP_file <- read.table(paste0(path1,CUTTags[i],"/",CUTTags[i],"_cut",cutoffs[k,j],"_",method[j],"_TP.bed"),row.names=4)
        TP <- sum(TP_file[,4])}

      if (file.info(paste0(path1,CUTTags[i],"/",CUTTags[i],"_cut",cutoffs[k,j],"_",method[j],"_FP.bed"))$size==0){
        FP<-0}
      else{
        FP_file <- read.table(paste0(path1,CUTTags[i],"/",CUTTags[i],"_cut",cutoffs[k,j],"_",method[j],"_FP.bed"),row.names=4)
        FP <- sum(FP_file[,4])}
      FN <- true_total - TP
      TN <- false_total - FP
      outdata[k,] <- c(TP,FP,FN,TN)
    }
    outdata$TPR<- outdata$TP/(outdata$TP+outdata$FN)
    outdata$FPR<- outdata$FP/(outdata$FP+outdata$TN)
    outdata$prec<- outdata$TP/(outdata$TP+outdata$FP)
    outdata$prec[is.na(outdata$prec)] <- 1
    write.table(outdata,paste0(path2,CUTTags[i],"_",method[j],"_measures.txt"),row.names = T, col.names = T,  sep=" ",quote=F)
    ROC<- outdata[,c(6,5)]
    ROC[len_cutoff+1,]<-c(0,0)
    ROC[len_cutoff+2,]<-c(1,1)
    ROC<- ROC[order(ROC[,1]),]
    auROC_1<-pracma::trapz(ROC$FPR,ROC$TPR)

    idx11<- which.max(ROC$FPR[ROC$FPR <= 0.1])
    idx1 <- tail(which(ROC$FPR ==ROC$FPR[idx11]), n = 1)
    idx2 <- min(which(ROC == min(ROC$FPR[ROC$FPR > 0.1])))
    if (ROC$TPR[idx2]>ROC$TPR[idx1]){
      newrow1 <-c(0.1,(ROC$TPR[idx2]-ROC$TPR[idx1])/(ROC$FPR[idx2]-ROC$FPR[idx1])*(0.1-ROC$FPR[idx1])+ROC$TPR[idx1])
    }
    else{
      newrow1 <-c(0.1,(ROC$TPR[idx1]-ROC$TPR[idx2])/(ROC$FPR[idx2]-ROC$FPR[idx1])*(ROC$FPR[idx2]-0.1)+ROC$TPR[idx2])
    }
    idx31<- which.max(ROC$FPR[ROC$FPR <= 0.5])
    idx3 <- tail(which(ROC$FPR ==ROC$FPR[idx31]), n = 1)
    idx4 <- min(which(ROC == min(ROC$FPR[ROC$FPR > 0.5])))
    if (ROC$TPR[idx4]>ROC$TPR[idx3]){
      newrow2 <-c(0.5,(ROC$TPR[idx4]-ROC$TPR[idx3])/(ROC$FPR[idx4]-ROC$FPR[idx3])*(0.5-ROC$FPR[idx3])+ROC$TPR[idx3])
    }
    else{
      newrow2 <-c(0.5,(ROC$TPR[idx3]-ROC$TPR[idx4])/(ROC$FPR[idx4]-ROC$FPR[idx3])*(ROC$FPR[idx4]-0.5)+ROC$TPR[idx4])}
    ROC<-rbind(ROC,newrow1,newrow2)
    ROC<- ROC[order(ROC[,1]),]
    idx_ROC_01 <- which(ROC$FPR == 0.1)
    auROC_01<-pracma::trapz(ROC$FPR[1:idx_ROC_01],ROC$TPR[1:idx_ROC_01])
    idx_ROC_05 <- which(ROC$FPR == 0.5)
    auROC_05<-pracma::trapz(ROC$FPR[1:idx_ROC_05],ROC$TPR[1:idx_ROC_05])
    
    PRC<- outdata[,c(5,7)]
    PRC[len_cutoff+1,]<-c(0,1)
    PRC[len_cutoff+2,]<-c(1,true_total/(true_total+false_total))
    PRC<- PRC[order(PRC[,1]),]
    auPRC_1<-pracma::trapz(PRC$TPR,PRC$prec)
    
    idx51<- which.max(PRC$TPR[PRC$TPR <= 0.1])
    idx5 <- tail(which(PRC$TPR ==PRC$TPR[idx51]), n = 1)
    idx6 <- min(which(PRC == min(PRC$TPR[PRC$TPR > 0.1])))
    if (PRC$prec[idx6]>PRC$prec[idx5]){
      newrow3 <-c(0.1,(PRC$prec[idx6]-PRC$prec[idx5])/(PRC$TPR[idx6]-PRC$TPR[idx5])*(0.1-PRC$TPR[idx5])+PRC$prec[idx5])
    }
    else{
      newrow3 <-c(0.1,(PRC$prec[idx5]-PRC$prec[idx6])/(PRC$TPR[idx6]-PRC$TPR[idx5])*(PRC$TPR[idx6]-0.1)+PRC$prec[idx6])
    }
    idx71<- which.max(PRC$TPR[PRC$TPR <= 0.5])
    idx7 <- tail(which(PRC$TPR ==PRC$TPR[idx71]), n = 1)
    idx8 <- min(which(PRC == min(PRC$TPR[PRC$TPR > 0.5])))
    if (PRC$prec[idx8]>PRC$prec[idx7]){
      newrow4 <-c(0.5,(PRC$prec[idx8]-PRC$prec[idx7])/(PRC$TPR[idx8]-PRC$TPR[idx7])*(0.5-PRC$TPR[idx7])+PRC$prec[idx7])
    }
    else{
      newrow4 <-c(0.5,(PRC$prec[idx7]-PRC$prec[idx8])/(PRC$TPR[idx8]-PRC$TPR[idx7])*(PRC$TPR[idx8]-0.5)+PRC$prec[idx8])}
    PRC<-rbind(PRC,newrow3,newrow4)
    PRC<- PRC[order(PRC[,1]),]
    idx_PRC_01 <- which(PRC$TPR == 0.1)
    auPRC_01<-pracma::trapz(PRC$TPR[1:idx_PRC_01],PRC$prec[1:idx_PRC_01])
    idx_PRC_05 <- which(PRC$TPR == 0.5)
    auPRC_05<-pracma::trapz(PRC$TPR[1:idx_PRC_05],PRC$prec[1:idx_PRC_05])
        
    
    auc[j,]<- c( auROC_01, auROC_05, auROC_1, auPRC_01,auPRC_05,auPRC_1)
    write.table(auc,paste0(path2,CUTTags[i],"_auc.txt"),row.names = T, col.names = T,  sep=" ",quote=F)
    }
  score_ROC <-cbind(score_ROC,auc[,3])
  score_PRC <-cbind(score_PRC,auc[,6])
  normRank <- apply(auc,2,rank)/len_method
  rank_mean <- apply(normRank,1,mean)
  final_mean <- cbind(final_mean,rank_mean)
  final_ROC<-cbind(final_ROC,normRank[,3])
  final_PRC<-cbind(final_PRC,normRank[,6])
  }

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
write.table(score_ROC,file=paste0(path2,"auROCscore_all.txt"),row.names=T,col.names=T,sep="\t",quote=F)
write.table(score_PRC,file=paste0(path2,"auPRCscore_all.txt"),row.names=T,col.names=T,sep="\t",quote=F)
write.table(final_ROC,file=paste0(path2,"auROCrank_all.txt"),row.names=T,col.names=T,sep="\t",quote=F)
write.table(final_PRC,file=paste0(path2,"auPRCrank_all.txt"),row.names=T,col.names=T,sep="\t",quote=F)
write.table(final_mean,file=paste0(path2,"AUCmeanrank_all.txt"),row.names=T,col.names=T,sep="\t",quote=F)


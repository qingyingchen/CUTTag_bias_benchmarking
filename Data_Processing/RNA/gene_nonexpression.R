library(dplyr)

K562_RNA1_rep1<-read.table("/Users/jkx9nz/Dropbox/CUTTagResults/result/TSS_bias/RNA/K562_RNA1_rep1_exp.txt",
                           header= T,sep= "\t")#,row.names = 1)
K562_RNA1_rep1<-K562_RNA1_rep1[order(K562_RNA1_rep1$FPKM,decreasing = T),]
K562_RNA1_rep1_uniq<-K562_RNA1_rep1[!duplicated(K562_RNA1_rep1$Gene.ID),]
row.names(K562_RNA1_rep1_uniq)<-K562_RNA1_rep1_uniq$Gene.ID
idx<-rownames(K562_RNA1_rep1_uniq)

K562_RNA1_rep2<-read.table("/Users/jkx9nz/Dropbox/CUTTagResults/result/TSS_bias/RNA/K562_RNA1_rep2_exp.txt",
                           header= T,sep= "\t")#,row.names = 1)
K562_RNA1_rep2<-K562_RNA1_rep2[order(K562_RNA1_rep2$FPKM,decreasing = T),]
K562_RNA1_rep2_uniq<-K562_RNA1_rep2[!duplicated(K562_RNA1_rep2$Gene.ID),]
row.names(K562_RNA1_rep2_uniq)<-K562_RNA1_rep2_uniq$Gene.ID
K562_RNA1_rep2_uniq<-K562_RNA1_rep2_uniq[idx,]


K562_RNA2_rep1<-read.table("/Users/jkx9nz/Dropbox/CUTTagResults/result/TSS_bias/RNA/K562_RNA2_rep1_exp.txt",
                           header= T,sep= "\t")#,row.names = 1)
K562_RNA2_rep1<-K562_RNA2_rep1[order(K562_RNA2_rep1$FPKM,decreasing = T),]
K562_RNA2_rep1_uniq<-K562_RNA2_rep1[!duplicated(K562_RNA2_rep1$Gene.ID),]
row.names(K562_RNA2_rep1_uniq)<-K562_RNA2_rep1_uniq$Gene.ID
K562_RNA2_rep1_uniq<-K562_RNA2_rep1_uniq[idx,]

K562_RNA2_rep2<-read.table("/Users/jkx9nz/Dropbox/CUTTagResults/result/TSS_bias/RNA/K562_RNA2_rep2_exp.txt",
                           header= T,sep= "\t")#,row.names = 1)
K562_RNA2_rep2<-K562_RNA2_rep2[order(K562_RNA2_rep2$FPKM,decreasing = T),]
K562_RNA2_rep2_uniq<-K562_RNA2_rep2[!duplicated(K562_RNA2_rep2$Gene.ID),]
row.names(K562_RNA2_rep2_uniq)<-K562_RNA2_rep2_uniq$Gene.ID
K562_RNA2_rep2_uniq<-K562_RNA2_rep2_uniq[idx,]

K562_RNA2_rep3<-read.table("/Users/jkx9nz/Dropbox/CUTTagResults/result/TSS_bias/RNA/K562_RNA2_rep3_exp.txt",
                           header= T,sep= "\t")#,row.names = 1)
K562_RNA2_rep3<-K562_RNA2_rep3[order(K562_RNA2_rep3$FPKM,decreasing = T),]
K562_RNA2_rep3_uniq<-K562_RNA2_rep3[!duplicated(K562_RNA2_rep3$Gene.ID),]
row.names(K562_RNA2_rep3_uniq)<-K562_RNA2_rep3_uniq$Gene.ID
K562_RNA2_rep3_uniq<-K562_RNA2_rep3_uniq[idx,]

# head(K562_RNA2_rep3_uniq)
# head(K562_RNA1_rep1_uniq)

K562_RNA<- as.data.frame(matrix(0,nrow=26586,ncol=13))
rownames(K562_RNA)<- idx
K562_RNA[,1:7]<-K562_RNA1_rep1_uniq[,1:7]
K562_RNA[,8]<-K562_RNA1_rep1_uniq[,9]
K562_RNA[,9]<-K562_RNA1_rep1_uniq[,8]
K562_RNA[,10]<-K562_RNA1_rep2_uniq[,8]
K562_RNA[,11]<-K562_RNA2_rep1_uniq[,8]
K562_RNA[,12]<-K562_RNA2_rep2_uniq[,8]
K562_RNA[,13]<-K562_RNA2_rep3_uniq[,8]
colnames(K562_RNA)<- c("Gene.ID","Gene.Name","Reference","Strand","Start","End","Coverage",
                       "TPM","FPKM_RNA1_rep1","FPKM_RNA1_rep2","FPKM_RNA2_rep1",
                       "FPKM_RNA2_rep2","FPKM_RNA2_rep3")
K562_RNA$average <- apply(K562_RNA[,9:13], 1, mean)
K562_RNA_output <- K562_RNA[,c(3,5,6,1,7,4,9,10,11,12,13,14)]
write.table(K562_RNA_output,file = "/Users/jkx9nz/Dropbox/CUTTagResults/result/TSS_bias/RNA/K562_RNA.bed",
            row.names=F,col.names=F,sep="\t",quote=F)

# K562_RNA_filtered <- filter(K562_RNA,FPKM_RNA1_rep1>1&FPKM_RNA1_rep2>1&FPKM_RNA2_rep1>1&
#                               FPKM_RNA2_rep2>1&FPKM_RNA2_rep3>1)

K562_RNA_log <-transform(K562_RNA,FPKM_RNA1_rep1=log2(FPKM_RNA1_rep1+1),
                                  FPKM_RNA1_rep2=log2(FPKM_RNA1_rep2+1),FPKM_RNA2_rep1=log2(FPKM_RNA2_rep1+1),
                                  FPKM_RNA2_rep2=log2(FPKM_RNA2_rep2+1),FPKM_RNA2_rep3=log2(FPKM_RNA2_rep3+1))

# K562_RNA_log$FPKM_RNA1_rep1 <- scale(K562_RNA_log$FPKM_RNA1_rep1)
# K562_RNA_log$FPKM_RNA1_rep2 <- scale(K562_RNA_log$FPKM_RNA1_rep2)
# K562_RNA_log$FPKM_RNA2_rep1 <- scale(K562_RNA_log$FPKM_RNA2_rep1)
# K562_RNA_log$FPKM_RNA2_rep2 <- scale(K562_RNA_log$FPKM_RNA2_rep2)
# K562_RNA_log$FPKM_RNA2_rep3 <- scale(K562_RNA_log$FPKM_RNA2_rep3)
K562_RNA_log$average <- apply(K562_RNA_log[,9:13], 1, mean)
K562_RNA_log_fil <- filter(K562_RNA_log, average ==0)
K562_RNA_log_fil_output <- K562_RNA_log_fil[,c(3,5,6,1,7,4,9,10,11,12,13,14)]
write.table(K562_RNA_log_fil_output,file = "/Users/jkx9nz/Dropbox/CUTTagResults/result/TSS_bias/RNA/K562_RNA_none.bed",
            row.names=F,col.names=F,sep="\t",quote=F)

# K562_RNA_log_sort<-K562_RNA_log[order(K562_RNA_log$average,decreasing=F),]
# K562_RNA_bot_5K<- K562_RNA_log_sort[1:5000,c(3,5,6,1,7,4,9,10,11,12,13,14)]
# # K562_RNA_2K<- K562_RNA_filtered_log_sort[1:2000,c(3,5,6,1,7,4,9,10,11,12,13,14)]
# # K562_RNA_1K<- K562_RNA_filtered_log_sort[1:1000,c(3,5,6,1,7,4,9,10,11,12,13,14)]
# 
# write.table(K562_RNA_5K,file = "/Users/jkx9nz/Dropbox/CUTTagResults/result/TSS_bias/RNA/K562_RNA_5K.bed",
#             row.names=F,col.names=F,sep="\t",quote=F)
# write.table(K562_RNA_2K,file = "/Users/jkx9nz/Dropbox/CUTTagResults/result/TSS_bias/RNA/K562_RNA_2K.bed",
#             row.names=F,col.names=F,sep="\t",quote=F)
# write.table(K562_RNA_1K,file = "/Users/jkx9nz/Dropbox/CUTTagResults/result/TSS_bias/RNA/K562_RNA_1K.bed",
#             row.names=F,col.names=F,sep="\t",quote=F)

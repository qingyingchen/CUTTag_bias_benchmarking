cat K562_RNA_8K.bed | awk 'BEGIN {OFS="\t";FS="\t"}{if ($6 ~/+/) print $1,$2-1000,$3,$4,$5,$6;else print $1,$2,$3+1000,$4,$5,$6}'> K562_RNA_8K_extend.bed
cat K562_RNA_none.bed| awk 'BEGIN {OFS="\t";FS="\t"}{if ($6 ~/+/) print $1,$2-1000,$2+1000,$4,$5,$6;else print $1,$3-1000,$3+1000,$4,$5,$6}'> K562_RNA_none_promoter1kb.bed 
cat K562_RNA_none.bed| awk 'BEGIN {OFS="\t";FS="\t"}{if ($6 ~/+/) print $1,$2-1000,$3,$4,$5,$6;else print $1,$2,$3+1000,$4,$5,$6}'> K562_RNA_none_extend.bed
cat K562_RNA_8K.bed | awk 'BEGIN {OFS="\t";FS="\t"}{if ($6 ~/+/) print $1,$2-1000,$2+1000,$4,$5,$6;else print $1,$3-1000,$3+1000,$4,$5,$6}'> K562_RNA_8K_promoter1kb.bed

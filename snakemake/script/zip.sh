ARRAY=(fastqc bam_qc DESeq2 DEXSeq `ls -d  rMAT*` GATK_ASEReadCounter )
for D in "${ARRAY[@]}"
do
rm -f $D/$D.zip && [ -d $D ] && zip -rq  $D/$D.zip $D/ 
done

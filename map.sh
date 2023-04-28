# Map reads to reference and sort using BWA v.0.7.17 and samtools v1.6:
#Paired reads
ml BWA/0.7.17-GCC-8.3.0
ml SAMtools/1.6-foss-2019b
bwa mem [ref.fa] [sample]_1.fastq.gz [sample]_2.fastq.gz | samtools view -b - | samtools sort -o [sample].sorted.bam

#Single reads
bwa mem [ref.fa] [sample]_1.fastq.gz | samtools view -b - | samtools sort -o [sample].sorted.bam


#Index reference
bwa index Af293ASM265v1.mfa


#Generate a consensus of the Illumina reads using samtools v.1.6 and bcftools v.1.6:
ml BCFtools/1.6-foss-2019b
ml seqtk/1.2-foss-2019b
samtools mpileup -I -d 100000 -uf [ref].mfa -I [sample].sorted.bam | bcftools call -c --ploidy 1 | bgzip -c > [sample].vcf.gz
gunzip -c [sample].vcf.gz | vcfutils.pl vcf2fq - | seqtk seq -q 40 -A > /scratch/bnc45581/19_20CDC/fasta/[sample].fa

ml Anaconda3/5.0.1
source activate /home/bnc45581/.conda/envs/my_root/
conda install -c bioconda ragtag


# scaffold a query assembly
#USAGE: ragtag.py scaffold ref.fasta query.fasta

ragtag.py scaffold Af293ASM265v1.fa GCF_000149645.3_ASM14964v4_genomic.fna

sed 's/\<1_RagTag\>/1/g;
s/\<2_RagTag\>/2/g;
s/\<3_RagTag\>/3/g;
s/\<4_RagTag\>/4/g;
s/\<5_RagTag\>/5/g;
s/\<6_RagTag\>/6/g;
s/\<7_RagTag\>/7/g;
s/\<8_RagTag\>/8/g' Afischeri.fa > Afischeri2.fa

mv Afischeri2.fa Afischeri.fa

#remove extra scaffolds in Afischeri.fa

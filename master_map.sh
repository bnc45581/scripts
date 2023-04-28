##For loop to make mapping faster
#Map paired reads to reference
#!/bin/bash
#SBATCH --job-name=master-fastq-to-vcf
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH --time=1:00:00
#SBATCH --export=NONE
#SBATCH --output=/scratch/bnc45581/19_20CDC/output/%x_%j.out
#SBATCH --error=/scratch/bnc45581/19_20CDC/error/%x_%j.err
#SBATCH --mail-user=bnc45581@uga.edu
#SBATCH --mail-type=END,FAIL

cd /scratch/bnc45581/19_20CDC

for file in *_1.fastq.gz
do
        echo '#!/bin/bash' > scripts/${strain}_map.sh
        echo "#SBATCH --job-name=${strain}_fastq-to-vcf" >> scripts/${strain}_map.sh
        echo "#SBATCH --partition=batch" >> scripts/${strain}_map.sh
        echo "#SBATCH --ntasks=1" >> scripts/${strain}_map.sh
        echo "#SBATCH --nodes=1" >> scripts/${strain}_map.sh
        echo "#SBATCH --mem=8G" >> scripts/${strain}_map.sh
        echo "#SBATCH --time=24:00:00" >> scripts/${strain}_map.sh
        echo "#SBATCH --mail-type=END,FAIL" >> scripts/${strain}_map.sh
        echo "#SBATCH --mail-user=bnc45581@uga.edu" >> scripts/${strain}_map.sh
        echo "#SBATCH --output=/scratch/bnc45581/19_20CDC/output/%x_%j.out" >> scripts/${strain}_map.sh
        echo "#SBATCH --error=/scratch/bnc45581/19_20CDC/error/%x_%j.err" >> scripts/${strain}_map.sh
        echo " " >> scripts/${strain}_map.sh
        echo "cd /scratch/bnc45581/19_20CDC" >> scripts/${strain}_map.sh
        echo " " >> scripts/${strain}_map.sh
        echo "module load BWA/0.7.17-GCC-8.3.0" >> scripts/${strain}_map.sh
        echo "module load SAMtools/1.6-foss-2019b" >> scripts/${strain}_map.sh
        echo " " >> scripts/${strain}_map.sh
        echo "bwa mem /scratch/bnc45581/19_20CDC/Af293ASM265v1.mfa ${strain}_1.fastq.gz ${strain}_2.fastq.gz | samtools view -b - | samtools sort -o /scratch/bnc45581/19_20CDC/bam/${strain}.sorted.bam" >> scripts/${strain}_map.sh
        echo " " >> scripts/${strain}_map.sh
        echo "module load BCFtools/1.6-foss-2019b" >> scripts/${strain}_map.sh
        echo "module load seqtk/1.2-foss-2019b" >> scripts/${strain}_map.sh
        echo "samtools mpileup -I -d 100000 -uf /scratch/bnc45581/19_20CDC/Af293ASM265v1.mfa /scratch/bnc45581/19_20CDC/bam/${strain}.sorted.bam | bcftools call -c --ploidy 1 | bgzip -c > /scratch/bnc45581/19_20CDC/vcf/${strain}.vcf.gz"  >> scripts/${strain}_map.sh
        echo "bcftools index /scratch/bnc45581/19_20CDC/vcf/${strain}.vcf.gz"  >> scripts/${strain}_map.sh
        echo "cd /scratch/bnc45581/19_20CDC/vcf" >> scripts/${strain}_map.sh
        echo "gunzip -c ${strain}.vcf.gz | vcfutils.pl vcf2fq - | seqtk seq -q 40 -A > /scratch/bnc45581/19_20CDC/fasta/${strain}.fa" >> scripts/${strain}_map.sh
        chmod 755 scripts/${strain}_map.sh
        sbatch scripts/${strain}_map.sh
done
```


#Map single reads to reference
#!/bin/bash
#SBATCH --job-name=master-fastq-to-vcf
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH --time=1:00:00
#SBATCH --export=NONE
#SBATCH --output=/scratch/bnc45581/GAPIT/CDC_WGS_fastq.dir/SE/output/%x_%j.out
#SBATCH --error=/scratch/bnc45581/GAPIT/CDC_WGS_fastq.dir/SE/error/%x_%j.err
#SBATCH --mail-user=bnc45581@uga.edu
#SBATCH --mail-type=END,FAIL

cd /scratch/bnc45581/GAPIT/CDC_WGS_fastq.dir/SE

for file in *.fastq.gz
do
        strain=${file%%.fastq.gz}

        echo "#!/bin/bash" > scripts/${strain}_map.sh
        echo "#SBATCH --job-name=${strain}_fastq-to-vcf" >> scripts/${strain}_map.sh
        echo "#SBATCH --partition=batch" >> scripts/${strain}_map.sh
	      echo "#SBATCH --ntasks=1" >> scripts/${strain}_map.sh
	      echo "#SBATCH --nodes=1" >> scripts/${strain}_map.sh
        echo "#SBATCH --mem=8G" >> scripts/${strain}_map.sh
        echo "#SBATCH --time=24:00:00" >> scripts/${strain}_map.sh
        echo "#SBATCH --output=/scratch/bnc45581/GAPIT/CDC_WGS_fastq.dir/SE/output/%x_%j.out" >> scripts/${strain}_map.sh
        echo "#SBATCH --error=/scratch/bnc45581/GAPIT/CDC_WGS_fastq.dir/SE/error/%x_%j.err" >> scripts/${strain}_map.sh
        echo "#SBATCH --mail-type=END,FAIL" >> scripts/${strain}_map.sh
	      echo "#SBATCH --mail-user=bnc45581@uga.edu" >> scripts/${strain}_map.sh
	      echo " " >> scripts/${strain}_map.sh
        echo "cd /scratch/bnc45581/GAPIT/CDC_WGS_fastq.dir/SE" >> scripts/${strain}_map.sh
        echo " " >> scripts/${strain}_map.sh
	      echo "module load BWA/0.7.17-GCC-8.3.0" >> scripts/${strain}_map.sh
        echo "module load SAMtools/1.6-foss-2019b" >> scripts/${strain}_map.sh
        echo " " >> scripts/${strain}_map.sh
        echo "bwa mem /scratch/bnc45581/GAPIT/CDC_WGS_fastq.dir/Af293Ref/Af293ASM265v1.mfa ${strain}.fastq.gz | samtools view -b - | samtools sort -o ../bam/${strain}.sorted.bam" >> scripts/${strain}_map.sh
        echo " " >> scripts/${strain}_map.sh
        echo "module load BCFtools/1.6-foss-2019b" >> scripts/${strain}_map.sh
        echo " " >> scripts/${strain}_map.sh
        echo "module load seqtk/1.2-foss-2019b" >> scripts/${strain}_map.sh
        echo "samtools mpileup -I -d 100000 -uf /scratch/bnc45581/GAPIT/CDC_WGS_fastq.dir/Af293Ref/Af293ASM265v1.mfa ../bam/${strain}.sorted.bam | bcftools call -c --ploidy 1 | bgzip -c > ../vcf/${strain}.vcf.gz"  >> scripts/${strain}_map.sh
        echo "gunzip -c $file | vcfutils.pl vcf2fq - | seqtk seq -q 40 -A > fasta/${strain}.fa" >> scripts/${strain}_vcf2fa.sh
        echo "bcftools index ../vcf/${strain}.vcf.gz"  >> scripts/${strain}_map.sh
        chmod 755 scripts/${strain}_map.sh
        sbatch scripts/${strain}_map.sh
done



#Obtain reference and rename chromosomes using zcat:
zcat https://ftp.ncbi.nlm.nih.gov/genomes/refseq/fungi/Aspergillus_fumigatus/latest_assembly_versions/GCF_000002655.1_ASM265v1/GCF_000002655.1_ASM265v1_genomic.fna.gz | sed 's/>\(.*\)chromosome \(.\)/>Af293_chr\2 \1/g' > Af293ASM265v1.mfa
#Note: You may need to alter the sed command to whatever you want the chromosomes to be named. This was adapted from Douda's script.
#Make sure the chromosome names are changed to only numbers!


#To look at chromosome names
grep ">" Af293ASM265v1.mfa


#To change chromosome names
#Original chromosome names go where numerical #s are
#New chromosome names go where roman numerals are
sed 's/\<1\>/I/g;
s/\<2\>/II/g;
s/\<3\>/III/g;
s/\<4\>/IV/g;
s/\<5\>/V/g;
s/\<6\>/VI/g;
s/\<7\>/VII/g;
s/\<8\>/VIII/g' Af293ASM265v1.mfa > Af293ASM265v1_new.mfa
mv Af293ASM265v1_new.mfa Af293ASM265v1.mfa


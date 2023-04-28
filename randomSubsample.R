install.packages("remotes")
remotes::install_github("GuillemSalazar/FastaUtils")

library(FastaUtils)

fasta.sample(infile = "withCladeA_wNidulansFischeri.fa", nseq = 480, file.out = "randomSubsample.fa", replacement = FALSE)

#!/bin/bash
#SBATCH --job-name=RunRandomSample
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --mem=150G
#SBATCH --time=48:00:00
#SBATCH --output=/scratch/bnc45581/azole/output/%x_%j.out
#SBATCH --error=/scratch/bnc45581/azole/error/%x_%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=bnc45581@uga.edu

cd /scratch/bnc45581/azole/fasta/withCladeA

module load R/4.0.0-foss-2019b
R CMD BATCH randomSubsample.R

#!/bin/bash
#SBATCH --partition day
#SBATCH --job-name convert
#SBATCH --time 1:00:00
#SBATCH --mem 15GB
#SBATCH --output logs/convert_%j.log

eval "$(conda shell.bash hook)"
export PATH="/project/hep/demers/mnp3/miniconda3/bin:$PATH"
conda activate birds
source mp3-to-wav.sh sparrow


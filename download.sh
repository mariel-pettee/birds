#!/bin/bash
#SBATCH --partition day
#SBATCH --job-name download
#SBATCH --time 3:00:00
#SBATCH --mem 15GB
#SBATCH --output logs/download_%j.log

eval "$(conda shell.bash hook)"
export PATH="/project/hep/demers/mnp3/miniconda3/bin:$PATH"
conda activate birds
python -u xcdl.py Zonotrichia albicollis

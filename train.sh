#!/bin/bash
#SBATCH --partition gpu
#SBATCH --job-name train
#SBATCH --time 1-00:00:00
#SBATCH --mem 15GB
#SBATCH --output logs/train_%j.log

eval "$(conda shell.bash hook)"
export PATH="/project/hep/demers/mnp3/miniconda3/bin:$PATH"
conda activate birds
cd tensorflow-wavenet
python -u train.py --data_dir=../data/xeno-canto-dataset/carolinachickadee/wav/

#!/bin/bash
#SBATCH --partition gpu
#SBATCH --job-name t_za_03
#SBATCH --time 1-00:00:00
#SBATCH --mem 35GB
#SBATCH --output logs/train_03_%j.log

eval "$(conda shell.bash hook)"
export PATH="/project/hep/demers/mnp3/miniconda3/bin:$PATH"
conda activate birds
cd tensorflow-wavenet

## Default training (specify logdir to pick up training where you left off)
python -u train.py --data_dir=../data/xeno-canto-dataset/Zonotrichiaalbicollis/wav/ --silence_threshold 0.3 --logdir ./logdir/train/za_thresh03

## Train with global conditioning (gc_channels = size of embedding vector)
# python -u train.py --data_dir=../data/xeno-canto-dataset/Zonotrichiaalbicollis/wav/ --silence_threshold 0.3 --logdir ./logdir/train/za_thresh03 --gc_channels=32

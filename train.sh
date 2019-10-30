#!/bin/bash
#SBATCH --partition gpu
#SBATCH --job-name all_01
#SBATCH --time 1-00:00:00
#SBATCH --mem 35GB
#SBATCH --output logs/train_all_01_%j.log

eval "$(conda shell.bash hook)"
export PATH="/project/hep/demers/mnp3/miniconda3/bin:$PATH"
conda activate birds
cd tensorflow-wavenet

## Default training (specify logdir to pick up training where you left off)
# python -u train.py --data_dir=../data/xeno-canto-dataset/all/wav/ --silence_threshold 0.01 --logdir ./logdir/train/za_thresh001

## Train with global conditioning (gc_channels = size of embedding vector)
python -u train.py --gc_channels=32 --data_dir=../data/xeno-canto-dataset/all/wav/ --silence_threshold 0.1 --learning_rate 1e-4 --logdir ./logdir/train/all_thresh01_lr0001
 
# Detected --gc_cardinality=916

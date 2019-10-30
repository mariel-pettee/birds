#!/bin/bash
#SBATCH --partition gpu
#SBATCH --job-name gen
#SBATCH --time 1:00:00
#SBATCH --mem 10GB
#SBATCH --output logs/gen_%j.log

eval "$(conda shell.bash hook)"
export PATH="/project/hep/demers/mnp3/miniconda3/bin:$PATH"
conda activate birds
cd tensorflow-wavenet

# 16,000 samples = 1 sec
# 80,000 samples = 5 sec

# Unconditional generation:
python -u generate.py --samples 80000 --wav_out_path=../generated_birdsong/all_epoch1750_thresh01_lr0001_id441.wav logdir/train/all_thresh01_lr0001/model.ckpt-1750 --gc_channels=32 --gc_cardinality=916 --gc_id=441



# For global condiditioning, add: 
# --gc_channels=32 --gc_cardinality=916 --gc_id=441

# For conditional generation on a training file, append this to the end:
#--wav_seed=../data/xeno-canto-dataset/Zonotrichiaalbicollis/wav/Zonotrichia83546.wav



#!/bin/bash
#SBATCH --partition gpu
#SBATCH --job-name gen01long
#SBATCH --time 1:00:00
#SBATCH --mem 10GB
#SBATCH --output logs/gen_01_long_%j.log

eval "$(conda shell.bash hook)"
export PATH="/project/hep/demers/mnp3/miniconda3/bin:$PATH"
conda activate birds
cd tensorflow-wavenet

# 16,000 samples = 1 sec
# 80,000 samples = 5 sec

# Unconditional generation:
python -u generate.py --samples 80000 --wav_out_path=../generated_birdsong/generated_za_epoch5600_thresh01_long.wav logdir/train/za_thresh01/model.ckpt-5600 


# For conditional generation on a training file, append this to the end:
#--wav_seed=../data/xeno-canto-dataset/Zonotrichiaalbicollis/wav/Zonotrichia83546.wav



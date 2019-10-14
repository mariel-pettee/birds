#!/bin/bash
#SBATCH --partition gpu
#SBATCH --job-name gen001
#SBATCH --time 30:00
#SBATCH --mem 15GB
#SBATCH --output logs/gen_001_%j.log

eval "$(conda shell.bash hook)"
export PATH="/project/hep/demers/mnp3/miniconda3/bin:$PATH"
conda activate birds
cd tensorflow-wavenet

# 16,000 samples = 1 sec
# 80,000 samples = 5 sec

# Unconditional generation:
# python -u generate.py --samples 80000 --wav_out_path=../generated_birdsong/generated_za_4.wav logdir/train/2019-10-10T18-44-59/model.ckpt-1100

python -u generate.py --samples 48000 --wav_out_path=../generated_birdsong/generated_za_thresh001.wav logdir/train/za_thresh001/model.ckpt-1500


# Conditional generation on a training file:
# python -u generate.py --samples 32000 --wav_out_path=../generated_birdsong/generated_chickadee_wav.wav logdir/train/2019-10-11T11-51-19/model.ckpt-300 --wav_seed=../data/xeno-canto-dataset/carolinachickadee/wav/Poecile52990.wav


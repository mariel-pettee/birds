#!/bin/bash
#SBATCH --partition gpu
#SBATCH --job-name gen
#SBATCH --time 30:00
#SBATCH --mem 15GB
#SBATCH --output logs/gen_%j.log

eval "$(conda shell.bash hook)"
export PATH="/project/hep/demers/mnp3/miniconda3/bin:$PATH"
conda activate birds
cd tensorflow-wavenet
python -u generate.py --samples 160000 --wav_out_path=../generated_birdsong/generated_za_1.wav logdir/train/2019-09-30T22-43-20/model.ckpt-98

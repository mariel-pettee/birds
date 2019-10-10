# birds
Generating birdsong with ML

## Workflow: 
1. `conda activate birds`
2. Download some .mp3s using https://github.com/karoliina/xeno-canto-download (specifically the code from the pull request updating to Python 3.7) — xcdl.py, i.e. xeno-canto download. 
- e.g. `python xcdl.py Zonotrichia albicollis`
3. Convert .mp3 -> .wav using `source mp3-to-wav.sh`
- Need to activate `./ffmpeg` (and have this binary in the directory)
4. Train on .wav files using tensorflow-wavenet (https://github.com/ibab/tensorflow-wavenet)
```
cd tensorflow-wavenet
python train.py --data_dir=../data/xeno-canto-dataset/Zonotrichiaalbicollis/wav/
```
5. Generate
```
cd tensorflow-wavenet
python generate.py --samples 16000 --wav_out_path=../generated_birdsong/generated_za_1.wav logdir/train/2019-09-30T22-43-20/model.ckpt-98
```
- Note: 16,000 samples = 1 second

## Dependencies: 
```
conda install tensorflow
pip install librosa==0.6.3 # must be > 0.5, but 0.7 had an error
```

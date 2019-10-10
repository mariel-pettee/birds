#!/bin/bash

# Convert downloaded mpegs to wav format
# Birdname is the argument to this script 

BIRDNAME=$1
FOLDER=/project/hep/demers/mnp3/AI/birdz/data/xeno-canto-dataset/

OUTPUT_DIR=$FOLDER/$BIRDNAME/wav
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
fi

for MP3 in $FOLDER/$BIRDNAME/mp3/*.mp3

do
    WAV=$OUTPUT_DIR/$(basename "${MP3%.*}.wav")
    if [ ! -f "$WAV" ]; then
        ./ffmpeg -i "$MP3" -acodec pcm_s16le -ac 1 -ar 16000 -y -hide_banner "$WAV"
        else
        echo "$WAV" already exists. Skipping.
    fi
done
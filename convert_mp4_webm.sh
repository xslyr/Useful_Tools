#!/bin/bash

if [ -z "$1" ]; then
    echo "Uso: $0 arquivo.mp4"
    exit 1
fi


ffmpeg -i "$1" -c:v libvpx-vp9 -crf 30 -b:v 0 -c:a libopus "${1%.*}.webm"

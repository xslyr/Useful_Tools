#!/bin/bash

if [ -z "$1" ]; then
    echo "Uso: $0 arquivo.ogg"
    exit 1
fi

ffmpeg -i "$1" -c:a libmp3lame -q:a 2 "${1%.*}.mp3"

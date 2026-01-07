#!/bin/bash


if [ -z "$1" ]; then
    echo "Uso: extrair_audio <nome_do_arquivo_mp4>"
    exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE="${INPUT_FILE%.*}.mp3"

echo "Extraindo áudio de: $INPUT_FILE"
echo "Salvando como: $OUTPUT_FILE"


ffmpeg -i "$INPUT_FILE" -vn -acodec libmp3lame -q:a 2 -y "$OUTPUT_FILE"


if [ $? -eq 0 ]; then
    echo "Extração de áudio concluída com sucesso."
else
    echo "Erro durante a extração de áudio."
fi

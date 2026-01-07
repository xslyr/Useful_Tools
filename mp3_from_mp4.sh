#!/bin/bash

# ##################################################################
# Script para extrair áudio MP3 de um arquivo de vídeo MP4.
# ##################################################################

if ! command -v ffmpeg &> /dev/null
then
    echo "ERRO: O programa 'ffmpeg' não foi encontrado."
    echo "Por favor, instale-o para continuar. (Ex: sudo apt install ffmpeg)"
    exit 1
fi


if [ -z "$1" ]; then
    echo "Uso: mp3_from_mp4 <arquivo_de_entrada.mp4> [arquivo_de_saida.mp3]"
    echo ""
    echo "Descrição:"
    echo "  Extrai o áudio de um arquivo MP4 e o salva como MP3 de alta qualidade."
    echo ""
    echo "Parâmetros:"
    echo "  <arquivo_de_entrada.mp4> : O arquivo de vídeo que você deseja converter."
    echo "  [arquivo_de_saida.mp3]   : (Opcional) O nome do arquivo MP3 a ser criado."
    echo "                               Se não for fornecido, o nome do arquivo de entrada"
    echo "                               será usado, trocando a extensão .mp4 por .mp3."
    exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE=""

if [ ! -f "$INPUT_FILE" ]; then
    echo "ERRO: O arquivo de entrada '$INPUT_FILE' não foi encontrado."
    exit 1
fi


if [ -n "$2" ]; then
    OUTPUT_FILE="$2"

else
    OUTPUT_FILE="${INPUT_FILE%.*}.mp3"
fi



echo "--------------------------------------------------"
echo "Entrada : $INPUT_FILE"
echo "Saída   : $OUTPUT_FILE"
echo "--------------------------------------------------"
echo "Iniciando a conversão..."

ffmpeg -i "$INPUT_FILE" -vn -c:a libmp3lame -q:a 2 "$OUTPUT_FILE"

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Conversão concluída com sucesso!"
else
    echo ""
    echo "❌ Ocorreu um erro durante a conversão com o ffmpeg."
    exit 1
fi

exit 0

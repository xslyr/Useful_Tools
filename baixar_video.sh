#!/bin/bash

check_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Erro: Execute como root ou use sudo para instalar dependências."
        exit 1
    fi
}


if ! command -v yt-dlp &> /dev/null; then
    echo "yt-dlp não encontrado. Iniciando instalação..."
    check_sudo
    
    apt update && apt install -y curl ffmpeg

    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
    chmod a+rx /usr/local/bin/yt-dlp
    
    echo "yt-dlp instalado com sucesso."
fi


if [ -z "$1" ]; then
    echo "Uso: $0 <URL>"
    exit 1
fi


yt-dlp -f "bv+ba/b" --merge-output-format mp4 "$1"

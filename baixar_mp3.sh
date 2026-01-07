#!/bin/bash

# 1. Verificação/Instalação do yt-dlp
if ! command -v yt-dlp &> /dev/null; then
    echo "yt-dlp não encontrado. Tentando instalar via apt..."
    sudo apt update && sudo apt install -y yt-dlp
    
    # Valida se a instalação teve sucesso
    if [ $? -ne 0 ]; then
        echo "Erro ao instalar yt-dlp. Verifique suas permissões ou conexão."
        exit 1
    fi
fi

# 2. Execução do download
# Adicionado check de parâmetro e sanitização básica
if [ -z "$1" ]; then
    echo "Uso: $0 <URL>"
    exit 1
fi

yt-dlp -x --audio-format mp3 --audio-quality 128K --embed-thumbnail --add-metadata "$1"



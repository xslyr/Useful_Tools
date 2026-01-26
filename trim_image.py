#!/usr/bin/env python3
import sys
import os
from PIL import Image

def trim_image(input_path):
    input_path = input_path.strip() # Remove quebras de linha do pipe
    if not input_path or not os.path.exists(input_path):
        return

    try:
        img = Image.open(input_path).convert("RGBA")
        bbox = img.getbbox()
        if bbox:
            nome_base, extensao = os.path.splitext(input_path)
            output_path = f"{nome_base}_trimmed{extensao}"
            img.crop(bbox).save(output_path)
            print(f"Sucesso: {output_path}")
    except Exception as e:
        print(f"Erro em {input_path}: {e}")

if __name__ == "__main__":
	
    if not sys.stdin.isatty():
        for line in sys.stdin:
            trim_image(line)
    
    elif len(sys.argv) > 1:
        for arquivo in sys.argv[1:]:
            trim_image(arquivo)
            
    else:
        print("Uso: trim_image file1.png file2.png OU ls *.png | trim_image")

#!/usr/bin/env bash
# Scarica tutti i reel elencati in links.txt (un URL per riga) con yt-dlp.
# Uso: ./scarica.sh [file_link] [cartella_output]
# Prerequisiti (macOS): brew install yt-dlp ffmpeg
set -u

LINKS="${1:-links.txt}"
OUT="${2:-reels}"
mkdir -p "$OUT"

# --cookies-from-browser safari: usa il login Instagram di Safari.
# (Se dà errore di permessi: Impostazioni di Sistema > Privacy e sicurezza >
#  Accesso completo al disco > abilita Terminale. In alternativa usa chrome.)
yt-dlp \
  --cookies-from-browser safari \
  --batch-file "$LINKS" \
  --download-archive "$OUT/.scaricati.txt" \
  --ignore-errors \
  --sleep-interval 3 --max-sleep-interval 8 \
  -o "$OUT/%(uploader)s - %(id)s.%(ext)s" \
  --merge-output-format mp4

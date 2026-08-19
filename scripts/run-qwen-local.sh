#!/usr/bin/env bash
set -euo pipefail

# RATISS Aeon Prime — démarrage local du modèle compact Qwen avec llama.cpp.
MODEL_PATH="${1:-./qwen2.5-0.5b-instruct-q4_k_m.gguf}"

if ! command -v llama-server >/dev/null 2>&1; then
  echo "llama.cpp est requis. Installez-le depuis https://github.com/ggerganov/llama.cpp/releases"
  exit 1
fi

if [ ! -f "$MODEL_PATH" ]; then
  echo "Modèle absent : $MODEL_PATH"
  echo "Téléchargez l'asset de la release ou utilisez : ollama run qwen2.5:0.5b-instruct"
  exit 1
fi

llama-server -m "$MODEL_PATH" --host 127.0.0.1 --port 8080 -c 4096

#!/bin/bash
set -euo pipefail

readonly OUTPUT=live

mkdir -p "${OUTPUT}"
rm -rf "${OUTPUT}"/*

fswatch live.ipynb | while read -r fpath; do \
  echo -e "\033[0;36mRELOAD\033[0m $fpath $(date +"%H%m%S")"
  jupyter nbconvert live.ipynb --to html --output-dir="${OUTPUT}"
  gsutil -h "Cache-Control:no-store,max-age=0" \
    cp "${OUTPUT}/live.html" gs://bigdata.luisbelloch.es/en_directo.html
done


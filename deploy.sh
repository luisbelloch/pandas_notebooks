#!/bin/bash
set -eou pipefail
echo -e "\033[0;36mRELOAD\033[0m $1 $(date +"%H%m%S")"
jupyter nbconvert live.ipynb --to html --output-dir=$(pwd)/live
scp live/live.html root@live.luisbelloch.es:/var/www/html/index.html


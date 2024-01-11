#!/bin/bash
BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_DIR="$BIN_DIR/.."
cd $PROJ_DIR

for f in notebooks/*.qmd
do 
  echo $f
  o=$(basename "$f")
  quarto render "$f" --to html
  mv "${f/%qmd/html}" "docs/${o/%qmd/html}"
done

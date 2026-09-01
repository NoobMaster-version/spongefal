#!/usr/bin/env bash
# Build every resume variant; copy PRIMARY to public/resume.pdf (what the site links).
set -euo pipefail
cd "$(dirname "$0")"

PRIMARY=resume-v2

for f in resume resume-v2 resume-master; do
  pdflatex -interaction=nonstopmode -halt-on-error "$f.tex" >/dev/null
  pdflatex -interaction=nonstopmode -halt-on-error "$f.tex" >/dev/null   # settle links
  pages=$(pdfinfo "$f.pdf" | awk '/^Pages:/{print $2}')
  marker=""
  [ "$f" = "$PRIMARY" ] && marker="  <- primary"
  echo "built $f.pdf (${pages} pages)${marker}"
done

rm -f ./*.aux ./*.log ./*.out
cp "$PRIMARY.pdf" ../public/resume.pdf
echo "copied $PRIMARY.pdf -> public/resume.pdf"

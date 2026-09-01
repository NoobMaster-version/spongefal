#!/usr/bin/env bash
# Build both resume variants and copy the one-pager to public/resume.pdf.
set -euo pipefail
cd "$(dirname "$0")"

for f in resume resume-full; do
  pdflatex -interaction=nonstopmode -halt-on-error "$f.tex" >/dev/null
  pdflatex -interaction=nonstopmode -halt-on-error "$f.tex" >/dev/null   # settle links
  pages=$(pdfinfo "$f.pdf" 2>/dev/null | awk '/^Pages:/{print $2}' || echo '?')
  echo "built $f.pdf (${pages} pages)"
done

rm -f ./*.aux ./*.log ./*.out
cp resume.pdf ../public/resume.pdf
echo "copied resume.pdf -> public/resume.pdf"

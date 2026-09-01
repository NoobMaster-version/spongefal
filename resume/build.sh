#!/usr/bin/env bash
# Build both resumes; copy the main one to public/resume.pdf (what the site links).
set -euo pipefail
cd "$(dirname "$0")"

for f in resume resume-master; do
  pdflatex -interaction=nonstopmode -halt-on-error "$f.tex" >/dev/null
  pdflatex -interaction=nonstopmode -halt-on-error "$f.tex" >/dev/null   # settle links
  pages=$(pdfinfo "$f.pdf" | awk '/^Pages:/{print $2}')
  echo "built $f.pdf (${pages} pages)"
done

rm -f ./*.aux ./*.log ./*.out
cp resume.pdf ../public/resume.pdf
echo "copied resume.pdf -> public/resume.pdf"

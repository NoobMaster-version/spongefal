#!/usr/bin/env bash
# Build resume.pdf and copy it to public/resume.pdf (what the site links).
set -euo pipefail
cd "$(dirname "$0")"

pdflatex -interaction=nonstopmode -halt-on-error resume.tex >/dev/null
pdflatex -interaction=nonstopmode -halt-on-error resume.tex >/dev/null   # settle links

pages=$(pdfinfo resume.pdf | awk '/^Pages:/{print $2}')
echo "built resume.pdf (${pages} pages)"
[ "$pages" = "1" ] || echo "WARNING: expected 1 page, got ${pages} -- trim something"

rm -f ./*.aux ./*.log ./*.out
cp resume.pdf ../public/resume.pdf
echo "copied resume.pdf -> public/resume.pdf"

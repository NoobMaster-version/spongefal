# Resume

Two variants off one shared preamble, so edits to style land in both.

| file | pages | use |
| --- | --- | --- |
| `resume.tex` → `resume.pdf` | 1 | the default. Send this unless asked for more. 9pt, tight. |
| `resume-full.tex` → `resume-full.pdf` | 2 | when depth helps — hardware roles, research, referrals who will actually read. 10pt, roomier. |
| `preamble.tex` | — | shared styling, helper macros, and the contact header. Edit contacts here once. |

## Build

```bash
./build.sh
```

Runs `pdflatex` twice on each variant, cleans the aux files, and copies
`resume.pdf` to `../public/resume.pdf` (what the website's "resume (PDF)" link
serves). To publish the detailed one instead, change the `cp` line in
`build.sh` to `resume-full.pdf`.

Needs `pdflatex` with `extsizes`, `charter`, `titlesec`, `enumitem`, `tabularx`.

## Editing

- `\entry{org}{dates}{role}{location}` — a job or position.
- `\pentry{project}{stack}{dates}` — a project.
- `\begin{points} \item ... \end{points}` — the bullets.
- `\skillrow{label}{list}` — a skills line.

The one-pager fits with no slack. If you add a line, take one out, or the
overflow silently becomes a second page. Check with:

```bash
pdfinfo resume.pdf | grep Pages
```

## Open items

Things asserted here that only you can confirm:

- **Eyecandy Robotics job title.** Written as "Electronics / Hardware Engineer"
  and dated from the first commit in the hardware repo (Nov 2025). Fix both if
  the real title or start date differs, and say "Founder"/"Co-founder" if that
  is what it is — it reads very differently to a recruiter.
- **LinkedIn URL** in `preamble.tex` is a placeholder (`linkedin.com`). Put the
  real profile in.
- **Nothing between Nov 2025 and now** appears anywhere on the website. If there
  was other work in 2026, it is missing from both variants.
- **CGPA 8.04** is carried over from the last CV. Update if it moved.
- The Eyecandy bullets describe the boards and the robot generically. If any of
  it is confidential, cut the part numbers and the words "companion robot".

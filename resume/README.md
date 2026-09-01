# Resume

One resume, one page, built on Jake's template.

| file | what |
| --- | --- |
| `resume.tex` → `resume.pdf` | the resume. Edit this. |
| `reference.tex` | the earlier version kept as the formatting reference. Not built. |
| `build.sh` | builds `resume.pdf` and copies it to `../public/resume.pdf` |

## Build

```bash
./build.sh
```

Runs `pdflatex` twice, cleans aux files, copies the PDF to `public/resume.pdf`
(what the website's "resume (PDF)" link serves). It warns if the output is not
exactly one page.

Needs `pdflatex` with `fullpage`, `marvosym`, `fancyhdr`, `babel`, `ulem`,
`titlesec`, `enumitem`, `tabularx`, `glyphtounicode`.

## Editing

- `\resumeSubheading{org}{dates}{role}{location}` — a job or position.
- `\resumeProjectHeading{name $|$ \emph{stack}}{dates}` — a project.
- `\resumeItem{...}` — a bullet.

Two things to watch:

- **It fits one page with no slack.** Add a bullet and it silently becomes two
  pages. `build.sh` warns, but check the warning.
- **Keep heading lines short.** The project heading and its date share one
  `tabular*` row; if the name plus stack is too long the date collides with it
  instead of right-aligning. That happened with "FOC Controller for
  High-Torque Micro BLDC Motor" — dropping "High-Torque" fixed it.

## Open items

- **Eyecandy Robotics title** is written as "Electronics Engineer" and dated
  from the first commit in the hardware repo (Nov 2025). Correct it if the real
  title or start date differs — and if you founded the company, say so, since
  that reads very differently.
- **Not included**, deliberately, to hold one page: the smart switch board, the
  coin sorter, and the Voice Video Manipulator (dropped from `reference.tex` to
  make room for the motor work). Swap any of them back in for something else if
  a particular application calls for it.
- **eYantra** moved from its own "Competitions" section into Projects to save a
  section heading. Its national-semifinalist result is not stated — worth
  adding if you can spare a line.
- **Skills are exactly your own list** from `reference.tex`, unchanged. FEMM is
  the one tool the resume now demonstrates but does not claim.

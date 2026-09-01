# Resume

Three documents, same Jake's-template formatting.

| file | pages | what |
| --- | --- | --- |
| `resume-v2.tex` → `resume-v2.pdf` | 1 | **primary — the one you send.** Copied to `../public/resume.pdf`. Tighter cut: no coin sorter, no MARIO, no achievements section. |
| `resume.tex` → `resume.pdf` | 2 | v1, kept for reference. Has MARIO, the coin sorter and an Achievements section. |
| `resume-master.tex` → `resume-master.pdf` | 3 | the full record — every project, every bullet. Not for sending; cut from it to target an application. |
| `reference.tex` | 1 | the original, kept as the formatting reference. Not built. |
| `build.sh` | — | builds all three; copies `$PRIMARY` (currently `resume-v2`) to `../public/resume.pdf` |

To change which variant the website serves, edit `PRIMARY=` at the top of
`build.sh`.

## Build

```bash
./build.sh
```

Needs `pdflatex` with `fullpage`, `marvosym`, `fancyhdr`, `babel`, `ulem`,
`titlesec`, `enumitem`, `tabularx`, `glyphtounicode`.

## Editing

- `\resumeSubheading{org}{dates}{role}{location}` — a job or position.
- `\resumeProjectHeading{name $|$ \emph{stack}}{dates}` — a project.
- `\resumeItem{...}` — a bullet.

Three things that bite:

- **Keep project heading lines short.** The name plus stack and the date share
  one `tabular*` row; if the left side is too long the date stops
  right-aligning and collides with it. Check with
  `pdftotext -layout resume-v2.pdf - | grep '|'` after adding a project.
- **A bare `\begin{itemize}` cannot sit directly inside another one.** v1's
  Achievements section uses `\begin{itemize}[leftmargin=0.3in,
  label=\textendash]` rather than the `\resumeSubHeadingListStart` /
  `\resumeItemListStart` pair, which needs an `\item` between the two levels.
- **v2 runs denser than the others** to hold one page: `\resumeItem` ends with
  `\vspace{-4pt}` and `\resumeItemListEnd` with `\vspace{-9pt}`, against `-2pt`
  and `-7pt` elsewhere. Margins are the template's standard; bottom margin is
  0.36 in when full, so adding a bullet will spill to page 2.

## What is where

**v2 (primary)** — Eyecandy, NishCorp, Krishna Defence; axial-flux motor, FOC
controller, smart switch, Open Manipulator X simulation; eYantra; SRA; skills.

**v1** adds MARIO, the coin sorter, and an Achievements section (Pratibimb win,
short film).

**Master** adds all of the above plus HSC/MHT-CET, Kurma, the self-balancing
robot, maze solver, gesture-controlled car, animal feeder, river-cleaning boat,
the Mass Robotics entry, the Pratibimb department-head role, and the longer
bullets — UWB range extension 45 m → 315 m, the Rs 13 lakh grant contribution,
the fleet provisioning tooling, and the full FEMM findings (40.9 mN·m/A,
496 rpm/V, zero cogging, 6 mm back plates).

## Open items

- **Coin sorter has no month** in v1 and the master, only "24-Hour Hackathon",
  because the real date was not recorded anywhere.
- **Skills are exactly your own list** from `reference.tex`, unchanged. Tools
  the resumes demonstrate but do not claim: FEMM, MQTT, OpenCV, TensorFlow,
  Flutter, FreeRTOS, BLE. Add any you would defend in an interview.
- **With MARIO off v2**, the only "200+ students" claim there is the SRA
  workshops line, which resolves the duplicate that v1 had. If you put MARIO
  back, do not let that number appear twice on one page.
- **NishCorp is still marked Hybrid.** Only Eyecandy was corrected to
  Bangalore; say if NishCorp needs a real location too.

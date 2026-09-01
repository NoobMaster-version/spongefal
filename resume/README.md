# Resume

Two documents on the same Jake's-template formatting.

| file | pages | what |
| --- | --- | --- |
| `resume.tex` → `resume.pdf` | 2 | **the one you send.** Also copied to `../public/resume.pdf` for the website. |
| `resume-master.tex` → `resume-master.pdf` | 3 | the full record — every project, every bullet. Not for sending; cut from it to target an application. |
| `reference.tex` | 1 | the earlier version, kept as the formatting reference. Not built. |
| `build.sh` | — | builds both, copies `resume.pdf` to `../public/resume.pdf` |

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

Two things that bite:

- **Keep project heading lines short.** The name plus stack and the date share
  one `tabular*` row. If the left side is too long the date stops
  right-aligning and collides with it. Check with
  `pdftotext -layout resume.pdf - | grep '|'` after adding a project.
- **A bare `\begin{itemize}` cannot sit directly inside another one.** The
  Achievements section therefore uses
  `\begin{itemize}[leftmargin=0.3in, label=\textendash]` rather than the
  `\resumeSubHeadingListStart` / `\resumeItemListStart` pair, which needs an
  `\item` between the two levels.

## What is on the main resume vs. only the master

The main resume carries: Eyecandy, NishCorp, Krishna Defence; the axial-flux
motor, FOC controller, smart switch, MARIO, Voice Video Manipulator, coin
sorter; eYantra; SRA; two achievements.

The master adds: HSC/MHT-CET, Kurma, the self-balancing robot, maze solver,
gesture-controlled car, animal feeder, river-cleaning boat, the Mass Robotics
entry, the Pratibimb department-head role, and the longer bullets — UWB range
extension 45 m → 315 m, the Rs 13 lakh grant contribution, the fleet
provisioning tooling, and the full FEMM findings (40.9 mN·m/A, 496 rpm/V,
zero cogging, 6 mm back plates).

## Open items

- **Kurma** was dropped from the main resume as not flagship, and the **smart
  switch board** put in its place. Kurma is still in the master.
- **The 200+ students / 50+ kits claim** sits on MARIO here, following
  `reference.tex`. The website attributes the 200+ students to the Wall-E
  self-balancing kits instead. Both may be true of different kits, but do not
  let the same number appear twice on one page.
- **Coin sorter has no month**, only "24-Hour Hackathon" in the date column,
  because the real date was not recorded anywhere. Fill it in if you know it.
- **Skills are exactly your own list** from `reference.tex`, unchanged. Tools
  the resume now demonstrates but does not claim: FEMM, MQTT, OpenCV,
  TensorFlow, Flutter, FreeRTOS, BLE. Add any you would defend in an
  interview; leave the rest off.

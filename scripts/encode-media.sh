#!/usr/bin/env bash
# One-shot media pipeline: old Assets/ → public/assets/<slug>/ with sane
# names, web-weight video (h264, ≤1280w, faststart), and real poster frames.
set -uo pipefail
cd "$(dirname "$0")/.."
SRC="Assets"
OUT="public/assets"
mkdir -p "$OUT"

vid() { # vid <in> <out-basename-without-ext>
  local in="$1" out="$2"
  mkdir -p "$(dirname "$OUT/$out")"
  ffmpeg -y -loglevel error -i "$in" \
    -vf "scale='min(1280,iw)':-2" \
    -c:v libx264 -crf 27 -preset medium -pix_fmt yuv420p \
    -movflags +faststart -c:a aac -b:a 96k \
    "$OUT/$out.mp4" </dev/null
  ffmpeg -y -loglevel error -ss 1 -i "$OUT/$out.mp4" \
    -frames:v 1 -q:v 3 "$OUT/$out-poster.jpg" </dev/null
  echo "vid  $out"
}

gif2mp4() { # silent loop clips from gifs
  local in="$1" out="$2"
  mkdir -p "$(dirname "$OUT/$out")"
  ffmpeg -y -loglevel error -i "$in" \
    -vf "scale='min(960,iw)':-2:flags=lanczos,fps=15,crop=trunc(iw/2)*2:trunc(ih/2)*2" \
    -c:v libx264 -crf 28 -preset medium -pix_fmt yuv420p -an \
    -movflags +faststart "$OUT/$out.mp4" </dev/null
  ffmpeg -y -loglevel error -i "$OUT/$out.mp4" \
    -frames:v 1 -q:v 3 "$OUT/$out-poster.jpg" </dev/null
  echo "gif  $out"
}

img() { # img <in> <out-basename-without-ext>
  local in="$1" out="$2"
  mkdir -p "$(dirname "$OUT/$out")"
  ffmpeg -y -loglevel error -i "$in" \
    -vf "scale='min(1600,iw)':-2" -q:v 4 "$OUT/$out.jpg" </dev/null
  echo "img  $out"
}

# ---- kdail ----
img "$SRC/KDAIL/uwb.JPEG" "kdail/uwb-anchor"
img "$SRC/KDAIL/iCloud Photos/IMG_4664.JPEG" "kdail/bot"
vid "$SRC/KDAIL/kdail_bot_teleop.MP4" "kdail/teleop"
vid "$SRC/KDAIL/IMG_4702.MP4" "kdail/field-test"

# ---- smart-switch ----
img "$SRC/SmartSwitch/CAD_Model.png" "smart-switch/cad-model"
img "$SRC/SmartSwitch/circuit_diagram.jpeg" "smart-switch/circuit-diagram"
img "$SRC/SmartSwitch/perf_board.jpeg" "smart-switch/perf-board"
img "$SRC/SmartSwitch/final_switch.jpeg" "smart-switch/final-switch"

# ---- nishcorp ----
img "$SRC/Nishcorp/electronics_to_control_motor.jpeg" "nishcorp/motor-electronics"
img "$SRC/Nishcorp/assembled_bot_1.jpeg" "nishcorp/assembled-1"
img "$SRC/Nishcorp/assembled_bot_2.jpeg" "nishcorp/assembled-2"
img "$SRC/Nishcorp/assembled_bot_3.jpeg" "nishcorp/assembled-3"

# ---- eyantra ----
img "$SRC/eyantra/e6e7b338-0101-4a82-88cf-1fd6ad3a4626.JPEG" "eyantra/drone-1"
img "$SRC/eyantra/iCloud Photos(4)/iCloud Photos/IMG_3182.JPEG" "eyantra/drone-2"
img "$SRC/eyantra/iCloud Photos(5)/iCloud Photos/IMG_3176.JPEG" "eyantra/drone-3"
vid "$SRC/eyantra/IMG_3999.MP4" "eyantra/flight-test"

# ---- kurma ----
vid "$SRC/Kurma/IMG_4242.MP4" "kurma/walk-1"
vid "$SRC/Kurma/IMG_4243.MP4" "kurma/walk-2"
vid "$SRC/Kurma/kurma_over_rough_terrain.MP4" "kurma/rough-terrain"

# ---- mario ----
img "$SRC/Mario/bot2.png" "mario/hardware"
img "$SRC/Mario/simulation.png" "mario/simulation"
gif2mp4 "$SRC/Mario/Mario_Santra.gif" "mario/arm-demo"
gif2mp4 "$SRC/Mario/simulation_mario_v2.3.gif" "mario/sim-demo"

# ---- vvm ----
cp "$SRC/VVM_Assets/image.webp" "$OUT/vvm/setup.webp" 2>/dev/null || { mkdir -p "$OUT/vvm"; cp "$SRC/VVM_Assets/image.webp" "$OUT/vvm/setup.webp"; }
vid "$SRC/VVM_Assets/Screencast from 08-29-2024 12_01_43 AM.mp4" "vvm/demo-detect"
vid "$SRC/VVM_Assets/Screencast from 08-31-2024 04_56_15 AM.mp4" "vvm/demo-pick"

# ---- origins (gesture car, wall-e, maze) ----
vid "$SRC/Gesture_Controlled_Car/Demonstration Video Internship Project .mp4" "origins/gesture-car"
vid "$SRC/Self Balancing Bot/IMG_3605.MP4" "origins/wall-e"
vid "$SRC/SAC/IMG_2092.MP4" "origins/maze-run"

# ---- robots-for-good (feeder, river, coin) ----
gif2mp4 "$SRC/AnimalFeeder/working_model.gif" "robots-for-good/feeder-working"
gif2mp4 "$SRC/AnimalFeeder/installation.gif" "robots-for-good/feeder-installed"
gif2mp4 "$SRC/AnimalFeeder/Cat.gif" "robots-for-good/cat"
img "$SRC/AnimalFeeder/SRA_Board_PetFeeder.JPEG" "robots-for-good/feeder-board"
img "$SRC/EVS_Project_River_Cleaning/IMG_2406.JPEG" "robots-for-good/river-hardware"
img "$SRC/EVS_Project_River_Cleaning/IMG_2408.JPEG" "robots-for-good/river-water"
img "$SRC/COin_Sorting/3D7563D3-87EC-4E96-AAC2-F3EF65814A51.JPEG" "robots-for-good/coin-build"
img "$SRC/COin_Sorting/iCloud Photos(1)/iCloud Photos/IMG_4216.JPEG" "robots-for-good/coin-sorter-1"
img "$SRC/COin_Sorting/iCloud Photos(3)/iCloud Photos/IMG_3984.JPEG" "robots-for-good/coin-sorter-2"
vid "$SRC/COin_Sorting/IMG_4188.MP4" "robots-for-good/coin-demo"

# ---- operator (about page) ----
img "$SRC/Prati/PFP.JPEG" "operator/portrait"
img "$SRC/Prati/PlotsePanga.JPEG" "operator/plot-se-panga"
img "$SRC/Prati/IMG_3636.JPEG" "operator/pratibimb-1"
img "$SRC/Prati/IMG_3660.JPEG" "operator/pratibimb-2"
img "$SRC/Prati/IMG_4624.JPEG" "operator/pratibimb-3"
vid "$SRC/Prati/2f3eb3e3-2318-4b8f-a0d7-f6b545837c8e.MP4" "operator/pratibimb-win"

# ---- resume ----
cp "$SRC/CV_Kartikey_Pathak-5.pdf" "public/resume.pdf"

echo "DONE"
du -sh "$OUT"

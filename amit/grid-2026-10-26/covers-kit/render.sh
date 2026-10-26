#!/bin/bash
# usage: bash render.sh   (run inside covers-kit; needs frames/<code>.png = chosen full emulator screenshot)
CH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
mkdir -p out
for f in html/*.html; do c=$(basename "$f" .html)
  [ -f "frames/$c.png" ] || { echo "MISSING frame $c"; continue; }
  "$CH" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 --window-size=1080,1920 --screenshot="$PWD/out/$c.png" "file://$PWD/$f" >/dev/null 2>&1
  echo "ok $c"
done

#!/usr/bin/env bash
set -euo pipefail

FLUTTER_BIN="${FLUTTER_BIN:-flutter}"
"$FLUTTER_BIN" pub get
"$FLUTTER_BIN" build web --release
printf '\nBuild terminé : %s/build/web\n' "$PWD"

#!/usr/bin/env bash
# Runs each time the codespace starts. Seeds KiCad's global library tables so students
# don't get the "configure global libraries" dialog, then opens KiCad on the desktop.
set -u

KICAD_MAJOR="$(kicad-cli version 2>/dev/null | cut -d. -f1-2 | tr -d '[:space:]')"
[ -n "${KICAD_MAJOR}" ] || KICAD_MAJOR="10.0"
CFG="${HOME}/.config/kicad/${KICAD_MAJOR}"
TEMPLATE_DIR="/usr/share/kicad/template"

mkdir -p "${CFG}"
for table in sym-lib-table fp-lib-table; do
  if [ ! -f "${CFG}/${table}" ] && [ -f "${TEMPLATE_DIR}/${table}" ]; then
    cp "${TEMPLATE_DIR}/${table}" "${CFG}/${table}"
  fi
done

# Wait briefly for the desktop (display :1, started by the desktop-lite feature).
export DISPLAY="${DISPLAY:-:1}"
for _ in $(seq 1 30); do
  xdpyinfo >/dev/null 2>&1 && break
  sleep 1
done

# Launch KiCad once; don't stack copies if the student reconnects.
if ! pgrep -x kicad >/dev/null 2>&1; then
  cd "${CODESPACE_VSCODE_FOLDER:-$PWD}/projects" 2>/dev/null || true
  setsid -f kicad </dev/null >/tmp/kicad.log 2>&1
fi
exit 0

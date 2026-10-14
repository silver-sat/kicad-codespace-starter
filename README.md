# KiCad in the browser (GitHub Codespaces)

Run KiCad on a cloud Linux desktop, viewed in a Chrome tab. Built for locked-down Chromebooks where nothing can be installed.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/silver-sat/kicad-codespaces-starter)

- **Students:** read [STUDENT-GUIDE.md](STUDENT-GUIDE.md).
- **Mentors:** read [MENTOR-SETUP.md](MENTOR-SETUP.md) before handing this out.

## What's inside

- `.devcontainer/Dockerfile` installs KiCad 10 stable from the official KiCad PPA on Ubuntu 24.04.
- `.devcontainer/devcontainer.json` adds a lightweight desktop (noVNC on port 6080) and asks for a 4-core machine.
- `.devcontainer/first-run.sh` sets up KiCad's default libraries and opens KiCad when the codespace starts.
- `projects/` is where design work goes.

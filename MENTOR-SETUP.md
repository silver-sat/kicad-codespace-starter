# Mentor setup and notes

One-time setup for running KiCad in GitHub Codespaces for students on locked-down Chromebooks.

## 1. Create the repository

- Push this folder to a new GitHub repository (an organization repo is easiest to manage).
- Students can each fork it, or you can use GitHub Classroom to give each student their own copy.

## 2. Test on a real student Chromebook first

The most likely blocker is the school's web filter. The Chromebook must be able to reach:

- `github.com` and `*.github.com`
- `*.githubusercontent.com`
- `*.app.github.dev` (the forwarded KiCad desktop)
- `*.github.dev` / `vscode.dev` and `*.vscode-cdn.net` (the browser editor)

Open a codespace on a student device and confirm the KiCad desktop tab loads and responds before rolling it out.

## 3. Turn on prebuilds (strongly recommended)

Without prebuilds, every new codespace installs KiCad and its libraries from scratch, which takes many minutes.

Repository **Settings → Codespaces → Set up prebuild**:

- Branch: `main`
- Region: the one nearest you (US East)
- Trigger: "On configuration change" is enough and keeps prebuild storage costs low.
- Machine type: 4-core.

Prebuild storage and runs are billed to whoever owns the repo, so check your org's Codespaces spending limit.

## 4. Limit wasted hours

Each student's account has a monthly allowance of Codespaces core-hours. A 4-core machine uses 4 core-hours per hour of running time.

- Ask students to set **github.com/settings/codespaces → Default idle timeout** to 15–30 minutes.
- Set **Default retention period** to a few weeks so old codespaces get deleted.
- If the repo is in an org that pays for Codespaces, org owners can enforce maximum idle timeouts and allowed machine types under **Organization settings → Codespaces → Policies**.

Students can apply through GitHub Education for a larger allowance.

## 5. Tune the environment

All in `.devcontainer/`:

| What | Where |
|---|---|
| Skip 3D models (faster builds, smaller image) | `devcontainer.json` → `"INSTALL_3D_MODELS": "false"` |
| KiCad major version | `Dockerfile` → `KICAD_PPA` (e.g. `ppa:kicad/kicad-10.0-releases`) |
| Machine size | `devcontainer.json` → `hostRequirements` |
| Don't auto-open KiCad | remove `postStartCommand` |

Changing any of these triggers a new prebuild. Students pick up changes by creating a new codespace (or running **Codespaces: Rebuild Container**).

**Version warning:** KiCad files saved in a newer major version can't be opened by an older one. Keep everyone, including mentors at home, on the same major version.

## 6. Security notes

- The desktop runs without a VNC password. That's acceptable because forwarded ports are private by default and need the student's GitHub sign-in. Don't change the port to **Public**.
- If you prefer a password, set `"password"` in the `desktop-lite` feature options. Students then type it on the Connect page.

## Known limits

- No GPU. KiCad uses Mesa software rendering. Schematic work is fine; large boards and the 3D viewer are slow.
- Wayland isn't involved; this is an X11 desktop, which is what KiCad supports.
- The very first codespace build on a new configuration takes a long time even with prebuilds enabled, because the prebuild itself has to run once.

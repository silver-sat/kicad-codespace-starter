# KiCad in a browser-viewable Linux desktop for GitHub Codespaces.
# Everything slow (the KiCad install) happens here so Codespaces prebuilds can cache it.
FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Set to "false" to skip the 3D models (~several GB). The 3D viewer then shows bare footprints.
ARG INSTALL_3D_MODELS=true
ARG KICAD_PPA=ppa:kicad/kicad-10.0-releases

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends software-properties-common gpg-agent \
 && add-apt-repository -y "${KICAD_PPA}" \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
      kicad kicad-symbols kicad-footprints kicad-templates \
      mesa-utils libgl1-mesa-dri x11-utils fonts-dejavu fonts-liberation \
 && if [ "${INSTALL_3D_MODELS}" = "true" ]; then apt-get install -y --no-install-recommends kicad-packages3d; fi \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# No GPU in Codespaces: tell Mesa to use its software renderer.
ENV LIBGL_ALWAYS_SOFTWARE=1

COPY first-run.sh /usr/local/bin/kicad-first-run
RUN chmod +x /usr/local/bin/kicad-first-run

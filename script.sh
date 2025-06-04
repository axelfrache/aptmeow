#!/bin/bash

echo "[+] Regenerating Packages.gz for all & amd64..."

docker compose exec debian-repo bash -c "
  mkdir -p dists/stable/main/binary-all dists/stable/main/binary-amd64 && \
  dpkg-scanpackages pool /dev/null | tee dists/stable/main/binary-all/Packages | gzip -9c > dists/stable/main/binary-all/Packages.gz && \
  cp dists/stable/main/binary-all/Packages dists/stable/main/binary-amd64/Packages && \
  gzip -9c dists/stable/main/binary-amd64/Packages > dists/stable/main/binary-amd64/Packages.gz
"

echo "[✓] Packages.gz updated for all & amd64"

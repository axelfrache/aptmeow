#!/bin/bash
docker compose exec debian-repo \
  bash -c "mkdir -p dists/stable/main/binary-all && \
           dpkg-scanpackages pool /dev/null | gzip -9c > dists/stable/main/binary-all/Packages.gz"

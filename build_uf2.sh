#!/bin/bash 
#Simple helper permettant de convertire le module/main.py en firmware.uf2
set -e
docker pull ghcr.io/lighta/micropython-picow-builder:latest
echo "=== BUILDING MICROPYTHON FIRMWARE FOR PICO (W and 2W) ==="
docker run --rm \
    -v $(pwd)/module:/module \
    -v $(pwd)/firmware:/firmware \
    --entrypoint /opt/build.sh ghcr.io/lighta/micropython-picow-builder:latest
echo "=== Result should be in /firmware folder ==="
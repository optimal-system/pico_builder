#!/bin/bash 
#Simple helper permettant de convertire le module/main.py en firmware.uf2
set -e
echo "=== BUILDING MICROPYTHON FIRMWARE FOR PICO (W and 2W) ==="
docker run --rm \
    -v $(pwd)/module:/module \
    -v $(pwd)/firmware:/firmware \
    --entrypoint /opt/build.sh micropython-pico-builder
echo "=== Result should be in /firmware folder ==="
#!/bin/bash
set -e

echo "=== BUILDING MICROPYTHON FIRMWARE FOR PICO (W and 2W)==="

# Paths
cd /opt/MicroPython/ports/rp2

# Copy user modules if provided
if [ -d /module ]; then
    echo "===> Copying user main.py to modules/"
    mkdir -p modules
    cp /module/*.py modules/
fi

# Build firmware2
#building for pico1
make BOARD=RPI_PICO_W -j$(nproc)
cp /opt/MicroPython/ports/rp2/build-RPI_PICO_W/firmware.uf2 /firmware/firmware_picoW_$(date +%Y%m%d_%H%M%S).uf2

#building for pico2
make BOARD=RPI_PICO2_W -j$(nproc)
cp /opt/MicroPython/ports/rp2/build-RPI_PICO_W/firmware.uf2 /firmware/firmware_pico2W_$(date +%Y%m%d_%H%M%S).uf2

echo "=== Build completed ==="
echo "UF2 files located at:"
echo "firmware/*.uf2"
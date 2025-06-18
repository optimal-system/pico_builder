# Dockerfile

FROM ubuntu:24.04

# Install dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential python3 python3-pip wget unzip

# Set workdir
WORKDIR /opt

#wget "https://developer.arm.com/-/media/Files/downloads/gnu/12.3.rel1/binrel/arm-gnu-toolchain-12.3.rel1-aarch64-arm-none-eabi.tar.xz?rev=420215e7c8d14d90b5227eb5486d8c75&hash=147F00293D4A8065E7222F29A1BCD05BFE94DF88" -O /tmp/arm-gnu-toolchain-12.3.rel1-aarch64-arm-none-eabi.tar.xz

RUN git clone https://github.com/MicroPython/MicroPython
RUN cd MicroPython \
&& make -C mpy-cross \
&& make -C ports/rp2 submodules BOARD=RPI_PICO_W \
&& make -C ports/rp2 submodules BOARD=RPI_PICO2_W

# Create volume mount point
VOLUME [ "/module" ]

# Entrypoint script
COPY assets/build.sh /opt/build.sh
RUN chmod +x /opt/build.sh

ENTRYPOINT ["/opt/build.sh"]

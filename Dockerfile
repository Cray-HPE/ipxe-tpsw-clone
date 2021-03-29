# Cray Docker packaging for the iPXE stack
# Copyright 2018,2021 Hewlett Packard Enterprise Development LP


# Create a building layer, which contains all of the dependencies to compile
# new content using this library
FROM arti.dev.cray.com/baseos-docker-master-local/alpine:3.12.4
LABEL vendor="Cray, Inc."
RUN apk add gcc binutils make perl mtools syslinux xz xz-libs cdrkit xz-dev libc-dev bash

# Add the source directory into the image
COPY src /ipxe

# Set the operational working directory for builds to be inside the ipxe dir
WORKDIR /ipxe

# Make a number of staticly compiled ROMs; this primes the image by linking the
# appropriate C objects, which speeds up the creation of images in the next
# downstream docker image
RUN make bin/undionly.kpxe && \
    make bin/ipxe.iso && \
    make bin/ipxe.usb && \
    make bin-x86_64-efi/ipxe.efi

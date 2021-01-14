# Cray Docker packaging for the iPXE stack
# Copyright 2018, Cray Inc. All rights reserved.

# Create a building layer, which contains all of the dependencies to compile
# new content using this library
FROM dtr.dev.cray.com:443/cache/centos:7
LABEL vendor="Cray, Inc."
RUN yum install -y gcc binutils make perl liblzma mtools mkisofs syslinux xz xz-devel && yum clean all

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

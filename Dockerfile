#
# MIT License
#
# (C) Copyright 2018, 2021-2025 Hewlett Packard Enterprise Development LP
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# Cray Docker packaging for the iPXE stack

# Create a building layer, which contains all of the dependencies to compile
# new content using this library

ARG UPSTREAM=artifactory.algol60.net/docker.io
ARG BASE_IMAGE_DISTRO=ubuntu
ARG BASE_IMAGE_TAG=24.04
ARG BASE_IMAGE=$UPSTREAM/$BASE_IMAGE_DISTRO:$BASE_IMAGE_TAG

FROM $BASE_IMAGE as base
LABEL vendor="Cray, Inc."
RUN apt -y update && \
    apt -y install gcc gcc-14 make gcc-aarch64-linux-gnu gcc-14-aarch64-linux-gnu lzma lzma-dev liblzma-dev \
                   genisoimage xz-utils libc-dev bash git && \
    apt-get upgrade -y && apt full-upgrade -y

# Add the source directory into the image
COPY vendor/github.com/Cray-HPE/ipxe/src /ipxe

# In the near future, we will not copy a local checkout of the ipxe source.
# Instead, we will checkout from the official repository via a tag or a
# git sha hashed value. This will prevent us from making local modifications
# to upstream source, and any local configurations or modifications will
# need to be applied to the codebase in the form of a diff/patch operation.
# This is staging/POC for work described in large part by MTL-2104 and associated
# tickets. Though commented out, it is often used during nominal developer testing
# of new upstream features from the ipxe community. Further thought about git
# checkout security practices will need to be employed as part of future enablement.
#ARG IPXE_GIT_SOURCE=git@github.com:ipxe/ipxe.git
#ARG IPXE_GIT_TAG=v1.21.1
#RUN git clone --depth 1 --branch $IPXE_GIT_TAG $IPXE_GIT_SOURCE
WORKDIR /ipxe

# Make a number of statically compiled ROMs; this primes the image by linking the
# appropriate C objects, which speeds up the creation of images in the next
# downstream docker image, as well, tests the build environment for sanity
# before the building container image enters production.
FROM base as precompile
COPY etc /sample
ARG CC=gcc-14

RUN make CONFIG=hpc bin/undionly.kpxe
RUN make CONFIG=hpc bin/ipxe.usb
RUN make CONFIG=hpc bin-x86_64-efi/ipxe.efi
# Workflow for basic x86 based ipxe.efi nodes
RUN cp /sample/cert_sample /ipxe/cert_sample && \
    cp /sample/bss_sample_script.txt /ipxe/bss_sample_script.txt && \
    export TOKEN=$(cat /sample/s3_sample_jwt) && \
    make CC=$CC CONFIG=hpc bin-x86_64-efi/ipxe.efi \
        DEBUG=httpcore,x509,efi_time \
        CERT=cert_sample TRUST=cert_sample \
        EMBED=bss_sample_script.txt && \
        BEARER_TOKEN=$TOKEN && \
        S3_HOST=$S3_HOST && \
    rm /ipxe/cert_sample /ipxe/bss_sample_script.txt /ipxe/bin-x86_64-efi/ipxe.efi
# Workflow for basic aarch64 based ipxe.efi nodes
RUN cp /sample/cert_sample /ipxe/cert_sample && \
    cp /sample/bss_sample_script.txt /ipxe/bss_sample_script.txt && \
    export TOKEN=$(cat /sample/s3_sample_jwt) && \
    make CC=aarch64-linux-gnu-$CC CONFIG=hpc CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 bin-arm64-efi/ipxe.efi \
        DEBUG=httpcore,x509,efi_time \
        CERT=cert_sample TRUST=cert_sample \
        EMBED=bss_sample_script.txt && \
        BEARER_TOKEN=$TOKEN && \
        S3_HOST=$S3_HOST && \
    rm /ipxe/cert_sample /ipxe/bss_sample_script.txt /ipxe/bin-arm64-efi/ipxe.efi

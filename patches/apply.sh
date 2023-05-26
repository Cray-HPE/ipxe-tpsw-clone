#!/bin/sh

patch -f /ipxe/core/uri.c < /patches/allow_characters.patch
patch -f /ipxe/config/general.h < /patches/enable_https.patch

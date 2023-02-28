# Copyright 2021 Hewlett Packard Enterprise Development LP
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
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# (MIT License)

# SPEC file for ipxe package
#  This is a build of the ipxe software stack, with Cray additions for
#  packaging purposes.
%global vendorroot ./vendor/github.com/Cray-HPE/ipxe
Name: ipxe
BuildArch: noarch
Group: Development/Tools/Building
# The MIT license above is for the Specfile itself, not for the RPM package it builds
License: GPL2
URL: https://git.ipxe.org/ipxe.git
Release: 1.0
Vendor: iPXE.org
Version: %(cat .version)
Source: %{name}-%{version}.tar.bz2
BuildRoot: %{_tmppath}/%{name}-%{version}-build
Summary: Base package for the suite

%description
This is the top level project package for the iPXE stack.

%package devel
Requires: gcc >= 3.0.0
Requires: binutils >= 2.18.0
Requires: make
Requires: perl >= 5.0.0
Requires: liblzma5 >= 5.0.0
Requires: mtools >= 4.0.0
Requires: genisoimage >= 1.0.0
Requires: syslinux >= 4.0
Summary: The iPXE Software Stack for creating NIC bootable firmware

%description devel
This is the iPXE devel firmware software stack, which is used for the creation
of boot ROMs. These ROMs allow hardware to boot from centralized network
locations using stanadard exchange protocols (HTTP, HTTPS, TFTP, iSCSI SAN,
Fibre Channel SAN, WANs, inifinibands, and chainloads from multiple sources).

%prep
%setup -q -n %{name}-%{version}

%build

%install
mkdir -p %{buildroot}/opt/%{name}/src
cp -r %{vendorroot}/src/* %{buildroot}/opt/%{name}/src/.
find %{buildroot}/opt/%{name}/src -name .gitignore -exec rm {} \;

%clean
%clean_build_root

%files

%files devel
%defattr(0444, root, root)
%dir /opt/%{name}
     /opt/%{name}/src
%defattr(0544, root, root)
/opt/%{name}/src/util/*.pl
/opt/%{name}/src/util/get-pci-ids
/opt/%{name}/src/util/gensdsk
/opt/%{name}/src/util/genefidsk
/opt/%{name}/src/util/geniso
/opt/%{name}/src/drivers/infiniband/qib_genbits.pl
/opt/%{name}/src/arch/i386/tests/gdbstub_test.gdb
/opt/%{name}/src/include/ipxe/efi/import.pl
/opt/%{name}/src/include/xen/import.pl

%changelog
* Tue Feb 28 2023 doomslayer@hpe.com
- Switch to Cray-HPE's iPXE fork
- Use the HPC configuration
* Mon Mar 12 2018 jsl@cray.com
- Version 1.0.0 initial check-in
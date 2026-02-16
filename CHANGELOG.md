# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Dependencies
- Bump `dangoslen/dependabot-changelog-helper` from 3 to 4 ([#40](https://github.com/Cray-HPE/ipxe-tpsw-clone/pull/40))
- Bump `actions/checkout` from 4 to 5 ([#45](https://github.com/Cray-HPE/ipxe-tpsw-clone/pull/45))
- Bump `dangoslen/dependabot-changelog-helper` from 3 to 4 ([#40](https://github.com/Cray-HPE/ipxe-tpsw-clone/pull/40))
- Bump `stefanzweifel/git-auto-commit-action` from 5 to 7 ([#46](https://github.com/Cray-HPE/ipxe-tpsw-clone/pull/46))

## [4.2.0] - 2025-05-27
### Changed
- CASMTRIAGE-7409 vendor update upstream IPXE code to fix kernel panics on boot
- Vendor updated to https://github.com/Cray-HPE/ipxe/tree/v1.21.1-644

## [4.1.1] - 2024-09-17

### Dependencies
- Update packages in Docker build to resolve CVEs

## [4.1.0] - 2024-08-20
### Added
- Refreshed `ipxe` vendor, non-impacting changes. Maintain parity with metal-ipxe

### Changed

- Updated `README.adoc` with new maintenance and usage directions needed after [MTL-2104](https://jira-pro.it.hpe.com:8443/browse/MTL-2104)
- Changed `README.md` to asciidoc (`README.adoc`)

## [4.0.0] - 2024-07-17
### Added

- Git Vendor (`vendor/`) of [iPXE](https://github.com/Cray-HPE/ipxe) fork; same source as [metal-ipxe](https://github.com/Cray-HPE/metal-ipxe)

### Changed

- Use [`hpc` iPXE configuration](https://github.com/Cray-HPE/ipxe/tree/master/src/config/hpc)
- Jenkins
    - Disabled concurrent Jenkins builds on same branch/commit
    - Added build timeout to avoid hung builds

### Removed
- `src/` directory, iPXE is now git-vendored
- Removed `LINK_WAIT` timings ([MTL-1957](https://jira-pro.it.hpe.com:8443/browse/MTL-1957))

### Dependencies
- Bump `actions/checkout` from 3 to 4 ([#29](https://github.com/Cray-HPE/ipxe-tpsw-clone/pull/29))
- Bump `stefanzweifel/git-auto-commit-action` from 4 to 5 ([#30](https://github.com/Cray-HPE/ipxe-tpsw-clone/pull/30))

## [3.0.0] - 2023-05-26
### Removed
- Removed defunct files leftover from previous versioning system
### Changed
- Switched over to ubuntu based build image
- Switched over to a diff/patch approach to managing changes ot upstream content
### Added
- Added base library support for aarch64 builds
- Full feature pre-compile and builds as part of docker image priming and testbuilds using sample scripts

## [2.4.62] - 2023-02-28
### Changed
- Undefined NET_PROTO_LACP
- Code owners changed to Cray-Management-Systems

## [2.4.61] - 2022-12-20
### Added
- Add Artifactory authentication to Jenkinsfile

## [2.4.60] - 2021-08-31
- Released into csm-1.2

[Unreleased]: https://github.com/Cray-HPE/ipxe-tpsw-clone/compare/v4.0.0...HEAD
[4.0.0]: https://github.com/Cray-HPE/ipxe-tpsw-clone/compare/v3.0.0...v4.0.0
[3.0.0]: https://github.com/Cray-HPE/ipxe-tpsw-clone/compare/v2.4.62...v3.0.0
[2.4.62]: https://github.com/Cray-HPE/ipxe-tpsw-clone/compare/v2.4.61...2.4.62
[2.4.61]: https://github.com/Cray-HPE/ipxe-tpsw-clone/compare/v2.4.60...2.4.61	

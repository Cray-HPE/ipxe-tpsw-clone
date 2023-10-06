# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Changed
- Disabled concurrent Jenkins builds on same branch/commit
- Added build timeout to avoid hung builds

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

[Unreleased]: https://github.com/Cray-HPE/ipxe-tpsw-clone/compare/v2.4.62...HEAD
[2.4.62]: https://github.com/Cray-HPE/ipxe-tpsw-clone/compare/v2.4.61...2.4.62
[2.4.61]: https://github.com/Cray-HPE/ipxe-tpsw-clone/compare/v2.4.60...2.4.61	
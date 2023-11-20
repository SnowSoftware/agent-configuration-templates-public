# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).  
This project only uses dates (yyyy-mm-dd) to track changes.

## [Unreleased]

## 2023-11-20 - Initial Release

### Added

- Moved configuration templates from docs.snowsoftware.com to github

### Fixed

- `./unix/snowagent.config` - changed `scan.software.srv4` to `scan.software.svr4`
- `./unix/AIX/snowagent.config` - changed `scan.software.srv4` to `scan.software.svr4`
- `./unix/HPUX/snowagent.config` - changed `scan.software.srv4` to `scan.software.svr4`
- `./unix/Solaris/snowagent.config` - changed `scan.software.srv4` to `scan.software.svr4`
- `./windows/snowagent.config` - changed schedule `TimeOfDay` to time format

### Removed

- `./windows/snowagent.config` - removed `saas.ie11.enabled` setting, which was removed in Snow Inventory Agent for Windows 6.10.0.
- `./macos/snowagent.config` - removed `saas.ie11.enabled` setting what never was a viable MacOS option.

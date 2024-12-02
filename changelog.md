# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).  
This project only uses dates (yyyy-mm-dd) to track changes.

## 2024-11-22

### Changed

- `snowagent.config.xsd` - added the system setting `process_affinity`, introduced with Snow Inventory Agent for Windows 7.2.0 .

## 2024-11-19

### Added

- Added the `snowagent.config.xsd` file in the [./schemas/v1.0.0](./schemas/v1.0.0/) folder to allow validation of agent configuration files.
- Added details about schema validation to the `README.md`.

### Changed

- Updated Snow Docs links in `README.md`.

## 2024-01-03

### Changed

- Added `.gitattributes` file to handle line endings of config files the same over all platforms

- `./windows/snowagent.config` - updated xml namespace to prevent Inventory Server Errors
- `./macos/snowagent.config` - reverted xml namespace to prevent Inventory Server Errors
- `./linux/snowagent.config` - reverted xml namespace to prevent Inventory Server Errors
- `./unix/snowagent.config` - reverted xml namespace to prevent Inventory Server Errors
- `./windows/snowagent.config` - changed encoding from UTF-8-BOM to UTF-8

## 2023-11-30 - Initial Release

### Added

- Moved configuration templates from docs.snowsoftware.com to github
- `./windows/snowagent.config` - added xml namespace

### Changed

- `./windows/snowagent.config` - changed schedule `TimeOfDay` to the preferred and easier to read time format. The duration format is still supported.
- `./windows/snowagent.config` - changed `Logging` > `Level` to verbose and `Logging` > `MaxSize` to 10240 to align all default configurations and allow easier troubleshooting.
- `./macos/snowagent.config` - changed `Logging` > `Level` to verbose and `Logging` > `MaxSize` to 10240 to align all default configurations and allow easier troubleshooting.
- `./macos/snowagent.config` - updated xml namespace
- `./linux/snowagent.config` - updated xml namespace
- `./unix/snowagent.config` - updated xml namespace

### Removed

- `./windows/snowagent.config` - removed `saas.ie11.enabled` setting, which was removed in Snow Inventory Agent for Windows 6.10.0.
- `./macos/snowagent.config` - removed `saas.ie11.enabled` setting what never was an MacOS option.
- `./unix/snowagent.config` - removed `scan.software.svr4`, `software.scan.ips`, `software.scan.lpp` and `software.scan.sd` as they are defaulting to true and only executed on the specific operating system.

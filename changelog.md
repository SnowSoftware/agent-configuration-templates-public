# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).  
This project only uses dates (yyyy-mm-dd) to track changes.

## 2026-01-14

### Changed

- `snowagent.config.xsd`
  - added the system settings `software.scan.exclude_on_demand` and `software.scan.exclude_projected_fs`, introduced with Snow Inventory Agent for Windows 7.5.0 and Snow Inventory Agent for MacOs 7.3.0.

## 2025-10-06

### Changed

- `snowagent.config.xsd`
  - added the Oracle settings `CommonOsGroup`, `FileSystemSecurityModule`, `UseMixedCredentials`, `EnableEbsScanning` introduced with Snow Inventory Agent for Windows 7.4.0, Snow Inventory Agent for Linux 7.4.0 and Snow Inventory Agent for Unix 8.3.0
  - added the Oracle settings `CommonOsGroup`, `FileSystemSecurityModule`, `UseMixedCredentials`, `EnableEbsScanning`, introduced with Snow Inventory Agent for Windows 7.4.0, Snow Inventory Agent for Linux 7.4.0 and Snow Inventory Agent for Unix 8.3.0
  - added the settings `SnowInventoryJavascanner`, `SnowInventoryOracleHardwareScanner` and `SnowInventoryOracleMiddlewareScanner`, introduced with Snow Inventory Agent for Windows 7.4.0, Snow Inventory Agent for Linux 7.4.0 and Snow Inventory Agent for Unix 8.3.0
  - added the system settings `saas.all_managed`, `saas.allow_list.force_updates`, `saas.allow_list.update_interval`, introduced with Snow Inventory Agent for Windows 7.3.0, Snow Inventory Agent for MacOS 7.2.0

- `readme.md`
  - Links updated
  - Windows defaults updated
  - MacOs defaults updated

## 2025-09-25

### Changed

- `./windows/snowagent.config`
  - Included example configuration for Snow Inventory Oracle Middleware Scanner, Snow Inventory Java Scanner and Snow Inventory Hardware Scanner
  - Updated Snow Invenory Oracle Scanner configuration example
- `./linux/snowagent.config`
  - Included example configuration for Snow Inventory Oracle Middleware Scanner, Snow Inventory Java Scanner and Snow Inventory Hardware Scanner
  - Updated Snow Invenory Oracle Scanner configuration example
- `./unix/snowagent.config`
  - Included example configuration for Snow Inventory Oracle Middleware Scanner, Snow Inventory Java Scanner and Snow Inventory Hardware Scanner
  - commented out Snow Inventory Oracle Scanner configuration to unify setup over all configuration examples
  - Updated Snow Inventory Oracle Scanner configuration example

## 2025-09-23

### Changed

- `./linux/snowagent.config` - added Agent default install directory to the scan

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

# agent-configuration-templates-public

Here you can find the latest templates for the Snow Inventory Agent.

> [!WARNING]  
> An incorrect configuration will result in the agent not working.
>
> The templates are only templates. They are not “best practice” configurations, and they are not meant to work in any and every scenario.

> [!IMPORTANT]  
> It is mandatory to have adequate knowledge of the contents of the following documentation before using the configuration file templates:  
> [Snow Docs: Compatibility Matrix - Snow Inventory Agents](https://docs.snowsoftware.io/other-snow-products/snow-inventory-agents-and-oracle-scanners/compatibility-matrix/)  
> [Snow Docs: Configuration of Snow Inventory Agents](https://docs.snowsoftware.io/other-snow-products/snow-inventory-agents-and-oracle-scanners/configuration-of-snow-inventory-agents/agent-configuration-file/)  
> [Snow Docs: Configuration Reference](https://docs.snowsoftware.com/documentation-resources/snow-inventory/configuration-doc.html)  
> [Snow Docs: Snow Inventory Agent for Windows](https://docs.snowsoftware.io/other-snow-products/snow-inventory-agents-and-oracle-scanners/snow-inventory-agent-for-windows/)  
> [Snow Docs: Snow Inventory Agent for Linux](https://docs.snowsoftware.io/other-snow-products/snow-inventory-agents-and-oracle-scanners/snow-inventory-agent-for-linux/)  
> [Snow Docs: Snow inventory Agent for macOs](https://docs.snowsoftware.io/other-snow-products/snow-inventory-agents-and-oracle-scanners/snow-inventory-agent-for-macos/)  
> [Snow Docs: Snow Inventory Agent for Unix](https://docs.snowsoftware.io/other-snow-products/snow-inventory-agents-and-oracle-scanners/snow-inventory-agent-for-unix/)  
> [Snow Docs: Snow Inventory Oracle Scanner](https://docs.snowsoftware.io/other-snow-products/snow-inventory-agents-and-oracle-scanners/snow-inventory-oracle-scanner/)  
> [Snow Docs: System Requirements - Snow Inventory Agents and Oracle Scanners](https://docs.snowsoftware.io/other-snow-products/snow-inventory-agents-and-oracle-scanners/system-requirements/)  
> [Snow Docs: About Package Builder](https://docs.snowsoftware.io/other-snow-products/snow-inventory-agents-and-oracle-scanners/system-requirements/)  
> [Snow Globe: Inventory Agent Exclusions](https://community.snowsoftware.com/s/article/Inventory-Agent-Exclusions)  

## Template files

- [Windows](/windows/snowagent.config)
- [Linux](/linux/snowagent.config)
- [macOs](/macos/snowagent.config)
- [Unix](/unix/snowagent.config)

## How to use these templates

1. Make sure you have an adequate understanding of the agent configuration and information about the environment the agent will be used in. See the list of mandatory documentation above. If unsure, use the [Snow Inventory Admin Console](https://docs.snowsoftware.io/other-snow-products/snow-inventory-server/snow-inventory-server-admin-console/) to generate the agent configuration and then export it, or reach out to Snow Support via [Snow Support Hub](https://community.snowsoftware.com/s/support-hub). Note that the Snow Inventory Admin Console comes with Snow Inventory and is only available for on-premises customers.  
1. Enter all relevant information into the configuration file. Note that if you need to generate a configuration with passwords, you must use the Snow Inventory Admin Console or reach out to Snow Support.  
1. Add comments, where appropriate, to disable a section of the configuration file. Settings not defined in the configuration file will result in a default being applied. Defaults are described in [Snow Docs: Configuration of Snow Inventory Agents](https://docs.snowsoftware.io/other-snow-products/snow-inventory-agents-and-oracle-scanners/configuration-of-snow-inventory-agents/agent-configuration-file/) or the [Default behavior](#default-behavior) section of this page.  
1. Remove any unused or empty sections from the configuration file.  
1. Validate the configuration file against the schema file provided in the [./schemas/] folder in this repository. Read more about using it in the [Schema validation](#schema-validation) chapter.

When the configuration file is ready, you can use it to create agent installation packages, either via [Package Builder on Snow Atlas](https://docs.snowsoftware.io/snow-atlas/user-documentation/package-builder/) or via [Snow Support Hub](https://community.snowsoftware.com/s/support-hub).

> [!Note]  
>
> - XML does not allow nested comments.  
> - XML is case-sensitive. For example, `<Oracle>` is **NOT** the same as `<oracle>`.  
> - The configuration for [Snow Inventory Oracle Middleware Scanner](https://docs.snowsoftware.io/other-snow-products/snow-inventory-agents-and-oracle-scanners/snow-inventory-oracle-middleware-scanner/), [Snow Inventory Oracle Hardware Scanner](https://docs.snowsoftware.io/other-snow-products/snow-inventory-agents-and-oracle-scanners/snow-inventory-oracle-hardware-scanner/) and [Snow Inventory Java Scanner](https://docs.snowsoftware.io/other-snow-products/snow-inventory-agents-and-oracle-scanners/snow-inventory-java-scanner/) is not part of the Snow Inventory Agent configuration file.
> - Test the configuration before deploying it in the infrastructure. Every environment is different.

## Schema validation

This repository contains XSD files in the [./schemas](./schemas/) folder. XSD files are used to validate XML files, like the Agent configuration. Different tools offer different functionality for this task.

- [Visual Studio Code](https://code.visualstudio.com/): This repository already contains files to configure VSCode, which are located in the [.vscode] folder. The recommended Extension is [RedHat XML Extension](https://github.com/redhat-developer/vscode-xml/tree/main).
- [Notepad++](https://notepad-plus-plus.org/): You can use the [XMLTools](https://github.com/morbac/xmltools) Plugin, you can install with the plugin management.
- [XMLNotepad](https://microsoft.github.io/XmlNotepad/#): You can use the Microsoft XML Nptepad, which comes with schema validation.
- [xmllint](https://linux.die.net/man/1/xmllint): On linux you can use the `xmllint` command with the `--schemafile` option.

## Default behavior

Every Snow Inventory Agent has a default behavior depending on the platform. If you use an item from the list below in the configuration file, that default behavior would be removed. For `<SystemSettings>` the granularity is set to the specific `<Setting>`, for everything else it is the Node level above. For example adding one `<Software><IncludeCriteria><FileType>` will remove the default FileTypes.

### Windows

<details>
<summary>Software &gt; IncludeCriteria &gt; FileType</summary>

```xml
<Software>
    <IncludeCriteria>
      <FileType>exe</FileType>
      <FileType>wfd</FileType>
      <FileType>wfi</FileType>
      <FileType>wtd</FileType>
      <FileType>wti</FileType>
      <FileType>sys2</FileType>
      <FileType>lnk</FileType>
    </IncludeCriteria>
  </Software>
```

</details>


<details>
<summary>Registry</summary>

Please use the "Collect custom registry keys" Scanning Module referenced in [Snow Docs: Package Builder - Scanning Modules](https://docs.snowsoftware.io/snow-atlas/user-documentation/package-builder/scanning-modules/) instead of adding additional registry queries. Otherwise you will lose

- Exchange Server details
- Windows Clustering details
- Virtual Machine details

and you would need to keep them updated manually.

</details>

<details>
<summary>SystemSettings</summary>

```xml
<SystemSettings>
    <Setting key="disable_all_updates" value="false" />
    <Setting key="env.is_virtual_desktop_infrastructure" value="false" />
    <Setting key="env.powershell_timeout" value="300000" />
    <Setting key="hardware.scan.device" value="true" />
    <Setting key="hardware.scan.displayadapter" value="true" />
    <Setting key="hardware.scan.enabled" value="true" />
    <Setting key="hardware.scan.expansionslot" value="true" />
    <Setting key="hardware.scan.keyboard" value="true" />
    <Setting key="hardware.scan.logicaldisk" value="true" />
    <Setting key="hardware.scan.memory" value="true" />
    <Setting key="hardware.scan.modem" value="true" />
    <Setting key="hardware.scan.monitor" value="true" />
    <Setting key="hardware.scan.mouse" value="true" />
    <Setting key="hardware.scan.multimedia" value="true" />
    <Setting key="hardware.scan.networkadapter" value="true" />
    <Setting key="hardware.scan.pci" value="true" />
    <Setting key="hardware.scan.physicaldisk" value="true" />
    <Setting key="hardware.scan.port" value="true" />
    <Setting key="hardware.scan.printer" value="true" />
    <Setting key="hardware.scan.processor" value="true" />
    <Setting key="hardware.scan.scsi" value="true" />
    <Setting key="hardware.scan.tapedrive" value="true" />
    <Setting key="hardware.scan.usb" value="true" />
    <Setting key="http.poll_interval" value="5400" />
    <Setting key="http.poll_variance" value="1800" />
    <Setting key="http.ssl_verify" value="true" />
    <Setting key="http.timeout" value="15" />
    <Setting key="legacy_webmetering.is_enabled" value="false" />
    <Setting key="log.append" value="false" />
    <Setting key="metering.is_enabled" value="true" />
    <Setting key="powershell.enabled" value="true" />
    <Setting key="powershell.encryption_key" value="" />
    <Setting key="privacy.hide_user" value="false" />
    <Setting key="privacy.hide_ip" value="false" />
    <Setting key="saas.edge.enabled" value="true" />
    <Setting key="saas.chrome.enabled" value="true" />
    <Setting key="saas.firefox.enabled" value="true" />
    <Setting key="send.max_scan_result_backlog_count" value="90" />
    <Setting key="software.scan.add_latency" value="0" />
    <Setting key="software.scan.custominfo" value="true" />
    <Setting key="software.scan.enabled" value="true" />
    <Setting key="software.scan.environmentvariables" value="true" />
    <Setting key="software.scan.fileshare" value="true" />
    <Setting key="software.scan.fonts" value="true" />
    <Setting key="software.scan.jar" value="true" />
    <Setting key="software.scan.loginuser" value="true" />
    <Setting key="software.scan.netclient" value="true" />
    <Setting key="software.scan.netprotocol" value="true" />
    <Setting key="software.scan.ntservice" value="true" />
    <Setting key="software.scan.odbc" value="true" />
    <Setting key="software.scan.swidtags" value="true" />
    <Setting key="software.scan.userscan" value="true" />
    <Setting key="software.scan.virtualsoftwareinfo" value="true" />
    <Setting key="wmi.poll_interval" value="15" />
</SystemSettings>
```

</details>

### Linux

<details>
<summary>Software &gt; Exclude &gt; FileSystem</summary>

To get the latest list of excluded file systems, check [Snow Docs: Snow Inventory Agent for Linux - File system types not scanned by the Agent](https://docs.snowsoftware.io/other-snow-products/snow-inventory-agents-and-oracle-scanners/snow-inventory-agent-for-linux/the-scanning-process/#file-system-types-not-scanned-by-the-agent).

```xml
<Software>
    <Exclude>
        <FileSystem>binfmt_misc</FileSystem>
        <FileSystem>cifs</FileSystem>
        <FileSystem>devpts</FileSystem>
        <FileSystem>devtmpfs</FileSystem>
        <FileSystem>fuse</FileSystem>
        <FileSystem>fuse.gvfsd-fuse</FileSystem>
        <FileSystem>fuse.vmware-vmblock</FileSystem>
        <FileSystem>fuseblk</FileSystem>
        <FileSystem>nfs</FileSystem>
        <FileSystem>nfs4</FileSystem>
        <FileSystem>none</FileSystem>
        <FileSystem>panfs</FileSystem>
        <FileSystem>proc</FileSystem>
        <FileSystem>rpc-pipes</FileSystem>
        <FileSystem>smbfs</FileSystem>
        <FileSystem>sysfs</FileSystem>
        <FileSystem>tmpfs</FileSystem>
        <FileSystem>vmblock</FileSystem>
        <FileSystem>vmhgfs</FileSystem>
    </Exclude>
</Software>
```

</details>

<details>
<summary>SystemSettings</summary>

```xml
<SystemSettings>
    <Setting key="disable_all_updates" value="false" />
    <Setting key="env.allowonlyonescanperday" value="false"/>
    <Setting key="env.data_dir" value="data/"/>
    <Setting key="env.log_dir" value="data/"/>
    <Setting key="env.temp_dir" value="/tmp/snow/"/>
    <Setting key="http.ssl_verify" value="true" />
    <Setting key="http.timeout" value="15" />
    <Setting key="log.append" value="false" />
    <Setting key="send.max_scan_result_backlog_count" value="90"/>
    <Setting key="software.scan.add_latency" value="0" />
    <Setting key="software.scan.dpkg" value="false" />
    <Setting key="software.scan.ignore_autofs_mounts" value="false" />
    <Setting key="software.scan.ignore_bind_mounts" value="false" />
    <Setting key="software.scan.jar" value="true" />
    <Setting key="software.scan.rpm" value="false" />
    <Setting key="software.scan.running_processes" value="true" />

</SystemSettings>
```
</details>

### MacOs

<details>
<summary>Software &gt; Exclude &gt; FileSystem</summary>

To get the latest list of excluded file systems, check [Snow Docs: Snow Inventory Agent for MacOs - File system types not scanned by the Agent](https://docs.snowsoftware.io/other-snow-products/snow-inventory-agents-and-oracle-scanners/snow-inventory-agent-for-macos/the-scanning-process/#file-system-types-not-scanned-by-the-agent).

```xml
<Software>
    <Exclude>
        <FileSystem>cifs</FileSystem>
        <FileSystem>nfs4</FileSystem>
        <FileSystem>devfs</FileSystem>
        <FileSystem>none</FileSystem>
        <FileSystem>fuseblk</FileSystem>
        <FileSystem>smbfs</FileSystem>
        <FileSystem>mtmfs</FileSystem>
        <FileSystem>vmhgfs</FileSystem>
        <FileSystem>nfs</FileSystem>
        <FileSystem>devfs</FileSystem>
    </Exclude>
</Software>
```

</details>

<details>
<summary>SystemSettings</summary>

```xml
<SystemSettings>
    <Setting key="disable_all_updates" value="false" />
    <Setting key="env.allowonlyonescanperday" value="false"/>
    <Setting key="env.data_dir" value="data/"/>
    <Setting key="env.log_dir" value="data/"/>
    <Setting key="env.temp_dir" value="/tmp/snow/"/>
    <Setting key="http.ssl_verify" value="false" />
    <Setting key="http.timeout" value="15" />
    <Setting key="log.append" value="false" />
    <Setting key="privacy.hide_ip" value="false" />
    <Setting key="privacy.hide_user" value="false" />
    <Setting key="saas.edge.enabled" value="true" />
    <Setting key="saas.chrome.enabled" value="true" />
    <Setting key="saas.chrome.enterprise.installation" value="true" />
    <Setting key="saas.firefox.enabled" value="true" />
    <Setting key="send.max_scan_result_backlog_count" value="90"/>
    <Setting key="software.scan.add_latency" value="0" />
    <Setting key="software.scan.jar" value="true" />
</SystemSettings>
```

</details>

### Unix

<details>
<summary>Software &gt; IncludeCriteria &gt; FileType</summary>

```xml
<Software>
    <IncludeCriteria>
        <FileType>ELF*executable*</FileType>
        <FileType>64-bit XCOFF executable*</FileType>
        <FileType>executable (RISC System/6000)*</FileType>
        <FileType>PA-RISC*executable*</FileType>
        <FileType>java*</FileType>
    </IncludeCriteria>
</Software>
```

</details>

<details>
<summary>Software &gt; Exclude &gt; Path</summary>

```xml
<Software>
    <Exclude>
        <Path>/tmp*</Path>
        <Path>/var/tmp*</Path>
        <Path>*.au</Path>
        <Path>*.bmp</Path>
        <Path>*.bmu</Path>
        <Path>*.cfg</Path>
        <Path>*.class</Path>
        <Path>*.conf</Path>
        <Path>*.csm</Path>
        <Path>*.css</Path>
        <Path>*.dic</Path>
        <Path>*.enc</Path>
        <Path>*.gif</Path>
        <Path>*.h</Path>
        <Path>*.htm</Path>
        <Path>*.html</Path>
        <Path>*.jpg</Path>
        <Path>*.js</Path>
        <Path>*.log</Path>
        <Path>*.mo</Path>
        <Path>*.mof</Path>
        <Path>*.packlist</Path>
        <Path>*.pcf</Path>
        <Path>*.pc</Path>
        <Path>*.pf</Path>
        <Path>*.pl</Path>
        <Path>*.png</Path>
        <Path>*.po</Path>
        <Path>*.properties</Path>
        <Path>*.rdf</Path>
        <Path>*.sdl</Path>
        <Path>*.so</Path>
        <Path>*.sql</Path>
        <Path>*.ttf</Path>
        <Path>*.txe</Path>
        <Path>*.txt</Path>
        <Path>*.utf8</Path>
        <Path>*.xml</Path>
        <Path>*.xpt</Path>
        <Path>*.zip</Path>
        <Path>*/oracle/*/audit*</Path>
    </Exclude>
</Software>
```

</details>

<details>
<summary>SystemSettings</summary>

```xml
<SystemSettings>
    <Setting key="disable_all_updates" value="false" />
    <Setting key="env.allowonlyonescanperday" value="false"/>
    <Setting key="env.data_dir" value="data/"/>
    <Setting key="env.log_dir" value="data/"/>
    <Setting key="env.temp_dir" value="/tmp/snow/"/>
    <Setting key="http.ssl_verify" value="true" />
    <Setting key="http.timeout" value="15" />
    <Setting key="log.append" value="false" />
    <Setting key="privacy.hide_ip" value="false" />
    <Setting key="privacy.hide_user" value="false" />
    <Setting key="send.max_scan_result_backlog_count" value="90"/>
    <Setting key="software.scan.add_latency" value="0" />
    <Setting key="software.scan.ips" value="true" />
    <Setting key="software.scan.lpp" value="true" />
    <Setting key="software.scan.running_processes" value="true" />
    <Setting key="software.scan.sd" value="true" />
    <Setting key="software.scan.svr4" value="true" />
</SystemSettings>
```

</details>

---

## Who is Flexera?

Flexera is the global leader in technology intelligence solutions, ensuring that organizations drive the maximum value from their technology investments. Over 4,000 organizations rely on Flexera to provide complete visibility, optimize usage and spend, and minimize regulatory risk.
Find us on [www.flexera.com](https://www.flexera.com)

## Contribution

If you want to contribute or suggest a change, create an idea on our [ideas portal](https://ideas.snowsoftware.com).  

&copy; Flexera 2023 - 2024, All rights reserved.

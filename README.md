# agent-configuration-templates-public

Here you can find the latest templates for the Snow Inventory Agent.

> [!WARNING]  
> AN INCORRECT CONFIGURATION WILL RESULT IN THE SNOW INVENTORY AGENT NOT WORKING!  
>  
> This templates are just templates, and no "best practice" configurations and not build to work in any and every scenario!  


> [!IMPORTANT]  
> Mandatory documentation you need to know:  
> [Snow Docs: Configuration of Snow Inventory Agents](https://docs.snowsoftware.com/snow-inventory/en/UUID-c54938ea-877f-3e63-7948-57b1e654802f.html)  
> [Snow Docs: Configuration Reference](https://docs.snowsoftware.com/documentation-resources/snow-inventory/configuration-doc.html)  
> [Snow Docs: Snow Inventory Agent for Windows](https://docs.snowsoftware.com/snow-inventory/en/UUID-a4ceda3e-9084-0bd8-c9c5-625964ee8e77.html)  
> [Snow Docs: Snow Inventory Agent for Linux](https://docs.snowsoftware.com/snow-inventory/en/UUID-8143d4ba-088a-9fb8-c791-95e62b3e7ee4.html)  
> [Snow Docs: Snow inventory Agent for MacOs](https://docs.snowsoftware.com/snow-inventory/en/UUID-8f964073-e34f-01c6-e57c-76e648b015e8.html)  
> [Snow Docs: Snow Inventory Agent for Unix](https://docs.snowsoftware.com/snow-inventory/en/UUID-93e9e6c7-33a0-0c85-c826-78f164c001ec.html)  
> [Snow Globe: Inventory Agent Exclusions](https://community.snowsoftware.com/s/article/Inventory-Agent-Exclusions)  

## Template Files

- [Windows](/windows/snowagent.config)
- [Linux](/linux/snowagent.config)
- [MacOs](/macos/snowagent.config)
- [Unix](/unix/snowagent.config)
- [AIX](/unix/AIX/snowagent.config)
- [HPUX](/unix/HPUX/snowagent.config)
- [Solaris](/unix/Solaris/snowagent.config)

## How to use these templates

1. make sure, you have appropriate understanding of the agent configuration and information about the environment the agent will be used in  
    1. if unsure, use the Snow Inventory Admin Console to generate the agent configuration and then export it or reach out to [Snow Support Hub](https://community.snowsoftware.com/s/support-hub).  
1. fill all relevant information into the configuration file  
1. if you need to generate configuration with passwords, you NEED to use the Snow Inventory Admin Console tor reach out to Snow Support.  
1. (they will be encrypted and the Admin Console is the only tool available for that)  
1. remove the unused/empty sections (usually you don't want to have `<tags>` open and closed without content)  
1. check the commented sections, remove comments where appropriate to enable that section of the configuration, add comments to disable it. Settings not defined in the configuration file will result in default described in [Snow Docs: Configuration of Snow Inventory Agents](https://docs.snowsoftware.com/snow-inventory/en/UUID-c54938ea-877f-3e63-7948-57b1e654802f.html) or (default behaviour)[#Default-behaviour] beeing applied  
1. xml does not allow nested comments
1. xml is case sensitive (`<Oracle>` is **NOT** the same as `<oracle>`)  

When the configuration is ready, you can use it on your own in the [Package Builder on Snow Atlas](https://docs.snowsoftware.com/snow-atlas/en/UUID-7a0f8e25-6f02-b787-057d-ddf03c886e9c.html) or send it to our [Snow Support Hub](https://community.snowsoftware.com/s/support-hub) to get the latest Snow Inventory Agent.

## Default behavior

Every Snow Inventory Agents has a default behavior depending on the platform. If you use such item in the configuration file, that default behavior would be removed. For `<SystemSettings>` the granularity is set to the specific `<Setting>`, for everything else it is the Node (i.e. ) above.

### Windows

<details>

<summary>&lt;Registry&gt;</summary>

Please use the "Collect custom registry keys" Scanning Module referenced in [Snow Docs: Package Builder - Scanning Modules](https://docs.snowsoftware.com/snow-atlas/en/UUID-fbea6041-f6ea-480b-2b10-292936b39f46.html#UUID-fbea6041-f6ea-480b-2b10-292936b39f46_section-idm423333219851216) instead of adding additional registry queries. You will lose:

- SQL Server details
- Exchange Server details
- Windows Clustering details
- Virtual Machine details

</details>

<details>

<summary>&lt;SystemSettings&gt;</summary>

```xml
<SystemSettings>
    <Setting key="env.is_virtual_desktop_infrastructure" value="false" />
    <Setting key="http.poll_interval" value="60" />
    <Setting key="http.poll_variance" value="0" />
    <Setting key="wmi.poll_interval" value="15" />
    <Setting key="send.max_scan_result_backlog_count" value="90" />
    <Setting key="http.ssl_verify" value="true" />
    <Setting key="env.powershell_timeout" value="300000" />
    <Setting key="log.append" value="false" />
    <Setting key="metering.is_enabled" value="true" />
    <Setting key="software.scan.enabled" value="true" />
    <Setting key="software.scan.custominfo" value="true" />
    <Setting key="software.scan.virtualsoftwareinfo" value="true" />
    <Setting key="software.scan.fonts" value="true" />
    <Setting key="software.scan.loginuser" value="true" />
    <Setting key="software.scan.netclient" value="true" />
    <Setting key="software.scan.netprotocol" value="true" />
    <Setting key="software.scan.ntservice" value="true" />
    <Setting key="software.scan.odbc" value="true" />
    <Setting key="software.scan.swidtags" value="true" />
    <Setting key="software.scan.userscan" value="true" />
    <Setting key="software.scan.fileshare" value="true" />
    <Setting key="software.scan.environmentvariables" value="true" />
    <Setting key="hardware.scan.enabled" value="true" />
    <Setting key="hardware.scan.networkadapter" value="true" />
    <Setting key="hardware.scan.device" value="true" />
    <Setting key="hardware.scan.displayadapter" value="true" />
    <Setting key="hardware.scan.expansionslot" value="true" />
    <Setting key="hardware.scan.keyboard" value="true" />
    <Setting key="hardware.scan.logicaldisk" value="true" />
    <Setting key="hardware.scan.memory" value="true" />
    <Setting key="hardware.scan.modem" value="true" />
    <Setting key="hardware.scan.monitor" value="true" />
    <Setting key="hardware.scan.mouse" value="true" />
    <Setting key="hardware.scan.multimedia" value="true" />
    <Setting key="hardware.scan.pci" value="true" />
    <Setting key="hardware.scan.physicaldisk" value="true" />
    <Setting key="hardware.scan.port" value="true" />
    <Setting key="hardware.scan.processor" value="true" />
    <Setting key="hardware.scan.scsi" value="true" />
    <Setting key="hardware.scan.tapedrive" value="true" />
    <Setting key="hardware.scan.usb" value="true" />
    <Setting key="hardware.scan.printer" value="true" />
</SystemSettings>
```

</details>

### Linux

<details>
<summary>&lt;Software&gt;&lt;Exclude&gt;&lt;FileSystem&gt;</summary>

To get the latest list of excluded files ystems, check [Snow Docs: Snow Inventory Agent for Linux - File system types not scanned by the Agent](https://docs.snowsoftware.com/snow-inventory/en/UUID-062baded-c442-e50e-2cd0-102c15e8e64b.html#UUID-062baded-c442-e50e-2cd0-102c15e8e64b_section-idm4662919877684832573844085199).

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

<summary>&lt;SystemSettings&gt;</summary>

```xml
<SystemSettings>
    <Setting key="env.data_dir" value="data/"/>
    <Setting key="env.log_dir" value="data/"/>
    <Setting key="env.temp_dir" value="/tmp/snow/"/>
    <Setting key="send.max_scan_result_backlog_count" value="90"/>
    <Setting key="http.ssl_verify" value="false" />
    <Setting key="env.allowonlyonescanperday" value="false"/>
    <Setting key="log.append" value="false" />
</SystemSettings>
```
</details>

### MacOs

<details>

<summary>&lt;SystemSettings&gt;</summary>

```xml
<SystemSettings>
    <Setting key="env.data_dir" value="data/"/>
    <Setting key="env.log_dir" value="data/"/>
    <Setting key="env.temp_dir" value="/tmp/snow/"/>
    <Setting key="send.max_scan_result_backlog_count" value="90"/>
    <Setting key="http.ssl_verify" value="false" />
    <Setting key="env.allowonlyonescanperday" value="false"/>
    <Setting key="log.append" value="false" />
</SystemSettings>
```

</details>

### Unix

<details>

<summary>&lt;Software&gt;&lt;IncludeCriteria&gt;</summary>

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

<summary>&lt;Software&gt;&lt;Exclude&gt;</summary>

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

<summary>&lt;SystemSettings&gt;</summary>

```xml
<SystemSettings>
    <Setting key="env.data_dir" value="data/"/>
    <Setting key="env.log_dir" value="data/"/>
    <Setting key="env.temp_dir" value="/tmp/snow/"/>
    <Setting key="send.max_scan_result_backlog_count" value="90"/>
    <Setting key="http.ssl_verify" value="false" />
    <Setting key="env.allowonlyonescanperday" value="false"/>
    <Setting key="log.append" value="false" />
</SystemSettings>
```
</details>

---

## Who is Snow Software?

Snow Software is the global leader in technology intelligence solutions, ensuring that organizations drive the maximum value from their technology investments. Over 4,000 organizations rely on Snow to provide complete visibility, optimize usage and spend, and minimize regulatory risk.
Find us on https://www.snowsoftware.com
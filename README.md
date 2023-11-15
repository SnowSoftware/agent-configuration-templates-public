# agent-configuration-templates-public

Here you can find the latest templates for the Snow Inventory Agent.

> [!WARNING]  
> An incorrect configuration will result in the agent not working.
>
> The templates are only templates. They are not “best practice” configurations, and they are not meant to work in any and every scenario.

> [!IMPORTANT]  
> It is mandatory to have adequate knowledge of the contents of the following documentation before using the configuration file templates:  
> [Snow Docs: Compatibility Matrix - Snow Inventory Agents](https://docs.snowsoftware.com/snow-compatibility-matrix/en/UUID-4d460220-56ef-9cc4-9ffe-ddd76ba92189.html)  
> [Snow Docs: Configuration of Snow Inventory Agents](https://docs.snowsoftware.com/snow-inventory-agents-and-oracle-scanners/en/UUID-c54938ea-877f-3e63-7948-57b1e654802f.html)  
> [Snow Docs: Configuration Reference](https://docs.snowsoftware.com/documentation-resources/snow-inventory/configuration-doc.html)  
> [Snow Docs: Snow Inventory Agent for Windows](https://docs.snowsoftware.com/snow-inventory-agents-and-oracle-scanners/en/UUID-a4ceda3e-9084-0bd8-c9c5-625964ee8e77.html)  
> [Snow Docs: Snow Inventory Agent for Linux](https://docs.snowsoftware.com/snow-inventory-agents-and-oracle-scanners/en/UUID-8143d4ba-088a-9fb8-c791-95e62b3e7ee4.html)  
> [Snow Docs: Snow inventory Agent for macOs](https://docs.snowsoftware.com/snow-inventory-agents-and-oracle-scanners/en/UUID-8f964073-e34f-01c6-e57c-76e648b015e8.html)  
> [Snow Docs: Snow Inventory Agent for Unix](https://docs.snowsoftware.com/snow-inventory-agents-and-oracle-scanners/en/UUID-93e9e6c7-33a0-0c85-c826-78f164c001ec.html)  
> [Snow Docs: Snow Inventory Oracle Scanner](https://docs.snowsoftware.com/snow-inventory-agents-and-oracle-scanners/en/UUID-a4e6b99f-a81d-42fd-5bb6-ebcf6dcb0e63.html)  
> [Snow Docs: System Requirements - Snow Inventory Agents and Oracle Scanners](https://docs.snowsoftware.com/snow-system-requirements/en/UUID-5e67847f-6c9b-5432-aa51-0fd32d9ce96c.html)  
> [Snow Docs: System Requirements for the Package Builder](https://docs.snowsoftware.com/snow-system-requirements/en/UUID-bf9d536d-bae2-2f07-2857-11ad85beee74.html)  
> [Snow Globe: Inventory Agent Exclusions](https://community.snowsoftware.com/s/article/Inventory-Agent-Exclusions)  

## Template files

- [Windows](/windows/snowagent.config)
- [Linux](/linux/snowagent.config)
- [macOs](/macos/snowagent.config)
- [Unix](/unix/snowagent.config)
  - [AIX](/unix/AIX/snowagent.config)
  - [HP-UX](/unix/HPUX/snowagent.config)
  - [Solaris](/unix/Solaris/snowagent.config)

## How to use these templates

1. Make sure you have an adequate understanding of the agent configuration and information about the environment the agent will be used in. See the list of mandatory documentation above. If unsure, use the [Snow Inventory Admin Console](https://docs.snowsoftware.com/snow-inventory-server/en/UUID-fdeec059-89bb-401e-5763-5719e89c79c2.html) to generate the agent configuration and then export it, or reach out to Snow Support via [Snow Support Hub](https://community.snowsoftware.com/s/support-hub). Note that the Snow Inventory Admin Console comes with Snow Inventory and is only available for on-premises customers.  
1. Enter all relevant information into the configuration file. Note that if you need to generate a configuration with passwords, you must use the Snow Inventory Admin Console or reach out to Snow Support.  
1. Add comments, where appropriate, to disable a section of the configuration file. Settings not defined in the configuration file will result in a default being applied- Defaults are described in [Snow Docs: Configuration of Snow Inventory Agents](https://docs.snowsoftware.com/snow-inventory-agents-and-oracle-scanners/en/UUID-c54938ea-877f-3e63-7948-57b1e654802f.html) or the [Default behavior](#default-behavior) section of this page.  
1. Remove any unused or empty sections from the configuration file.  

When the configuration file is ready, you can use it to create agent installation packages, either via [Package Builder on Snow Atlas](https://docs.snowsoftware.com/snow-atlas/en/UUID-7a0f8e25-6f02-b787-057d-ddf03c886e9c.html) or via [Snow Support Hub](https://community.snowsoftware.com/s/support-hub).

> [!Note]  
>
> - XML does not allow nested comments.  
> - XML is case-sensitive. For example, `<Oracle>` is **NOT** the same as `<oracle>`.  
> - The configuration for [Snow Inventory Oracle Middleware Scanner](https://docs.snowsoftware.com/snow-inventory-agents-and-oracle-scanners/en/UUID-7526d097-e486-f798-328f-b3aa7a5da385.html), [Snow Inventory Oracle Hardware Scanner](https://docs.snowsoftware.com/snow-inventory-agents-and-oracle-scanners/en/UUID-8f7ce834-805a-1a8b-6569-537844460727.html) and [Snow Inventory Java Scanner](https://docs.snowsoftware.com/snow-inventory-agents-and-oracle-scanners/en/UUID-29ad3c06-f149-1af4-c8b2-9b4de9e947f9.html) is not part of the Snow Inventory Agent configuration file.
> - Test the configuration before deploying it in the infrastructure. Every environment is different.

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

Please use the "Collect custom registry keys" Scanning Module referenced in [Snow Docs: Package Builder - Scanning Modules](https://docs.snowsoftware.com/snow-atlas/en/UUID-fbea6041-f6ea-480b-2b10-292936b39f46.html#UUID-fbea6041-f6ea-480b-2b10-292936b39f46_section-idm423333219851216) instead of adding additional registry queries. Otherwise you will lose

- Exchange Server details
- Windows Clustering details
- Virtual Machine details

and you would need to keep them updated manually.

</details>

<details>
<summary>SystemSettings</summary>

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
<summary>Software &gt; Exclude &gt; FileSystem</summary>

To get the latest list of excluded file systems, check [Snow Docs: Snow Inventory Agent for Linux - File system types not scanned by the Agent](https://docs.snowsoftware.com/snow-inventory-agents-and-oracle-scanners/en/UUID-062baded-c442-e50e-2cd0-102c15e8e64b.html#UUID-062baded-c442-e50e-2cd0-102c15e8e64b_section-idm4662919877684832573844085199).

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
<summary>Software &gt; Exclude &gt; FileSystem</summary>

To get the latest list of excluded file systems, check [Snow Docs: Snow Inventory Agent for MacOs - File system types not scanned by the Agent](https://docs.snowsoftware.com/snow-inventory-agents-and-oracle-scanners/en/UUID-8adaed67-35d2-c537-46a5-f809fab188b7.html#UUID-8adaed67-35d2-c537-46a5-f809fab188b7_section-idm4555670506516832575095009411).

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

### Unix (AIX, HP-UX, Solaris)

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
Find us on [www.snowsoftware.com](https://www.snowsoftware.com)

## Contribution

If you want to contribute or suggest a change, create an idea on our [ideas portal](https://ideas.snowsoftware.com).  

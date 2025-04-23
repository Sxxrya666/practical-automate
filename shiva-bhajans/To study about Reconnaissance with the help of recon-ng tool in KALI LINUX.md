**Aim:** To study about Reconnaissance with the help of recon-ng tool in KALI LINUX.

**Learning Objective:** To understand **Reconnaissance** using recon-ng in KALI LINUX.

**Theory:**

**Recon-ng Information Gathering Tool in Kali Linux**
In Kali Linux, **Recon-ng** is a **free** and **open-source** tool available on **GitHub.** Recon-ng is built on **Open-Source Intelligence (OSINT** ), the most simple and effective reconnaissance tool. Recon-ng UI is fairly similar to that of **Metasploit 1** and **Metasploit 2**. On kali Linux, we can use Recon-ng to execute a **command-line** interface. We can use this tool to obtain our **target (domain** ) information. The interactive console has a variety of useful features, including **command completion** and **contextual help**. This tool is written in **Python.** It contains numerous modules such as **database interaction, interactive help, command completion** , Recon-ng that offer a powerful environment where **open-source** web-based reconnaissance can be performed, and we can collect any information.

**Features of Recon-ng**

- Recon-ng is a comprehensive set of information gathering modules. It features a large number of modules that can be used to gather information.
- Recon-ng is a simple and effective reconnaissance tool.
- Recon-ng is a free and open-source tool that we can download and use without charge.
- Recon-ng is a tool for gathering information and assessing the vulnerability of web applications.
- Pentesters will find it easier to work with Recon-ng because it can target a single domain and find all of its subdomains.
- In order to scan IoT devices, Recon-ng uses the Shodan search engine.
- The interactive console of Recon-ng's offers a number of useful features.
- ng is a powerful tool for finding flaws in the code of web apps and websites.
- ng works and acts as a web application/website scanner.
- The interface of Recon-ng is much similar to metasploitable 1 and metasploitable 2, making it simple to use.
- The modules of Recon-ng are as follows: Geoip lookup, banner grabbing, DNS lookup, and port scanning. These modules make this tool extremely powerful.

**How to use Recon-ng:**

#### Create a Workspace

The command **recon-ng -w example_name** opens or returns directly to that workspace.

```shell
[recon-ng][default]> workspaces create test
[recon-ng][test]>
```

#### Recon-ng Marketplace and Modules

Here again the help comes in marketplace help shows commands for removing modules, how to find more info, search, refresh and install.

```shell
[recon-ng][test]> marketplace install hackertarget
[recon-ng][test][hackertarget]> marketplace help
```

Interfaces with the module marketplace

Usage: marketplace info|install|refresh|remove|search [...]

**Recon-ng modules**
Modules are grouped together under various categories and can be found searching on marketplace

- Discovery
- Exploitation
- Import
- Recon
- reporting

```shell
[recon-ng][example_name]> marketplace search
[recon-ng][default]> marketplace search ssl
```

```shell
[recon-ng][default]> marketplace info ssltools
```

```shell
[recon-ng][test][hackertarget]> options set SOURCE tesla.com
```

```shell
[recon-ng][test][hackertarget]> info
```

**Learning Outcome:** Performed Reconnaissance using recon-ng tool in KALI LINUX.

**Conclusion:**
This experiment demonstrates the use of Recon-ng in Kali Linux for conducting Open-Source Intelligence reconnaissance. By creating workspaces, installing modules, and gathering data on a target domain, users gain hands-on experience in mapping a target’s digital footprint. The exercise underscores the importance of:

- Using Recon-ng ethically and only on authorized targets
- Leveraging modules to automate and streamline data collection
- Organizing and analyzing findings in the database
- Applying reconnaissance results to inform security assessments This knowledge equips users to perform effective reconnaissance and enhance their penetration testing capabilities.

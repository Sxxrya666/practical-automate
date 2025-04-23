## Aim

To study the Metasploit tool in Kali Linux.

## Learning Objective

To understand how to perform exploits using the Metasploit tool in Kali Linux.

## Theory

### What is Metasploit?

Metasploit is a powerful, open-source penetration testing framework widely used by security professionals to identify and mitigate vulnerabilities in systems before they can be exploited by malicious actors. Often described as a tool that enables "hacking with permission," Metasploit provides a structured environment for conducting penetration tests, developing security tools, and executing exploits. It simplifies the process of vulnerability assessment for both attackers and defenders, making it a cornerstone in the field of cybersecurity.

The Metasploit Framework (MSF) is the core component, offering a comprehensive suite of tools, libraries, user interfaces, and modules. These components allow users to configure exploit modules, pair them with payloads, target specific systems, and launch attacks. With a vast database containing hundreds of exploits and numerous payload options, Metasploit is a go-to tool for security engineers, system administrators, and ethical hackers.

### Purpose of Metasploit

Metasploit serves multiple purposes in network security and system administration:

- **Penetration Testing**: Identifies vulnerabilities in systems, networks, or applications through simulated attacks.
- **Patch Verification**: Allows system administrators to test whether patches have been successfully applied.
- **Regression Testing**: Enables product vendors to ensure software updates do not introduce new vulnerabilities.
- **Vulnerability Assessment**: Helps security professionals proactively identify and prioritize weaknesses that could be exploited by attackers.

By simulating real-world attack scenarios, Metasploit helps organizations strengthen their defenses and reduce the risk of unauthorized access.

### Who Uses Metasploit?

Metasploit’s versatility and open-source nature make it popular among a wide range of users:

- **Security Professionals**: Penetration testers and security engineers use Metasploit to assess system security.
- **System Administrators**: Verify patch installations and system configurations.
- **Developers**: Test software for vulnerabilities during development.
- **Hackers**: Both ethical and malicious actors leverage Metasploit due to its accessibility and extensive exploit database.

Its widespread use underscores the importance of security professionals being familiar with Metasploit, even if they do not actively use it, to understand potential attack vectors.

### Metasploit Uses and Benefits

Metasploit offers numerous benefits that make it a preferred tool for penetration testing:

- **Open Source and Actively Developed**: Freely accessible with a transparent source code, allowing users to add custom modules and stay updated with the latest vulnerabilities.
- **Ease of Use**: Automates complex tasks, such as large-scale network penetration tests, making it efficient for testing multiple systems.
- **Payload Flexibility**: The `set payload` command enables quick switching between payloads (e.g., Meterpreter or shell-based access) to perform specific operations.
- **Clean Exits**: Ensures clean disconnection from compromised systems, minimizing disruption.
- **User-Friendly Interface**: Offers a graphical user interface (GUI) and supports third-party interfaces for easier management of penetration testing projects.
- **Extensive Module Library**: Includes exploits, payloads, auxiliary modules, and post-exploitation tools for comprehensive testing.

### Metasploit Framework Structure

The Metasploit Framework is organized into a modular filesystem to support its functionality:

- **Data**: Stores editable files, including binaries, wordlists, images, templates, and logos.
- **Tools**: Contains command-line utilities, plugins, and tools for tasks like memory dumping.
- **Scripts**: Includes Meterpreter scripts and resources for automating functionalities.
- **Modules**: Houses the core MSF modules, such as exploits, payloads, auxiliary, and post-exploitation modules.
- **Plugins**: Provides extensions for automating manual tasks.
- **Documentation**: Contains guides, PDFs, and resources for using Metasploit.
- **Lib**: Includes libraries required to run Metasploit from start to finish.

### How Metasploit Works

A typical Metasploit penetration test follows these phases:

1. **Information Gathering**: Integrates with reconnaissance tools like Nmap, SNMP scanning, Nessus, or Windows patch enumeration to identify vulnerabilities.
2. **Exploit Selection**: Chooses an appropriate exploit module based on the identified weakness.
3. **Payload Configuration**: Pairs the exploit with a payload (e.g., Meterpreter for remote control or a reverse shell).
4. **Target Execution**: Launches the exploit against the target system.
5. **Post-Exploitation**: Performs actions like privilege escalation, data exfiltration, or persistence using post-exploitation modules.

This structured approach ensures thorough testing and actionable results.

### Setting Up Metasploit in Kali Linux

Metasploit relies on a PostgreSQL database for efficient operation. Below are the steps to set up and verify Metasploit in Kali Linux:

1. **Initialize the Metasploit Database**

   ```bash
   sudo msfdb init
   ```

   This command sets up the PostgreSQL database for Metasploit.

2. **Manage Metasploit Database**

   ```bash
   sudo msfdb
   ```

   This command provides options to interact with Metasploit’s database configuration.

3. **Start the PostgreSQL Service**

   ```bash
   sudo msfdb start
   ```

   Launches the PostgreSQL service required for Metasploit.

4. **Verify PostgreSQL Service**

   ```bash
   sudo msfdb status
   ```

   Checks if PostgreSQL is running (port 5432 should be listening).

5. **Launch Metasploit Console**

   ```bash
   msfconsole -q
   ```

   Starts the Metasploit console in quiet mode. Verify database connectivity using:

   ```bash
   db_status
   ```

### Key Metasploit Commands

Below are essential Metasploit commands and their use cases:

1. **Back and Exit Commands**

   ```bash
   msf > exploit/windows/vnc/realvnc_client
   msf exploit(realvnc_client) > back
   ```

   The `back` command returns to the previous context, while `exit` terminates the session.

2. **Help Command**

   ```bash
   msf exploit(realvnc_client) > help
   ```

   Displays available commands and their descriptions.

3. **Info Command**

   ```bash
   msf exploit(realvnc_client) > info
   ```

   Provides detailed information about the selected exploit module.

4. **Search Command**

   ```bash
   msf > search flash
   ```

   Searches the Metasploit database for exploits or modules related to a keyword (e.g., Flash).

5. **Show Options Command**

   ```bash
   msf > exploit(adobe_flash_shader_drawing_fill) > show options
   ```

   Displays configurable options for the selected exploit. For example, the Flash exploit may include options like:

   - `SRVHOST` (Required): The IP address of the server hosting the exploit.
   - `SRVPORT` (Required): The port used for the exploit.

   Example configuration:

   ```bash
   set SRVHOST 192.168.0.100
   set SRVPORT 80
   ```

6. **Show Payloads Command**

   ```bash
   msf > exploit(adobe_flash_shader_drawing_fill) > show payloads
   ```

   Lists compatible payloads for the selected exploit.

7. **Show Targets Command**

   ```bash
   msf > exploit(adobe_flash_shader_drawing_fill) > show targets
   ```

   Displays operating systems or software versions vulnerable to the exploit. Example:

   ```bash
   set target 1
   ```

   Setting a specific target narrows down compatible payloads.

8. **Show Advanced Command**

   ```bash
   msf > exploit(adobe_flash_shader_drawing_fill) > show advanced
   ```

   Shows advanced configuration options for fine-tuning the exploit.

9. **Show Encoders Command**

   ```bash
   msf > exploit(adobe_flash_shader_drawing_fill) > show encoders
   ```

   Lists encoders that can obfuscate payloads to evade intrusion detection systems (IDS/IPS).

10. **Show Nops Command**

    ```bash
    msf > exploit(adobe_flash_shader_drawing_fill) > show nops
    ```

    Displays No Operation (NOP) generators used to create NOP sleds, which help bypass IDS/IPS by varying sled patterns.

### Additional Considerations

- **Ethical Use**: Metasploit must only be used with explicit permission. Unauthorized exploitation is illegal and unethical.
- **Custom Modules**: Users can develop custom exploits or payloads to extend Metasploit’s functionality.
- **Automation**: Scripts and plugins can automate repetitive tasks, improving efficiency.
- **Stealth**: Advanced options like encoders and NOP sleds help evade detection, but Metasploit is inherently noisy compared to manual exploitation.

By mastering Metasploit, users gain the ability to simulate real-world attacks, identify vulnerabilities, and strengthen system defenses.

## Learning Outcome

Successfully performed exploits using the Metasploit tool in Kali Linux, gaining hands-on experience in penetration testing and vulnerability exploitation.

## Conclusion

The experiment provided a comprehensive understanding of the Metasploit Framework, including its setup, module structure, and key commands. By exploring commands like `search`, `set`, `show options`, and `show payloads`, we learned how to configure and execute exploits against vulnerable systems. This practical exposure highlighted Metasploit’s role in ethical hacking and its importance in proactively securing networks.

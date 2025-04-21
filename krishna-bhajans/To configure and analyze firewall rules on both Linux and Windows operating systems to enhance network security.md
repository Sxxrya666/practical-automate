## Aim

To configure and analyze firewall rules on both Linux and Windows operating systems to enhance network security.

## Learning Objectives

1. To understand the role of firewalls in network security.
2. To learn how to configure firewall rules on Linux and Windows.
3. To analyze the effectiveness of firewall rules in controlling network traffic.
4. To compare the functionality and usability of firewall tools on different operating systems.

## Tools

1. Computer or virtual machine running Linux (e.g., Ubuntu, Kali).
2. Computer or virtual machine running Windows 10/11.
3. UFW (Uncomplicated Firewall) for Linux.
4. Windows Defender Firewall with Advanced Security for Windows.

## Theory

A **firewall** is a network security system that monitors and controls incoming and outgoing network traffic based on predefined rules. It acts as a barrier between trusted and untrusted networks, preventing unauthorized access, mitigating attacks, and enforcing security policies. Firewalls are essential for protecting systems from threats like unauthorized access, malware, and denial-of-service (DoS) attacks.

### Types of Firewalls

1. **Packet Filtering Firewall**:
   - Analyzes network packets based on attributes like IP address, port, and protocol.
   - Operates at the network layer (Layer 3) and is fast but lacks context about connection states.
2. **Stateful Inspection Firewall**:
   - Tracks the state of active connections (e.g., established, related) to make context-aware decisions.
   - Operates at the transport layer (Layer 4) and provides better security than packet filtering.
3. **Application Layer Firewall**:
   - Inspects traffic at the application layer (Layer 7), analyzing content and protocols (e.g., HTTP, FTP).
   - Offers granular control but may impact performance due to deep inspection.

### Firewall Tools Used

- **Linux: UFW (Uncomplicated Firewall)**:
  - A user-friendly interface for managing iptables, the Linux kernel’s packet filtering framework.
  - Simplifies the creation and management of firewall rules for common use cases.
- **Windows: Windows Defender Firewall with Advanced Security**:
  - A built-in tool for defining and enforcing inbound and outbound traffic rules.
  - Supports advanced features like rule customization, logging, and integration with Windows security policies.

## Experiment Steps

### Step 1: Configure Firewall on Linux (Ubuntu/Kali)

1. **Enable UFW**:

   ```bash
   sudo ufw enable
   ```

   Activates the UFW firewall, enabling it to enforce rules.

2. **Allow SSH (Port 22)**:

   ```bash
   sudo ufw allow 22/tcp
   ```

   Permits incoming SSH connections to ensure remote access.

3. **Allow HTTP (Port 80) and HTTPS (Port 443)**:

   ```bash
   sudo ufw allow 80/tcp
   sudo ufw allow 443/tcp
   ```

   Enables web traffic for HTTP and HTTPS services.

4. **Set Default Policies**:

   ```bash
   sudo ufw default deny incoming
   sudo ufw default allow outgoing
   ```

   Blocks all incoming traffic except explicitly allowed services and permits all outgoing traffic.

5. **Check Firewall Status**:

   ```bash
   sudo ufw status verbose
   ```

   Displays the current firewall rules, status, and logging details.

### Step 2: Configure Firewall on Windows

1. **Open Windows Defender Firewall with Advanced Security**:

   - Navigate to `Control Panel > System and Security > Windows Defender Firewall > Advanced Settings`.

2. **Create Inbound and Outbound Rules**:

   - Go to **Inbound Rules** and select **New Rule**.
   - Create rules to allow traffic on:
     - Port 22 (TCP) for SSH.
     - Port 80 (TCP) for HTTP.
     - Port 443 (TCP) for HTTPS.
   - Repeat for **Outbound Rules** if specific outbound restrictions are needed.

3. **Set Default Deny Policy**:

   - Configure the firewall to block all inbound traffic by default (already set in most Windows configurations).
   - Ensure outbound traffic is allowed unless specific restrictions are required.

4. **Verify Rules**:

   - Check the **Monitoring** section to view active rules and firewall logs.
   - Test connectivity to allowed ports (e.g., using `telnet` or a browser) and attempt access to blocked ports to confirm restrictions.

### Step 3: Analyze Effectiveness

1. **Test Firewall Rules**:

   - On Linux, use tools like `nmap` to scan the system and verify that only allowed ports (22, 80, 443) are open.
   - On Windows, use `netstat -an` or a third-party port scanner to confirm open ports and blocked traffic.
   - Attempt unauthorized access (e.g., connecting to a blocked port like 23) to ensure the firewall drops the connection.

2. **Check Logs**:

   - On Linux, view UFW logs in `/var/log/ufw.log` to analyze blocked and allowed traffic.
   - On Windows, enable firewall logging in Advanced Settings and review logs in `%systemroot%\system32\LogFiles\Firewall`.

3. **Simulate Threats**:
   - Perform a simulated attack (e.g., port scanning or attempting to access unauthorized services) to confirm that the firewall effectively blocks malicious traffic.

### Output

#### Observations

- **Linux (UFW)**:

  - **Ease of Use**: UFW’s command-line interface is intuitive, making it simple to configure rules for common services like SSH, HTTP, and HTTPS.
  - **Effectiveness**: Successfully blocked unauthorized incoming traffic while allowing specified services. Logs confirmed dropped packets for unallowed ports.
  - **Challenges**: Required careful configuration to avoid locking out legitimate services (e.g., SSH). Resolved by testing rules incrementally.

- **Windows (Defender Firewall)**:
  - **Ease of Use**: The graphical interface is user-friendly but requires navigation through multiple menus for advanced configurations.
  - **Effectiveness**: Blocked unauthorized traffic and allowed specified ports as configured. Logging provided detailed insights into traffic patterns.
  - **Challenges**: Initial rule misconfiguration blocked a legitimate application, resolved by reviewing logs and adjusting rules.

#### Comparison of Firewall Tools

- **Functionality**:
  - **UFW**: Simplifies iptables management, ideal for quick setups and common use cases. Lacks advanced features like application-layer filtering without additional tools.
  - **Windows Defender Firewall**: Offers granular control, including program-specific rules and integration with Windows security policies. Supports advanced logging and monitoring.
- **Usability**:
  - **UFW**: Command-line based, requiring familiarity with Linux commands but straightforward for basic tasks.
  - **Windows Defender Firewall**: GUI-based, more accessible for non-technical users but complex for advanced rule sets.
- **Flexibility**:
  - **UFW**: Best for server environments with predictable traffic patterns.
  - **Windows Defender Firewall**: Suited for desktops and enterprise environments with diverse application needs.

#### Effectiveness Analysis

- Both firewalls successfully restricted traffic to allowed ports (22, 80, 443) and blocked unauthorized access.
- UFW’s default deny policy ensured a secure baseline, while Windows Defender Firewall’s logging capabilities aided in troubleshooting.
- Simulated attacks (e.g., port scans) were thwarted, confirming the robustness of the configurations.

## Learning Outcomes

Upon completing this experiment, students should be able to:

1. Understand the critical role of firewalls in enhancing network security.
2. Configure and manage firewall rules on Linux (UFW) and Windows (Defender Firewall).
3. Analyze network traffic and enforce security policies using firewall rules.
4. Compare the functionality, usability, and suitability of firewall tools across Linux and Windows.

## Conclusion

This experiment demonstrated the configuration and analysis of firewall rules on Linux and Windows, highlighting their importance in securing network traffic. By implementing rules to allow SSH, HTTP, and HTTPS while blocking unauthorized access, we ensured robust protection against threats. The comparison of UFW and Windows Defender Firewall revealed differences in usability and functionality, with each tool suited to specific use cases. This hands-on experience underscored the need for precise rule configuration, regular log monitoring, and testing to maintain effective network security.

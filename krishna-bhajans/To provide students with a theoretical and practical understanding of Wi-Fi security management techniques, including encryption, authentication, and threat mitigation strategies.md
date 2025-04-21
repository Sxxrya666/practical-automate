## Aim

To provide students with a theoretical and practical understanding of Wi-Fi security management techniques, including encryption, authentication, and threat mitigation strategies.

## Learning Objectives

1. Understand the principles of Wi-Fi security protocols and standards.
2. Learn how to configure and manage Wi-Fi security settings effectively.
3. Identify common security threats associated with Wi-Fi networks.
4. Study encryption and authentication mechanisms to enhance Wi-Fi network security.
5. Gain proficiency in using tools for monitoring and analyzing Wi-Fi network traffic.

## Tools

1. Computer or laptop with administrative access.
2. Wi-Fi router with configurable settings.
3. Operating system (e.g., Windows, Linux, macOS).
4. Wireshark for network traffic analysis.
5. Web browser for accessing the router’s admin panel.

## Theory

Wi-Fi security is critical for protecting wireless networks from unauthorized access, data interception, and attacks. Understanding security protocols, encryption methods, authentication mechanisms, vulnerabilities, and best practices is essential for effective Wi-Fi security management.

### Wi-Fi Security Protocols

1. **WEP (Wired Equivalent Privacy)**:

   - Uses RC4 encryption, which has significant cryptographic flaws.
   - Easily cracked due to weak key management and predictable initialization vectors.
   - Obsolete and should not be used.

2. **WPA (Wi-Fi Protected Access)**:

   - Introduced as an interim improvement over WEP.
   - Uses TKIP (Temporal Key Integrity Protocol) for encryption, which is stronger than WEP but still vulnerable to attacks.
   - Largely replaced by WPA2.

3. **WPA2 (Wi-Fi Protected Access 2)**:

   - Implements AES (Advanced Encryption Standard) for robust encryption.
   - Widely used and secure for most applications but susceptible to certain attacks (e.g., KRACK).
   - Supports both PSK (Pre-Shared Key) and enterprise modes.

4. **WPA3 (Wi-Fi Protected Access 3)**:
   - Latest standard with enhanced security features, including stronger encryption and protection against brute-force attacks.
   - Uses Simultaneous Authentication of Equals (SAE) for password-based authentication.
   - Mitigates vulnerabilities found in WPA2, such as offline dictionary attacks.

### Encryption Methods

1. **WEP (RC4-based)**:

   - Weak encryption due to flawed key scheduling and small key sizes.
   - Easily compromised using tools like Aircrack-ng.

2. **TKIP**:

   - Designed for WPA to improve WEP’s security without requiring new hardware.
   - Vulnerable to packet injection and decryption attacks; considered deprecated.

3. **AES**:
   - Strong, symmetric encryption standard used in WPA2 and WPA3.
   - Provides high security and is resistant to known cryptographic attacks.

### Authentication Mechanisms

1. **PSK (Pre-Shared Key)**:

   - Used in WPA2-PSK and WPA3-SAE for home and small networks.
   - Relies on a shared password, which must be strong to prevent brute-force attacks.

2. **EAP (Extensible Authentication Protocol)**:

   - Used in enterprise Wi-Fi networks with WPA2/WPA3-Enterprise.
   - Supports multiple authentication methods (e.g., EAP-TLS, EAP-PEAP) for secure user verification.

3. **802.1X**:
   - A network access control framework that integrates with RADIUS servers for centralized authentication.
   - Common in enterprise environments for managing user access.

### Common Wi-Fi Security Vulnerabilities and Threats

1. **Man-in-the-Middle (MITM) Attacks**:
   - Attackers intercept communication between devices and the access point to steal data or inject malicious content.
2. **Evil Twin Attacks**:
   - Attackers create fake access points with the same SSID to trick users into connecting, enabling data theft.
3. **De-authentication Attacks**:
   - Attackers send de-authentication frames to disconnect users, forcing reconnection to a malicious access point or causing denial of service.
4. **Brute-Force Attacks**:
   - Attackers attempt to guess weak passwords using automated tools.
5. **Packet Sniffing**:
   - Attackers capture unencrypted network packets to extract sensitive information.

### Best Practices for Wi-Fi Security

1. Use WPA3 or WPA2 with AES encryption for strong security.
2. Implement strong, unique passwords (e.g., 20+ characters or passphrases).
3. Enable multi-factor authentication (MFA) where supported.
4. Disable WPS (Wi-Fi Protected Setup) to prevent exploitation of PIN vulnerabilities.
5. Use MAC address filtering to restrict access to known devices.
6. Hide the SSID to reduce visibility to unauthorized users.
7. Regularly monitor network traffic for anomalies using tools like Wireshark.
8. Keep router firmware updated to patch known vulnerabilities.

## Study Procedure

### Step 1: Understanding Wi-Fi Security Configuration

1. **Access Router Admin Panel**:

   - Open a web browser and navigate to the router’s IP address (e.g., `192.168.1.1`).
   - Log in with administrator credentials (default credentials should be changed).

2. **Study Encryption Methods**:

   - Review available security protocols in the router’s wireless settings (e.g., WPA2-AES, WPA3).
   - Configure the router to use WPA3 or WPA2 with AES encryption for optimal security.
   - Note the differences in compatibility and security between protocols.

3. **Explore Authentication Mechanisms**:

   - Configure PSK for home network setups with a strong passphrase (e.g., 20+ characters).
   - Study enterprise authentication options (e.g., 802.1X with RADIUS) if available.
   - Test authentication by connecting devices to the network.

4. **Disable WPS**:

   - Locate the WPS setting in the router’s admin panel and disable it to prevent exploitation.
   - Verify that WPS-based connections are no longer possible.

5. **Configure MAC Address Filtering and Firewall**:
   - Enable MAC address filtering and add trusted devices’ MAC addresses.
   - Review and enable the router’s built-in firewall to block unauthorized traffic.

### Step 2: Wi-Fi Network Traffic Analysis

1. **Set Up Wireshark**:

   - Install Wireshark on a computer connected to the Wi-Fi network.
   - Select the Wi-Fi interface for packet capture.

2. **Capture and Filter Packets**:

   - Start capturing packets and apply filters (e.g., `wlan` for Wi-Fi traffic, `wlan.sa` for source address).
   - Analyze packet headers to identify protocols, source/destination addresses, and payloads.

3. **Detect De-authentication Attacks**:

   - Use Wireshark to monitor for de-authentication frames (`wlan.fc.type_subtype == 0x0c`).
   - Simulate a de-authentication attack (with permission, using tools like `aireplay-ng` on Kali Linux) and observe its impact.

4. **Analyze Packet Sniffing**:

   - Capture unencrypted traffic (e.g., on an open Wi-Fi network) to demonstrate data exposure.
   - Compare with encrypted traffic (WPA2/WPA3) to show how AES prevents data leakage.

   _Screenshot Placeholder: Wireshark Implementation_

### Step 3: Security Threat Identification & Prevention

1. **Study Exploitation of Weak Settings**:

   - Research vulnerabilities in WEP and WPA-TKIP using online resources or tools like Aircrack-ng.
   - Note how weak passwords or outdated protocols increase attack risks.

2. **Learn About Brute-Force Attacks**:

   - Study password cracking techniques using tools like Hashcat or Aircrack-ng.
   - Test the strength of the configured PSK (with permission) to evaluate resistance to brute-force attempts.

3. **Understand Evil Twin Attacks**:

   - Research methods to detect fake access points (e.g., mismatched SSID parameters, unusual signal strength).
   - Configure devices to avoid auto-connecting to open or unfamiliar networks.

4. **Mitigation Strategies**:
   - Enable firewall rules to block suspicious traffic.
   - Use MAC filtering to limit connections to authorized devices.
   - Implement strong authentication (e.g., WPA3-SAE or 802.1X) to reduce attack surfaces.

## Expected Outcomes

By the end of the experiment, students will:

1. Understand Wi-Fi security configurations, including encryption and authentication mechanisms.
2. Identify common Wi-Fi vulnerabilities (e.g., MITM, Evil Twin, de-authentication attacks) and their mitigation techniques.
3. Analyze network traffic using Wireshark to detect anomalies and threats.
4. Study the impact of authentication mechanisms (PSK, EAP, 802.1X) on network security.
5. Apply best practices for Wi-Fi security management, such as using WPA3, disabling WPS, and monitoring traffic.

## Conclusion

This experiment provided a comprehensive understanding of Wi-Fi security management through theoretical study and practical application. By configuring WPA3 with AES encryption, disabling WPS, and enabling MAC filtering, we enhanced the security of a Wi-Fi network. Using Wireshark, we analyzed network traffic to detect potential threats like de-authentication attacks and demonstrated the importance of encryption in preventing packet sniffing. The study of vulnerabilities such as Evil Twin and brute-force attacks highlighted the need for strong passwords, robust authentication, and proactive monitoring. These practices and tools are essential for securing Wi-Fi networks against modern threats, ensuring data confidentiality and network integrity.

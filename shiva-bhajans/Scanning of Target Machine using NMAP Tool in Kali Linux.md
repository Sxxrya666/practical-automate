## Aim

Scanning of Target Machine using NMAP Tool in Kali Linux

## Learning Objective

To understand the process of scanning a target machine using the NMAP tool in Kali Linux.

## Theory

### NMAP Tool in Kali Linux

Nmap (Network Mapper) is a versatile, free, and open-source command-line utility designed for network exploration, security auditing, and reconnaissance. It is widely used by network administrators and cybersecurity professionals to discover hosts, services, and vulnerabilities on a computer network. Nmap operates by sending carefully crafted packets to the target system and analyzing the responses to map the network topology, identify open ports, detect operating systems, and gather other critical information.

Nmap’s flexibility stems from its extensive range of scan types and options, allowing users to tailor scans to specific needs. It can perform stealthy scans to avoid detection, aggressive scans to gather detailed information, or lightweight scans to quickly check host availability. The tool is pre-installed in Kali Linux, a specialized distribution for security researchers and penetration testers, making it an essential component for ethical hacking and network security assessments.

#### Key Features of Nmap

- **Host Discovery**: Identifies live hosts on a network by sending probes like ICMP echo requests or TCP/UDP packets.
- **Port Scanning**: Determines open, closed, or filtered ports on a target system, revealing services running on those ports.
- **Service and Version Detection**: Identifies the applications and their versions running on open ports.
- **OS Detection**: Analyzes packet responses to fingerprint the operating system and its version.
- **Scriptable Interaction**: Uses the Nmap Scripting Engine (NSE) to perform advanced tasks like vulnerability detection or network enumeration.

#### How Nmap Works

Nmap sends packets to the target system and interprets the responses based on the protocol and scan type used. For example, in TCP scans, Nmap leverages the TCP handshake process to determine port states. The tool can target a single IP address, a range of IPs, or even entire subnets, making it suitable for both small-scale and large-scale network assessments.

Below are detailed explanations of the most commonly used Nmap scan types, focusing on their mechanisms, use cases, and implications.

#### TCP Scan/TCP Connect Scan

```bash
nmap -sT 192.168.1.12 --top-ports 50
```

- **Flag**: `-sT` (TCP Scan).
- **Option**: `--top-ports 50` (Scans the top 50 most commonly used TCP ports).
- **Target**: `192.168.1.12` (Destination IP; can also be a URL).

The TCP Connect Scan is a reliable and straightforward scanning method that completes the full TCP 3-way handshake to determine the state of a port. The 3-way handshake involves:

1. **SYN Packet**: The source sends a SYN (synchronize) packet to initiate a connection.
2. **SYN/ACK Response**: If the port is open, the destination responds with a SYN/ACK (synchronize-acknowledgment) packet, indicating it is listening.
3. **ACK Packet**: The source sends an ACK (acknowledgment) packet to complete the connection.

- **If the port is closed**: The destination responds with an RST/ACK (reset-acknowledgment) packet, indicating no service is listening.
- **If the port is filtered**: No response is received, often due to a firewall blocking the packet.

**Use Case**: This scan is ideal for environments where stealth is not a priority, as it is easily detectable by intrusion detection systems (IDS) due to the completed handshake. It is also useful when the user lacks raw packet privileges, as it relies on the operating system’s networking stack.

_Screenshot Placeholder_

#### SYN Scan/Stealth Scan/Half-Open Scan

```bash
nmap -sS 192.168.1.12 --top-ports 50
```

- **Flag**: `-sS` (SYN Scan).

The SYN Scan, also known as a Stealth Scan or Half-Open Scan, is a more discreet alternative to the TCP Connect Scan. It initiates but does not complete the 3-way handshake, reducing the likelihood of detection. The process is as follows:

1. **SYN Packet**: The source sends a SYN packet to the target port.
2. **SYN/ACK Response**: If the port is open, the destination responds with a SYN/ACK packet.
3. **RST Packet**: Instead of completing the handshake with an ACK, the source sends an RST (reset) packet to terminate the connection.

- **If the port is closed**: The destination responds with an RST packet.
- **If the port is filtered**: No response is received.

**Use Case**: SYN Scan is preferred for stealthy reconnaissance, as it avoids logging by not completing the connection. It requires raw packet privileges, making it suitable for users with administrative access on Kali Linux.

_Screenshot Placeholder_

#### UDP Scan

```bash
nmap -sU 192.168.1.12 --top-ports 50
```

- **Flag**: `-sU` (UDP Scan).

Unlike TCP, UDP is a connectionless protocol, and UDP scans are designed to identify open UDP ports by sending empty UDP packets to the target. The response behavior is:

- **If the port is open**: The destination may not respond, or it may send a UDP packet back, depending on the service.
- **If the port is closed**: The destination typically responds with an ICMP “Port Unreachable” message.
- **If the port is filtered**: No response is received, or an ICMP error message may be sent.

UDP scans are slower than TCP scans due to the lack of a handshake and the need to wait for timeouts to confirm closed or filtered ports. They are also less reliable because some systems limit ICMP responses to prevent abuse.

**Use Case**: UDP scans are critical for discovering services like DNS (port 53), SNMP (port 161), or DHCP (port 67/68), which rely on UDP.

#### Ping Scan/No Port Scan

```bash
nmap -sn 192.168.1.0/24
```

- **Flag**: `-sn` or `-sP` (Ping Scan).

The Ping Scan is a lightweight scan used for host discovery rather than port scanning. It sends probes (e.g., ICMP echo requests or TCP SYN/ACK packets) to determine which hosts are active within a specified network range (e.g., `192.168.1.0/24` for a subnet).

- **Response**: Only hosts that respond to the probes are reported as active.
- **No Port Information**: This scan does not provide details about open ports or services.

**Use Case**: Ping Scan is useful for quickly mapping a network to identify live hosts before performing more detailed scans. It can also be used to verify if a single host is online.

#### Additional Considerations

- **Firewall Evasion**: Nmap offers techniques like fragmentation (`-f`), decoy scans (`-D`), and spoofing source addresses (`-S`) to bypass firewalls and IDS.
- **Performance Optimization**: Options like `--min-rate`, `--max-rate`, and `-T` (timing templates) allow users to adjust scan speed and reduce network load.
- **Ethical Use**: Scanning networks without permission is illegal and unethical. Always obtain explicit authorization before performing scans.

By mastering these scan types, users can effectively gather intelligence about a target network, identify potential vulnerabilities, and enhance their understanding of network security.

## Learning Outcome

Successfully scanned a target machine using the NMAP tool in Kali Linux with various commands, gaining insights into network reconnaissance techniques.

**Conclusion:**
This experiment illustrates the capabilities of the Nmap tool in Kali Linux for scanning and mapping network targets. By performing TCP, SYN, UDP, and Ping scans, users gain practical experience in network reconnaissance, port discovery, and service identification. The exercise emphasizes the importance of:

- Using Nmap ethically and only on authorized systems
- Selecting appropriate scan types to balance stealth, speed, and detail
- Interpreting scan results to assess network security
- Implementing robust network defenses to mitigate vulnerabilities identified by tools like Nmap This knowledge forms a foundation for advanced penetration testing and network security practices.

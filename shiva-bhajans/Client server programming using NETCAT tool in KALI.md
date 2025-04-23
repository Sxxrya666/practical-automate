**Aim:** Client server programming using NETCAT tool in KALI.

**Learning Objective:** To understand client server programming using NETCAT tool in KALI LINUX.

**Theory:**
Netcat is one of the most powerful networking tools, security tools, and network monitoring tools. It
acts like a cat command over a network. It is even considered a Swiss army knife of networking tools. It
is generally used for the following reasons:

● Operation related to TCP, UDP, or UNIX-domain sockets.
● Port Scanning
● Port Listening
● Port redirection
● open Remote connections
● Read/Write data across the network.
● Network debugging
● Network daemon testing
● Simple TCP proxies
● A Socks or HTTP Proxy Command for ssh

Syntax of the `nc` command in KALI Linux
The basic syntax for the nc command as follows.

**nc [options] [hostname] [port]**

**[options]:** Use to customize the behavior of the nc command. Some examples include adding verbose
output, setting a timeout for connections, etc.

**[hostname]:** The hostname or the IP address of the target we want to connect to or interact with using
netcat. It can be both Domain name (e.g., example.com) or an IP address (e.g., 192.168.0.1).

**[port]:** The port number of the target that we want to connect to or interact with. Ports are used to
identify specific services or applications running on a system. (For example: port 80 (HTTP) or port 22
(SSH) connections.

**netcat (nc) command options**

It offers various options that help us in enhancing its functionality. Some commonly used options
include:

**Options Description:**

**-l:** Listen mode, used to create a server that listens for incoming
connections.
**-p:** Specifies the source port number.
**-v:** Verbose mode, provides more detailed output.
**-z:** Scans for open ports.
**-w:** Sets a timeout for connections.
**-q:** Specifies the delay before closing the connection.

**Two Primary Working Modes of Netcat.**

**1. Client Server Programming using browser:**

```shell
ifconfig
nc –l –p 5555 –v
listening mode...
```

Go to firefox and write following in URL:
10.0.0.5:

**2. Client Server Programming on the local host (Chatting):**

On Terminal 1

```shell
nc –l –p 5555
```

On Terminal 2

```shell
nc 127.0.0.1 5555
```

Connection will be established and chatting can be done between server and client on the local host.

**Learning Outcome:** Performed client server programming between browser and machine and with different terminal on the local host using NETCAT tool using various commands.

**Conclusion:**
This experiment demonstrates the power and versatility of the Netcat tool in Kali Linux for client-server programming. By configuring Netcat in both client and server modes, users can establish network connections, transfer data, and simulate real-world networking scenarios. The exercise highlights the importance of understanding network protocols, port configurations, and command-line tools for network communication. To enhance security, users should:

- Use Netcat responsibly and only on authorized systems
- Implement strong access controls to prevent unauthorized connections
- Monitor network traffic to detect potential misuse of open ports
- Combine Netcat with other security tools for comprehensive network testing

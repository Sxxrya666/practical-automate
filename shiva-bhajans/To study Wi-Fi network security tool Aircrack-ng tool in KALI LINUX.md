**Aim:** To study Wi-Fi network security tool **Aircrack-ng** tool in KALI LINUX.

**Learning Objective:** To understand Wi-Fi network security tool Aircrack-ng in KALI LINUX.

**Theory:**
Aircrack-ng is a suite of open-source tools pre-installed in Kali Linux, designed for assessing and testing the security of Wi-Fi networks. It is widely used by security researchers and penetration testers to evaluate the strength of wireless network configurations, identify vulnerabilities, and demonstrate the risks of weak encryption protocols. Aircrack-ng combines multiple functionalities, including packet sniffing, WEP and WPA/WPA2 password cracking, traffic analysis, and hash capturing, making it a comprehensive tool for Wi-Fi security testing.

The tool supports a variety of wireless interfaces and is compatible with most modern Wi-Fi adapters, provided they support monitor mode. Aircrack-ng focuses on four primary areas: monitoring network traffic, launching attacks, testing hardware capabilities, and cracking encryption keys. By capturing and analyzing Wi-Fi packets, it can extract cryptographic hashes and attempt to recover passwords using techniques like dictionary attacks or brute force. Its versatility and command-line interface make it a powerful tool for both offensive and defensive security tasks. It mainly focuses on 4 areas:

- **Monitoring** : Captures cap, packet, or hash files.
- **Attacking** : Performs deauthentication or creates fake access points
- **Testing** : Checking the wifi cards or driver capabilities
- **Cracking** : Various security standards like WEP or WPA PSK.

**How Aircrack-ng Works:**
Aircrack-ng operates by interacting with Wi-Fi networks through a compatible wireless adapter in monitor mode, which allows it to passively capture packets or actively inject frames. The process typically involves enabling monitor mode, identifying target networks, capturing authentication handshakes, and cracking the captured data using wordlists or other techniques. For WPA/WPA2, Aircrack-ng captures the four-way handshake, a critical component of the authentication process, and uses it to verify potential passwords against a provided wordlist.

Common Tools in the Aircrack-ng Suite:

- airmon-ng: Manages wireless interfaces, enabling or disabling monitor mode and setting channels.
- airodump-ng: Captures Wi-Fi packets and displays information about nearby networks, including BSSIDs, channels, and connected clients.
- aireplay-ng: Performs attacks like deauthentication or packet injection to facilitate handshake capture.
- aircrack-ng: Cracks WEP and WPA/WPA2 keys using captured data and wordlists.
- airbase-ng: Creates fake access points for testing or attack simulation.

Wi-Fi Security Protocols Supported:

- WEP: An outdated and insecure protocol that Aircrack-ng can crack using statistical methods or brute force due to its weak encryption.
- WPA/WPA2: More secure protocols that rely on pre-shared keys. Aircrack-ng cracks these by capturing the four-way handshake and testing passwords against a wordlist.
- WPA3: Emerging standard with stronger encryption, not directly supported by Aircrack-ng for cracking due to its robust security features.

**Working with aircrack-ng**
To list all network interfaces.

```shell
sudo airmon-ng
```

This command will return all the network interfaces available or connected to the system.

**1.** Stopping the desired network interface.

```shell
sudo airmon-ng stop wlan0mon
```

To stop a network interface, enter the above command and replace “ **wlan0** ” with the desired network interface.

**2.** Starting a network interface at a specific channel.

```shell
sudo airmon-ng start wlan0 10
```

To start a network interface at a specific channel enter the above command and replace “ **wlan0** ” with the desired network interface and 10 with the desired channel name.

**3.** Collecting authentication handshake

```shell
sudo airodump-ng -c 10 --bssid 00:15:5D:9C: 44:00 -w psk wlan
```

To collect the authentication handshake, enter the above command in terminal and replace “ **wlan0** ” with
the desired network interface and 10 with the desired channel name and _bssid_ with the _bssid_ of the wifi.

**4.** Cracking the captured handshake file by means of a wordlist

```shell
sudo aircrack-ng -w wordlist psk\*.cap
```

**To run a brute force attack and to crack the password enter the above command in the terminal and replace “wordlist” with the desired wordlist to be used and “wpa.cap” with the desired handshake filename.**

**5.** To get the help section of the tool

```shell
sudo aircrack-ng –help
```

**6.** To display the # of CPUs and SIMD support

```shell
sudo aircrack-ng –u
```

**Learning Outcome:** Performed Wi-Fi network security tool Aircrack-ng in KALI LINUX.

**Conclusion:**
This experiment demonstrates the use of Aircrack-ng in Kali Linux for assessing Wi-Fi network security. By enabling monitor mode, capturing authentication handshakes, and attempting to crack WPA/WPA2 passwords, users gain practical experience in identifying wireless vulnerabilities. The exercise emphasizes the importance of:

- Using Aircrack-ng ethically and only on authorized networks
- Understanding Wi-Fi protocols and their security limitations
- Implementing strong passwords and modern encryption standards like WPA3
- Regularly auditing wireless networks to detect and mitigate risks This knowledge equips users to enhance Wi-Fi security and perform responsible penetration testing.

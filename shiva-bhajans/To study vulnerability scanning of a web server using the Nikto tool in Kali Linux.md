## Aim

To study vulnerability scanning of a web server using the Nikto tool in Kali Linux.

## Learning Objective

To understand the process of vulnerability scanning of a web server using Nikto in Kali Linux.

## Theory

### What is Nikto?

Nikto, also known as Nikto2, is an open-source (GPL), free-to-use web server scanner designed to identify vulnerabilities in web servers. It performs comprehensive scans to detect dangerous files, outdated software versions, server configuration errors, and potential vulnerabilities that could be exploited. Nikto is a fast-evolving project, frequently updated with the latest known vulnerabilities, making it a reliable tool for security professionals to assess web server security.

### Main Features of Nikto

- **Free and Open Source**: Licensed under GPL, Nikto is accessible to all and frequently updated.
- **Cross-Platform Compatibility**: Scans any web server, including Apache, Nginx, Lighttpd, and Litespeed.
- **Extensive Vulnerability Database**: Checks against over 6,700 known vulnerabilities and performs version checks for more than 1,250 web servers.
- **Configuration Scanning**: Identifies misconfigurations, such as open index directories or improper server settings.
- **SSL Certificate Scanning**: Analyzes SSL certificates for cipher strength and issuer information.
- **Multi-Port Scanning**: Supports scanning multiple ports on a server hosting multiple web servers.
- **Proxy Support**: Allows scanning through a network proxy or specific IP address.
- **HTTP Authentication**: Capable of scanning websites protected by HTTP authentication.
- **Customizable Scans**: Options to set maximum scan time, exclude specific scan types, or ignore certain HTTP response codes.
- **Cache Handling**: Includes options to bypass cached versions of websites for accurate results.

### How Nikto Works

Nikto sends HTTP requests to the target web server and analyzes the responses to identify vulnerabilities, misconfigurations, or outdated software. It compares server responses against its extensive database of known issues and generates a report detailing potential security risks. Nikto is pre-installed in Kali Linux, making it a go-to tool for penetration testers and security researchers.

### Nikto Commands for Vulnerability Scanning

Below are key Nikto commands and their use cases for performing vulnerability scans:

#### 1. Running a Basic Website Scan

```bash
nikto -h example.com
```

This command performs a basic vulnerability scan on the specified web server (e.g., `example.com`). It checks for common vulnerabilities, outdated software, and configuration issues.

_Screenshot Placeholder_

#### 2. Running a Scan on a Website with SSL

To scan a website with an SSL certificate (e.g., on port 443), Nikto automatically detects HTTPS and provides SSL cipher and issuer information.

```bash
nikto -h https://example.com
```

**Use Case**: This is useful for assessing the security of SSL/TLS configurations and identifying weak ciphers or expired certificates.

#### 3. Scanning Specific Ports

Web servers may run on non-standard ports (e.g., 8080, 8081) or host multiple web servers on different ports. Nikto allows scanning specific ports using the `-p` flag.

```bash
nikto -h example.com -p 8080
```

**Use Case**: This is essential for scanning servers with custom configurations or multiple web instances on the same host.

#### 4. Scanning Through a Network Proxy

For websites accessible only through a proxy, Nikto supports scanning via a specified proxy address using the `-useproxy` flag.

```bash
nikto -h example.com -useproxy http://proxy-address:port
```

**Use Case**: This is critical for scanning internal or restricted networks that require proxy routing.

#### 5. Scanning Websites with HTTP Authentication

Nikto can scan websites protected by HTTP authentication by providing credentials using the `-id` flag.

```bash
nikto -h example.com -id username:password
```

**Use Case**: This allows testing of protected web applications or administrative interfaces.

#### 6. Ignoring Certain HTTP Codes

To avoid scanning unnecessary objects (e.g., 301 redirects), Nikto allows ignoring specific HTTP response codes using the `-IgnoreCode` flag.

```bash
nikto -h example.com -IgnoreCode 301
```

**Use Case**: This improves scan efficiency by focusing on relevant responses and avoiding redirects.

#### 7. Disabling Response Cache

Modern web servers often cache content to optimize performance, which may lead to inaccurate scan results. Nikto’s `-nocache` flag ensures a non-cached version of the website is scanned.

```bash
nikto -h example.com -nocache
```

**Use Case**: This is important for obtaining up-to-date vulnerability information, as cached pages may hide or falsely report vulnerabilities.

### Additional Considerations

- **Performance Optimization**: Use flags like `-Tuning` to limit scan types or `-maxtime` to set a maximum scan duration for efficiency.
- **Output Customization**: Nikto supports saving scan results in various formats (e.g., HTML, CSV) using the `-Format` and `-output` flags.
- **Ethical Use**: Vulnerability scanning without explicit permission is illegal and unethical. Always obtain authorization before scanning a web server.
- **Limitations**: Nikto is a noisy tool and may be detected by intrusion detection systems (IDS). It is not designed for stealthy operations.

By leveraging Nikto’s features, users can perform thorough vulnerability assessments, identify security weaknesses, and recommend remediation steps to secure web servers.

## Learning Outcome

Successfully performed vulnerability scanning of a web server using the Nikto tool in Kali Linux, gaining practical experience in web server security assessment.

## Conclusion

The experiment demonstrated the use of Nikto to identify vulnerabilities, misconfigurations, and outdated software on a web server. By executing various Nikto commands, we explored its capabilities for scanning SSL-enabled websites, specific ports, authenticated sites, and proxy-based environments. This hands-on experience highlighted the importance of regular vulnerability scanning in maintaining web server security.

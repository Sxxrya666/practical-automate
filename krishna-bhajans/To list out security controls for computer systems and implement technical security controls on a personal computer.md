## Aim

To list out security controls for computer systems and implement technical security controls on a personal computer.

## Learning Objectives

1. To understand the concept of security controls for computer systems.
2. To learn about different types of technical security controls.
3. To implement technical security controls on a personal computer.
4. To assess the effectiveness of implemented security controls.

## Tools

1. Personal computer with administrative privileges.
2. Operating system (e.g., Windows, macOS, Linux).
3. Antivirus software.
4. Firewall software.
5. Encryption software (optional).
6. System and application updates.

## Theory

**Security controls** are safeguards or countermeasures implemented to protect computer systems and data from unauthorized access, use, disclosure, disruption, modification, or destruction. They are essential for maintaining the confidentiality, integrity, and availability of information. Security controls are categorized into three main types:

- **Administrative Controls**: Policies, procedures, and training to manage security practices.
- **Physical Controls**: Physical barriers, such as locks or biometric scanners, to restrict access to hardware.
- **Technical Controls**: Software, hardware, or firmware-based measures to secure systems and data.

**Technical security controls** focus on technological solutions and include:

- **Access Controls**: Restrict system access to authorized users (e.g., user authentication).
- **Antivirus Software**: Detects and removes malicious software like viruses and trojans.
- **Firewalls**: Monitor and filter network traffic based on security rules.
- **Encryption**: Protects data by converting it into an unreadable format without the correct key.
- **Intrusion Detection Systems (IDS)**: Identify suspicious activities or potential attacks.
- **System Updates**: Apply patches to fix vulnerabilities and enhance system security.

These controls work together to reduce vulnerabilities, mitigate risks, and protect against cyber threats.

## Experiment Steps

1. **List Technical Security Controls**: Identify and document various technical security controls applicable to computer systems.
2. **Select Target System**: Choose a personal computer for implementing security controls.
3. **Implement Security Controls**:
   - Install and configure antivirus software to protect against malware.
   - Enable and configure a firewall to control network traffic.
   - Optionally, use encryption software to secure sensitive data.
   - Ensure the operating system and applications are updated with the latest security patches.
4. **Test Controls**: Verify the functionality and effectiveness of each implemented control.
5. **Document Process**: Record the implementation steps, challenges, resolutions, and observations.

## Output

### Security Controls Overview

Security controls are designed to detect, prevent, mitigate, and respond to threats that could compromise system security. They reduce vulnerabilities and protect assets from attacks, breaches, or damage. Below are key technical security controls and their purposes:

1. **Antivirus Software**

   - **Definition**: Software that detects, prevents, and removes malware, such as viruses, worms, and trojans.
   - **Purpose**: Protects systems from malicious code that could disrupt operations, steal data, or cause damage. It uses signature-based detection and behavioral analysis to identify threats.

2. **Firewall**

   - **Definition**: A network security system that monitors and filters incoming and outgoing traffic based on predefined rules.
   - **Purpose**: Acts as a barrier between trusted and untrusted networks, blocking unauthorized access and preventing data exfiltration.

3. **Encryption**

   - **Definition**: The process of encoding data to prevent unauthorized access, applied to data at rest or in transit.
   - **Purpose**: Ensures confidentiality and integrity, making data unreadable without the correct decryption key.

4. **System Updates**
   - **Definition**: Regular application of patches and updates to software and hardware.
   - **Purpose**: Addresses known vulnerabilities, enhances functionality, and improves security by closing exploitable gaps.

### Implementation Process

The following technical security controls were implemented on a personal computer:

1. **Installed and Configured Antivirus Software**

   - **Action**:
     - Downloaded and installed a reputable antivirus program (e.g., Windows Defender, Avast, or Malwarebytes).
     - Configured real-time protection and scheduled automatic scans.
     - Enabled automatic updates to ensure the latest virus definitions.
   - **Verification**: Ran a full system scan to detect and remove potential threats.

2. **Configured Firewall Rules**

   - **Action**:
     - Enabled the built-in firewall (e.g., Windows Firewall, iptables on Linux, or macOS firewall).
     - Created rules to block all unauthorized inbound traffic except for trusted sources (e.g., specific IP addresses or ports).
     - Configured outbound rules to restrict applications from sending data to untrusted destinations.
   - **Verification**: Tested rules by attempting to access blocked services and monitoring firewall logs.

3. **Encrypted Sensitive Data**

   - **Action**:
     - Used encryption software (e.g., BitLocker for Windows, FileVault for macOS, or VeraCrypt for cross-platform) to encrypt a folder or drive containing sensitive files.
     - Set a strong password for the encrypted volume.
   - **Verification**: Confirmed that encrypted files were inaccessible without the correct password.

4. **Applied System and Application Updates**
   - **Action**:
     - Checked for and installed the latest operating system updates (e.g., Windows Update, apt-get on Linux, or Software Update on macOS).
     - Updated all installed applications to their latest versions.
   - **Verification**: Verified that no pending updates remained and checked system logs for successful patch application.

### Challenges and Resolutions

1. **Antivirus Software**

   - **Challenge**: The antivirus software conflicted with an existing application, causing system slowdowns.
   - **Resolution**: Temporarily disabled the conflicting application during the initial scan, then adjusted antivirus settings to exclude the application’s directory, resolving the conflict.

2. **Firewall Configuration**

   - **Challenge**: A firewall rule inadvertently blocked a legitimate application, causing connectivity issues.
   - **Resolution**: Reviewed firewall logs to identify the blocked application, then modified the rule to allow its traffic while maintaining restrictions on other untrusted sources.

3. **Encryption**

   - **Challenge**: Encrypting large folders caused performance delays when accessing files.
   - **Resolution**: Limited encryption to only the most sensitive files, reducing overhead while maintaining security for critical data.

4. **System Updates**
   - **Challenge**: Slow internet connectivity delayed the download of large update files.
   - **Resolution**: Scheduled updates during off-peak hours and used a wired connection to improve download speeds.

### Observations on Effectiveness

1. **Antivirus Software**

   - **Effectiveness**: Successfully detected and quarantined test malware samples during scans, providing robust real-time protection.
   - **Observation**: Automatic updates ensured the antivirus remained effective against new threats, but regular scans were necessary to catch dormant malware.

2. **Firewall**

   - **Effectiveness**: Blocked unauthorized inbound and outbound traffic, preventing simulated attack attempts (e.g., port scans).
   - **Observation**: Required careful rule tuning to avoid blocking legitimate traffic, but provided a strong defense against external threats.

3. **Encryption**

   - **Effectiveness**: Rendered sensitive data inaccessible without the decryption key, even when the drive was accessed externally.
   - **Observation**: Encryption added a layer of security for data at rest, but performance impacts necessitated selective encryption for large datasets.

4. **System Updates**
   - **Effectiveness**: Closed known vulnerabilities, as verified by running a vulnerability scanner post-update.
   - **Observation**: Regular updates were critical to maintaining security, but required user diligence to ensure timely application.

## Learning Outcomes

Upon completing this experiment, students should be able to:

1. Identify and describe various technical security controls for computer systems.
2. Effectively implement technical security controls on a personal computer.
3. Evaluate the effectiveness of implemented controls in protecting against common threats.
4. Gain practical experience in securing systems and addressing implementation challenges.

## Course Outcomes

This experiment contributes to the following course outcomes:

1. Understand the principles and concepts of information security compliance.
2. Apply various security controls and mechanisms to protect computer systems and data.
3. Evaluate and assess the effectiveness of security measures in mitigating security risks.
4. Develop skills in implementing and managing security controls in real-world scenarios.

## Conclusion

This experiment provided hands-on experience in implementing technical security controls on a personal computer, including antivirus software, firewall configuration, encryption, and system updates. By addressing challenges and evaluating the effectiveness of each control, the exercise demonstrated the importance of layered security measures in protecting systems from threats. The process underscored the need for careful configuration, regular maintenance, and user awareness to maintain a strong security posture.

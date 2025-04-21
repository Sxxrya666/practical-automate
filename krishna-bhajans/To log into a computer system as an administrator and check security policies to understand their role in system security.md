## Aim

To log into a computer system as an administrator and check security policies to understand their role in system security.

## Objective

To comprehend the significance of security policies, learn to access a system as an administrator, identify and analyze security policies, and evaluate their implications for system security and user access.

## Learning Objectives

1. Understand the importance of security policies in computer systems.
2. Learn how to log into a computer system as an administrator.
3. Identify and analyze various security policies enforced within the system.
4. Interpret the implications of security policies for system security and user access.

## Materials Required

1. Computer system with administrator access.
2. Operating system with security policy settings (e.g., Windows Group Policy Editor, Linux security configurations).
3. Documentation tools for recording observations (e.g., notebook, document editor, or security auditing software).

## Theory

**Security policies** are a set of rules and guidelines that govern the security of a computer system. They define how systems, data, and users are protected from unauthorized access, misuse, or attacks. Security policies ensure the confidentiality, integrity, and availability of information by regulating various system behaviors, including:

- **User Access Levels**: Specify who can access the system and at what privilege level (e.g., regular user, administrator).
- **Password Requirements**: Enforce minimum standards for password strength and complexity.
- **Network Configurations**: Define settings for secure communication, such as firewall rules or encryption protocols.
- **File Permissions**: Control access to and modification of data and system files.
- **Audit Policies**: Enable tracking of user activities to monitor security and detect unauthorized actions.

By logging in as an administrator, users gain elevated privileges to view, modify, and enforce these policies, allowing them to assess and strengthen system security.

## Experiment Procedure

### Step 1: Preparation

1. **Ensure System Readiness**:

   - Confirm administrative access to the computer system.
   - Verify that the operating system supports security policy settings (e.g., Windows Group Policy Editor, Linux PAM, or SELinux).
   - Set up a documentation tool (e.g., Microsoft Word, Notepad, or a security auditing tool) to record findings.

2. **Understand Security Policies**:
   - Research common security policy categories, such as password policies, access controls, network restrictions, and audit settings.
   - Familiarize yourself with the tools used to manage policies (e.g., `gpedit.msc` on Windows, `iptables` or SELinux on Linux).

### Step 2: Log into the System as an Administrator

1. **Windows Operating System**:

   - Boot the system and navigate to the login screen.
   - Enter administrator credentials (username and password).
   - Verify administrative privileges by accessing system settings or running commands like `net user administrator`.

2. **Linux Operating System**:
   - Open a terminal.
   - Use the `sudo` command to gain administrator privileges (e.g., `sudo su` or `sudo -i`).
   - Enter the administrator password when prompted.

### Step 3: Access Security Policies

1. **Windows**:

   - Open the Group Policy Editor by typing `gpedit.msc` in the Run dialog (`Win + R`).
   - Navigate to:
     - **Computer Configuration > Windows Settings > Security Settings** for policies like Account Policies, Local Policies, and Security Options.
     - **User Configuration** for user-specific settings.
   - Review settings under Account Policies (e.g., Password Policy, Account Lockout Policy), Local Policies (e.g., Audit Policy, User Rights Assignment), and Security Options.

2. **Linux**:

   - Check security settings in `/etc/security/` for Pluggable Authentication Modules (PAM) configurations.
   - Use `iptables -L` or `nft list ruleset` to review firewall rules.
   - Examine SELinux (`getenforce`, `sestatus`) or AppArmor (`aa-status`) configurations for advanced security policies.

3. **Explore Policies**:
   - Review password requirements (e.g., length, complexity).
   - Check user access controls and privilege assignments.
   - Analyze network configurations, including firewall rules and port restrictions.
   - Verify audit and logging settings for user activity tracking.

### Step 4: Analyze Security Policies

1. **Password Policies**:

   - Check for minimum password length, complexity requirements, and expiration settings.
   - Evaluate account lockout policies (e.g., threshold for failed login attempts, lockout duration).

2. **User Access Control**:

   - Identify accounts with administrator privileges versus standard users.
   - Review user rights assignments (e.g., ability to modify system files or change settings).

3. **Network Policies**:

   - Examine firewall rules for inbound/outbound traffic restrictions.
   - Check for IP filtering or restrictions on specific applications.

4. **Audit Policies**:
   - Verify if logging is enabled for critical events (e.g., logins, file access).
   - Assess the granularity of audit trails for monitoring administrator actions.

### Step 5: Record Findings and Document Observations

- Document all observed policies, including:
  - Specific settings (e.g., password length, lockout thresholds).
  - Discrepancies or weaknesses (e.g., lax password requirements, missing audit logs).
  - Potential vulnerabilities or areas for improvement.
- Summarize the overall strength of the system’s security based on the policies.

### Step 6: Evaluate the Effectiveness of Security Policies

- Assess whether policies adequately protect against common threats:
  - Are password policies strong enough to resist brute force attacks?
  - Do audit policies provide sufficient visibility into user activities?
  - Are network configurations secure against unauthorized access?
- Identify any gaps, such as weak authentication mechanisms or overly permissive access controls.

### Step 7: Suggest Improvements

- Propose enhancements to address identified weaknesses (e.g., stricter password policies, enhanced logging, or tighter network restrictions).

## Expected Output

### Identification of Security Policies

1. **Password Policy Enforcement**:

   - **Observation**: The system enforces a minimum password length of 8 characters but lacks full complexity requirements (e.g., no mandatory special characters or numbers).
   - **Weakness**: Vulnerable to brute force attacks due to predictable password patterns.
   - **Details**: Maximum password age is set to 60 days, with no minimum password age enforced.

2. **Account Lockout Policy**:

   - **Observation**: Locks accounts after 5 failed login attempts for 15 minutes.
   - **Weakness**: The reset lockout counter is not restrictive enough, allowing repeated attack attempts.
   - **Details**: No additional measures for persistent failed attempts.

3. **Administrator Privileges and User Rights**:

   - **Observation**: Administrator accounts have full system access, while standard users are restricted from critical files and settings.
   - **Weakness**: Administrative access to network shares could pose risks if credentials are compromised.
   - **Details**: User rights assignments allow administrators to modify security settings.

4. **Audit Policies and Logging**:
   - **Observation**: Basic logging is enabled for logon events and account management.
   - **Weakness**: Lacks advanced logging for file access or system configuration changes.
   - **Details**: Audit trails are limited, reducing visibility into sensitive actions.

### Analysis

- **Password Policies**: The lack of complexity requirements weakens resistance to brute force attacks. The 60-day expiration period is reasonable but should be paired with stronger composition rules.
- **Account Lockout**: The 5-attempt threshold is adequate, but a shorter reset interval or lower attempt limit could enhance protection.
- **User Access Control**: Clear separation of administrator and standard user privileges is effective, but network share access needs tighter controls.
- **Network Policies**: Firewall rules are in place but may allow unnecessary traffic (e.g., open ports for unused services).
- **Audit Policies**: Basic logging is insufficient for comprehensive monitoring, especially for sensitive operations.

### Documentation of Findings

- **Weaknesses**:
  - Inadequate password complexity increases vulnerability to attacks.
  - Limited audit logging reduces traceability of unauthorized actions.
  - Permissive network share access for administrators poses risks.
  - Remote Desktop Protocol (RDP) enabled by default could allow external attacks.
- **Recommendations**:
  - Enforce stronger password policies (e.g., 12+ characters, mixed character types).
  - Reduce account lockout threshold to 3 attempts and extend lockout duration.
  - Disable unnecessary remote access services (e.g., RDP) and tighten firewall rules.
  - Enable detailed logging for file access and configuration changes.

### Evaluation of Effectiveness

The current security policies provide a foundational level of protection but have notable gaps:

- **Password Policies**: Lack of complexity requirements makes passwords easier to crack.
- **Account Lockout**: Effective against casual attacks but could be stricter to deter persistent attempts.
- **User Access**: Well-defined but overly permissive for administrators in some areas.
- **Audit Policies**: Insufficient logging limits forensic capabilities.
- **Network Security**: Firewall is enabled, but lenient rules and default RDP access increase exposure.

Overall, the policies are a good starting point but require enhancements to fully protect the system.

### Improvement Suggestions

1. **Strengthen Password Policies**:

   - Require passwords of 12+ characters with a mix of uppercase, lowercase, numbers, and special characters.
   - Screen passwords against common or compromised lists.

2. **Tighten Account Lockout**:

   - Reduce failed login attempts to 3 and increase lockout duration to 30 minutes.
   - Implement a reset counter to prevent rapid retry attacks.

3. **Restrict Administrator Access**:

   - Limit network share access for administrators to specific, necessary resources.
   - Use principle of least privilege for all accounts.

4. **Enhance Audit Logging**:

   - Enable logging for file access, system configuration changes, and privilege escalation events.
   - Regularly review logs for suspicious activity.

5. **Secure Network Configurations**:
   - Disable RDP unless required and restrict it to specific IP addresses.
   - Tighten firewall rules to block all untrusted inbound/outbound traffic, allowing only necessary services (e.g., HTTP, HTTPS).

## Learning Outcomes

Upon completing this experiment, students should be able to:

1. Gain practical experience in logging into a system as an administrator.
2. Understand the significance of security policies in maintaining system integrity and confidentiality.
3. Navigate and analyze security settings to assess policy effectiveness.
4. Enhance critical thinking by identifying weaknesses and recommending improvements.

## Course Outcome

This experiment contributes to:

- Developing a comprehensive understanding of information security compliance principles.
- Equipping students with skills to evaluate, implement, and maintain effective security policies.
- Strengthening cybersecurity measures in organizational environments.

## Questions

1. **What are the primary roles and responsibilities of an Information Systems Auditor in ensuring compliance?**

   - Conducting risk assessments, auditing security controls, ensuring adherence to regulations, and reporting non-compliance issues.

2. **How does a Compliance Officer contribute to the design and implementation of an internal compliance system?**

   - Developing policies, monitoring adherence, conducting training, and coordinating with auditors to ensure regulatory compliance.

3. **How do PCI-DSS and HIPAA regulations influence an organization's compliance policies and controls?**
   - **PCI-DSS**: Mandates secure payment card data handling, requiring encryption, access controls, and regular audits.
   - **HIPAA**: Requires protection of health information through strict access controls, encryption, and audit logging to ensure patient privacy.

## Conclusion

This experiment provided hands-on experience in accessing a computer system as an administrator and analyzing its security policies. By examining password policies, account lockout settings, user access controls, and audit configurations, we identified strengths and weaknesses in the system’s security posture. The findings highlighted the need for stronger password requirements, enhanced logging, and tighter network controls to mitigate risks. This exercise underscored the critical role of security policies in protecting systems and the importance of regular evaluation to ensure robust cybersecurity.

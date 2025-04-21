## Aim

To prepare a password policy for computer and mobile device usage.

## Learning Objectives

1. To understand the importance of password policies in information security.
2. To learn about the key components of a password policy.
3. To develop a password policy for computer and mobile device usage.
4. To understand the implications of weak password practices and the need for strong authentication mechanisms.

## Tools

1. Computer or laptop for research and drafting the password policy.
2. Mobile device for considering password requirements on mobile platforms.

## Theory

A **password policy** is a set of rules and guidelines designed to enhance security by ensuring that users create, manage, and maintain strong and secure passwords. It defines requirements and restrictions for password creation, usage, and management within an organization or system. The primary goal of a password policy is to protect sensitive data and systems from unauthorized access by mitigating risks associated with weak passwords, such as brute force attacks, credential theft, and phishing.

### Key Components of a Password Policy

1. **Password Length**: Specifies the minimum and recommended number of characters for passwords.
2. **Complexity Requirements**: Defines the use of diverse character types (e.g., uppercase, lowercase, numbers, special characters) to increase password strength.
3. **Password Expiration and Renewal**: Sets guidelines for how often passwords should be changed, if necessary.
4. **Prohibition of Password Reuse**: Prevents users from reusing previous passwords to reduce the risk of compromised credentials.
5. **Account Lockout Thresholds**: Implements limits on failed login attempts to protect against brute force attacks.
6. **Multi-Factor Authentication (MFA)**: Requires additional verification methods (e.g., biometrics, one-time codes) to enhance security.

A well-crafted password policy balances security with usability, ensuring that users can comply without undue inconvenience. Weak password practices, such as using simple passwords or reusing them across accounts, significantly increase the risk of security breaches, making robust policies essential.

## Experiment Steps

1. **Research Password Policies**: Study industry standards and best practices, such as those from the National Institute of Standards and Technology (NIST), to understand effective password policy guidelines.
2. **Identify Platform-Specific Requirements**: Analyze the unique security needs and constraints of computer systems and mobile devices.
3. **Draft the Password Policy**: Create a comprehensive policy document addressing the needs of both platforms while considering usability and security trade-offs.
4. **Consider User Experience**: Ensure the policy is practical and user-friendly to encourage compliance without compromising security.
5. **Review and Refine**: Evaluate the draft for clarity, alignment with organizational goals, and compliance with industry standards, making revisions as needed.

## Output

Below is a structured approach to developing a comprehensive password policy for computers and mobile devices, aligned with industry best practices:

### 1. Password Policies and Guidelines

Industry standards, particularly NIST Special Publication 800-63B (2024), provide evidence-based recommendations for password policies:

- **Password Length**: Require a minimum of 8 characters, with a recommendation of 15 or more for enhanced security. Longer passwords (e.g., passphrases) are harder to crack.
- **Password Complexity**: Avoid mandatory complexity rules (e.g., requiring uppercase, numbers, and symbols) as they often lead to predictable patterns (e.g., "Password1!"). Instead, encourage random, memorable passphrases.
- **Password Expiration**: Eliminate arbitrary expiration periods (e.g., every 90 days) unless there is evidence of compromise, as frequent changes can lead to weaker passwords.
- **Screening**: Check new passwords against lists of commonly used or compromised passwords to prevent weak choices.

### 2. Specific Requirements for Computer Systems and Mobile Devices

#### Computer Systems

- **Password Storage**: Store passwords using strong cryptographic methods, such as salted hashes (e.g., bcrypt, Argon2), to protect against offline attacks.
- **Password Managers**: Promote the use of password managers to generate, store, and autofill strong, unique passwords, reducing the burden on users.
- **MFA**: Require multi-factor authentication for sensitive systems or accounts to add an additional layer of security.

#### Mobile Devices

- **Passcode Policies**: Mandate alphanumeric passcodes or complex PINs (e.g., 6+ characters) instead of simple 4-digit PINs. Support biometric authentication (e.g., fingerprint, facial recognition) as a convenient alternative.
- **Device Security**: Enforce auto-lock timers (e.g., 1-5 minutes) and account lockout after 5-10 failed attempts to prevent unauthorized access.
- **Encryption**: Ensure devices use full-disk encryption to protect data if the device is lost or stolen.

### 3. Comprehensive Password Policy Document

The following policy outlines requirements for creating and managing passwords on computers and mobile devices:

#### Password Creation

- **Length**: Passwords must be at least 15 characters long. Passphrases (e.g., "correct horse battery staple") are encouraged for memorability and strength.
- **Composition**: No mandatory complexity rules; however, passwords should not be easily guessable or based on personal information (e.g., names, birthdays).
- **Uniqueness**: Each account must have a unique password to prevent cascading breaches.

#### Password Management

- **Password Reuse**: Prohibited across all accounts and platforms to minimize the impact of credential leaks.
- **Password Managers**: Strongly recommended to generate and securely store complex passwords.
- **Password Sharing**: Forbidden, except in secure, approved systems (e.g., enterprise password vaults).

#### Password Protection

- **Secure Storage**: Passwords must be stored in hashed and salted formats on servers and devices.
- **MFA**: Required for all critical systems, including email, financial accounts, and administrative access. MFA options include biometrics, authenticator apps, or hardware tokens.
- **Account Lockout**: Systems must lock accounts after 5-10 failed login attempts, with a temporary lockout period (e.g., 15 minutes) or administrative unlock.

#### Password Change Protocols

- **Expiration**: Passwords should not expire unless there is evidence of compromise or a security audit mandates a change.
- **Compromise Response**: Immediate password changes are required if a breach or suspicious activity is detected.
- **User Education**: Provide regular training on secure password practices, phishing awareness, and the benefits of MFA.

#### Mobile Device-Specific Policies

- **Passcode Requirements**: Minimum 6-character alphanumeric passcode or biometric authentication (e.g., fingerprint, face ID).
- **Auto-Lock**: Devices must lock automatically after 1-5 minutes of inactivity.
- **Remote Wipe**: Enable remote wipe capabilities to erase data on lost or stolen devices.

### 4. Usability and Security Trade-Offs

- **User Convenience**: Long passphrases and password managers reduce the cognitive load of remembering complex passwords. Biometrics on mobile devices enhance usability without sacrificing security.
- **Security**: MFA and account lockouts significantly reduce the risk of unauthorized access, while avoiding forced complexity rules prevents predictable password patterns.
- **Compliance**: The policy aligns with NIST guidelines and can be adapted to meet regulatory requirements (e.g., GDPR, HIPAA).

### 5. Review and Refinement

- **Clarity**: Use clear, concise language to ensure users understand the policy.
- **Effectiveness**: Test the policy in a pilot group to identify practical challenges and gather feedback.
- **Alignment**: Ensure the policy supports organizational security goals and complies with relevant standards or regulations.

## Learning Outcomes

Upon completing this experiment, students should be able to:

1. Understand the critical role of password policies in safeguarding information security.
2. Develop a comprehensive password policy tailored to computers and mobile devices.
3. Evaluate the balance between security and usability in password policy design.
4. Recognize the challenges of implementing and enforcing password policies in organizations.

## Course Outcomes

This experiment contributes to the following course outcomes:

1. Understanding the principles and concepts of information security compliance.
2. Developing skills in designing and implementing security policies and procedures.
3. Evaluating the effectiveness of security measures in mitigating risks and vulnerabilities.
4. Demonstrating knowledge of industry standards and best practices in information security management.

## Conclusion

This experiment provided a practical approach to designing a password policy for computers and mobile devices, emphasizing the importance of aligning with industry standards like NIST. By addressing password creation, management, protection, and platform-specific requirements, the policy ensures robust security while maintaining user-friendliness. The exercise highlighted the need for strong authentication mechanisms, such as MFA, and the risks associated with weak password practices, equipping students with the skills to enhance organizational security.

## Aim

To set, configure, and manage three password policies in a computer system for BIOS, Administrator, and Standard User accounts.

## Learning Objectives

1. To understand the importance of password policies in maintaining system security.
2. To learn how to configure password policies at different levels: BIOS, Administrator, and Standard User.
3. To explore the impact of different password policies on system security and user experience.

## Tools

1. Computer with BIOS/UEFI access.
2. Operating system with administrative privileges (e.g., Windows, Linux).
3. User account management tools (e.g., Group Policy Editor for Windows, Linux user management tools like `passwd` or `chage`).

## Theory

**Password policies** are critical for securing computer systems by enforcing strong authentication measures. They define rules for creating, managing, and using passwords to prevent unauthorized access, data breaches, and other security threats. A well-designed password policy balances security with usability, ensuring robust protection without overly complicating user interactions. This experiment focuses on configuring password policies at three levels:

1. **BIOS Password Policy**:

   - Protects the system’s firmware (BIOS/UEFI) settings, preventing unauthorized changes to hardware configurations or boot settings.
   - Set during system boot via the BIOS/UEFI interface.
   - Enhances security by restricting access to low-level system controls.

2. **Administrator Password Policy**:

   - Governs accounts with elevated privileges, ensuring only authorized users can modify system settings or access sensitive resources.
   - Configured through operating system tools like Windows Local Security Policy or Linux user management commands.
   - Includes rules for password complexity, expiration, and account lockout.

3. **Standard User Password Policy**:
   - Applies to non-privileged accounts, limiting access to sensitive settings and system modifications.
   - Managed via user account settings in the operating system.
   - Ensures regular users maintain secure passwords without requiring administrative-level restrictions.

## Procedure

### 1. Configuring BIOS Password

1. **Access BIOS/UEFI**:

   - Restart the computer and press the appropriate key (e.g., F2, F10, Del) during boot to enter the BIOS/UEFI setup.

2. **Navigate to Security Settings**:

   - Locate the “Security” or “Password” section in the BIOS/UEFI menu.

3. **Set BIOS Password**:

   - Enable the administrator or user password option.
   - Enter and confirm a strong password (e.g., 8+ characters, mix of letters, numbers, and symbols).

4. **Save and Exit**:
   - Save changes (usually via F10) and exit the BIOS/UEFI, rebooting the system.
   - Verify that the password is required to access BIOS/UEFI settings.

### 2. Configuring Administrator Password Policy

1. **Access Policy Management Tool**:

   - **Windows**:
     - Open the Local Security Policy by typing `secpol.msc` in the Run dialog (`Win + R`).
     - Navigate to `Account Policies > Password Policy`.
   - **Linux**:
     - Open a terminal and use `sudo` to access administrative privileges.

2. **Set Password Policy**:

   - **Windows**:
     - Configure:
       - **Minimum Password Length**: 12 characters.
       - **Password Complexity**: Require uppercase, lowercase, numbers, and special characters.
       - **Maximum Password Age**: 90 days.
       - **Password History**: Prevent reuse of the last 5 passwords.
       - **Account Lockout**: Lock account after 3 failed attempts for 15 minutes.
     - Apply changes.
   - **Linux**:
     - Edit `/etc/login.defs` to set:
       - `PASS_MAX_DAYS 90` (password expiration).
       - `PASS_MIN_LEN 12` (minimum length).
     - Use `sudo pam_tally2` to configure account lockout (e.g., lock after 3 failed attempts).
     - Enforce complexity by editing `/etc/security/pwquality.conf` (e.g., require mixed characters).

3. **Restart System**:
   - Reboot to ensure policy changes take effect.
   - Test by logging into an administrator account with a compliant password.

### 3. Configuring Standard User Password Policy

1. **Create or Select Standard User Account**:

   - **Windows**:
     - Open `Control Panel > User Accounts > Manage Accounts` and create a standard user account if none exists.
   - **Linux**:
     - Use `sudo adduser username` to create a standard user.

2. **Set Password Policy**:

   - **Windows**:
     - Use Group Policy Editor (`gpedit.msc`) to apply user-specific policies:
       - Navigate to `User Configuration > Administrative Templates > System > Logon`.
       - Set password requirements (e.g., minimum 10 characters, no reuse of last 3 passwords).
     - Alternatively, use `net accounts` in Command Prompt:
       ```bash
       net accounts /minpwlen:10 /maxpwage:90 /uniquepw:3
       ```
   - **Linux**:
     - Use `sudo chage` to set password policies for the user:
       ```bash
       sudo chage --maxdays 90 --minlen 10 username
       ```
     - Enforce complexity via `/etc/security/pwquality.conf` (e.g., require at least one uppercase, number, and special character).

3. **Verify Policy**:
   - Log in as the standard user and attempt to set a non-compliant password to confirm restrictions.

## Output

### Configured Password Policies

1. **BIOS Password Policy**:

   - **Settings**:
     - Password required to access BIOS/UEFI settings.
     - 8-character password with mixed letters, numbers, and symbols.
   - **Impact**:
     - Prevents unauthorized changes to boot order or hardware settings.
     - Enhances security at the firmware level.

2. **Administrator Password Policy**:

   - **Settings**:
     - Minimum length: 12 characters.
     - Complexity: Uppercase, lowercase, numbers, special characters.
     - Expiration: 90 days.
     - Reuse prevention: Last 5 passwords.
     - Lockout: 3 failed attempts, 15-minute lockout.
   - **Impact**:
     - Restricts administrative access to authorized users.
     - Reduces risk of brute force attacks and credential reuse.

3. **Standard User Password Policy**:
   - **Settings**:
     - Minimum length: 10 characters.
     - Complexity: At least one uppercase, number, and special character.
     - Expiration: 90 days.
     - Reuse prevention: Last 3 passwords.
   - **Impact**:
     - Ensures regular users maintain secure passwords.
     - Limits exposure to sensitive system areas.

### Documentation of Policies

- **BIOS**:
  - Password set to restrict firmware access.
  - Tested by attempting BIOS entry without the password (access denied).
- **Administrator**:
  - Policy enforced via Local Security Policy (Windows) or `/etc/login.defs` and PAM (Linux).
  - Tested by creating a non-compliant password (rejected) and triggering lockout after 3 failed logins.
- **Standard User**:
  - Policy applied via Group Policy or `chage` command.
  - Verified by setting a compliant password and confirming restrictions on non-compliant attempts.

### Observations

- **Security Impact**:
  - **BIOS**: Prevents unauthorized hardware or boot changes, critical for physical security.
  - **Administrator**: Strong policies reduce the risk of unauthorized system modifications, though frequent expirations may prompt users to write down passwords.
  - **Standard User**: Ensures basic security for non-privileged accounts without overly restrictive rules, maintaining usability.
- **Usability Impact**:
  - **BIOS**: Minimal impact on daily use, as BIOS access is infrequent.
  - **Administrator**: Complex requirements may challenge users, but password managers can mitigate this.
  - **Standard User**: Balanced requirements ensure security without overwhelming users.
- **Challenges**:
  - Forgetting the BIOS password requires hardware reset (e.g., CMOS battery removal).
  - Administrator lockout policies must be carefully tuned to avoid locking out legitimate users.
  - Standard user policies require user education to ensure compliance.

## Learning Outcomes

Upon completing this experiment, students should be able to:

1. Gain practical experience in configuring password policies at BIOS, Administrator, and Standard User levels.
2. Understand the role of strong password policies in enhancing system security.
3. Balance security requirements with user convenience to ensure effective policy implementation.

## Course Outcome

This experiment contributes to:

- Developing a deeper understanding of information security principles and practices.
- Equipping students with skills to implement effective password policies to protect systems from unauthorized access and threats.

## Conclusion

This experiment provided hands-on experience in configuring and managing password policies at the BIOS, Administrator, and Standard User levels. By setting robust policies, we enhanced system security against unauthorized access and potential threats. The exercise highlighted the importance of balancing security with usability, as overly stringent policies can reduce user compliance. The configured policies demonstrated effective protection at different system layers, reinforcing the critical role of password management in cybersecurity.

## Aim

**Installation of KALI Linux on Virtual Box**

---

## Learning Objective

To learn the installation of KALI Linux on VirtualBox.

---

## Theory

Kali Linux is a specialized Debian-based Linux distribution designed for security researchers, penetration testers, and cybersecurity enthusiasts. It evolved from BackTrack Linux and is tailored for performing security audits, vulnerability assessments, and penetration testing. Kali Linux comes pre-installed with hundreds of tools for tasks such as network scanning, password cracking, web application testing, and digital forensics. These tools include Nmap, Metasploit, Burp Suite, and Wireshark, among others, making it a comprehensive platform for cybersecurity professionals.

Kali Linux is highly versatile and can be used in multiple ways. It can be run as a Live USB or DVD for temporary, non-persistent sessions, allowing users to boot into the system without installing it. Alternatively, it can be installed as the primary operating system on a physical machine or within a virtual machine for persistent use. Its flexibility extends to various architectures, including i386 (32-bit) and amd64 (64-bit), ensuring compatibility with a wide range of hardware. Kali Linux is maintained by Offensive Security, which regularly updates the distribution to include the latest tools and security patches.

The use of Kali Linux in a virtualized environment, such as VirtualBox, is a common practice for safe and controlled testing. Virtualization allows users to experiment with Kali's tools without affecting their primary system, isolate network activities, and create snapshots to revert changes. This setup is ideal for learning penetration testing techniques, practicing secure configurations, and simulating real-world attack scenarios in a sandboxed environment. However, users must exercise caution, as Kali Linux contains powerful tools that can cause harm if misused. It should only be used on systems or networks with explicit permission to avoid legal and ethical issues.

---

## Prerequisites

- At least 20 GB of disk space
- At least 1 GB of RAM (preferably 2 GB) for i386 and amd64 architectures
- VirtualBox (or alternative virtualization software)

---

## Steps for Installing Kali Linux on VirtualBox

### Step 1: Download Kali Linux ISO Image

- Go to the [official Kali Linux Downloads page](https://www.kali.org/get-kali/).
- Download the appropriate 64-bit or 32-bit version depending on your system.

> 💡 _Note: Learn more about Kali Linux and how it compares to other distros in our article "Kali Linux vs. Ubuntu"._

---

### Step 2: Create Kali Linux VirtualBox Container

1. Launch **VirtualBox Manager** and click the **New** icon.
2. **Name and Operating System**:
   - Enter a name and select a destination folder.
   - The Type and Version will auto-fill. Ensure they match the downloaded ISO.
3. **Memory Size**: Allocate memory (recommended: 1024 MB or more).
4. **Hard Disk**: Choose to create a virtual hard disk now and click **Create**.
5. **Hard Disk File Type**: Choose `VDI (VirtualBox Disk Image)` and click **Next**.
6. **Storage on Physical Disk**: Choose between
   - **Dynamically allocated** (grows as needed), or
   - **Fixed size** (uses defined space from start).
7. **File Location and Size**:
   - Choose location and size (recommended minimum: 8 GB).
   - Click **Create**.

---

### Step 3: Configure Virtual Machine Settings

1. Select the VM and click the **Settings** icon.
2. Navigate to **General > Advanced** tab:
   - Set **Shared Clipboard** and **Drag’n’Drop** to **Bidirectional**.
3. Go to **System > Motherboard**:
   - Set **Boot Order** to: Optical > Hard Disk.
   - Uncheck **Floppy**.
4. Under the **Processor** tab:
   - Increase processors to **2** (optional for performance).
5. Navigate to **Storage**:
   - Add the Kali ISO under **Controller: IDE** by clicking the disk icon.
6. Click **Start** to begin the installation process.

---

### Step 4: Installing and Setting Up Kali Linux

1. On the Kali welcome screen, select **Graphical install**.
2. Follow these steps in the installation wizard:

   - **Language**: Select your language.
   - **Location**: Select your country.
   - **Keyboard**: Choose keymap (e.g., American English).
   - **Network**:
     - Enter hostname.
     - Enter domain name (e.g., example.com).
   - **Users & Passwords**: Set a strong root password.
   - **Clock**: Select time zone.
   - **Partition Disks**:
     - Select `Guided – use entire disk`.
     - Choose the virtual disk (e.g., `SCSI3 (0,0,0)` – 68.7 GB).
     - Use `All files in one partition`.
     - Finish partitioning and write changes to disk. Confirm with **Yes**.
   - **Installation**: Let Kali install and configure.
   - **Package Manager**:
     - Choose whether to use a network mirror.
     - Enter HTTP proxy if required, else leave blank.
   - **GRUB Boot Loader**:
     - Choose **Yes** to install GRUB on the hard disk.
     - Select the boot loader device.

3. After installation is complete, click **Continue** to reboot the VM.
4. On reboot, you’ll see the Kali login screen. Log in using the root credentials you set earlier.

---

## Learning Outcome

Successfully learned and performed installation of **KALI Linux in VirtualBox**.

**Conclusion:**
This experiment demonstrates the process of installing Kali Linux on VirtualBox, providing a safe and controlled environment for learning cybersecurity and penetration testing. By completing the installation, users gain hands-on experience with virtualization, Linux system setup, and disk partitioning. The exercise underscores the importance of:

- Using Kali Linux responsibly and only on authorized systems
- Configuring virtual machines to optimize performance and security
- Maintaining strong credentials to protect the root account
- Regularly updating Kali Linux to access the latest tools and patches This setup serves as a foundation for exploring Kali's extensive suite of security tools in a controlled environment.

**Aim:** To study about OWASP ZAP tool in KALI LINUX.

**Learning Objective:** To understand **Vulnerability scanning of Web application using OWASP ZAP** in KALI LINUX.

**Theory:**

**What is OWASP ZAP?**
Zed Attack Proxy (ZAP) is a free, open-source penetration testing tool being maintained under the umbrella of The Software Security Project (SSP). ZAP is designed specifically for testing web applications and is both flexible and extensible.

At its core, ZAP is what is known as a “man-in-the-middle proxy.” It stands between the tester’s browser and the web application so that it can intercept and inspect messages sent between browser and web
application, modify the contents if needed, and then forward those packets on to the destination. It can be used as a stand-alone application, and as a daemon process.

If there is another network proxy already in use, as in many corporate environments, ZAP can be configured to connect to that proxy.

ZAP provides functionality for a range of skill levels – from developers, to testers new to security testing, to security testing specialists. ZAP has versions for each major OS and Docker, so you are not tied to a single OS. Additional functionality is freely available from a variety of add-ons in the ZAP Marketplace, accessible from within the ZAP client.

Because ZAP is open-source, the source code can be examined to see exactly how the functionality is implemented. Anyone can volunteer to work on ZAP, fix bugs, add features, create pull requests to pull
fixes into the project, and author add-ons to support specialized situations.

**Install and Configure ZAP**

Go to following website:

https://www.zaproxy.org/download/

Download LINUX Installer

Then, go to Downloads in kali with the help of following commands.

```shell
cd Download/
chmod +x ZAP_2_14_0_unix.sh
sudo su
```

```shell
./ZAP_2_14_0_unix.sh
```

ZAP will be successfully installed in the KALI LINUX.

**Persisting a Session**

When you first start ZAP, you will be asked if you want to persist the ZAP session. By default, ZAP sessions are always recorded to disk in a HSQLDB database with a default name and location. If you do not persist the session, those files are deleted when you exit ZAP. If you choose to persist a session, the session information will be saved in the local database so you can access it later, and you will be able to
provide custom names and locations for saving the files.

For now, select **No, I do not want to persist this session at this moment in time** , then click **Start**. The ZAP sessions will not be persisted for now.

**ZAP Desktop UI**

The ZAP Desktop UI is composed of the following elements:

1. **Menu Bar** – Provides access to many of the automated and manual tools.
2. **Toolbar** – Includes buttons which provide easy access to most commonly used features.
3. **Tree Window** – Displays the Sites tree and the Scripts tree.
4. **Workspace Window** – Displays requests, responses, and scripts and allows you to edit them.
5. **Information Window** – Displays details of the automated and manual tools.
6. **Footer** – Displays a summary of the alerts found and the status of the main automated tools.

**Running an Automated Scan**

1. Start ZAP and click the Quick Start tab of the Workspace Window.
2. Click the large Automated Scan button.
3. In the URL to attack text box, enter the full URL of the web application you want to attack.
4. Click the Attack

ZAP will proceed to crawl the web application with its spider and passively scan each page it finds. Then ZAP will use the active scanner to attack all of the discovered pages, functionality, and parameters.

**View Alerts and Alert Details**

The left-hand side of the Footer contains a count of the Alerts found during your test, broken out into risk
categories. These risk categories are:

To view the alerts created during your test:

1. Click the **Alerts** tab in the Information Window.
2. Click each alert displayed in that window to display the URL and the vulnerability detected in the right side of the Information Window.
3. In the Workspace Windows, click the **Response** tab to see the contents of the header and body of the response. The part of the response that generated the alert will be highlighted.

**Manual Exploration**

1. Start ZAP and click the Quick Start tab of the Workspace Window.
2. Click the large Manual Explore button.
3. In the URL to explore text box, enter the full URL of the web application you want to explore.
4. Select the browser you would like to use 5. Click the Launch Browser

**Learning Outcome:** Performed Vulnerability scanning of Web application using OWASP ZAP in KALI LINUX.

**Conclusion:**
This experiment demonstrates the use of OWASP ZAP in Kali Linux for vulnerability scanning of web applications. By installing and configuring ZAP, running automated scans, and exploring manual testing, users gain practical experience in identifying security flaws. The exercise highlights the importance of:

- Conducting scans only on authorized web applications
- Interpreting and prioritizing alerts based on risk levels
- Using both automated and manual techniques for thorough testing
- Implementing remediation strategies to address identified vulnerabilities This knowledge equips users to enhance web application security and perform effective penetration testing.

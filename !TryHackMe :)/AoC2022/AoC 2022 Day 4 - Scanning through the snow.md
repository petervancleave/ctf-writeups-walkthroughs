Day 4 introduces scanning, one of the most critical phases in any offensive or defensive security workflow. Scanning allows us to identify live hosts, open ports, running services, and potential weaknesses that can later be exploited or hardened.

## Learning Objectives

In this task, you will learn to:

• Understand what scanning is and why it matters  
• Differentiate between common scanning types and techniques  
• Use popular scanning tools to enumerate services  
• Leverage discovered services to access exposed resources

---

## What is Scanning

Scanning is the process of probing systems to gather technical information such as:

• Which hosts are online  
• Which ports are open  
• What services are running  
• What operating system is in use  
• Whether known vulnerabilities may exist

Scanning expands visibility into a target’s attack surface. While attackers use scanning to identify entry points, defenders use it to discover and secure exposed services before they can be abused.

---

## Scanning Tools

### Nmap

Nmap, or Network Mapper, is one of the most widely used tools for scanning and enumeration. It can identify open ports, running services, operating systems, and much more.

Commonly used Nmap options include:

• TCP SYN scan for stealthy port discovery  
• Ping scan to identify live hosts  
• OS detection to fingerprint the target system  
• Service detection to identify running applications

---

### Nikto

Nikto is a web vulnerability scanner used to identify common misconfigurations, outdated software, exposed files, and other weaknesses in web servers.

---

## Walkthrough

### Identifying the HTTP Server

To identify the HTTP server running on the QA host, run a service detection scan using Nmap:

`nmap -sV MACHINE_IP`

From the output, the HTTP service and server name are listed.

**Answer:** Apache

### Identifying the Service on Port 22

From the same Nmap scan output, port 22 is shown as open with a specific service associated with it.

**Answer:** ssh

---

### Accessing the Samba Service

Using credentials previously discovered during the OSINT task, we can now access the exposed Samba service.

Connect using the file browser and enter the following:

• Username: ubuntu  
• Password: S@nta2022

Navigate to the admin directory and open the flag.txt file found inside.

**Answer:** THM_SANTA_SMB_SERVER

---

### Finding the Password for santahr

While browsing the Samba share, open the userlist.txt file. Inside this file, locate the entry for the santahr user.

The password is clearly listed alongside the username.

**Answer:** santa25
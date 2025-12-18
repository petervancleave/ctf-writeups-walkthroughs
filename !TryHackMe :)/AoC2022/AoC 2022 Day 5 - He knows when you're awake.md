Day 5 introduces brute forcing and authentication attacks against common remote access services. The focus is on identifying exposed services, using automated tools to recover weak credentials, and accessing systems through graphical remote protocols.

## Learning Objectives

In this task, you will learn to:

• Understand common remote access services  
• Identify a VNC service through port scanning  
• Use Hydra to brute force authentication services  
• Connect to a remote system using a VNC client

---

## Remote Access Services Overview

### SSH

SSH, Secure Shell, provides remote command line access to Unix-like systems. It is commonly used by administrators to manage servers securely over the network.

---

### RDP

RDP, Remote Desktop Protocol, allows users to remotely access Windows systems through a graphical desktop interface, using keyboard and mouse input as if physically present.

---

### VNC

VNC, Virtual Network Computing, provides graphical remote access across multiple operating systems. Unlike SSH, VNC exposes a full desktop environment and often relies solely on a password for authentication.

---

## Hacking an Authentication Service

When services rely on weak or reused passwords, they become vulnerable to brute force attacks. Instead of manually guessing passwords, attackers use automated tools like THC Hydra to rapidly test large password lists against exposed services.

Hydra supports many protocols, including SSH, VNC, FTP, and others.

General Hydra syntax:

`hydra -l username -P wordlist.txt TARGET service`

If a service does not require a username, the -l option is omitted.

---

## Walkthrough

### Scanning for Open Services

Start the AttackBox and target machine, then scan the host using Nmap:

`nmap -sS 10.10.91.66`

The scan reveals two listening services:

• SSH  
• VNC

Since the task focuses on VNC, the next step is brute forcing the VNC password.

---

### Brute Forcing the VNC Password

Because the VNC service does not require a username, we run Hydra without specifying one:

`hydra -P /usr/share/wordlists/rockyou.txt 10.10.91.66 vnc`

Alternatively, a more verbose and controlled command can be used:

`hydra -P /usr/share/wordlists/rockyou.txt vnc://10.10.91.66 -V -f -t 4`

Hydra successfully discovers the VNC password.

**Answer:** 1q2w3e4r

---

### Connecting to the VNC Server

Using a VNC client on the AttackBox, such as Remmina:

1. Select VNC as the protocol
    
2. Enter the target IP address
    
3. When prompted, enter the recovered password
    

After successfully connecting, the remote desktop becomes visible and displays the flag directly on the screen.

**Answer:** THM{I_SEE_YOUR_SCREEN}
# Passwords - A Cracking Christmas


https://tryhackme.com/room/attacks-on-ecrypted-files-aoc2025-asdfghj123

---

Attackers almost never attack cryptography directly. Modern encryption is strong. Instead, they target the weakest link: human chosen passwords.

The goal is not to break encryption, but to guess the password protecting the file.

---

## Primary Attack Techniques

### Dictionary Attacks

Dictionary attacks use predefined wordlists containing:

• Leaked passwords from prior breaches  
• Common passwords like password123  
• Predictable patterns using names, dates, seasons  
• Known substitutions like p@ssw0rd

These attacks are fast and effective because password reuse and weak choices are common.

Common wordlists include:

• rockyou.txt  
• SecLists collections  
• Target specific lists built from company names or project data

Dictionary attacks are always attempted first due to their high success rate and low cost.

---

### Brute Force and Mask Attacks

Brute force attacks try every possible character combination. This guarantees success but becomes infeasible as password length and complexity increase.

Mask attacks optimize brute force by narrowing the search space based on expected patterns.

Example mask:

?l?l?l?d?d  
Three lowercase letters followed by two digits

Mask attacks balance speed and coverage when the attacker has partial knowledge of password structure.

---

## Practical Workflow Used by Attackers

1. Start with a generic wordlist for fast wins
    
2. Move to targeted wordlists if needed
    
3. Apply mask or incremental attacks on short passwords
    
4. Use GPU acceleration where possible
    
5. Monitor system resources to avoid detection
    

This workflow is predictable and therefore detectable.

---

## File Type Confirmation

Before cracking, attackers identify the file type:

• PDF files require PDF specific tools  
• ZIP files require ZIP specific tools

This determines the correct extraction and cracking method.

---

## Common Tools by File Type

PDF files:  
• pdfcrack  
• john via pdf2john

ZIP files:  
• fcrackzip  
• john via zip2john

General purpose:  
• john  
• hashcat

John the Ripper is flexible and widely used. Hashcat is faster and GPU optimized.

---

## Why Offline Cracking Is Dangerous

Offline cracking does not generate failed login attempts. This means:

• No account lockouts  
• No authentication logs  
• No SIEM alerts from auth systems

Detection must occur on the host performing the cracking.

---

## Detection and Telemetry Opportunities

### Process Creation

Watch for known binaries and aliases:

• john  
• hashcat  
• fcrackzip  
• pdfcrack  
• zip2john  
• pdf2john.pl  
• 7z, qpdf, unzip

Command line indicators:

• --wordlist or -w  
• rockyou.txt  
• --mask  
• -a 3 in hashcat

---

### File Artefacts

• ~/.john/john.pot  
• ~/.hashcat/hashcat.potfile  
• john.rec

Repeated reads of large wordlists are a strong indicator.

---

### GPU and Resource Signals

GPU based cracking is noisy:

• Sustained high GPU utilization  
• Increased power draw and fan activity  
• nvidia-smi showing long running john or hashcat processes

Loaded libraries may include:

• nvcuda.dll  
• OpenCL.dll  
• libcuda.so

---

### Network Signals

While cracking itself is offline, preparatory activity often includes:

• Downloading rockyou.txt  
• Cloning wordlist repositories  
• Installing cracking tools  
• GPU driver updates

These are valuable early warning signals.

---

## Example Detection Logic

Windows Sysmon Event ID 1:  
Process creation with command line logging enabled

Linux:  
• auditd execve rules  
• Wordlist read monitoring

Sigma style detection:  
Trigger on cracking binaries or wordlist usage combined with suspicious flags.

---

## Response Playbook

When detected:

1. Isolate the host if unauthorized
    
2. Capture volatile artefacts:  
    • Process list  
    • Memory dump  
    • GPU usage snapshot  
    • Open file handles
    
3. Preserve working directories and wordlists
    
4. Identify decrypted content and access scope
    
5. Determine authorization and intent
    
6. Escalate to incident response if malicious
    
7. Rotate affected credentials and enforce MFA
    
8. Educate users and enforce secure password policies

---

Q: What is the flag inside the encrypted PDF?

A: THM{Cr4ck1ng_PDFs_1s_34$y}

Q: What is the flag inside the encrypted zip file?

A: `THM{Cr4ck1n6_z1p$_1s_34$yyyy}`
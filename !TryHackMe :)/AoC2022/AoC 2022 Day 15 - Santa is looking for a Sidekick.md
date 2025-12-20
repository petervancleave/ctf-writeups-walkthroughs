
Day 15 focuses on secure coding practices, specifically input validation and unrestricted file upload vulnerabilities. This task demonstrates how insecure file handling can lead directly to remote code execution and how proper defensive techniques can prevent such attacks.

---

## Learning Objectives

In this task, you learned to:

• Understand the importance of input validation  
• Identify unrestricted file upload vulnerabilities  
• Recognize how file uploads can be abused for phishing and malware delivery  
• Exploit an unrestricted file upload to gain remote access  
• Apply secure coding defenses to prevent file upload abuse

---

## Input Validation and File Upload Risks

Input validation is one of the most critical security controls in any web application. When an application blindly trusts user input, attackers can abuse that trust to inject malicious content. File upload functionality is especially dangerous because it allows attackers to place files directly onto the server.

An unrestricted file upload vulnerability exists when an application allows users to upload files without properly validating file type, content, or behavior. This can result in remote code execution, malware distribution, or persistent compromise.

---

## Exploitation Results

### 1. Name of the Vulnerability

File uploads that allow threat actors to upload arbitrary files are known as:

**Answer:** Unrestricted

---

### 2. Title of the Web Application

After launching the target machine and accessing the website, the application title was identified.

**Answer:** SantaSideKick2

---

### 3. Flag in the HR Elf’s Documents Directory

The application allowed file uploads without enforcing file type restrictions. A malicious executable was generated using msfvenom and uploaded as a fake CV. When an elf reviewed the uploaded file, a reverse shell was established.

Navigating to the HR Elf’s documents directory revealed the flag.

**Answer:** THM{Naughty.File.Uploads.Can.Get.You.RCE}

---

## Secure Defense Techniques

The task concludes by highlighting essential defenses that should always be implemented for file uploads.

### 4. Restrict Allowed File Types

Ensures only approved file extensions are accepted.

**Answer:** File Extension Validation

---

### 5. Prevent Direct File Retrieval

Stops attackers from accessing uploaded files by predictable names.

**Answer:** File Renaming

---

### 6. Block Malicious Content

Detects and prevents known malware from being uploaded.

**Answer:** Malware Scanning
Day 12 focuses on foundational malware analysis techniques, emphasizing manual investigation rather than reliance on automated sandbox scanners. The task walks through identifying malware characteristics, unpacking binaries, and observing live behavior inside a controlled sandbox environment.

---

## Learning Objectives

In this task, you will learn to:

• Understand common malware behaviors and why they matter in investigations  
• Perform basic static and dynamic malware analysis  
• Identify persistence mechanisms, file creation, and network activity  
• Analyze malware safely using a sandbox environment

---

## Malware Analysis Overview

Malware is software designed to disrupt systems, steal information, or maintain unauthorized access. Threat actors often design malware to persist, communicate externally, and manipulate system resources in subtle ways.

Key behavioral indicators include:

• Network connections for command and control or payload retrieval  
• Registry modifications to establish persistence  
• File creation or modification to support execution

---

## Sandbox Environment

A sandbox is an isolated environment designed to safely execute malware samples. It allows analysts to observe behavior without risking their primary system or network.

For this task, a FlareVM instance is used as a manual analysis sandbox.

---

## Static and Dynamic Analysis

Static analysis examines a malware sample without executing it, focusing on metadata, strings, structure, and compilation details.

Dynamic analysis involves executing the malware in a sandbox to observe real time behavior such as registry changes, file creation, and network connections.

Both approaches are used in this task.

---

## Analysis Results

### 1. Malware Architecture

Using Detect It Easy on the sample file, the architecture was identified as:

**Answer:** 64-bit

---

### 2. Packer Used

The malware was identified as being packed with:

**Answer:** upx

---

### 3. Compiler Used

After unpacking the sample using UPX and analyzing it with CAPA, the compiler used to build the malware was identified as:

**Answer:** nim

---

### 4. MITRE ATT&CK Techniques Under Discovery

CAPA analysis revealed two techniques attributed to the Discovery tactic.

**Answer:** 2

---

### 5. Registry Key Abused

Using Process Monitor with registry focused filters, the malware was observed creating a persistence mechanism via a Run key.

**Answer:**  
HKCU\Software\Microsoft\Windows\CurrentVersion\Run

---

### 6. Registry Value Written

The malware wrote the following value to the registry key to establish persistence:

**Answer:**  
C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\wishes.bat

---

### 7. Files Created by the Malware

By filtering file write operations in Process Monitor, two files were observed being created under the Administrator directory.

**Answer:**  
test.jpg,wishes.bat

---

### 8. Domains Contacted by the Malware

Network activity analysis revealed two external domains contacted by the malware.

**Answer:**  
bestfestivalcompany.thm.virustotal.com

---

### 9. Full URL Used for File Download

String analysis of the malware binary revealed the exact URL used to download a file from the first contacted domain.

**Answer:**
http://bestfestivalcompany.thm/favicon.ico

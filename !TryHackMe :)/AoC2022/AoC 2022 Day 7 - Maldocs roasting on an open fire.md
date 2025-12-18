
Day 7 introduces CyberChef and demonstrates how it can be used to analyze malicious documents. Building on the previous task, we investigate the malicious document extracted from the phishing email and use CyberChef to decode, deobfuscate, and extract actionable indicators.

## Learning Objectives

In this task, you will learn to:

• Understand what CyberChef is  
• Identify the capabilities of CyberChef  
• Use CyberChef to analyze a malicious document  
• Deobfuscate, filter, and parse embedded data

---

## CyberChef Overview

CyberChef is a web based data analysis tool often described as a “cyber swiss army knife.” It allows analysts to encode, decode, parse, search, and transform data using modular operations called recipes.

CyberChef consists of four main panels:

• Panel 1: Input data or files  
• Panel 2: Available operations and recipes  
• Panel 3: The recipe workspace where operations are chained  
• Panel 4: Output produced by the recipe

Recipes are executed either manually using the Bake button or automatically with AutoBake enabled.

---

## Walkthrough

### Accessing CyberChef

The attached virtual machine is deployed and CyberChef is accessed through the Firefox browser. The version number is visible in the top left corner of the application.

**CyberChef version:**  
9.49.0

---

### Analyzing the Malicious Document

The malicious document identified on Day 6 is uploaded into CyberChef. Following the guided walkthrough provided in the task, multiple recipes are chained together to decode and extract embedded data such as URLs and payload references.

**Number of recipes used:**  
10

This highlights how layered obfuscation in malicious documents often requires multiple decoding and parsing steps.

---

### Extracted Malware Information

During URL extraction, multiple links are identified. One of these links references a downloadable executable.

**Malware filename:**  
mysterygift.exe

This confirms the document’s role as a malware delivery mechanism rather than a benign file.

---

### Domain and URL Analysis

Further analysis reveals defanged URLs associated with the bandityeti domain.

**Last defanged URL:**  
`hxxps[://]cdn[.]bandityeti[.]THM/files/index/`

Defanging ensures that malicious links are documented without risking accidental execution.

---

### Flag Discovery

One of the extracted domains contains a ticket value embedded in the path.

**Ticket:**  
THM_MYSTERY_FLAG

This confirms successful extraction and parsing of the malicious content.
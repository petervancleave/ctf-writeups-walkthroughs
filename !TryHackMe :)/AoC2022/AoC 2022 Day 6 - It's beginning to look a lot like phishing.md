
Day 6 focuses on email analysis, one of the most common and still most effective initial access techniques used by attackers. The task walks through identifying suspicious emails, analyzing headers, extracting attachments safely, and using threat intelligence platforms to assess malicious indicators.

---

## Learning Objectives

In this task, you will learn to:

• Understand what email analysis is and why it remains critical  
• Identify key email header fields  
• Ask the right investigative questions during email analysis  
• Analyze email headers to determine legitimacy  
• Safely extract and investigate suspicious email attachments

---

## What Is Email Analysis?

Email analysis is the process of examining an email’s headers, body, and attachments to determine whether it is malicious. Email headers contain technical routing and metadata such as sender, recipient, message ID, and mail servers involved in delivery.

Because phishing attacks rely heavily on deception rather than exploits, email headers often reveal inconsistencies or indicators of compromise that are not visible in the email body alone.

---

## Phishing Overview

Phishing is a form of social engineering delivered via email. Its purpose is to trick recipients into revealing credentials, downloading malware, or executing malicious attachments. Even modern organizations remain vulnerable, making email analysis a foundational blue team skill.

---

## Important Email Header Fields

Email headers commonly analyzed include:

• From  
• Return Path  
• Message ID  
• X-Spam Score  
• Received headers  
• Attachment metadata

These fields help identify spoofing, malicious infrastructure, and hidden payloads.

---

## Walkthrough

### Analyzing the Email File

The provided email sample is analyzed using emlAnalyzer. This tool extracts headers, body content, URLs, and attachments in a controlled environment.

Command used:

`emlAnalyzer -i ./Desktop/Urgent:.eml --header --html -u --text --extract-all`

---

### Sender Information

**Sender email address:**  
chief.elf@santaclaus.thm

**Return address:**  
murphy.evident@bandityeti.thm

The mismatch between sender and return path is an immediate red flag.

---

### Email Context

**Sent on behalf of:**  
chief elf

**X-Spam score:**  
3

This indicates the email triggered spam detection heuristics but was not fully blocked.

---

### Message ID Analysis

The Message ID contains encoded data:

`QW9DMjAyMl9FbWFpbF9BbmFseXNpcw==`

After Base64 decoding, it reveals:

**Hidden value:**  
AoC2022_Email_Analysis

Attackers often hide identifiers or campaign markers inside header fields.

---

### Reputation Check

Using emailrep.io to assess the sender’s reputation:

**Reputation result:**  
RISKY

This supports the hypothesis of a phishing attempt.

---

### Attachment Analysis

The email contains a malicious attachment extracted during analysis.

**Attachment filename:**  
Division_of_labour-Load_share_plan.doc

To safely investigate, the file hash is calculated.

Command used:

`sha256sum Division_of_labour-Load_share_plan.doc`

**SHA256 hash:**  
0827bb9a2e7c0628b82256759f0f888ca1abd6a2d903acdb8e44aca6a1a03467

---

### VirusTotal Investigation

The hash is searched on VirusTotal. Under the Behavior section, MITRE ATT&CK tactics are listed.

**Second MITRE tactic observed:**  
Defense Evasion

This indicates the malware attempts to bypass detection mechanisms.

---

### InQuest Analysis

Using InQuest Indicator Lookup with the same hash:

**File subcategory:**  
macro_hunter

This confirms the document likely contains malicious macros designed to execute payloads upon user interaction.
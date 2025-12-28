Learning Objectives

• Learn what threat detection is  
• Understand what Sigma rules are  
• Understand why Sigma rules are used  
• Learn how to implement Sigma rules for threat detection

|Attack Technique|Indicators of Compromise|Required Detection Fields|
|---|---|---|
|[Account Creation](https://attack.mitre.org/techniques/T1136/)|- EventID: 4720<br>- Service: Security|- Service<br>- EventID|
|[Software Discovery](https://attack.mitre.org/techniques/T1518/)|- Category: Process Creation<br>- EventID: 1<br>- Service: Sysmon<br>- Image: C:\Windows\System32\reg.exe<br>- CommandLine: `reg query “HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer” /v svcVersion`|- Category<br>- EventID<br>- Image<br>- CommandLine strings|
|[Scheduled Task](https://attack.mitre.org/techniques/T1053/005/)|- Category: Process Creation<br>- EventID: 1<br>- Service: Sysmon<br>- Image: C:\Windows\System32\schtasks.exe<br>- Parent Image: C:\Windows\System32\cmd.exe<br>- CommandLine: `schtasks /create /tn "T1053_005_OnLogon" /sc onlogon /tr "cmd.exe /c calc.exe"`|- Category<br>- EventID<br>- Image<br>- CommandLine strings|

Threat Detection Overview

Threat detection is the process of identifying malicious or suspicious activity by analysing logs, system events, and network traffic. Blue team operations rely heavily on proactive detection techniques to identify attacker behaviour early.

Sigma Rules Overview

Sigma is an open source, vendor agnostic detection rule format written in YAML. It allows analysts to describe log patterns that indicate suspicious behaviour and later convert those rules into SIEM specific queries.

Key Sigma characteristics:

• YAML based  
• Case sensitive  
• Uses spaces, not tabs  
• Key value structure  
• Designed for log based detection

Sigma rules are commonly used to detect:

• Account creation  
• Registry queries  
• Process execution  
• Persistence mechanisms

---

Environment Setup

Deploy the attached virtual machine and wait several minutes for services to start.

Using the AttackBox or VPN, open a browser and navigate to:

http://MACHINE_IP

This opens the Sigma challenge application.

---

Challenge 1

Question 1  
What is the Challenge #1 flag?

Click on **Create Rule** under Challenge #1.

In the editor, replace the content with the following Sigma rule:

title: Local Account Creation Detection  
id: 1  
status: experimental  
description: Detects the creation of a local user account on a computer.  
product: windows  
service: security  
EventID: 4720  
level: low

Click **Run**.

The rule successfully matches the log and reveals the flag.

Answer:  
THM{n0t_just_your_u$ser}

---

Question 2  
From the Challenge 1 log, what user account was created?

Click **View Log** under Challenge #1.

Inspect the log details and locate the username field showing the newly created account.

Answer:  
BanditYetiMini

---

Challenge 2

Question 3  
What is the Challenge #2 flag?

Click **Create Rule** under Challenge #2.

Replace the editor contents with the following rule:

product: windows  
service: sysmon  
category: process_creation  
detection:  
selection:  
EventID: 1  
Image|endswith:  
- reg.exe  
CommandLine|contains|all:  
- reg  
- quer  
- /v  
- svcVersion

Click **Run**.

The rule matches registry query activity and reveals the flag.

Answer:  
THM{wh@t_1s_Runn1ng_H3r3}

---

Question 4  
What was the user’s path in the Challenge #2 log file?

Click **View Log** under Challenge #2.

Locate the user context or path field in the log entry.

Answer:  
`SIGMA_AOC2022\Bandit Yeti`

---

Challenge 3

Question 5  
What is the Challenge #3 flag?

Click **Create Rule** under Challenge #3.

Replace the editor contents with the following rule:

product: windows  
service: sysmon  
category: process_creation  
detection:  
selection:  
EventID: 1  
Image|endswith:  
- schtasks.exe  
CommandLine|contains|all:  
- schtasks  
- cmd.exe  
- /create

Click **Run**.

The rule detects scheduled task creation and reveals the flag.

Answer:  
THM{sch3dule_0npo1nt_101}

---

Question 6  
What was the MD5 hash associated with Challenge #3 logs?

Click **View Log** under Challenge #3.

Locate the hash values in the log entry.

The MD5 hash is provided alongside other hashes.

Answer:  
2F6CE97FAF2D5EEA919E4393BDD416A7
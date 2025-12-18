This room introduces the concept of cybersecurity frameworks and how defenders model, understand, and respond to real world attacks. The focus of Day 1 is the Unified Kill Chain, a framework that combines multiple well known attack models into a single adversary focused lifecycle.

Rather than learning tools or commands, this task emphasizes structured thinking. Understanding how attackers operate across phases allows defenders to detect, prevent, and respond more effectively.

---

## Security Frameworks Overview

A security framework is a documented set of guidelines, policies, and procedures that organizations follow to manage risk and implement security controls. Frameworks act as blueprints that help organizations:

• Identify threats and weaknesses  
• Standardize defensive practices  
• Improve detection and response capabilities  
• Align technical controls with business risk

Common frameworks in cybersecurity include MITRE ATT&CK, the Cyber Kill Chain, and the Unified Kill Chain. Each provides a different perspective on attacker behavior and defensive strategy.

---

## Unified Kill Chain

The Unified Kill Chain, published by Paul Pols in 2017 and reviewed in 2022, merges the MITRE ATT&CK framework with the Cyber Kill Chain into a single coherent attack lifecycle. Instead of viewing attacks as isolated events, the UKC models them as a continuous sequence of phases from initial access to final objectives.

The framework consists of 18 phases organized into three high level cycles: In, Through, and Out. Each phase is described using Tactics, Techniques, and Procedures, often referred to as TTPs.

---

## Cycle 1: In

The goal of Cycle 1 is for the attacker to gain an initial foothold in the target environment.

**Reconnaissance**  
The attacker gathers publicly available information about the target, such as infrastructure details, employees, technologies, and exposed services.

**Weaponization**  
The attacker prepares the infrastructure and tools needed to deliver the attack, including command and control servers or malicious payloads.

**Delivery**  
The payload is delivered to the target through methods such as phishing emails, malicious links, or compromised supply chains.

**Social Engineering**  
The attacker manipulates the target into interacting with the payload by impersonating trusted sources or exploiting human trust.

**Exploitation**  
A vulnerability or weakness is abused to execute the malicious payload on the target system.

**Persistence**  
The attacker establishes a reliable method to maintain access even if the system reboots or credentials change.

**Defense Evasion**  
Security controls are bypassed or disabled to avoid detection. This may include log deletion, obfuscation, or disabling monitoring tools.

**Command and Control**  
A communication channel is established between the compromised system and the attacker’s infrastructure, allowing remote control.

---

## Cycle 2: Through

Cycle 2 focuses on expanding access and increasing control within the environment.

**Pivoting**  
The initially compromised system is used as a launch point to attack other systems on the network.

**Discovery**  
The attacker gathers detailed information about users, systems, credentials, and network structure.

**Privilege Escalation**  
The attacker seeks higher level permissions to gain greater control over systems and data.

**Execution**  
Malicious code is executed to further the attacker’s goals, such as deploying malware or extracting data.

**Credential Access**  
Stored or in memory credentials are harvested to enable further movement and persistence.

**Lateral Movement**  
Using stolen credentials, the attacker moves between systems and resources within the organization.

---

## Cycle 3: Out

The final cycle focuses on completing the attacker’s objectives.

**Collection**  
Sensitive data is gathered and staged for removal from the environment.

**Exfiltration**  
The attacker transfers the collected data out of the network while attempting to avoid detection.

**Impact**  
The attacker disrupts availability, integrity, or operations. This may include sabotage, data destruction, or ransomware deployment.

**Objectives**  
The attacker completes their broader goals, which may be financial, political, reputational, or strategic in nature.


---

## Walkthrough

To begin the interactive portion of the task, click the View Site button in the top right corner of the room. This opens a web based puzzle interface.

The challenge consists of three drag and drop puzzles, each corresponding to a different phase of the Unified Kill Chain. For each puzzle, you must match the correct phase names to their definitions based on the framework descriptions provided.

Carefully read each definition and place it under the correct phase. Once all three puzzles are completed successfully, the final results are revealed.

---

## Answers

**Who is the adversary that attacked Santa’s network this year?**  
The Bandit Yeti

**What’s the flag that they left behind?**  
`THM{IT'S A Y3T1 CHR1$TMA$}`

**Looking to learn more?**  
No answer required
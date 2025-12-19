
Day 13 focuses on packet and traffic analysis using Wireshark. The objective is to reconstruct how malicious files such as mysterygift.exe entered the environment by analyzing recorded network traffic. This task emphasizes identifying patterns, anomalies, and malicious indicators within packet captures.

---

## Learning Objectives

In this task, you will learn to:

• Understand packet and traffic analysis fundamentals  
• Use Wireshark for investigative analysis  
• Identify suspicious network patterns and anomalies  
• Extract indicators such as domains, files, IPs, and user agents  
• Correlate network traffic with malware activity

---

## Packet Analysis Overview

Network communication occurs through packets, which are small chunks of data transmitted between hosts. Packet analysis involves examining these packets to identify behaviors such as file downloads, protocol misuse, authentication attempts, and command and control activity.

Traffic analysis remains critical for incident response because it allows analysts to trace attacker actions even after systems have been compromised.

---

## Analysis Results

### 1. HTTP Percent Packets

Using **Statistics → Protocol Hierarchy**, the percentage of packets attributed to HTTP traffic was identified.

**Answer:** 0.3

---

### 2. Port with More Than 1000 Packets

From **Statistics → Conversations → TCP**, one destination port received over 1000 packets.

**Answer:** 3389

---

### 3. Service Name of the Protocol

Port 3389 is associated with the following service.

**Answer:** rdp

---

### 4. Domain Names Observed in DNS Traffic

Filtering DNS packets revealed two queried domains. These were defanged and sorted alphabetically.

**Answer:**  
bestfestivalcompany[.]thm,cdn[.]bandityeti[.]thm

---

### 5. Requested File Names over HTTP

Filtering HTTP packets revealed two requested files. These were defanged and listed alphabetically.

**Answer:**  
favicon[.]ico,mysterygift[.]exe

---

### 6. IP Address That Downloaded the Executable

The source IP responsible for downloading mysterygift.exe was identified and defanged.

**Answer:**  
10[.]10[.]29[.]186

---

### 7. Domain Hosting the Malicious File

Inspection of the HTTP GET request for the executable revealed the hosting domain.

**Answer:**  
cdn[.]bandityeti[.]thm

---

### 8. User-Agent Used for the Non-Executable Download

The HTTP packet associated with downloading favicon.ico revealed the user agent string.

**Answer:**  
Nim httpclient/1.6.8

---

### 9. SHA256 Hash of the Executable File

After exporting HTTP objects and hashing the executable, the following SHA256 value was obtained.

**Answer:**  
0ce160a54d10f8e81448d0360af5c2948ff6a4dbb493fe4be756fc3e2c3f900f

---

### 10. Connected IP Addresses from VirusTotal

VirusTotal behavior analysis revealed multiple connected IP addresses associated with the malware. These were defanged and sorted numerically.

**Answer:**  
20[.]99[.]133[.]109,20[.]99[.]184[.]37,23[.]216[.]147[.]64,23[.]216[.]147[.]76
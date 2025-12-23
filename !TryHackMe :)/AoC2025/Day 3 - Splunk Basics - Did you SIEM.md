# Splunk Basics - Did you SIEM?

<img width="900" height="900" alt="5e8dd9a4a45e18443162feab-1762518888961" src="https://github.com/user-attachments/assets/71663023-561e-4407-ae5e-78dcdd3a323a" />


https://tryhackme.com/room/splunkforloganalysis-aoc2025-x8fj2k4rqp


The room focuses on investigating an incident involving King Malhare and his Bandit Bunnies using Splunk to analyze web traffic and firewall logs. It's all about ingesting and interpreting logs, creating field extractions, using SPL for filtering, and uncovering insights step by step.

## Learning Objectives

- Ingest and interpret custom log data in Splunk.
- Create and apply custom field extractions.
- Use Search Processing Language (SPL) to filter and refine search results.
- Conduct an investigation within Splunk to uncover key insights.

The data includes two pre-ingested sources:

- **web_traffic**: Events related to web connections to/from the web server.
- **firewall_logs**: Traffic allowed or blocked; the web server's local IP is 10.10.1.5 (note: room text says 10.10.1.15, but logs confirm 10.10.1.5 as the compromised server).

## Exploring the Logs

Start by pulling up all ingested logs to get an overview.

**Query:** index=main

- index=main: Searches the main index for all events. This returns 18,744 events across both datasets, showing everything available for analysis. 

SS0
<img width="1876" height="847" alt="day3ss0" src="https://github.com/user-attachments/assets/96c28b2c-b53f-411c-83d9-37195a682a65" />

## Initial Triage

Narrow to web traffic logs for the investigation start.

**Query:** index=main sourcetype=web_traffic

- index=main: Limits to the main index.
- sourcetype=web_traffic: Filters to only web traffic events. This retrieves all web_traffic events (17,172 total), with fields like host, source, sourcetype, user_agent, path, status, and client_ip extracted for review. Use "All time" as the time range.

The timeline histogram shows daily log volume with a spike indicating the attack window. Selected fields display metadata, interesting fields list extracted ones (e.g., user_agent, path, client_ip), and event details show parsed log entries.

## Visualizing the Logs Timeline

Chart event counts over time to spot anomalies.

**Query:** index=main sourcetype=web_traffic | timechart span=1d count

- index=main sourcetype=web_traffic: Base search for web traffic events.
- | timechart span=1d count: Aggregates and charts the count of events per day (1d span). This visualizes daily event counts; switch to the Visualization tab for a graph showing spikes.

To sort by highest count first: **Query:** index=main sourcetype=web_traffic | timechart span=1d count | sort by count | reverse

- Adds | sort by count | reverse: Sorts counts ascending then reverses to descending order. This lists days with the most events first, highlighting the attack day with intense activity.

## Anomaly Detection

Return to the Events tab and examine fields for suspicious values.

- **user_agent**: Click this field in the left panel to view details. It shows legitimate agents (e.g., Mozilla variants) mixed with suspicious ones for further investigation. 

SS1
<img width="1567" height="817" alt="day3ss1" src="https://github.com/user-attachments/assets/f5b279dc-4d81-44dd-a4a9-262c662f661d" />

- **client_ip**: View client IPs accessing the server. One IP stands out with high activity: 198.51.100.55.

SS2
<img width="1778" height="805" alt="day3ss2" src="https://github.com/user-attachments/assets/75d0d4ed-1149-4815-ba5e-4e6565370734" />

- **path**: Shows requested URIs, revealing potential attack patterns.

## Filtering out Benign Values

Exclude standard browser traffic to isolate suspicious activity (Bandit Bunnies use scripts/tools, not browsers).

**Query:** index=main sourcetype=web_traffic user_agent!=*Mozilla* user_agent!=*Chrome* user_agent!=*Safari* user_agent!=*Firefox*

- index=main sourcetype=web_traffic: Base web traffic search.
- user_agent!=*Mozilla* etc.: Excludes events with common legitimate user agents (using != for negation and * for wildcards). This reveals only suspicious user agents; checking client_ip shows all tied to 198.51.100.55.

## Narrowing Down Suspicious IPs

Identify top non-browser IPs by count.

**Query:** sourcetype=web_traffic user_agent!=*Mozilla* user_agent!=*Chrome* user_agent!=*Safari* user_agent!=*Firefox* | stats count by client_ip | sort -count | head 5

- sourcetype=web_traffic ...: Filters non-legitimate user agents.
- | stats count by client_ip: Counts events per client_ip.
- | sort -count: Sorts descending by count (- for reverse).
- | head 5: Limits to top 5 results. This confirms 198.51.100.55 as the primary attacker IP with the highest malicious traffic.

## Tracing the Attack Chain

Focus on the attacker IP (198.51.100.55) to trace steps chronologically.

### Reconnaissance (Footprinting)

Search for probes of exposed config files.

**Query:** index=main sourcetype=web_traffic client_ip="198.51.100.55" AND path IN ("/.env", "/*phpinfo*", "/.git*") | table _time, path, user_agent, status

- client_ip="198.51.100.55": Filters to attacker IP.
- path IN ("/.env", "/*phpinfo*", "/.git*"): Matches specific paths (IN for list, * for wildcards).
- | table _time, path, user_agent, status: Displays selected fields in a table. Results show curl, go-http-client, zgrab user agents with 403/401/404 statuses (denied access). 

SS3
<img width="1892" height="641" alt="day3ss3" src="https://github.com/user-attachments/assets/41122ba8-5b1c-4a72-8bb4-28d8ea047dcb" />

### Enumeration (Vulnerability Testing)

Look for path traversal and open redirects.

**Query:** index=main sourcetype=web_traffic client_ip="198.51.100.55" AND path="*..*" OR path="*redirect*"

- path="*..*" OR path="*redirect*": Searches for traversal (..) or redirect patterns (* wildcards, OR for alternatives). This shows attempted resources. 

SS4
<img width="1915" height="878" alt="day3ss4" src="https://github.com/user-attachments/assets/bd791599-b657-40e9-b7a4-7f10c0089254" />

Add count: **Query:** index=main sourcetype=web_traffic client_ip="198.51.100.55" AND path="*..\/..\/*" OR path="*redirect*" | stats count by path

- Updates to escape traversal as *..\/..\/* for accurate matching.
- | stats count by path: Counts unique paths. Reveals attempts to read system files, indicating active vuln testing. 


SS5
<img width="1900" height="712" alt="day3ss5" src="https://github.com/user-attachments/assets/749f42ea-99de-4579-84cd-8f003be85b1c" />

### SQL Injection Attack

Identify automated tools and payloads.

**Query:** index=main sourcetype=web_traffic client_ip="198.51.100.55" AND user_agent IN ("*sqlmap*", "*Havij*") | table _time, path, status

- user_agent IN ("*sqlmap*", "*Havij*"): Matches known SQL tools. Results show sqlmap with path /search.php?q=test'%20AND%20SLEEP(5)-- and 504 status (timeout confirming time-based injection success). 


SS6
<img width="1903" height="867" alt="day3ss6" src="https://github.com/user-attachments/assets/cda146e2-60a0-4897-aec2-5a9e203f8cdd" />

### Exfiltration Attempts

Check for downloads of sensitive files.

**Query:** index=main sourcetype=web_traffic client_ip="198.51.100.55" AND path IN ("*backup.zip*", "*logs.tar.gz*") | table _time, path, user_agent

- path IN ("*backup.zip*", "*logs.tar.gz*"): Targets backup/log archives. Shows exfiltration of logs.tar.gz using curl, zgrab, wget. 


SS7
<img width="1917" height="862" alt="day3ss7" src="https://github.com/user-attachments/assets/0f3b7935-b42f-49a9-8777-88eba9cf721b" />

### Ransomware Staging & RCE

Look for webshell and ransomware execution.

**Query:** index=main sourcetype=web_traffic client_ip="198.51.100.55" AND path IN ("*bunnylock.bin*", "*shell.php?cmd=*") | table _time, path, user_agent, status

- path IN ("*bunnylock.bin*", "*shell.php?cmd=*"): Matches ransomware binary and webshell commands. Confirms successful RCE via /shell.php?cmd=./bunnylock.bin (200 status). 


SS8
<img width="1917" height="873" alt="day3ss8" src="https://github.com/user-attachments/assets/e0f3eb84-865c-4135-a0d7-0a7105b23740" />

## Correlate Outbound C2 Communication

Pivot to firewall logs for post-exploitation.

**Query:** sourcetype=firewall_logs src_ip="10.10.1.5" AND dest_ip="198.51.100.55" AND action="ALLOWED" | table _time, action, protocol, src_ip, dest_ip, dest_port, reason

- src_ip="10.10.1.5" dest_ip="198.51.100.55" action="ALLOWED": Filters outbound from server to attacker, allowed traffic. Shows C2 contact on suspicious ports with reason=C2_CONTACT. 


SS9
<img width="1897" height="861" alt="day3ss9" src="https://github.com/user-attachments/assets/4bd96a6b-2c73-43e4-9936-3391c4c9c07b" />

## Volume of Data Exfiltrated

Calculate transferred bytes.

**Query:** sourcetype=firewall_logs src_ip="10.10.1.5" AND dest_ip="198.51.100.55" AND action="ALLOWED" | stats sum(bytes_transferred) by src_ip

- | stats sum(bytes_transferred) by src_ip: Sums bytes transferred, grouped by source IP. Total: 126,167 bytes exfiltrated to C2. 


SS10
<img width="1901" height="311" alt="day3ss10" src="https://github.com/user-attachments/assets/8493916c-a4a5-4d60-95a9-e5803b6cc085" />


---

Q: What is the attacker IP found attacking and compromising the web server?

A: 198.51.100.55

Q: Which day was the peak traffic in the logs? (Format: YYYY-MM-DD)

A: 2025-10-12

Q: What is the count of Havij user_agent events found in the logs?

A: 993

Q: How many path traversal attempts to access sensitive files on the server were observed?

A: 658

Q: Examine the firewall logs. How many bytes were transferred to the C2 server IP from the compromised web server?

A: 126167




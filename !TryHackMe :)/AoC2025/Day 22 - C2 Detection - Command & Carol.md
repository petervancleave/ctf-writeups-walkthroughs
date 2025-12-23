
### Introduction

Real Intelligence Threat Analytics (RITA) is an open source framework designed to detect command and control activity by analyzing network traffic. Rather than relying on signatures, RITA performs behavioral analysis on network metadata to identify suspicious patterns such as beaconing, DNS tunneling, long lived connections, and data exfiltration.

RITA operates on Zeek logs, which are structured outputs generated from packet captures or live network traffic. In this walkthrough, we convert a PCAP into Zeek logs, import them into RITA, and analyze the results to identify potential indicators of compromise.

---

## Step 1: Preparing the Environment

Start the VM and open a terminal. Navigate to the home directory and list its contents:

`ls`

You should see two relevant directories:

- `pcaps` contains example packet capture files
    
- `zeek_logs` will store Zeek output
    

The PCAPs are real world malware captures collected from Bradley Duncan’s blog and represent realistic attack traffic.

---

## Step 2: Converting PCAP to Zeek Logs

RITA cannot ingest PCAP files directly. They must first be converted into Zeek logs.

Run the following command to parse the AsyncRAT PCAP:

`zeek readpcap pcaps/AsyncRAT.pcap zeek_logs/asyncrat`

Zeek will process the packet capture and generate structured log files in the specified output directory.

Navigate to the generated logs and list them:

`cd ~/zeek_logs/asyncrat ls`

You should see logs such as:

- conn.log
    
- dns.log
    
- http.log
    
- ssl.log
    
- x509.log
    
<img width="992" height="663" alt="ss1" src="https://github.com/user-attachments/assets/072116f2-69e9-4362-b7ae-e3aaeddf33e0" />


These logs summarize network connections, DNS queries, HTTP requests, TLS metadata, and certificates. RITA will use these logs as its input dataset.

---

## Step 3: Importing Zeek Logs into RITA

With the Zeek logs prepared, import them into RITA for analysis:

`rita import --logs ~/zeek_logs/asyncrat/ --database asyncrat`

<img width="1911" height="800" alt="ss2" src="https://github.com/user-attachments/assets/f539fb3f-eab8-46bd-b5b9-782852c03232" />


RITA parses the logs, normalizes the data, and applies multiple analytics modules. During the import, RITA also updates threat intelligence feeds and cross references external IPs against known malicious indicators.

Once the import completes, view the results:

`rita view asyncrat`

This opens RITA’s interactive terminal interface.

---

## Step 4: Understanding the RITA Interface

The RITA interface consists of three main areas:

### Search Bar

Press `/` to enter search mode. Typing `?` displays available search fields and examples. Press `esc` to exit search mode.

### Results Pane

Each row represents a suspicious connection and includes:

- Severity score based on threat modifiers
    
- Source and destination IP or FQDN
    
- Beacon likelihood
    
- Connection duration
    
- Number of subdomains contacted
    
- Threat intelligence hits
    

Even entries with lower severity scores can still be meaningful, especially in small datasets.

### Details Pane

Selecting an entry displays detailed information split into two sections.

#### Threat Modifiers

These contribute to the severity score and highlight unusual behavior, including:

- MIME type and URI mismatches
    
- Rare TLS or HTTP signatures
    
- Low prevalence external hosts
    
- Recently seen domains or IPs
    
- Missing HTTP host headers
    
- Large outbound data volumes
    
- Lack of direct connection patterns
    

#### Connection Info

This section includes metadata such as:

- Total connection count
    
- Total bytes transferred
    
- Ports, protocols, and detected services
    

Non standard ports, long lived connections, or high data transfer volumes are common red flags.

---

## Step 5: Analyzing the Results

Two notable entries stand out in the results:

- A domain resembling `sunshine-bizrate-inc-software.trycloudflare.com`
    
- An external IP address `91.134.150.150`
    

Selecting the first entry reveals a long and suspicious FQDN. A quick lookup on VirusTotal confirms the domain is malicious, indicating command and control activity.

The second entry shows:

- A known malicious IP
    
- Long connection durations
    
- Non standard ports
    

These characteristics strongly suggest malicious communication. Even without threat intel confirmation, the behavioral indicators alone would justify further investigation.

RITA also flags a rare signature modifier, indicating that the TLS handshake or client behavior differs significantly from normal browser traffic. Malware often produces unique TLS patterns that stand out even when the payload is encrypted.

<img width="1895" height="752" alt="ss3" src="https://github.com/user-attachments/assets/d1a76a58-c28a-4632-955b-8caf46599167" />


---

## Step 6: Next Steps and Investigation

At this stage, an analyst would typically pivot into:

- Zeek logs for deeper inspection
    
- PCAP analysis for payloads or artifacts
    
- Timeline reconstruction
    
- Host based investigation
    

These steps are outside the scope of this walkthrough, but the findings provide strong starting points for incident response and threat hunting.

---

## Final Challenge

To complete the room challenge, apply the same workflow to the provided PCAP:

- Convert `~/pcaps/rita_challenge.pcap` into Zeek logs
    
- Import the logs into RITA
    
- Analyze the results and answer the challenge questions
    

Follow the same process used in this walkthrough to identify suspicious connections and potential indicators of compromise.

<img width="1822" height="666" alt="ss4" src="https://github.com/user-attachments/assets/8d128065-90aa-4358-bd46-5ecb41e1ea55" />

<img width="1890" height="773" alt="ss5" src="https://github.com/user-attachments/assets/0be471e0-6975-4a1d-9779-ffe2758a76b3" />

<img width="1903" height="727" alt="ss6" src="https://github.com/user-attachments/assets/748adc59-71e5-4ea6-b308-1336cc50881d" />

---

Q: How many hosts are communicating with malhare.net?

A: 6

Q: Which Threat Modifier tells us the number of hosts communicating to a certain destination?

A: prevalence

Q: What is the highest number of connections to rabbithole.malhare.net?

A: 40

Q: Which search filter would you use to search for all entries that communicate to rabbithole.malhare.net with a beacon score greater than 70% and sorted by connection duration (descending)?

A: dst:rabbithole.malhare.net beacon:>=70 sort:duration-desc

Q: Which port did the host 10.0.0.13 use to connect to rabbithole.malhare.net?

A: 80





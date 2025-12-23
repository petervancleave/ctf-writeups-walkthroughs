# Network Discovery - Scan-ta Clause

<img width="900" height="900" alt="678ecc92c80aa206339f0f23-1761778821176" src="https://github.com/user-attachments/assets/c8b27e34-9ed9-4d30-ad1b-ddcffc4d68f9" />


https://tryhackme.com/room/networkservices-aoc2025-jnsoqbxgky


## Discovering Exposed Services Summary

When a server is reachable on the network, it exposes services through network ports. Each service listens on a specific port number, allowing clients to communicate using protocols such as HTTP, SSH, FTP, DNS, or custom applications. Discovering which ports are open is often the first step in assessing the attack surface of a target system.

Port scanning is the process of probing a target to identify open ports and the services running behind them. Tools like Nmap allow attackers and defenders to quickly discover exposed services, identify misconfigurations, and spot services running on nonstandard ports. While many services use default ports, such as HTTP on port 80 or SSH on port 22, administrators can configure services to listen on any port, making full range scans important.

In addition to TCP, systems may expose UDP services. UDP based services such as DNS often do not respond in the same way as TCP services, requiring specific scan techniques. Once services are identified, generic tools like Netcat can be used to manually interact with unknown or custom services.

Finally, once access to a system is obtained, on host service discovery becomes possible. Instead of scanning remotely, system utilities can directly list listening ports and local only services that are not externally accessible. This often reveals internal databases or management services that can be queried directly from the host.

---

## Walkthrough

The target for this task is the QA server tbfc-devqa01 with the IP address:

`10.80.173.66`

### Step 1: Basic TCP Port Scan

Start with a simple Nmap scan to identify commonly exposed services.

`nmap 10.80.173.66`

<img width="717" height="306" alt="ss2" src="https://github.com/user-attachments/assets/158ffcd4-6a1b-490a-872a-8d82b56c809a" />

The scan reveals two open ports:

• Port 22 running SSH  
• Port 80 running HTTP

Visiting `http://10.80.173.66` shows that the website has been defaced by the attackers.

<img width="1015" height="822" alt="ss1" src="https://github.com/user-attachments/assets/9f785019-59d7-42ae-ae7d-94d23ff1b914" />


### Step 2: Full TCP Port Scan

Since only the top 1000 ports were scanned, perform a full port scan across all TCP ports and grab service banners.

`nmap -p- --script=banner 10.80.173.66`

This scan reveals additional services:

• Port 21212 running an FTP server  
• Port 25251 running a custom TBFC maintenance service

<img width="695" height="292" alt="ss3" src="https://github.com/user-attachments/assets/3b1983de-a8c2-4939-b185-28448a0b9842" />


### Step 3: Access the FTP Service

Although FTP usually runs on port 21, it is accessible here on port 21212. Attempt an anonymous login.

`ftp 10.80.173.66 21212`

Log in as `anonymous` and list the files.

`ls`

<img width="840" height="608" alt="ss4" src="https://github.com/user-attachments/assets/379ecfed-dc7a-4035-aeb9-5c509dd9da7e" />


A file named `tbfc_qa_key1` is present. Retrieve it to obtain the first key.

`get tbfc_qa_key1`

<img width="905" height="197" alt="ss5" src="https://github.com/user-attachments/assets/20206594-f414-43c7-a97d-b0523a54d1f7" />

Exit the FTP session.

<img width="737" height="492" alt="ss6" src="https://github.com/user-attachments/assets/e0410ad0-a948-4f52-90c1-c302d2273466" />


### Step 4: Interact with the Custom Service Using Netcat

The service on port 25251 is not a standard protocol, so use Netcat to interact with it.

`nc -v 10.80.173.66 25251`

<img width="646" height="331" alt="ss7" src="https://github.com/user-attachments/assets/66374118-94e6-45f7-b521-ac276e73cec2" />

The service responds with available commands. Use the appropriate command to retrieve the second key.

Once the key is received, exit Netcat.

### Step 5: Scan for UDP Services

So far only TCP ports have been scanned. Perform a UDP scan to identify additional exposed services.

`nmap -sU 10.80.173.66`

<img width="647" height="216" alt="ss8" src="https://github.com/user-attachments/assets/df04106c-3a01-48b9-833c-11e7a3754855" />


The scan reveals port 53 open over UDP, indicating a DNS service.

### Step 6: Query DNS for the Final Key

Use the `dig` command to query a TXT record from the DNS server.

`dig @10.80.173.66 TXT key3.tbfc.local +short`

<img width="592" height="170" alt="ss9" src="https://github.com/user-attachments/assets/ee082604-fde7-4255-9a39-33d0bede9e56" />

This returns the third and final key.

### Step 7: Access the Admin Console

With all three keys collected, visit the QA server website again and submit the combined keys to access the secret admin console.

`http://10.80.173.66`

<img width="560" height="290" alt="ss10" src="https://github.com/user-attachments/assets/6637f27f-b549-427d-9590-ac4ed6c521ad" />

<img width="1218" height="492" alt="ss11" src="https://github.com/user-attachments/assets/b9f76465-b4f4-4ab6-9cbf-15fe2e402bad" />

### Step 8: On Host Service Discovery

Inside the admin console shell, list all listening ports using:

`ss -tunlp`

<img width="1267" height="613" alt="ss12" src="https://github.com/user-attachments/assets/55bd8037-8a1a-452f-9835-d7d2f5ccb8c9" />


This confirms the previously discovered services and reveals additional local only services bound to 127.0.0.1, including a MySQL database on port 3306.

### Step 9: Access the MySQL Database

Since the database allows local access, connect to it and enumerate the tables.

`mysql -D tbfcqa01 -e "show tables;"`

A table named `flags` is present. Query its contents.

`mysql -D tbfcqa01 -e "select * from flags;"`

<img width="936" height="255" alt="ss13" src="https://github.com/user-attachments/assets/61249152-dd22-495c-b0dd-1f7b3b99de34" />


The final flag is revealed.

---

Q: What evil message do you see on top of the website?

A: Pwned by HopSec

Q: What is the first key part found on the FTP server?

A: 3aster_

Q: What is the second key part found in the TBFC app?

A: 15_th3_

Q: What is the third key part found in the DNS records?

A: n3w_xm45

Q: Which port was the MySQL database running on?

A: 3306

Q: Finally, what's the flag you found in the database?

A: THM{4ll_s3rvice5_d1sc0vered}


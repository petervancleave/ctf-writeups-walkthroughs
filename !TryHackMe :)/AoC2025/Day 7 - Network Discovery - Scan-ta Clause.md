
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

The scan reveals two open ports:

• Port 22 running SSH  
• Port 80 running HTTP

Visiting `http://10.80.173.66` shows that the website has been defaced by the attackers.

### Step 2: Full TCP Port Scan

Since only the top 1000 ports were scanned, perform a full port scan across all TCP ports and grab service banners.

`nmap -p- --script=banner 10.80.173.66`

This scan reveals additional services:

• Port 21212 running an FTP server  
• Port 25251 running a custom TBFC maintenance service

### Step 3: Access the FTP Service

Although FTP usually runs on port 21, it is accessible here on port 21212. Attempt an anonymous login.

`ftp 10.80.173.66 21212`

Log in as `anonymous` and list the files.

`ls`

A file named `tbfc_qa_key1` is present. Retrieve it to obtain the first key.

`get tbfc_qa_key1`

Exit the FTP session.

### Step 4: Interact with the Custom Service Using Netcat

The service on port 25251 is not a standard protocol, so use Netcat to interact with it.

`nc -v 10.80.173.66 25251`

The service responds with available commands. Use the appropriate command to retrieve the second key.

Once the key is received, exit Netcat.

### Step 5: Scan for UDP Services

So far only TCP ports have been scanned. Perform a UDP scan to identify additional exposed services.

`nmap -sU 10.80.173.66`

The scan reveals port 53 open over UDP, indicating a DNS service.

### Step 6: Query DNS for the Final Key

Use the `dig` command to query a TXT record from the DNS server.

`dig @10.80.173.66 TXT key3.tbfc.local +short`

This returns the third and final key.

### Step 7: Access the Admin Console

With all three keys collected, visit the QA server website again and submit the combined keys to access the secret admin console.

`http://10.80.173.66`

### Step 8: On Host Service Discovery

Inside the admin console shell, list all listening ports using:

`ss -tunlp`

This confirms the previously discovered services and reveals additional local only services bound to 127.0.0.1, including a MySQL database on port 3306.

### Step 9: Access the MySQL Database

Since the database allows local access, connect to it and enumerate the tables.

`mysql -D tbfcqa01 -e "show tables;"`

A table named `flags` is present. Query its contents.

`mysql -D tbfcqa01 -e "select * from flags;"`

The final flag is revealed.


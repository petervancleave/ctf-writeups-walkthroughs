
What is Docker?

1. Open Firefox on the Kali machine
    
2. Navigate to [http://10.10.129.42](http://10.10.129.42)
    
3. Open Developer Tools
    
4. Inspect the Network tab
    
5. Observe the Set-Cookie header
    

The response indicates the Laravel framework.

Answer:  
Laravel

---

Question 3  
What CVE is the application vulnerable to?

Step by step:

1. Launch Metasploit:
    

msfconsole

2. Search for Laravel exploits:
    

search laravel

3. Use the info command on the relevant exploit module
    
4. Scroll through the module details
    

Answer:  
CVE-2021-3129

---

Question 4  
What command can be used to upgrade the last opened session to a Meterpreter session?

Step by step:

1. Run the Laravel exploit module
    
2. Confirm a shell session is opened
    
3. Background the session using:
    

background

4. List active sessions:
    

sessions

5. Upgrade the most recent session to Meterpreter
    

Answer:  
sessions -u -1

---

Question 5  
What file indicates a session has been opened within a Docker container?

Step by step:

1. From the Meterpreter session, list files in the root directory
    
2. Identify the Docker environment indicator
    

Answer:  
/.dockerenv

---

Question 6  
What file often contains useful credentials for web applications?

Step by step:

1. Locate the environment configuration file
    
2. Read its contents
    

Answer:  
.env

---

Question 7  
What database table contains useful credentials?

Step by step:

1. Extract database credentials from the .env file
    
2. Background the Meterpreter session
    
3. Add routing for the Docker network
    
4. Use Metasploit Postgres modules to interact with the database
    
5. Dump the database schema
    
6. Identify the table containing user credentials
    

Answer:  
users

---

Question 8  
What is Santa’s password?

Step by step:

1. Query the users table using Metasploit:
    

run postgres://postgres:postgres@172.28.101.51/postgres sql='select * from users'

2. Review the returned credentials
    

Answer:  
p4$$w0rd

---

Question 9  
What ports are open on the host machine?

Step by step:

1. Set up a SOCKS proxy in Metasploit:
    

use auxiliary/server/socks_proxy  
run srvhost=127.0.0.1 srvport=9050 version=4a

2. Use proxychains to scan the Docker host:
    

proxychains -q nmap -n -sT -Pn -p 22,80,443,5432 172.17.0.1

3. Review the scan output
    

Answer:  
22,80

---

Question 10  
What is the root flag?

Step by step:

1. SSH from the Docker container to the host machine
    
2. Reuse Santa’s password
    
3. Access the root directory
    
4. Locate the root.txt file
    
5. Read the flag
    

Answer:  
THM{47C61A0FA8738BA77308A8A600F88E4B}


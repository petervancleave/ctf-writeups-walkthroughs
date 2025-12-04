
Main Room – Learning Linux CLI Basics

First Commands:

```shell
echo "Hello World!"
ls
cat README.txt
```

Navigate to Guides Directory:
```shell
cd Guides
ls -la               # reveals hidden .guide.txt
cat .guide.txt
```

Grep the authentication logs
```shell
cd /var/log
grep "Failed password" auth.log
```

→ Lots of failed logins for user socmas from HopSec IPs.

Find malicious script
```shell
find /home/socmas -name "*egg*"
# → /home/socmas/2025/eggstrike.sh
cat /home/socmas/2025/eggstrike.sh
```

Script overwrites the real Christmas wishlist with an EASTMAS version.

switch to root and check bash history

```shell
sudo su
history
cat /root/.bash_history
```
→ Reveals attackers exfiltrated the original wishlist and uploaded it to HopSec.

Visiting http://MACHINE_IP:8080 in the VM’s browser shows the glitched EASTMAS site.

---

Side Quest – “McSkidy’s Hidden Note” → Bonus Room Unlock (The Great Disappearing Act (which I only have 1 flag for ATM and am still working on))

This a challenge within the room that  gives access to the first side quest of AoC2025.

1. Find & decrypt McSkidy’s note

```shell
cd /home/eddi_knapp/Documents
ls -la
# → mcskidy_note.txt.gpg

gpg --pinentry-mode loopback -d mcskidy_note.txt.gpg
# Passphrase: 3ast3r-1s-c0M1nG   (fragments found earlier)
```

The decrypted note contains the correct wishlist and instructions to overwrite /home/socmas/2025/wishlist.txt (as root) with the list:

```shell
sudo nano /home/socmas/2025/wishlist.txt
# Paste the exact list from the note (one item per line)
```

2. Fix the website, get the ciphertext and unlock key

After fixing the file, reload http://MACHINE_IP:8080. The site now shows a big base64 AES-encrypted blob and gives the key:

**UNLOCK_KEY:** 91J6X7R4FQ9TQPM9JX2Q9X2Z

Decrypt it on the box:

```shell
# Paste the ciphertext into a file
cat > /tmp/website_output.txt
# (paste the entire ciphertext, then Ctrl+D)

openssl enc -d -aes-256-cbc -pbkdf2 -iter 200000 -salt -base64 \
    -in /tmp/website_output.txt -out /tmp/decoded_message.txt \
    -pass pass:'91J6X7R4FQ9TQPM9JX2Q9X2Z'

cat /tmp/decoded_message.txt

```
Flag obtained: THM{w3lcome_2_A0c_2025}

3. Unlock the hidden directory with the flag
```shell
cd /home/eddi_knapp/.secret
ls -la
# → dir.tar.gz.gpg

gpg --decrypt --passphrase "THM{w3lcome_2_A0c_2025}" dir.tar.gz.gpg > dir.tar.gz
tar -xzf dir.tar.gz
cd dir
ls -la
# → sq1.png
```

```shell
xdg-open sq1.png
```

sq1 image contains the text: now_you_see_me

4. redeem the side quest key

Go to the AoC 2025 Side Quest Hub, enter now_you_see_me → unlocks “The Great Disappearing Act” bonus room.

---

Q: Which CLI command would you use to list a directory?

A: ls

Q: Complete on machine

A: THM{learning-linux-cli}

Q: Which command helped you filter the logs for failed logins?

A: grep

Q: Complete on machine

A: THM{sir-carrotbane-attacks}

Q: Which command would you run to switch to the root user?

A: sudo su

Q: Finally, what flag did Sir Carrotbane leave in the root bash history?

A: THM{until-we-meet-again}

---
**raw:**

user:
eddi_knapp
pw:
S0mething1Sc0ming


Frag 1:
"3ast3r"

Frag 2:
-1s-


Frag 3:
c0M1nG


3ast3r-1s-c0M1nG

gpg tells the GnuPG program to run.
--pinentry-mode loopback forces GPG to accept the passphrase directly from the terminal instead of launching a pinentry window. This is required when a script or CTF challenge wants you to type the passphrase inline.
-d means decrypt.
mcskidy_note.txt.gpg is the encrypted file you are decrypting.


eddi_knapp@tbfc-web01:~/Documents$ gpg --pinentry-mode loopback -d mcskidy_note.txt.gpg

gpg: AES256.CFB encrypted data
gpg: encrypted with 1 passphrase
Congrats — you found all fragments and reached this file.

Below is the list that should be live on the site. If you replace the contents of
/home/socmas/2025/wishlist.txt with this exact list (one item per line, no numbering),
the site will recognise it and the takeover glitching will stop. Do it — it will save the site.

Hardware security keys (YubiKey or similar)
Commercial password manager subscriptions (team seats)
Endpoint detection & response (EDR) licenses
Secure remote access appliances (jump boxes)
Cloud workload scanning credits (container/image scanning)
Threat intelligence feed subscription

Secure code review / SAST tool access
Dedicated secure test lab VM pool
Incident response runbook templates and playbooks
Electronic safe drive with encrypted backups

A final note — I don't know exactly where they have me, but there are *lots* of eggs
and I can smell chocolate in the air. Something big is coming.  — McSkidy

---

When the wishlist is corrected, the site will show a block of ciphertext. This ciphertext can be decrypted with the following unlock key:

UNLOCK_KEY: 91J6X7R4FQ9TQPM9JX2Q9X2Z

To decode the ciphertext, use OpenSSL. For instance, if you copied the ciphertext into a file /tmp/website_output.txt you could decode using the following command:

cat > /tmp/website_output.txt
openssl enc -d -aes-256-cbc -pbkdf2 -iter 200000 -salt -base64 -in /tmp/website_output.txt -out /tmp/decoded_message.txt -pass pass:'91J6X7R4FQ9TQPM9JX2Q9X2Z'
cat /tmp/decoded_message.txt

Sorry to be so convoluted, I couldn't risk making this easy while King Malhare watches. — McSkidy



----
So we now know we have to go to:

/home/socmas/2025/wishlist.txt
(as root not eddi)

we nano into wishlist.txt and replace the contents with the following list:
Hardware security keys (YubiKey or similar)
Commercial password manager subscriptions (team seats)
Endpoint detection & response (EDR) licenses
Secure remote access appliances (jump boxes)
Cloud workload scanning credits (container/image scanning)
Threat intelligence feed subscription
Secure code review / SAST tool access
Dedicated secure test lab VM pool
Incident response runbook templates and playbooks
Electronic safe drive with encrypted backups

now, we can visit the site using the provided IP, and we are shown a cipher text we cant now decrypt with the unlock key from earlier

U2FsdGVkX1/7xkS74RBSFMhpR9Pv0PZrzOVsIzd38sUGzGsDJOB9FbybAWod5HMsa+WIr5HDprvK6aFNYuOGoZ60qI7axX5Qnn1E6D+BPknRgktrZTbMqfJ7wnwCExyU8ek1RxohYBehaDyUWxSNAkARJtjVJEAOA1kEOUOah11iaPGKxrKRV0kVQKpEVnuZMbf0gv1ih421QvmGucErFhnuX+xv63drOTkYy15s9BVCUfKmjMLniusI0tqs236zv4LGbgrcOfgir+P+gWHc2TVW4CYszVXlAZUg07JlLLx1jkF85TIMjQ3B91MQS+btaH2WGWFyakmqYltz6jB5DOSCA6AMQYsqLlx53ORLxy3FfJhZTl9iwlrgEZjJZjDoXBBMdlMCOjKUZfTbt3pnlHWEaGJD7NoTgywFsIw5cz7hkmAMxAIkNn/5hGd/S7mwVp9h6GmBUYDsgHWpRxvnjh0s5kVD8TYjLzVnvaNFS4FXrQCiVIcp1ETqicXRjE4T0MYdnFD8h7og3ZlAFixM3nYpUYgKnqi2o2zJg7fEZ8c=


we can save this cipher text to a file:
cat > /tmp/website_output.txt
(paste ciphertext, then press Ctrl+D)

and then run the decryption:
openssl enc -d -aes-256-cbc -pbkdf2 -iter 200000 -salt -base64 -in website_output.txt -out /tmp/decoded_message.txt -pass pass:'91J6X7R4FQ9TQPM9JX2Q9X2Z'

View the result:
cat /tmp/decoded_message.txt


When we cat the decoded message:
root@tbfc-web01:/tmp$ cat decoded_message.txt 
Well done — the glitch is fixed. Amazing job going the extra mile and saving the site. Take this flag THM{w3lcome_2_A0c_2025}

NEXT STEP:
If you fancy something a little...spicier....use the FLAG you just obtained as the passphrase to unlock:
/home/eddi_knapp/.secret/dir

That hidden directory has been archived and encrypted with the FLAG.
Inside it you'll find the sidequest key.

So we can see a dir.tar.gz.gpg in that directory

so I run:
gpg --decrypt --passphrase "THM{w3lcome_2_A0c_2025}" dir.tar.gz.gpg > dir.tar.gz

and we see the output:
gpg: directory '/root/.gnupg' created
gpg: keybox '/root/.gnupg/pubring.kbx' created
gpg: AES256.CFB encrypted data
gpg: encrypted with 1 passphrase
root@tbfc-web01:/home/eddi_knapp/.secret$ ls -a
.  ..  dir.tar.gz  dir.tar.gz.gpg


so now we can see a dir.tar.gz

And we can extract the tar.gz:

tar -xzf dir.tar.gz

Now we can cd into dir

and if we ls -a we can see a sq1.png

we can use xdg-open sq1.png to see the image:

SS1
<img width="1888" height="940" alt="Screenshot 2025-12-01 225107" src="https://github.com/user-attachments/assets/2475c166-d72c-4378-8f12-59bbfd3fa54a" />


The easter egg says:
"now_you_see_me"

so I think this is what we can use to access the bonus room The Great Disappearing Act.



Now moving onto the extra room, we can enter the memory key and we get a popup message saying:
"Celebration The key is correct! Celebration

The bunnies are celebrating! Unlocking Hopper's memories..."

now we can use nmap, here is the output:

nmap 10.64.189.70 -sC -sV 
Starting Nmap 7.95 ( https://nmap.org ) at 2025-12-01 23:01 MST
Nmap scan report for 10.64.189.70
Host is up (0.061s latency).
Not shown: 995 closed tcp ports (reset)
PORT     STATE SERVICE     VERSION
22/tcp   open  ssh         OpenSSH 9.6p1 Ubuntu 3ubuntu13.11 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   256 91:9c:d4:0b:1f:80:15:47:2d:16:c9:bf:bd:68:4f:71 (ECDSA)
|_  256 4c:fe:06:3d:8b:27:68:c7:b8:dc:ae:13:eb:9b:83:14 (ED25519)
80/tcp   open  http        nginx 1.24.0 (Ubuntu)
|_http-title: HopSec Asylum - Security Console
|_http-server-header: nginx/1.24.0 (Ubuntu)
8000/tcp open  http-alt
| fingerprint-strings: 
|   FourOhFourRequest: 
|     HTTP/1.0 404 Not Found
|     Content-Type: text/html
|     X-Frame-Options: DENY
|     Content-Length: 179
|     Vary: Accept-Language
|     Content-Language: en
|     X-Content-Type-Options: nosniff
|     <!doctype html>
|     <html lang="en">
|     <head>
|     <title>Not Found</title>
|     </head>
|     <body>
|     <h1>Not Found</h1><p>The requested resource was not found on this server.</p>
|     </body>
|     </html>
|   GenericLines, Help, RTSPRequest, SIPOptions, Socks5, TerminalServerCookie: 
|     HTTP/1.1 400 Bad Request
|   GetRequest, HTTPOptions: 
|     HTTP/1.0 302 Found
|     Content-Type: text/html; charset=utf-8
|     Location: /posts/
|     X-Frame-Options: DENY
|     Content-Length: 0
|     Vary: Accept-Language
|     Content-Language: en
|_    X-Content-Type-Options: nosniff
| http-title: Fakebook - Sign In
|_Requested resource was /accounts/login/?next=/posts/
8080/tcp open  http        SimpleHTTPServer 0.6 (Python 3.12.3)
|_http-server-header: SimpleHTTP/0.6 Python/3.12.3
|_http-title: HopSec Asylum - Security Console
9001/tcp open  tor-orport?
| fingerprint-strings: 
|   NULL: 
|     ASYLUM GATE CONTROL SYSTEM - SCADA TERMINAL v2.1 
|     [AUTHORIZED PERSONNEL ONLY] 
|     WARNING: This system controls critical infrastructure
|     access attempts are logged and monitored
|     Unauthorized access will result in immediate termination
|     Authentication required to access SCADA terminal
|     Provide authorization token from Part 1 to proceed
|_    [AUTH] Enter authorization token:
2 services unrecognized despite returning data. If you know the service/version, please submit the following fingerprints at https://nmap.org/cgi-bin/submit.cgi?new-service :
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port8000-TCP:V=7.95%I=7%D=12/1%Time=692E80C6%P=x86_64-pc-linux-gnu%r(Ge
SF:nericLines,1C,"HTTP/1\.1\x20400\x20Bad\x20Request\r\n\r\n")%r(GetReques
SF:t,C9,"HTTP/1\.0\x20302\x20Found\r\nContent-Type:\x20text/html;\x20chars
SF:et=utf-8\r\nLocation:\x20/posts/\r\nX-Frame-Options:\x20DENY\r\nContent
SF:-Length:\x200\r\nVary:\x20Accept-Language\r\nContent-Language:\x20en\r\
SF:nX-Content-Type-Options:\x20nosniff\r\n\r\n")%r(FourOhFourRequest,160,"
SF:HTTP/1\.0\x20404\x20Not\x20Found\r\nContent-Type:\x20text/html\r\nX-Fra
SF:me-Options:\x20DENY\r\nContent-Length:\x20179\r\nVary:\x20Accept-Langua
SF:ge\r\nContent-Language:\x20en\r\nX-Content-Type-Options:\x20nosniff\r\n
SF:\r\n\n<!doctype\x20html>\n<html\x20lang=\"en\">\n<head>\n\x20\x20<title
SF:>Not\x20Found</title>\n</head>\n<body>\n\x20\x20<h1>Not\x20Found</h1><p
SF:>The\x20requested\x20resource\x20was\x20not\x20found\x20on\x20this\x20s
SF:erver\.</p>\n</body>\n</html>\n")%r(Socks5,1C,"HTTP/1\.1\x20400\x20Bad\
SF:x20Request\r\n\r\n")%r(HTTPOptions,C9,"HTTP/1\.0\x20302\x20Found\r\nCon
SF:tent-Type:\x20text/html;\x20charset=utf-8\r\nLocation:\x20/posts/\r\nX-
SF:Frame-Options:\x20DENY\r\nContent-Length:\x200\r\nVary:\x20Accept-Langu
SF:age\r\nContent-Language:\x20en\r\nX-Content-Type-Options:\x20nosniff\r\
SF:n\r\n")%r(RTSPRequest,1C,"HTTP/1\.1\x20400\x20Bad\x20Request\r\n\r\n")%
SF:r(Help,1C,"HTTP/1\.1\x20400\x20Bad\x20Request\r\n\r\n")%r(TerminalServe
SF:rCookie,1C,"HTTP/1\.1\x20400\x20Bad\x20Request\r\n\r\n")%r(SIPOptions,1
SF:C,"HTTP/1\.1\x20400\x20Bad\x20Request\r\n\r\n");
==============NEXT SERVICE FINGERPRINT (SUBMIT INDIVIDUALLY)==============
SF-Port9001-TCP:V=7.95%I=7%D=12/1%Time=692E80C6%P=x86_64-pc-linux-gnu%r(NU
SF:LL,34F,"\n\xe2\x95\x94\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\
SF:xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90
SF:\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x9
SF:0\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x
SF:90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\
SF:x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95
SF:\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x9
SF:5\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x
SF:95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\
SF:x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2
SF:\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe
SF:2\x95\x97\n\xe2\x95\x91\x20\x20\x20\x20\x20ASYLUM\x20GATE\x20CONTROL\x2
SF:0SYSTEM\x20-\x20SCADA\x20TERMINAL\x20v2\.1\x20\x20\x20\x20\x20\x20\x20\
SF:x20\x20\x20\xe2\x95\x91\n\xe2\x95\x91\x20\x20\x20\x20\x20\x20\x20\x20\x
SF:20\x20\x20\x20\x20\x20\[AUTHORIZED\x20PERSONNEL\x20ONLY\]\x20\x20\x20\x
SF:20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\
SF:x20\xe2\x95\x91\n\xe2\x95\x9a\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x
SF:95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\
SF:x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2
SF:\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe
SF:2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\x
SF:e2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\
SF:xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90
SF:\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x9
SF:0\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x
SF:90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\
SF:x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95
SF:\x90\xe2\x95\x9d\n\n\[!\]\x20WARNING:\x20This\x20system\x20controls\x20
SF:critical\x20infrastructure\n\[!\]\x20All\x20access\x20attempts\x20are\x
SF:20logged\x20and\x20monitored\n\[!\]\x20Unauthorized\x20access\x20will\x
SF:20result\x20in\x20immediate\x20termination\n\n\[!\]\x20Authentication\x
SF:20required\x20to\x20access\x20SCADA\x20terminal\n\[!\]\x20Provide\x20au
SF:thorization\x20token\x20from\x20Part\x201\x20to\x20proceed\n\n\n\[AUTH\
SF:]\x20Enter\x20authorization\x20token:\x20");
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 135.47 seconds


okay so we know we are dealing with port 9001 (SCADA). We can use netcat to connect:

nc 10.64.189.70 9001

╔═══════════════════════════════════════════════════════════════╗
║     ASYLUM GATE CONTROL SYSTEM - SCADA TERMINAL v2.1          ║
║              [AUTHORIZED PERSONNEL ONLY]                      ║
╚═══════════════════════════════════════════════════════════════╝

[!] WARNING: This system controls critical infrastructure
[!] All access attempts are logged and monitored
[!] Unauthorized access will result in immediate termination

[!] Authentication required to access SCADA terminal
[!] Provide authorization token from Part 1 to proceed


[AUTH] Enter authorization token: 


the now_you_see_me does not work here, but our goal is to open the asylum gate (step 1 = unlock hopper's cell) and this is the digital lock.

Another notable port is port 8000 which is a facebook login

if we run gobuster dir -u http://10.64.189.70:8000 -w /usr/share/wordlists/dirb/common.txt


we see the following:

/admin                (Status: 301) [Size: 0] [--> /admin/]
/chat                 (Status: 301) [Size: 0] [--> /chat/]
/media                (Status: 301) [Size: 0] [--> /media/]
/posts                (Status: 301) [Size: 0] [--> /posts/]
/profiles             (Status: 301) [Size: 0] [--> /profiles/]
Progress: 4614 / 4615 (99.98%)

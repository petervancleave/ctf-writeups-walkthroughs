# Phishing - Merry Clickmas

<img width="900" height="900" alt="6645aa8c024f7893371eb7ac-1761822143495" src="https://github.com/user-attachments/assets/96e5cc92-f2b8-498e-bf07-76407d0913fd" />

https://tryhackme.com/room/phishing-aoc2025-h2tkye9fzU


Goal: Send a convincing phishing email using the Social-Engineer Toolkit and capture credentials with a fake login page.

1. Start the fake login page (credential harvester)
```shell
cd ~/Rooms/AoC2025/Day02
./server.py
```

- Listens on http://YOUR_ATTACKBOX_IP:8000
- Open it in Firefox to see what the victim will see (TBFC portal login clone).
- Any credentials entered will instantly appear in this terminal.

2. craft and send the phishing email with SET

```shell
setoolkit
```

Menu path: 1 → Social-Engineering Attacks 5 → Mass Mailer Attack 1 → E-Mail Attack Single Email Address

Then fill in the details exactly like this (replace MACHINE_IP with your actual AttackBox IP):

|Prompt|Input you type|
|---|---|
|Send email to|[factory@wareville.thm](mailto:factory@wareville.thm)|
|1) Gmail 2) Own server/open relay|2|
|From address|[updates@flyingdeer.thm](mailto:updates@flyingdeer.thm)|
|The FROM NAME the user will see|Flying Deer|
|Username / Password for open-relay|(just press Enter twice – we’re using direct SMTP)|
|SMTP email server address|MACHINE_IP|
|Port|25 (default)|
|High priority?|no|
|Attach a file?|n|
|Inline file?|n|
|Email subject|Shipping Schedule Changes|
|HTML or plain|p (default)|
|Body (example)|Dear elves, There have been major changes to the shipping schedule due to high order volume. Please review and confirm the new times here: http://MACHINE_IP:8000 Best regards, Flying Deer END|
Press Enter after typing END → email is sent instantly.

3. Wait for the bite

Go back to the terminal running server.py and you should see the password

---

Q: What is the password used to access the TBFC portal?

A: unranked-wisdom-anthem

Q: Browse to `http://MACHINE_IP` from within the AttackBox and try to access the mailbox of the `factory` user to see if the previously harvested `admin` password has been reused on the email portal. What is the total number of toys expected for delivery?

A: 1984000
